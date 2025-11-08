-- Delta Executör / Universal Script için tek dosya
-- Admin Paneli (Client-Side) - WEST31 MOBİL VERSİYON (v11 FULL - OPTİMİZE EDİLDİ)

local Player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local Camera = Workspace.CurrentCamera

-- LocalPlayer'ı bekliyoruz
while not Player do
    wait()
    Player = game.Players.LocalPlayer
end

-- NEON TEMA RENGİ
local NEON_COLOR = Color3.fromRGB(200, 50, 255)

-- =================================================================
-- KALICILIK VE BAŞLANGIÇ KONTROLÜ (Koda dokunulmadı)
-- =================================================================

local Toggles = {} 
local IJConnection = nil 
local flyConnection = nil
local espConnection = nil 
local espBoxes = {} 
local WalkToConnection = nil 
local IsActive = false

local function notify(message)
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {Title = "WEST31 ADMIN", Text = message, Duration = 3})
        print("[WEST31 ADMIN] " .. message)
    end)
end

local function characterAddedHandler(character)
    -- Reset sonrası hileleri geri yükleme
    
    if Toggles["Noclip"] then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
    
    if Toggles["GodMode"] then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Died:Connect(function()
                if Toggles["GodMode"] and humanoid.Health <= 0 then
                    humanoid.Health = humanoid.MaxHealth
                end
            end)
        end
    end

    local savedJumpPower = Toggles["JumpPowerValue"] or 50 
    if character:FindFirstChildOfClass("Humanoid") then
        character:FindFirstChildOfClass("Humanoid").JumpPower = savedJumpPower
    end

    if Toggles["Fly"] then
        local HRP = character:FindFirstChild("HumanoidRootPart")
        if HRP then HRP.Anchored = true end
    end
    
    if Toggles["NoFallDamage"] then
        local Humanoid = character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.MaxHealth = 100000000
            Humanoid.Health = 100000000
        end
    end

    notify("Karakter yüklendi, hileler tekrar uygulandı.")
end

Player.CharacterAdded:Connect(characterAddedHandler)
if Player.Character then characterAddedHandler(Player.Character) end

-- =================================================================
-- HİLE VE UTILITY FONKSİYONLARI (Koda dokunulmadı)
-- =================================================================

local function toggleBypassChatFilter(state)
    Toggles["BypassChatFilter"] = state
    notify("Chat Filter Bypass (Client) " .. (state and "aktif." or "pasif.") .. ". (Etkisi sınırlı olabilir!)")
end

local function toggleFullBright(state)
    Toggles["FullBright"] = state
    if state then
        Toggles["FullBrightOriginalAmbient"] = Lighting.Ambient
        Toggles["FullBrightOriginalOutdoorAmbient"] = Lighting.OutdoorAmbient
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        Lighting.Ambient = Toggles["FullBrightOriginalAmbient"] or Color3.fromRGB(0, 0, 0)
        Lighting.OutdoorAmbient = Toggles["FullBrightOriginalOutdoorAmbient"] or Color3.fromRGB(0, 0, 0)
    end
    notify("Full Bright " .. (state and "AÇILDI" or "KAPANDI") .. ".")
end

local function toggleHealthTagESP(state)
    Toggles["HealthTagESP"] = state
    notify("Health/Name Tag ESP " .. (state and "AÇILDI" or "KAPANDI") .. ".")
end

local function toggleNoFallDamage(state)
    Toggles["NoFallDamage"] = state
    local Humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if Humanoid and not Toggles["GodMode"] then
        if state then
            Humanoid.MaxHealth = 100000000
            Humanoid.Health = 100000000
            Toggles["NoFallDamageOriginalMaxHealth"] = 100
        else
            Humanoid.MaxHealth = Toggles["NoFallDamageOriginalMaxHealth"] or 100
            Humanoid.Health = Humanoid.MaxHealth
        end
    end
    notify("No Fall Damage " .. (state and "AÇILDI" or "KAPANDI") .. ".")
end

local function setFogColor(hexValue)
    local success, color = pcall(Color3.fromHex, hexValue)
    if success and color then
        Lighting.FogColor = color
        Toggles["FogColorValue"] = hexValue
        notify("Sis Rengi #" .. hexValue .. " olarak ayarlandı.")
    else
        notify("Hata: Geçersiz HEX kodu. Örneğin: FF00FF")
    end
end

local function respawnCharacter()
    local Humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        Humanoid.Health = 0
        notify("Karakter sıfırlandı.")
    else
        notify("Karakter sıfırlanamadı.")
    end
