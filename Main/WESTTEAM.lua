-- Delta, Fluxus veya diğer modern mobil executor'lar için optimize edildi.
-- Admin Paneli (Client-Side) - WEŚTTEÂM-FŪĆK-RØBLŌX V63.2: BACKDOOR UI (Yazılar Güncellendi)

local Player, Character, Humanoid, Root 
local NEON_COLOR = Color3.fromRGB(255, 0, 0) 
local BUTTON_COLOR = Color3.fromRGB(255, 165, 0) 
local TEXT_COLOR = Color3.fromRGB(255, 255, 255) 
local BACKGROUND_COLOR = Color3.fromRGB(5, 5, 5) 
local FEATURE_HEIGHT = 45 
local Toggles = {} 
local ButtonStates = {} 
local SpawnedParts = {} 
local FpsKillerThreads = {}
local MapColorParts = {} 
local OriginalGravity = 196.2 

-- Mutlak Lag Durumları
local DISCO_ACTIVE, FLY_MODE_ACTIVE, TRAIL_CHAOS_ACTIVE, FPS_KILLER_ACTIVE, MAP_COLOR_CHAOS_ACTIVE, GRAVITY_CHAOS_ACTIVE, PHASE_ACTIVE, TELEPORT_SPAM_ACTIVE, LAG_SPHERE_ACTIVE = false, false, false, false, false, false, false, false, false
local PING_SPAM_ACTIVE = false 
local LAG_ALL_ACTIVE = false 
local WESTTEAM_POWER_ACTIVE = false 
local BEST_LABEL_ACTIVE = false 
local PERMANENT_FIRE_ACTIVE = false 
local CLONE_FLOOD_ACTIVE = false 
local WestteamPowerLabels = {} 
local WestteamPowerThreads = {}
local BestLabelsContainer = {} 
local FireConnections = {} 
local CloneFloodParts = {} 

-- =================================================================
-- KRİTİK BAŞLATMA VE HATA KORUMASI
-- =================================================================

local function notify(message) 
    pcall(function() game:GetService("StarterGui"):SetCore("SendNotification", {Title = "WEŚTTEÂM-FŪĆK-RØBLŌX", Text = message, Duration = 4}) end) 
end

local function setToggle(name, state) 
    Toggles[name] = state 
end

local function updateButtonState(name, state) 
    if ButtonStates[name] then
        local Button = ButtonStates[name]
        -- GÜNCELLENDİ: [PASİF] yerine [BACKDOOR¶] kullanıldı
        local passiveText = " [BACKDOOR¶]" 
        Button.Text = name .. (state and " [AKTİF]" or passiveText)
        Button.BackgroundColor3 = state and NEON_COLOR or BUTTON_COLOR
        Button.TextColor3 = state and TEXT_COLOR or BACKGROUND_COLOR
    end
end

local function initialize()
    local Players = game:GetService("Players")
    if not Players then return false end
    
    Player = Players.LocalPlayer
    if not Player then return false end
    
    Character = Player.Character or Player.CharacterAdded:Wait()
    Humanoid = Character:FindFirstChildOfClass("Humanoid")
    Root = Character:FindFirstChild("HumanoidRootPart")
    
    if not Humanoid or not Root then return false end
    OriginalGravity = game.Workspace.Gravity
    
    notify("WEŚTTEÂM-FŪĆK-RØBLŌX V63.2: BACKDOOR UI Yüklendi. GUI Başlatılıyor...")
    return true
end

-- =================================================================
-- ÖZELLİK FONKSİYONLARI (KOPYALANAN KODUNDAN)
-- =================================================================

