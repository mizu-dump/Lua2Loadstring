-- ===========================================
-- OP W WESTTEAM - KARARLI SÜRÜM (22 Özellik)
-- Full Bright ve GELİŞMİŞ NoClip eklendi.
-- ===========================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui") 
local Lighting = game:GetService("Lighting") 

-- ===========================================
-- 1. ÖZELLİK DURUMLARI (FLAG'LER)
-- ===========================================
local isAntiAfkActive = false
local isNoClipActive = false        -- <<< Durum bayrağı
local isInfiniteJumpActive = false 
local isAntiFreezeActive = false    
local isAimBotActive = false        
local isEspActive = false           
local isFreezeAllActive = false     
local isFloatActive = false         
local isAnimationGlitchActive = false 
local isKillAuraActive = false        
local isWalkSpeedActive = false       
local isFullBrightActive = false      
local isFlyGUILoaded = false          
local isPlayTimeGUILoaded = false     
local isBackdoorScannerLoaded = false 
local isK00pkiddLoaded = false        
local isWestteamWLoaded = false       
local isAdmPanelLoaded = false        
local isSabScLoaded = false           
local isBrookhavenLoaded = false      
local isCoolkiddLoaded = false        
local isBrookhaven2Loaded = false     

local jumpConnection = nil 
local aimbotConnection = nil        
local espConnection = nil           
local animationGlitchConnection = nil 
local killAuraConnection = nil        
local noClipLoop = nil                  -- <<< Yeni: NoClip döngüsü için değişken
local originalGravity = Workspace.Gravity 
local originalWalkSpeed = 16          
local originalBrightness = Lighting.Brightness or 1 

-- Ayarlar
local AIM_PART = "Head" 
local KILL_AURA_RADIUS = 10     
local KILL_AURA_DAMAGE = 10     
local ANIMATION_IDS = {
    "rbxassetid://507766524", "rbxassetid://974597372", "rbxassetid://507766023", 
    "rbxassetid://2579043213", "rbxassetid://507766928",
}

-- Panel Ayarları
local PANEL_WIDTH = 280
local PANEL_HEIGHT = 400
local HEADER_HEIGHT = 45

local BUTTON_HEIGHT = 30
local BUTTON_PADDING = 5
local TOTAL_FEATURES_COUNT = 22 
local PADDING_TOP_BOTTOM = 20 

local REQUIRED_CONTENT_HEIGHT = (BUTTON_HEIGHT + BUTTON_PADDING) * TOTAL_FEATURES_COUNT + PADDING_TOP_BOTTOM
local CONTENT_HEIGHT = math.max(REQUIRED_CONTENT_HEIGHT, (PANEL_HEIGHT - HEADER_HEIGHT) + 500)

-- Renkler 
local BACKGROUND_COLOR = Color3.fromRGB(40, 40, 40)
local BUTTON_COLOR = Color3.fromRGB(60, 60, 60)
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)
local ACCENT_COLOR = Color3.fromRGB(255, 85, 0)
local ESP_COLOR = Color3.fromRGB(0, 255, 255) 

local espDrawings = {}

-- ===========================================
-- 2. GUI YAPISI VE HAREKETİ (AYNI)
-- ===========================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OP_W_WESTTEAM_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "WESTTEAM_POWER_Panel"
MainFrame.Size = UDim2.new(0, PANEL_WIDTH, 0, PANEL_HEIGHT) 
MainFrame.Position = UDim2.new(0.05, 0, 0.5, -PANEL_HEIGHT / 2) 
MainFrame.BackgroundColor3 = BACKGROUND_COLOR
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 8)
FrameCorner.Parent = MainFrame

local Header = Instance.new("TextLabel")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, HEADER_HEIGHT - 5)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundColor3 = BACKGROUND_COLOR
Header.Text = "WESTTEAM-POWER ♕ — Unified Admin"
Header.TextColor3 = TEXT_COLOR
Header.Font = Enum.Font.SourceSansBold
Header.TextSize = 18
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.TextWrapped = true
Header.Parent = MainFrame