end

local function toggleWalkTo(state)
    Toggles["WalkTo"] = state
    if state then
        WalkToConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if Toggles["WalkTo"] and not gameProcessed and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                local ray = Camera:ScreenPointToRay(input.Position.X, input.Position.Y)
                local raycastResult = Workspace:Raycast(ray.Origin, ray.Direction * 500)
                
                if raycastResult and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    local HRP = Player.Character:FindFirstChild("HumanoidRootPart")
                    HRP.CFrame = CFrame.new(raycastResult.Position) * CFrame.new(0, HRP.Size.Y/2 + 2, 0)
                    notify("Tıklanan noktaya ışınlanıldı.")
                end
            end
        end)
        notify("Walk To (Teleport) AÇILDI. Ekrana dokunarak ışınlan.")
    else
        if WalkToConnection then WalkToConnection:Disconnect() end
        notify("Walk To KAPANDI.")
    end
end

local function toggleInfiniteJump(state)
    Toggles["Infinite Jump"] = state
    if state then
        IJConnection = UserInputService.JumpRequest:Connect(function()
            if Toggles["Infinite Jump"] and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
                Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if IJConnection then IJConnection:Disconnect() end
    end
    notify("Infinite Jump " .. (state and "AÇILDI" or "KAPANDI") .. ".")
end

local function toggleFly(state)
    Toggles["Fly"] = state
    local HRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not HRP then return end
    if state then
        HRP.Anchored = true; HRP.CanCollide = false
        local humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.PlatformStanding) end
        if not flyConnection then
            flyConnection = RunService.Heartbeat:Connect(function()
                local moveVector = Player.Character.Humanoid.MoveDirection 
                if moveVector.Magnitude > 0 then
                    HRP.CFrame = HRP.CFrame + (moveVector * 1.5)
                end
            end)
        end
        notify("Fly modu AÇILDI. JoysTick ile hareket edebilirsin.")
    else
        if flyConnection then flyConnection:Disconnect() end
        flyConnection = nil; HRP.Anchored = false; HRP.CanCollide = true
        local humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
        notify("Fly modu KAPANDI.")
    end
end

local function clientKick()
    if rawget(_G, "disconnect") then
        rawget(_G, "disconnect")()
    elseif Player then
        Player:Kick("WEST31")
    end
    notify("Kendini oyundan attın (WEST31).")
end