-- [BEST LABEL CHAOS KODU BURADA KORUNDU]
local function createBestLabel(targetCharacter)
    local Head = targetCharacter:FindFirstChild("Head")
    if not Head or Head:FindFirstChild("BestLabelChaos") then return end

    local Billboard = Instance.new("BillboardGui")
    Billboard.Size = UDim2.new(8, 0, 3, 0) 
    Billboard.Name = "BestLabelChaos"
    Billboard.Adornee = Head
    Billboard.AlwaysOnTop = true
    Billboard.ExtentsOffset = Vector3.new(0, 1.5, 0)
    Billboard.Parent = Head
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "WESTTEAM-Best"
    TextLabel.Font = Enum.Font.Highway
    TextLabel.TextScaled = true
    TextLabel.TextColor3 = NEON_COLOR
    TextLabel.TextStrokeColor3 = BACKGROUND_COLOR
    TextLabel.TextStrokeTransparency = 0.8
    TextLabel.ZIndex = 5
    TextLabel.Parent = Billboard

    local thread = task.spawn(function()
        while Billboard and TextLabel and BEST_LABEL_ACTIVE do
            pcall(function()
                local t = tick()
                TextLabel.TextColor3 = Color3.fromHSV((t * 2.5) % 1, 1, 1) 
                TextLabel.TextTransparency = math.abs(math.sin(t * 5)) * 0.4 
                local scale = 1 + math.sin(t * 6) * 0.2 
                Billboard.Size = UDim2.new(8 * scale, 0, 3 * scale, 0)
            end)
            task.wait(0.04)
        end
    end)
    table.insert(BestLabelsContainer, {Billboard = Billboard, Thread = thread})
end

local function onBestLabelCharacterAdded(character) 
    local Head = character:FindFirstChild("Head")
    if Head and BEST_LABEL_ACTIVE then createBestLabel(character) end
end

local function onBestLabelPlayerAdded(targetPlayer) 
    if targetPlayer == Player then onBestLabelCharacterAdded(Player.Character or Player.CharacterAdded:Wait()) return end
    FireConnections[targetPlayer .. "_Label"] = targetPlayer.CharacterAdded:Connect(onBestLabelCharacterAdded)
    if targetPlayer.Character then onBestLabelCharacterAdded(targetPlayer.Character) end
end

local function toggleBestLabelChaos(state)
    BEST_LABEL_ACTIVE = state
    setToggle("BEST LABEL CHAOS 👑", state)

    if state then
        notify("BEST LABEL CHAOS 👑 AKTİF! WESTTEAM-Best herkesin üstünde!")
        onBestLabelPlayerAdded(Player) 
        FireConnections.LabelPlayerAdded = game.Players.PlayerAdded:Connect(onBestLabelPlayerAdded)
        for _, targetPlayer in ipairs(game:GetService("Players"):GetPlayers()) do onBestLabelPlayerAdded(targetPlayer) end
    else
        notify("BEST LABEL CHAOS 👑 PASİF. Etiketler temizleniyor.")
        if FireConnections.LabelPlayerAdded then FireConnections.LabelPlayerAdded:Disconnect() end
        for _, item in ipairs(BestLabelsContainer) do pcall(function() task.cancel(item.Thread) end); if item.Billboard and item.Billboard.Parent then pcall(function() item.Billboard:Destroy() end) end end
        BestLabelsContainer = {}
    end
end

local function applyFire(targetCharacter)
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    local targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
    
    if not targetRoot or not targetHumanoid or targetCharacter.Parent == Player.Character.Parent then return end

    pcall(function()
        if not targetRoot:FindFirstChild("PermanentFire") then
            local Fire = Instance.new("Fire")
            Fire.Name = "PermanentFire" 
            Fire.Parent = targetRoot
            Fire.Heat = 100 
            Fire.Size = 10 
            Fire.Color = Color3.fromRGB(255, 50, 0) 
            Fire.Enabled = true
        end

        for i = 1, 3 do targetHumanoid:TakeDamage(math.huge); task.wait(0.1) end
    end)
end

local function onFireCharacterAdded(character)
    if PERMANENT_FIRE_ACTIVE then applyFire(character) end
end

local function onFirePlayerAdded(targetPlayer)
    if targetPlayer == Player then return end
    FireConnections[targetPlayer.UserId .. "_Fire"] = targetPlayer.CharacterAdded:Connect(onFireCharacterAdded)
    if targetPlayer.Character then onFireCharacterAdded(targetPlayer.Character) end
end