local Line = Instance.new("Frame")
Line.Size = UDim2.new(1, -10, 0, 2)
Line.Position = UDim2.new(0.5, 0, 0, HEADER_HEIGHT)
Line.BackgroundColor3 = ACCENT_COLOR
Line.AnchorPoint = Vector2.new(0.5, 0)
Line.BorderSizePixel = 0
Line.Parent = MainFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "FeaturesContainer"
ScrollingFrame.Size = UDim2.new(1, 0, 1, -HEADER_HEIGHT)
ScrollingFrame.Position = UDim2.new(0, 0, 0, HEADER_HEIGHT)
ScrollingFrame.BackgroundColor3 = BACKGROUND_COLOR
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, CONTENT_HEIGHT) 
ScrollingFrame.ScrollBarThickness = 8 
ScrollingFrame.Parent = MainFrame

local Layout = Instance.new("UIListLayout")
Layout.Name = "FeatureLayout"
Layout.Padding = UDim.new(0, BUTTON_PADDING) 
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = ScrollingFrame

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, PADDING_TOP_BOTTOM / 2) 
Padding.PaddingBottom = UDim.new(0, PADDING_TOP_BOTTOM / 2) 
Padding.PaddingLeft = UDim.new(0, 10)
Padding.PaddingRight = UDim.new(0, 10)
Padding.Parent = ScrollingFrame

local dragging = false
local dragStart = Vector2.new()

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = UIS:GetMouseLocation() - MainFrame.AbsolutePosition
        if input.UserInputType == Enum.UserInputType.Touch then
            UIS:CaptureFocus(input)
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

RunService.Heartbeat:Connect(function()
    if dragging then
        local mousePos = UIS:GetMouseLocation()
        local newX = (mousePos.X - dragStart.X) / ScreenGui.AbsoluteSize.X
        local newY = (mousePos.Y - dragStart.Y) / ScreenGui.AbsoluteSize.Y
        MainFrame.Position = UDim2.new(newX, 0, newY, 0)
    end
end)

-- ===========================================
-- 3. ÖZELLİK FONKSİYONLARI (Dahili 12)
-- ===========================================

-- 3.1. Anti-AFK (AYNI)
local function toggleAntiAfk(button)
    isAntiAfkActive = not isAntiAfkActive
    local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if isAntiAfkActive then
        coroutine.wrap(function() while isAntiAfkActive and Humanoid do Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) wait(10) end end)()
        button.Text = "Anti-AFK (Aktif)"
        button.BackgroundColor3 = ACCENT_COLOR
    else
        button.Text = "Anti-AFK"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- 3.2. NoClip (GELİŞTİRİLDİ)
local function setCharacterCollision(char, collisionState)
    if not char then return end
    for _, part in ipairs(char:GetChildren()) do
        if part:IsA("BasePart") and not part:IsA("Accessory") and part.Name ~= "HumanoidRootPart" then 
            part.CanCollide = collisionState
        end
    end
end

local function noClipMonitor()
    while isNoClipActive do
        local char = LocalPlayer.Character
        if char then
            setCharacterCollision(char, false)
        end
        RunService.Heartbeat:Wait() -- Her karede kontrol et
    end
end

local function handleCharacterNoClip(char)
    if isNoClipActive then
        setCharacterCollision(char, false)
    end
end

local function toggleNoClip(button)
    isNoClipActive = not isNoClipActive
    
    if isNoClipActive then
        local char = LocalPlayer.Character
        if char then setCharacterCollision(char, false) end
        
        noClipLoop = coroutine.wrap(noClipMonitor)() -- Sürekli kontrol eden döngüyü başlat
        LocalPlayer.CharacterAdded:Connect(handleCharacterNoClip) -- Yeniden spawn'da devreye girsin
        
        button.Text = "NoClip (Aktif - Gelişmiş)"
        button.BackgroundColor3 = ACCENT_COLOR
    else
        local char = LocalPlayer.Character
        if char then setCharacterCollision(char, true) end
        
        if noClipLoop then noClipLoop = nil end -- Döngüyü durdurmak için bayrağı kullanıyoruz
        
        button.Text = "NoClip"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end