local function toggleNoclip(state)
    Toggles["Noclip"] = state
    for _, part in ipairs(Player.Character:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = not state end
    end
    notify("Noclip " .. (state and "AÇILDI" or "KAPANDI") .. ".")
end

local function toggleGod(state)
    Toggles["GodMode"] = state
    notify("GodMode " .. (state and "AÇILDI" or "KAPANDI") .. ".")
end

local function setJumpPower(value)
    local power = tonumber(value) or 50
    local Humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        Humanoid.JumpPower = power
        Toggles["JumpPowerValue"] = power 
        notify("Zıplama Gücü " .. power .. " olarak ayarlandı.")
    end
end

local function setSpeed(value)
    local speed = tonumber(value) or 16
    local Humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        Humanoid.WalkSpeed = speed
        notify("Hız " .. speed .. " olarak ayarlandı.")
    end
end

local function teleport(targetName)
    local TargetPlayer = game.Players:FindFirstChild(targetName)
    if TargetPlayer and Player.Character then
        local HRP = TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local MyHRP = Player.Character:FindFirstChild("HumanoidRootPart")
        if HRP and MyHRP then
            MyHRP.Anchored = true 
            MyHRP.CFrame = HRP.CFrame * CFrame.new(0, 5, 0)
            task.wait(0.1)
            MyHRP.Anchored = false 
            notify(targetName .. "'ye ışınlanıldı.")
            return
        end
    end
    notify("Hedef oyuncu bulunamadı.")
end

local function killAll()
    for _, targetPlayer in ipairs(game.Players:GetPlayers()) do
        if targetPlayer ~= Player and targetPlayer.Character and targetPlayer.Character:FindFirstChildOfClass("Humanoid") then
            targetPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
        end
    end
    notify("Tüm oyuncular öldürüldü (Client-Side).")
end

-- ESP ve UpdateESP fonksiyonları burada yer almaktadır. (Uzunluğu sebebiyle kodu kısaltılmıştır)
local function createESPBox(targetPlayer)
    local GUIParent = Player.PlayerGui:FindFirstChild("WEST31_UniversalAdmin") or Player.PlayerGui
    if not GUIParent then return end
    local Box = Instance.new("Frame")
    Box.BackgroundTransparency = 1; Box.BorderSizePixel = 0; Box.ZIndex = 10; Box.Parent = GUIParent
    local Border = Instance.new("UIStroke"); Border.Color = Color3.fromRGB(0, 255, 0); Border.Thickness = 2; Border.Parent = Box
    local NameText = Instance.new("TextLabel"); NameText.Name = "NameTag"; NameText.TextColor3 = Color3.fromRGB(0, 255, 0); NameText.TextScaled = true; NameText.BackgroundTransparency = 1; NameText.Size = UDim2.new(1, 0, 0.2, 0); NameText.Parent = Box
    local HealthText = Instance.new("TextLabel"); HealthText.Name = "HealthTag"; HealthText.TextColor3 = Color3.fromRGB(255, 255, 255); HealthText.TextScaled = true; HealthText.BackgroundTransparency = 1; HealthText.Size = UDim2.new(1, 0, 0.2, 0); HealthText.Position = UDim2.new(0, 0, 0.8, 0); HealthText.Parent = Box
    espBoxes[targetPlayer] = Box
end
local function updateESP()
    for targetPlayer, Box in pairs(espBoxes) do
        if not targetPlayer or not targetPlayer.Character or not Toggles["ESP Box"] then
            if Box then Box:Destroy() end; espBoxes[targetPlayer] = nil; continue
        end
        local HRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart"); local Humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
        if HRP and Camera and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Humanoid then
            local vec, visible = Camera:WorldToScreenPoint(HRP.Position); local dist = (Player.Character.HumanoidRootPart.Position - HRP.Position).Magnitude
            if visible then
                local sizeX = math.max(30, 100 / (dist + 5)); local sizeY = sizeX * 2.5
                Box.Size = UDim2.new(0, sizeX, 0, sizeY); Box.Position = UDim2.new(0, vec.X - sizeX / 2, 0, vec.Y - sizeY / 2); Box.Visible = true
                local NameTag = Box:FindFirstChild("NameTag"); if NameTag then NameTag.Text = targetPlayer.Name .. " (" .. math.floor(dist) .. "m)" end
                local HealthTag = Box:FindFirstChild("HealthTag"); 
                if HealthTag and Toggles["HealthTagESP"] then
                    local currentHP = math.floor(Humanoid.Health); HealthTag.Text = "HP: " .. currentHP
                    if currentHP <= 20 then HealthTag.TextColor3 = Color3.fromRGB(255, 0, 0)
                    elseif currentHP <= 50 then HealthTag.TextColor3 = Color3.fromRGB(255, 255, 0)
                    else HealthTag.TextColor3 = Color3.fromRGB(0, 255, 0) end
                    HealthTag.Visible = true
                elseif HealthTag then HealthTag.Visible = false end
            else Box.Visible = false end
        else if Box then Box.Visible = false end end
    end
end
local function toggleESP(state)
    Toggles["ESP Box"] = state
    if state then
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p ~= Player and not espBoxes[p] then createESPBox(p) end
        end
        game.Players.PlayerAdded:Connect(function(newPlayer)
            newPlayer.CharacterAdded:Wait(); if newPlayer ~= Player and not espBoxes[newPlayer] then createESPBox(newPlayer) end
        end)
        if not espConnection then espConnection = RunService.RenderStepped:Connect(updateESP) end
        notify("ESP Box açıldı.")
    else
        if espConnection then espConnection:Disconnect() end; espConnection = nil
        for _, Box in pairs(espBoxes) do Box:Destroy() end; espBoxes = {}
        notify("ESP Box kapandı.")
    end
end
-- =================================================================
-- GUI OLUŞTURMA VE BAŞLATMA (OPTIMİZE EDİLDİ)
-- =================================================================

local function createGUI()
    if IsActive then return end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "WEST31_UniversalAdmin"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = Player.PlayerGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0.85, 0, 0.85, 0) -- ANA ÇERÇEVE %85'E YÜKSELTİLDİ
    MainFrame.Position = UDim2.new(0.075, 0, 0.075, 0) 
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Visible = false 
    MainFrame.Parent = ScreenGui

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0.15, 0, 0, 50)
    ToggleButton.Position = UDim2.new(0.01, 0, 0.01, 0)
    ToggleButton.Text = "W31" 
    ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    ToggleButton.TextColor3 = NEON_COLOR
    ToggleButton.Font = Enum.Font.SourceSansBold
    ToggleButton.TextSize = 20
    ToggleButton.Parent = ScreenGui

    ToggleButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
        notify("Panel " .. (MainFrame.Visible and "açıldı" or "kapandı") .. ".")
    end)

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Text = "WEST31 MOBİL CLIENT ADMIN"
    Title.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    Title.TextColor3 = NEON_COLOR
    Title.Parent = MainFrame

    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Size = UDim2.new(1, 0, 1, -30)
    ContentFrame.Position = UDim2.new(0, 0, 0, 30)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Parent = MainFrame

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 3) -- BOŞLUK AZALTILDI
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Parent = ContentFrame

    local function createToggle(name, commandFunc, defaultState)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, 0, 0, 35) -- YÜKSEKLİK 35'E DÜŞÜRÜLDÜ
        Button.Text = name .. " [KAPALI]"
        Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Parent = ContentFrame
        
        local state = defaultState or false
        
        Button.MouseButton1Click:Connect(function()
            state = not state
            Toggles[name] = state
            Button.Text = name .. (state and " [AÇIK]" or " [KAPALI]")
            Button.BackgroundColor3 = state and NEON_COLOR or Color3.fromRGB(60, 60, 60)
            Button.TextColor3 = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 255, 255)
            pcall(commandFunc, state)
        end)
        return Button
    end

    local function createInputButton(name, commandFunc, defaultValue)
        local Container = Instance.new("Frame")
        Container.Size = UDim2.new(1, 0, 0, 40) -- YÜKSEKLİK 40'A DÜŞÜRÜLDÜ
        Container.BackgroundTransparency = 1
        Container.Parent = ContentFrame
        
        local TextBox = Instance.new("TextBox")
        TextBox.Size = UDim2.new(0.6, 0, 1, 0)
        TextBox.Text = defaultValue or ""
        TextBox.PlaceholderText = name .. " Değeri Gir"
        TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TextBox.Parent = Container
        
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0.38, 0, 1, 0)
        Button.Position = UDim2.new(0.62, 0, 0, 0)
        Button.Text = name
        Button.BackgroundColor3 = NEON_COLOR
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Parent = Container

        Button.MouseButton1Click:Connect(function()
            pcall(commandFunc, TextBox.Text)
        end)
        return Container
    end

    local function createSimpleButton(name, commandFunc)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, 0, 0, 35) -- YÜKSEKLİK 35'E DÜŞÜRÜLDÜ
        Button.Text = name
        Button.BackgroundColor3 = NEON_COLOR
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Parent = ContentFrame
        
        Button.MouseButton1Click:Connect(function()
            pcall(commandFunc)
        end)
        return Button
    end

    -- YENİLENMİŞ ÖZELLİK LİSTESİ
    createToggle("ESP Box (Kutu)", toggleESP)
    createToggle("Health/Name Tag ESP", toggleHealthTagESP)
    createToggle("Fly (JoysTick İle Hareket)", toggleFly)
    createToggle("Noclip", toggleNoclip)
    createToggle("GodMode", toggleGod)
    createToggle("Infinite Jump", toggleInfiniteJump)
    createToggle("Full Bright", toggleFullBright)
    createToggle("No Fall Damage", toggleNoFallDamage)
    createToggle("Walk To (Teleport)", toggleWalkTo)
    createToggle("Bypass Chat Filter (Client)", toggleBypassChatFilter)

    createInputButton("SetJumpPower", setJumpPower, "100")
    createInputButton("SetSpeed", setSpeed, "150")
    createInputButton("TeleportTo", teleport, "Arkadaşının Adı")
    createInputButton("Sis Rengi (HEX)", setFogColor, "FF00FF")
    
    createSimpleButton("Karakter Sıfırla (Hızlı)", respawnCharacter)
    createSimpleButton("Kill All (Client)", killAll)
    createSimpleButton("Client Kick (WEST31)", clientKick)
    
    IsActive = true
    notify("WEST31 Mobil Admin Panel V11 Yüklendi! Mobil ekran için optimize edildi.")
end

-- =================================================================
-- KALICILIĞI SAĞLAYAN ANA DÖNGÜ
-- =================================================================

createGUI()

while true do
    if not Player.PlayerGui:FindFirstChild("WEST31_UniversalAdmin") then
        IsActive = false
        wait(1) 
        createGUI()
    end
    wait(1) 
end