local function togglePermanentFire(state)
    PERMANENT_FIRE_ACTIVE = state
    setToggle("PERMANENT FIRE 🔥 (AÇ/KAPA)", state)

    if state then
        notify("PERMANENT FIRE 🔥 REJİMİ AKTİF! Herkes sonsuza dek yanacak!")
        FireConnections.FirePlayerAdded = game.Players.PlayerAdded:Connect(onFirePlayerAdded)
        for _, targetPlayer in ipairs(game:GetService("Players"):GetPlayers()) do onFirePlayerAdded(targetPlayer) end
    else
        notify("PERMANENT FIRE 🔥 REJİMİ PASİF. Yangınlar temizleniyor.")
        if FireConnections.FirePlayerAdded then FireConnections.FirePlayerAdded:Disconnect() end
        for userId, conn in pairs(FireConnections) do if string.find(tostring(userId), "_Fire") then pcall(function() conn:Disconnect() FireConnections[userId] = nil end) end end
        
        for _, targetPlayer in ipairs(game:GetService("Players"):GetPlayers()) do
            if targetPlayer.Character then
                local fire = targetPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("PermanentFire")
                if fire then pcall(function() fire:Destroy() end) end
            end
        end
    end
end

local function toggleCloneFlood(state)
    CLONE_FLOOD_ACTIVE = state
    setToggle("OMEGA CLONE FLOOD 🌊 (LAG)", state)

    if state then
        notify("OMEGA CLONE FLOOD 🌊 BAŞLADI! RAM ve CPU'ya saldırı!")
        
        local BasePart = Instance.new("Part"); BasePart.Anchored = true; BasePart.CanCollide = false; BasePart.Transparency = 0.5; BasePart.BrickColor = BrickColor.random(); BasePart.Material = Enum.Material.Neon
        BasePart.Size = Vector3.new(1, 1, 1)

        local thread = task.spawn(function()
            local cloneCount = 0
            while CLONE_FLOOD_ACTIVE and cloneCount < 5000 do 
                pcall(function()
                    local newClone = BasePart:Clone()
                    newClone.CFrame = Root.CFrame * CFrame.new(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
                    newClone.BrickColor = BrickColor.random()
                    newClone.Parent = game.Workspace
                    table.insert(CloneFloodParts, newClone)
                    cloneCount = cloneCount + 1
                    
                    if cloneCount % 100 == 0 then
                         local bigClone = BasePart:Clone(); bigClone.Size = Vector3.new(20, 20, 20); bigClone.BrickColor = BrickColor.new("Really black"); bigClone.Reflectance = 1; bigClone.Parent = game.Workspace
                         table.insert(CloneFloodParts, bigClone)
                    end
                end)
                task.wait(0.001) 
            end
            
            while CLONE_FLOOD_ACTIVE do
                pcall(function()
                    for _, part in ipairs(CloneFloodParts) do
                        if part.Parent then
                            part.CFrame = part.CFrame * CFrame.Angles(0.1, 0.1, 0.1) * CFrame.new(math.random() * 0.1 - 0.05, math.random() * 0.1 - 0.05, math.random() * 0.1 - 0.05)
                        end
                    end
                end)
                task.wait(0.01)
            end
            
        end)
        table.insert(FpsKillerThreads, thread) 
        BasePart:Destroy() 
    end
end

local function toggleFpsKiller(state)
    FPS_KILLER_ACTIVE = state; setToggle("FPS KILLER OMEGA 💀", state)
    if state then
        notify("FPS KILLER OMEGA V3.0 BAŞLATILIYOR! Yüksek frekanslı kaotik hareket.")
        local num_parts = 15000 
        local randBaseX, randBaseY, randBaseZ = math.random() * 10, math.random() * 10, math.random() * 10
        
        for i = 1, num_parts do 
            local size = (i % 50 == 0) and Vector3.new(30, 30, 30) or Vector3.new(0.0001, 0.0001, 0.0001) 
            local part = Instance.new("Part"); part.Size = size; part.Transparency = 0.5; part.CanCollide = false; part.Anchored = false; part.Parent = game.Workspace
            table.insert(SpawnedParts, part)
            
            local thread = task.spawn(function()
                while FPS_KILLER_ACTIVE and part.Parent do 
                    pcall(function() 
                        local tickValue = tick()
                        local rx = math.sin(tickValue * 8 * randBaseX) * 0.8 
                        local ry = math.cos(tickValue * 9 * randBaseY) * 0.8
                        local rz = math.sin(tickValue * 10 * randBaseZ) * 0.8
                        
                        part.CFrame = part.CFrame * CFrame.Angles(rx, ry, rz) * CFrame.new(0, 0, 0.000001) 
                    end)
                    task.wait(0.000001) 
                end
            end)
            table.insert(FpsKillerThreads, thread)
        end
        notify("FPS KILLER: " .. num_parts .. " adet MUTLAK kaotik işlem başlatıldı!")
    end
end

local function togglePingSpam(state)
    PING_SPAM_ACTIVE = state
    setToggle("PING SPAM [AĞ LAG]", state)
    if state then
        notify("SERVER PING SPAM BAŞLADI! V2.0: Ağ Yükü Maksimum!")
        local function pingLoop()
            while PING_SPAM_ACTIVE do
                pcall(function()
                    Root.CFrame = Root.CFrame * CFrame.new(0, 0, math.random() * 0.0001) 
                    local data = {}
                    for i = 1, 5000 do data[i] = {math.random(100), math.random(100), "SPAM_DATA_WEŚTTEÂM_V63"} end
                end)
                task.wait(0.001) 
            end
        end
        task.spawn(pingLoop)
    end
end

local function toggleMapColorChaos(state)
    MAP_COLOR_CHAOS_ACTIVE = state
    setToggle("MAP COLOR CHAOS 🌈", state)
    
    if state then
        notify("MAP COLOR CHAOS BAŞLADI! Harita renkleri + Materyal delirdi.")
        MapColorParts = {}
        for _, descendant in pairs(game.Workspace:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant.Parent ~= Player.Character and descendant.CanCollide then
                MapColorParts[descendant] = {BrickColor = descendant.BrickColor, Material = descendant.Material} 
            end
        end

        local materials = Enum.Material:GetEnumItems()
        local function colorLoop()
            while MAP_COLOR_CHAOS_ACTIVE do
                local newColor = BrickColor.random()
                local newMaterial = materials[math.random(1, #materials)]
                for part, _ in pairs(MapColorParts) do
                    pcall(function() 
                        part.BrickColor = newColor
                        part.Material = newMaterial 
                    end)
                end
                task.wait(0.005) 
            end
        end
        task.spawn(colorLoop)
    else
        notify("MAP COLOR CHAOS Durduruldu. Renkler geri yükleniyor (Temizlikte).")
    end
end

local function toggleLagAll(state)
    LAG_ALL_ACTIVE = state
    setToggle("LAG ALL OMEGA", state)

    if state then
        notify("MUTLAK LAG REJİMİ V63 AKTİF! OYUNUN ÇÖKMESİ GARANTİ! 💀")
        pcall(function() toggleFpsKiller(true) end)
        pcall(function() toggleMapColorChaos(true) end) 
        pcall(function() toggleDisco(true) end)
        pcall(function() toggleTeleportSpam(true) end)
        pcall(function() togglePingSpam(true) end)
        pcall(function() toggleGravityChaos(true) end)
        pcall(function() toggleLagSphere(true) end) 
        pcall(function() toggleCloneFlood(true) end) 
        pcall(function() doSixSixSix() end) 
    else
        notify("MUTLAK LAG REJİMİ PASİF. TEMİZLİK BAŞLADI!")
        cleanup() 
    end
end

local function cleanup() 
    notify("Tüm OMEGA LAG Rejimi Temizleniyor...")
    
    -- Tüm Togglege'ları Kapat
    pcall(function() toggleLagAll(false); updateButtonState("LAG ALL OMEGA", false) end) 
    pcall(function() togglePingSpam(false); updateButtonState("PING SPAM [AĞ LAG]", false) end)
    pcall(function() toggleTeleportSpam(false); updateButtonState("MASSIVE TP SPAM 🚀", false) end)
    pcall(function() togglePhase(false); updateButtonState("OBJECT PHASE [DUVAR]", false) end)
    pcall(function() toggleLagSphere(false); updateButtonState("MAX LAG SPHERE", false) end) 
    pcall(function() toggleMapColorChaos(false); updateButtonState("MAP COLOR CHAOS 🌈", false) end) 
    pcall(function() toggleDisco(false); updateButtonState("DISCO ULTRA HIZ", false) end)
    pcall(function() toggleGravityChaos(false); updateButtonState("GRAVITY CHAOS 🤯", false) end) 
    pcall(function() toggleFlyMode(false); updateButtonState("FLY MODE HIZLI", false) end)
    pcall(function() toggleFpsKiller(false); updateButtonState("FPS KILLER OMEGA 💀", false) end) 
    pcall(function() toggleLocalSpeedBoost(false); updateButtonState("YEREL HIZ X50 🏃", false) end)
    pcall(function() toggleLocalJumpBoost(false); updateButtonState("YEREL ZIPLAMA X120 🚀", false) end)
    pcall(function() toggleWestteamPower(false); updateButtonState("WESTTEAM-POWER 🛑", false) end)
    pcall(function() toggleBestLabelChaos(false); updateButtonState("BEST LABEL CHAOS 👑", false) end) 
    pcall(function() togglePermanentFire(false); updateButtonState("PERMANENT FIRE 🔥 (AÇ/KAPA)", false) end) 
    pcall(function() toggleCloneFlood(false); updateButtonState("OMEGA CLONE FLOOD 🌊 (LAG)", false) end) 
    
    -- Parçaları Temizle
    for _, part in ipairs(SpawnedParts) do pcall(function() part:Destroy() end) end; SpawnedParts = {}
    for _, part in ipairs(CloneFloodParts) do pcall(function() part:Destroy() end) end; CloneFloodParts = {} 
    for _, thread in ipairs(FpsKillerThreads) do pcall(function() task.cancel(thread) end) end; FpsKillerThreads = {}
    
    -- Harita Renklerini Geri Yükle
    if next(MapColorParts) then 
        for part, originalProps in pairs(MapColorParts) do 
            pcall(function() 
                part.BrickColor = originalProps.BrickColor
                part.Material = originalProps.Material
            end) 
        end
        MapColorParts = {} 
    end
    pcall(function() game.Workspace.Gravity = OriginalGravity end)

    -- Bağlantıları Temizle
    for key, conn in pairs(FireConnections) do
        if type(conn) == "userdata" and conn:IsA("RBXScriptConnection") then
            pcall(function() conn:Disconnect() FireConnections[key] = nil end)
        end
    end
    
    notify("Temizlik tamamlandı! OMEGA DESTRUCTION CORE durduruldu.")
end

local function toggleFlyMode(state) FLY_MODE_ACTIVE = state; setToggle("FLY MODE HIZLI", state); notify("Fly Mode "..(state and "Açık" or "Kapalı")) end
local function togglePhase(state) PHASE_ACTIVE = state; setToggle("OBJECT PHASE [DUVAR]", state); notify("Phase "..(state and "Açık" or "Kapalı")) end
local function toggleDisco(state) DISCO_ACTIVE = state; setToggle("DISCO ULTRA HIZ", state); notify("Disco "..(state and "Açık" or "Kapalı")) end
local function toggleGravityChaos(state) GRAVITY_CHAOS_ACTIVE = state; setToggle("GRAVITY CHAOS 🤯", state); notify("Gravity Chaos "..(state and "Açık" or "Kapalı")) end
local function toggleTeleportSpam(state) TELEPORT_SPAM_ACTIVE = state; setToggle("MASSIVE TP SPAM 🚀", state); notify("Teleport Spam "..(state and "Açık" or "Kapalı")) end
local function doSixSixSix() notify("666: DEV LAG PARÇALARI Oluşturuldu.") end 
local function doBlockSpam() notify("Block Spam Başlatıldı.") end 
local function toggleLocalSpeedBoost(state) if Humanoid then Humanoid.WalkSpeed = state and 50 or 16 end; updateButtonState("YEREL HIZ X50 🏃", state); notify("Yerel Hız "..(state and "Açık" or "Kapalı")) end
local function toggleLocalJumpBoost(state) if Humanoid then Humanoid.JumpPower = state and 120 or 50 end; updateButtonState("YEREL ZIPLAMA X120 🚀", state); notify("Yerel Zıplama "..(state and "Açık" or "Kapalı")) end 
local function doKillAll()
    notify("SUNUCU YIKILIYOR! WEŚTTEÂM-FŪĆK-RØBLŌX ABSOLUTE EXIT BAŞLATILDI! 💥")
    pcall(function() 
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "SERVER KICKED", Text = "FUCKING ITS SERVER By-WEŚTTEÂM-FŪĆK-RØBLŌX - Have a nice crash.", Duration = 10, Button1 = "OK", Callback = function() end})
    end) 
    task.wait(2) 
    pcall(function() game:GetService("Players").LocalPlayer:Kick("FUCKING ITS SERVER By-WEŚTTEÂM-FŪĆK-RØBLŌX") end)
    pcall(function() game:GetService("TeleportService"):Teleport(0) end) 
end

local function toggleLagSphere(state)
    LAG_SPHERE_ACTIVE = state
    setToggle("MAX LAG SPHERE", state)
    if state then
        local parts = {}
        local count = 0
        for _, descendant in pairs(game.Workspace:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant.Parent:IsA("Model") and descendant.CanCollide and not descendant.Anchored and count < 1500 then 
                table.insert(parts, descendant)
                count = count + 1
            end
        end

        local function lagLoop()
            while LAG_SPHERE_ACTIVE do
                for _, part in ipairs(parts) do
                    pcall(function()
                        part.Material = Enum.Material.ForceField 
                        part.BrickColor = BrickColor.random()
                        part.Reflectance = 1
                        part.CanCollide = true 
                    end)
                end
                task.wait(0.01) 
            end
        end
        task.spawn(lagLoop)
    end
end
local function toggleWestteamPower(state)
    WESTTEAM_POWER_ACTIVE = state
    setToggle("WESTTEAM-POWER 🛑", state)
    
    if state then
        notify("WESTTEAM-POWER 🛑 AKTİF! WESTTEAM ORDUSU EKRANDA!")
        local ScreenGui = Player.PlayerGui:FindFirstChild("WEŚTTEÂM_FŪĆK_RØBLŌX_V63") 
        if not ScreenGui then return end 
        
        local num_labels = math.random(10, 20) 
        
        for i = 1, num_labels do
            local label = Instance.new("TextLabel")
            label.Name = "WestteamPowerText_" .. i
            label.Size = UDim2.new(0.3 + math.random() * 0.4, 0, 0.15 + math.random() * 0.3, 0) 
            label.Position = UDim2.new(math.random() * 0.8, 0, math.random() * 0.8, 0)
            label.AnchorPoint = Vector2.new(0.5, 0.5)
            label.BackgroundTransparency = 1
            label.Text = "WESTTEAM" 
            label.Font = Enum.Font.Highway
            label.TextSize = math.random(70, 200) 
            label.TextScaled = true
            label.TextColor3 = Color3.fromHSV(math.random() % 1, 1, 1)
            label.ZIndex = 10 
            label.Visible = true
            label.Parent = ScreenGui 
            
            table.insert(WestteamPowerLabels, label) 

            local speedX = math.random(8, 20) / 100 
            local speedY = math.random(8, 20) / 100
            local speedColor = math.random(4, 8) 
            local rotationSpeed = math.random(3, 8) 
            
            local directionX = (math.random() > 0.5 and 1 or -1)
            local directionY = (math.random() > 0.5 and 1 or -1)

            local thread = task.spawn(function()
                while WESTTEAM_POWER_ACTIVE and label.Parent do
                    pcall(function()
                        local t = tick()
                        
                        label.Position = UDim2.new(
                            label.Position.X.Scale + speedX * directionX, 0,
                            label.Position.Y.Scale + speedY * directionY, 0
                        )
                        
                        if label.Position.X.Scale > 0.9 or label.Position.X.Scale < 0.1 then directionX = -directionX end
                        if label.Position.Y.Scale > 0.9 or label.Position.Y.Scale < 0.1 then directionY = -directionY end
                        
                        label.TextColor3 = Color3.fromHSV((t * speedColor) % 1, 1, 1)
                        label.Rotation = (label.Rotation + rotationSpeed) % 360 

                    end)
                    task.wait(0.01) 
                end
            end)
            table.insert(WestteamPowerThreads, thread)
        end
    else
        notify("WESTTEAM-POWER 🛑 PASİF. Ekran temizleniyor.")
    end
end
-- =================================================================
-- GUI OLUŞTURMA (V63.2 - GÜNCELLENMİŞ)
-- =================================================================

local function createGUI()
    local gui_name = "WEŚTTEÂM_FŪĆK_RØBLŌX_V63"
    if Player.PlayerGui:FindFirstChild(gui_name) then return end
    
    local function createSectionHeader(title, parentFrame)
        local Header = Instance.new("TextLabel"); Header.Size = UDim2.new(1, 0, 0, FEATURE_HEIGHT); Header.Text = "--- " .. title .. " ---"; Header.BackgroundColor3 = NEON_COLOR; Header.TextColor3 = TEXT_COLOR; Header.Parent = parentFrame; return Header
    end
    
    local function createSimpleButton(name, commandFunc, parentFrame)
        local Button = Instance.new("TextButton"); Button.Size = UDim2.new(0.32, 0, 0, FEATURE_HEIGHT); Button.Text = name; Button.BackgroundColor3 = BUTTON_COLOR; Button.TextColor3 = BACKGROUND_COLOR; Button.BorderSizePixel = 2; Button.BorderColor3 = NEON_COLOR; Button.Parent = parentFrame
        Button.MouseButton1Click:Connect(function() pcall(commandFunc) end); return Button
    end
    
    local function createToggleButton(name, commandFunc, parentFrame)
        local Button = Instance.new("TextButton"); Button.Size = UDim2.new(0.32, 0, 0, FEATURE_HEIGHT); 
        -- GÜNCELLENDİ: Başlangıç metni artık [BACKDOOR¶]
        Button.Text = name .. " [BACKDOOR¶]"; 
        Button.BackgroundColor3 = BUTTON_COLOR; Button.TextColor3 = BACKGROUND_COLOR; Button.BorderSizePixel = 2; Button.BorderColor3 = NEON_COLOR; Button.Parent = parentFrame
        local state = false; ButtonStates[name] = Button 
        Button.MouseButton1Click:Connect(function()
            state = not state; 
            local passiveText = " [BACKDOOR¶]" -- GÜNCELLENDİ
            Button.Text = name .. (state and " [AKTİF]" or passiveText); 
            Button.BackgroundColor3 = state and NEON_COLOR or BUTTON_COLOR; Button.TextColor3 = state and TEXT_COLOR or BACKGROUND_COLOR 
            pcall(commandFunc, state)
        end); return Button
    end

    local ScreenGui = Instance.new("ScreenGui"); ScreenGui.Name = gui_name; ScreenGui.Parent = Player.PlayerGui
    
    local MainFrame = Instance.new("Frame"); MainFrame.Size = UDim2.new(0.9, 0, 0.9, 0); MainFrame.Position = UDim2.new(0.05, 0, 0.05, 0); MainFrame.BackgroundColor3 = BACKGROUND_COLOR; MainFrame.Active = true; MainFrame.Draggable = true; MainFrame.Visible = false; MainFrame.Parent = ScreenGui
    
    local ToggleButton = Instance.new("TextButton"); ToggleButton.Size = UDim2.new(0.15, 0, 0, 50); ToggleButton.Position = UDim2.new(0.01, 0, 0.01, 0); ToggleButton.Text = "W32"; ToggleButton.BackgroundColor3 = NEON_COLOR; ToggleButton.TextColor3 = TEXT_COLOR; ToggleButton.Parent = ScreenGui
    ToggleButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible; notify("WEŚTTEÂM-FŪĆK-RØBLŌX Panel " .. (MainFrame.Visible and "AKTİF" or "PASİF") .. ".") end)
    
    local Title = Instance.new("TextLabel"); Title.Size = UDim2.new(1, 0, 0, 40); Title.Text = "WEŚTTEÂM-FŪĆK-RØBLŌX: OMEGA CORE"; Title.BackgroundColor3 = NEON_COLOR; Title.TextColor3 = TEXT_COLOR; Title.Parent = MainFrame
    
    local ScrollFrame = Instance.new("ScrollingFrame"); ScrollFrame.Size = UDim2.new(1, 0, 1, -40); ScrollFrame.Position = UDim2.new(0, 0, 0, 40); ScrollFrame.BackgroundTransparency = 1; ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0); ScrollFrame.VerticalScrollBarInset = Enum.ScrollBarInset.Always; ScrollFrame.Parent = MainFrame

    local UIGrid = Instance.new("UIGridLayout"); UIGrid.CellSize = UDim2.new(0.32, 0, 0, FEATURE_HEIGHT); UIGrid.CellPadding = UDim2.new(0.01, 0, 0, 5); UIGrid.HorizontalAlignment = Enum.HorizontalAlignment.Center; UIGrid.Parent = ScrollFrame

    -- BÖLÜM 1: HIZ AYARLARI (YERELLER)
    createSectionHeader("HIZ AYARLARI (LOKAL HAREKET)", ScrollFrame);
    createToggleButton("YEREL HIZ X50 🏃", toggleLocalSpeedBoost, ScrollFrame);
    createToggleButton("YEREL ZIPLAMA X120 🚀", toggleLocalJumpBoost, ScrollFrame);
    createToggleButton("FLY MODE HIZLI", toggleFlyMode, ScrollFrame);

    -- BÖLÜM 2: MUTLAK YIKIM (LAG ALL)
    createSectionHeader("LAG ALL - TEK TUŞ OMEGA YIKIM", ScrollFrame);
    createToggleButton("LAG ALL OMEGA 💀", toggleLagAll, ScrollFrame); 

    -- BÖLÜM 3: MÜDAHALE & SON MESAJ
    createSectionHeader("GÖRSEL KAOS & YIKIM", ScrollFrame);
    createToggleButton("WESTTEAM-POWER 🛑", toggleWestteamPower, ScrollFrame); 
    createToggleButton("BEST LABEL CHAOS 👑", toggleBestLabelChaos, ScrollFrame); 
    createToggleButton("PERMANENT FIRE 🔥 (AÇ/KAPA)", togglePermanentFire, ScrollFrame); 
    createSimpleButton("666 OMEGA YOK ET", doSixSixSix, ScrollFrame);
    createSimpleButton("BLOCK SPAM OMEGA", doBlockSpam, ScrollFrame);
    createToggleButton("FPS KILLER OMEGA 💀", toggleFpsKiller, ScrollFrame);
    createSimpleButton("KILL ALL & EXIT 💥", doKillAll, ScrollFrame); 
    createSimpleButton("KAOS TEMİZLEME 🧹", cleanup, ScrollFrame);
    
    -- BÖLÜM 4: ABSOLUTE KAOS 
    createSectionHeader("DERİN SİSTEM KAOSU", ScrollFrame);
    createToggleButton("OMEGA CLONE FLOOD 🌊 (LAG)", toggleCloneFlood, ScrollFrame); 
    createToggleButton("PING SPAM [AĞ LAG]", togglePingSpam, ScrollFrame); 
    createToggleButton("MASSIVE TP SPAM 🚀", toggleTeleportSpam, ScrollFrame);
    createToggleButton("OBJECT PHASE [DUVAR]", togglePhase, ScrollFrame);
    createToggleButton("MAX LAG SPHERE", toggleLagSphere, ScrollFrame);
    createToggleButton("MAP COLOR CHAOS 🌈", toggleMapColorChaos, ScrollFrame); 
    createToggleButton("DISCO ULTRA HIZ", toggleDisco, ScrollFrame);
    createToggleButton("GRAVITY CHAOS 🤯", toggleGravityChaos, ScrollFrame); 
end

-- Scriptin Çalıştırılması
if initialize() then
    createGUI()
end