-- 3.3. InfiniteJump (AYNI)
local function handleJumpRequest()
    local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if isInfiniteJumpActive and Humanoid and Humanoid.Health > 0 then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

local function toggleInfiniteJump(button)
    isInfiniteJumpActive = not isInfiniteJumpActive
    if isInfiniteJumpActive then
        button.Text = "InfiniteJump (Aktif)"
        button.BackgroundColor3 = ACCENT_COLOR
        jumpConnection = UIS.JumpRequest:Connect(handleJumpRequest) 
    else
        button.Text = "InfiniteJump"
        button.BackgroundColor3 = BUTTON_COLOR
        if jumpConnection then jumpConnection:Disconnect(); jumpConnection = nil end
    end
end

-- 3.4. Anti-Freeze (AYNI)
local function antiFreezeLoop()
    while isAntiFreezeActive and LocalPlayer.Character do
        local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Humanoid and Humanoid.Health > 0 then
            local currentState = Humanoid:GetState()
            if currentState == Enum.HumanoidStateType.None or
               currentState == Enum.HumanoidStateType.Seated or 
               currentState == Enum.HumanoidStateType.PlatformStanding or
               currentState == Enum.HumanoidStateType.Physics then
                Humanoid:ChangeState(Enum.HumanoidStateType.Running)
            end
        end
        wait() 
    end
end

local function toggleAntiFreeze(button)
    isAntiFreezeActive = not isAntiFreezeActive
    if isAntiFreezeActive then
        coroutine.wrap(antiFreezeLoop)()
        button.Text = "Anti-Freeze (Aktif)"
        button.BackgroundColor3 = ACCENT_COLOR
    else
        button.Text = "Anti-Freeze"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- 3.5. AimBot (AYNI)
local function findTarget()
    local minDistance = math.huge
    local target = nil
    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.Health > 0 then
            local targetHRP = player.Character.HumanoidRootPart
            local distance = (myHRP.Position - targetHRP.Position).Magnitude
            if distance < minDistance then
                minDistance = distance
                target = player.Character
            end
        end
    end
    return target
end

local function aimBotLoop()
    if not isAimBotActive or not LocalPlayer.Character or not Workspace.CurrentCamera then return end
    local target = findTarget()
    if target and target:FindFirstChild(AIM_PART) then
        local targetPart = target[AIM_PART]
        local headPosition = targetPart.Position
        Workspace.CurrentCamera.CFrame = CFrame.lookAt(
            Workspace.CurrentCamera.CFrame.Position, 
            headPosition
        )
    end
end

local function toggleAimBot(button)
    isAimBotActive = not isAimBotActive
    if isAimBotActive then
        button.Text = "AimBot (Aktif - " .. AIM_PART .. ")"
        button.BackgroundColor3 = ACCENT_COLOR
        aimbotConnection = RunService.Heartbeat:Connect(aimBotLoop)
        UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
    else
        button.Text = "AimBot"
        button.BackgroundColor3 = BUTTON_COLOR
        if aimbotConnection then aimbotConnection:Disconnect(); aimbotConnection = nil end
        UIS.MouseBehavior = Enum.MouseBehavior.Default
    end
end

-- 3.6. ESP (Box/Name) (AYNI)
local function createPlayerBoxESP(player)
    local char = player.Character
    if not char then return end
    for _, drawing in pairs(espDrawings[player] or {}) do drawing:Destroy() end
    espDrawings[player] = {}
    local Head = char:FindFirstChild("Head")
    local HRP = char:FindFirstChild("HumanoidRootPart")
    if not Head or not HRP then return end
    
    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = "WESTTEAM_ESP_Billboard"
    Billboard.Size = UDim2.new(0, 100, 0, 20)
    Billboard.Adornee = Head 
    Billboard.AlwaysOnTop = true 
    Billboard.MaxDistance = math.huge 
    Billboard.ExtentsOffset = Vector3.new(0, 1.5, 0)
    Billboard.Parent = CoreGui 

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, 0, 1, 0)
    NameLabel.Text = player.Name
    NameLabel.TextColor3 = ESP_COLOR
    NameLabel.TextStrokeTransparency = 0 
    NameLabel.BackgroundTransparency = 1
    NameLabel.Font = Enum.Font.SourceSans
    NameLabel.TextSize = 14
    NameLabel.Parent = Billboard
    
    espDrawings[player][1] = Billboard

    local BoxFrame = Instance.new("Frame")
    BoxFrame.Name = "WESTTEAM_ESP_BoxFrame"
    BoxFrame.Size = UDim2.new(0, 2, 0, 2)
    BoxFrame.BackgroundTransparency = 1
    BoxFrame.BorderSizePixel = 0
    BoxFrame.ZIndex = 5
    BoxFrame.Parent = PlayerGui 
    
    local drawBox = {}
    for i=1, 4 do
        local edge = Instance.new("Frame")
        edge.Name = "Edge" .. i
        edge.BackgroundColor3 = ESP_COLOR
        edge.BorderSizePixel = 0
        edge.ZIndex = 5
        edge.Parent = BoxFrame
        drawBox[i] = edge
    end
    
    espDrawings[player][2] = BoxFrame
end

local function updateBoxESP()
    if not isEspActive or not LocalPlayer.Character or not Workspace.CurrentCamera then return end
    local camera = Workspace.CurrentCamera
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local HRP = char:FindFirstChild("HumanoidRootPart")
            local Head = char:FindFirstChild("Head")
            
            if HRP and Head then
                local boxFrame = espDrawings[player] and espDrawings[player][2]
                if not boxFrame then continue end
                local boxData = boxFrame:GetChildren()

                local upperPos = Head.Position + Vector3.new(0, Head.Size.Y / 2, 0)
                local lowerPos = HRP.Position - Vector3.new(0, HRP.Size.Y / 2, 0)
                
                local upperScreen, upperVis = camera:WorldToScreenPoint(upperPos)
                local lowerScreen, lowerVis = camera:WorldToScreenPoint(lowerPos)

                if upperVis and lowerVis then
                    local height = math.abs(upperScreen.Y - lowerScreen.Y)
                    local width = height * 0.6
                    local center = Vector2.new(upperScreen.X, upperScreen.Y + height / 2)
                    local topLeft = center - Vector2.new(width / 2, height / 2)
                    local lineThickness = 1.5

                    boxData[1].Position = UDim2.new(0, topLeft.X, 0, topLeft.Y); boxData[1].Size = UDim2.new(0, lineThickness, 0, height)
                    boxData[2].Position = UDim2.new(0, topLeft.X + width - lineThickness, 0, topLeft.Y); boxData[2].Size = UDim2.new(0, lineThickness, 0, height)
                    boxData[3].Position = UDim2.new(0, topLeft.X, 0, topLeft.Y); boxData[3].Size = UDim2.new(0, width, 0, lineThickness)
                    boxData[4].Position = UDim2.new(0, topLeft.X, 0, topLeft.Y + height - lineThickness); boxData[4].Size = UDim2.new(0, width, 0, lineThickness)

                    boxFrame.Visible = true
                else
                    boxFrame.Visible = false
                end
            else
                if espDrawings[player] then
                    for _, drawing in pairs(espDrawings[player]) do drawing:Destroy() end
                    espDrawings[player] = nil
                end
            end
        end
    end
end

local function togglePlayerESP(player, shouldActivate)
    if shouldActivate then
        createPlayerBoxESP(player)
    else
        if espDrawings[player] then
            for _, drawing in pairs(espDrawings[player]) do drawing:Destroy() end
            espDrawings[player] = nil
        end
    end
end

local function handleCharacterAdded(char, player)
    if isEspActive then
        togglePlayerESP(player, true)
    end
end

local function espActivation(shouldActivate)
    if shouldActivate then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                togglePlayerESP(player, true)
                player.CharacterAdded:Connect(function(char) handleCharacterAdded(char, player) end)
            end
        end
        espConnection = RunService.RenderStepped:Connect(updateBoxESP) 
    else
        for player, drawings in pairs(espDrawings) do
            for _, drawing in pairs(drawings) do drawing:Destroy() end
        end
        espDrawings = {}
        if espConnection then espConnection:Disconnect(); espConnection = nil end
    end
end

local function toggleESP(button)
    isEspActive = not isEspActive
    if isEspActive then
        button.Text = "ESP (Aktif - Box/İsim)"
        button.BackgroundColor3 = ACCENT_COLOR
        espActivation(true)
    else
        button.Text = "ESP"
        button.BackgroundColor3 = BUTTON_COLOR
        espActivation(false)
    end
end

-- 3.7. Freeze All (AYNI)
local function freezeAllActivation(shouldFreeze)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local char = player.Character
            if char then
                local HRP = char:FindFirstChild("HumanoidRootPart")
                if HRP then
                    if shouldFreeze then
                        HRP.Velocity = Vector3.new(0, 0, 0)
                        HRP.RotationalVelocity = Vector3.new(0, 0, 0)
                        HRP.Anchored = true 
                    else
                        HRP.Anchored = false
                    end
                end
            end
        end
    end
end

local function freezeAllLoop()
    while isFreezeAllActive do
        freezeAllActivation(true) 
        RunService.Heartbeat:Wait()
    end
    freezeAllActivation(false)
end

local function toggleFreezeAll(button)
    isFreezeAllActive = not isFreezeAllActive

    if isFreezeAllActive then
        button.Text = "Freeze All (Aktif - LALOL HUB)" 
        button.BackgroundColor3 = ACCENT_COLOR
        coroutine.wrap(freezeAllLoop)()
    else
        button.Text = "Freeze All (LALOL HUB)" 
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- 3.8. Float (AYNI)
local function toggleFloat(button)
    isFloatActive = not isFloatActive
    
    if isFloatActive then
        Workspace.Gravity = 10 
        button.Text = "Float (Aktif)"
        button.BackgroundColor3 = ACCENT_COLOR
    else
        Workspace.Gravity = originalGravity
        button.Text = "Float"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- 3.9. Animation Glitch (AYNI)
local function animationGlitchLoop()
    local character = LocalPlayer.Character
    local Humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    if not character or not Humanoid then return end
    
    local Anim = Instance.new("Animation")
    local Animator = Humanoid:FindFirstChildOfClass("Animator")
    
    if not Animator then return end
    
    local animTrack = Animator:LoadAnimation(Anim) 
    animTrack:Play() 

    while isAnimationGlitchActive and Humanoid.Health > 0 do
        local randomAnimId = ANIMATION_IDS[math.random(1, #ANIMATION_IDS)]
        
        Anim.AnimationId = randomAnimId
        animTrack = Animator:LoadAnimation(Anim)
        
        animTrack:Play()
        
        wait(0.1) 
        
        animTrack:Stop() 
        animTrack:Destroy()
    end
    
    local tracks = Animator:GetPlayingAnimationTracks()
    for _, track in ipairs(tracks) do
        track:Stop()
    end
    Anim:Destroy()
end

local function toggleAnimationGlitch(button)
    isAnimationGlitchActive = not isAnimationGlitchActive

    if isAnimationGlitchActive then
        button.Text = "Animation Glitch (Aktif)"
        button.BackgroundColor3 = ACCENT_COLOR
        coroutine.wrap(animationGlitchLoop)() 
    else
        button.Text = "Animation Glitch"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- 3.10. Kill Aura (AYNI)
local function killAuraLoop()
    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    
    if not myChar or not myHRP then return end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetChar = player.Character
            local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid")
            
            if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then
                local distance = (myHRP.Position - targetHRP.Position).Magnitude
                
                if distance <= KILL_AURA_RADIUS then
                    targetHumanoid:TakeDamage(KILL_AURA_DAMAGE)
                end
            end
        end
    end
end

local function toggleKillAura(button)
    isKillAuraActive = not isKillAuraActive

    if isKillAuraActive then
        button.Text = "Kill Aura (Aktif - " .. KILL_AURA_RADIUS .. "m)"
        button.BackgroundColor3 = ACCENT_COLOR
        
        killAuraConnection = RunService.Heartbeat:Connect(killAuraLoop)
    else
        button.Text = "Kill Aura"
        button.BackgroundColor3 = BUTTON_COLOR
        
        if killAuraConnection then
            killAuraConnection:Disconnect()
            killAuraConnection = nil
        end
    end
end

-- 3.11. WalkSpeed 100 (AYNI)
local function setWalkSpeed(speed)
    local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        Humanoid.WalkSpeed = speed
    end
end

local function toggleWalkSpeed100(button)
    isWalkSpeedActive = not isWalkSpeedActive
    
    if isWalkSpeedActive then
        setWalkSpeed(100)
        button.Text = "WalkSpeed: 100 (Aktif)"
        button.BackgroundColor3 = Color3.fromRGB(135, 206, 250) 
    else
        setWalkSpeed(originalWalkSpeed)
        button.Text = "WalkSpeed: 100"
        button.BackgroundColor3 = BUTTON_COLOR
    end
    
    LocalPlayer.CharacterAdded:Connect(function(char)
        if isWalkSpeedActive then
            local newHumanoid = char:WaitForChild("Humanoid")
            newHumanoid.WalkSpeed = 100
        end
    end)
end

-- 3.12. Full Bright (AYNI)
local function toggleFullBright(button)
    isFullBrightActive = not isFullBrightActive

    if isFullBrightActive then
        originalBrightness = Lighting.Brightness 
        Lighting.Brightness = 5 
        Lighting.GlobalShadows = false 
        button.Text = "Full Bright (Aktif)"
        button.BackgroundColor3 = Color3.fromRGB(255, 255, 100) 
    else
        Lighting.Brightness = originalBrightness 
        Lighting.GlobalShadows = true 
        button.Text = "Full Bright"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end


-- ===========================================
-- 4. ÖZELLİK FONKSİYONLARI (Harici 10 - AYNI)
-- ===========================================

-- 4.1. Load Fly GUI V4 
local function toggleLoadFlyGUI(button)
    if not isFlyGUILoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-script-gui-v4-made-by-me-64278"))()
        isFlyGUILoaded = true
        button.Text = "Fly GUI V4 (Açıldı!)"
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        button.Text = "Fly GUI V4 (Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end

-- 4.2. Play Time
local function togglePlayTime(button)
    if not isPlayTimeGUILoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Play-time-63991"))()
        isPlayTimeGUILoaded = true
        button.Text = "Play Time (Açıldı!)"
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        button.Text = "Play Time (Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end

-- 4.3. Backdoor XP SCANNER
local function toggleBackdoorScanner(button)
    if not isBackdoorScannerLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-XP-Backdoor-Scanner-51591"))()
        isBackdoorScannerLoaded = true
        button.Text = "XP SCANNER (Açıldı!)"
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0) 
    else
        button.Text = "XP SCANNER (Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end

-- 4.4. k00pkidd (Hacker)
local function toggleK00pkidd(button)
    if not isK00pkiddLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-k00pkidd-39401"))()
        isK00pkiddLoaded = true
        button.Text = "k00pkidd (Açıldı!)"
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0) 
    else
        button.Text = "k00pkidd (Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end

-- 4.5. SAB SC (Kurd Hub)
local function toggleSabSc(button)
    if not isSabScLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Kurd-Hub-29484"))()
        isSabScLoaded = true
        button.Text = "SAB SC (Kurd Hub - AÇILDI!)"
        button.BackgroundColor3 = Color3.fromRGB(255, 170, 0) 
    else
        button.Text = "SAB SC (Kurd Hub - Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end

-- 4.6. Brookhaven SC (Sander XY)
local function toggleBrookhavenSC(button)
    if not isBrookhavenLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))()
        isBrookhavenLoaded = true
        button.Text = "Brookhaven SC 1 (Sander XY - AÇILDI!)"
        button.BackgroundColor3 = Color3.fromRGB(85, 255, 0) 
    else
        button.Text = "Brookhaven SC 1 (Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end

-- 4.7. Brookhaven OP 2 (FURIA HUB)
local function toggleBrookhaven2(button)
    if not isBrookhaven2Loaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-FURIA-HUB-47441"))()
        isBrookhaven2Loaded = true
        button.Text = "Brookhaven OP 2 (FURIA HUB - AÇILDI!)"
        button.BackgroundColor3 = Color3.fromRGB(255, 105, 180) 
    else
        button.Text = "Brookhaven OP 2 (Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end

-- 4.8. c00lkidd excutor.s
local function toggleCoolkiddExecutor(button)
    if not isCoolkiddLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lkidd-executor-2025-61657"))()
        isCoolkiddLoaded = true
        button.Text = "c00lkidd excutor.s (AÇILDI!)"
        button.BackgroundColor3 = Color3.fromRGB(255, 20, 147) 
    else
        button.Text = "c00lkidd excutor.s (Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end

-- 4.9. WESTTEAM-W (Ana Script)
local function toggleWestteamW(button)
    if not isWestteamWLoaded then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM.lua"))()
        isWestteamWLoaded = true
        button.Text = "WESTTEAM-W (ANA HUB - BAŞLATILDI!)"
        button.BackgroundColor3 = Color3.fromRGB(0, 200, 255) 
    else
        button.Text = "WESTTEAM-W (Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end

-- 4.10. WESTTEAM-ADM-PANEL (Nihai Yönetim)
local function toggleAdmPanel(button)
    if not isAdmPanelLoaded then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BY-WEST-UNİVERSAL.lua"))()
        isAdmPanelLoaded = true
        button.Text = "**WESTTEAM-ADM-PANEL** (AÇILDI!)"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
    else
        button.Text = "**WESTTEAM-ADM-PANEL** (Yüklü)"
        button.BackgroundColor3 = ACCENT_COLOR
    end
end


-- ===========================================
-- 5. BUTON OLUŞTURUCU (AYNI)
-- ===========================================

local function createButton(text, clickFunction)
    local Button = Instance.new("TextButton")
    Button.Name = text:gsub(" ", "") .. "Button"
    Button.Size = UDim2.new(1, 0, 0, BUTTON_HEIGHT) 
    Button.BackgroundColor3 = BUTTON_COLOR
    Button.TextColor3 = TEXT_COLOR
    Button.Text = text
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 16
    Button.BorderSizePixel = 0
    Button.Parent = ScrollingFrame

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button
    
    Button.MouseButton1Click:Connect(function()
        clickFunction(Button)
    end)
    
    return Button
end

-- ===========================================
-- 6. ÖZELLİKLERİ PANELE EKLEME (NİHAİ LİSTE - AYNI SIRALAMA)
-- ===========================================

-- Dahili Özellikler (12 Adet)
createButton("Anti-AFK", toggleAntiAfk)
createButton("NoClip", toggleNoClip) -- GELİŞTİRİLDİ
createButton("InfiniteJump", toggleInfiniteJump)
createButton("Anti-Freeze", toggleAntiFreeze)
createButton("AimBot", toggleAimBot)
createButton("ESP", toggleESP)
createButton("Freeze All (LALOL HUB)", toggleFreezeAll)
createButton("Float", toggleFloat)
createButton("Animation Glitch", toggleAnimationGlitch)
createButton("Kill Aura", toggleKillAura)
createButton("WalkSpeed: 100", toggleWalkSpeed100) 
createButton("Full Bright", toggleFullBright) 

-- Harici Araçlar (10 Adet)
createButton("Load Fly GUI V4", toggleLoadFlyGUI)
createButton("Play Time", togglePlayTime)
createButton("Backdoor XP SCANNER", toggleBackdoorScanner)
createButton("k00pkidd (Hacker)", toggleK00pkidd)
createButton("SAB SC (Kurd Hub)", toggleSabSc) 
createButton("Brookhaven SC 1 (Sander XY)", toggleBrookhavenSC)
createButton("Brookhaven OP 2 (FURIA HUB)", toggleBrookhaven2) 
createButton("c00lkidd excutor.s", toggleCoolkiddExecutor) 

-- Ana WESTTEAM Hub'ları (2 Adet)
createButton("WESTTEAM-W (ANA HUB)", toggleWestteamW)
createButton("**WESTTEAM-ADM-PANEL**", toggleAdmPanel)

print("OP W WESTTEAM GUI: Nihai 22 özellikli menü başarıyla güncellendi. NoClip GELİŞTİRİLDİ ve daha kararlı!")

