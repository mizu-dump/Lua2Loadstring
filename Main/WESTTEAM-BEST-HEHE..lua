-- ===============================================================
-- ♕ WESTTEAM-POWER 6.2.5: NIHAI BIRLEŞTIRILMIŞ SÜRÜM
-- Toplam 40 Özellik. Harici scriptler butona tekrar basılarak YENİDEN BAŞLATILABİLİR.
-- TSB-GOJO ve TSB-SUKUNA (Key=RVVC SUKUNA) içerir.
-- ===============================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui") 
local Lighting = game:GetService("Lighting") 
local TeleportService = game:GetService("TeleportService") 

-- ===========================================
-- 1. ÖZELLİK DURUMLARI (FLAG'LER) - (TOPLAM 40)
-- ===========================================
local isAntiAfkActive = false
local isNoClipActive = false        
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
local isFOVActive = false           

local isFlyGUILoaded = false          
local isPlayTimeGUILoaded = false     
local isBackdoorScannerLoaded = false 
local isLalolHubLoaded = false      
local isTigerXLoaded = false        
local isK00pkiddLoaded = false        
local isG00byd0lanLoaded = false    
local isUnixBackdoorLoaded = false  
local isHexagonLoaded = false       
local isNytheruneLoaded = false     
local isWestteamWLoaded = false       
local isAdmPanelLoaded = false        
local isSabScLoaded = false           
local isBrookhavenLoaded = false      
local isCoolkiddLoaded = false        
local isBrookhaven2Loaded = false     
local isDripClientLoaded = false    
local isCarFlyLoaded = false        
local isMM2SCLoaded = false         
local is99NightsLoaded = false      
local isDexLoaded = false           
local isBrainrotLoaded = false      
local isServerHopRunning = false    
local isUniversalAimBotLoaded = false 
local isSpeedrunTimerLoaded = false 
local isTSBGojoLoaded = false       
local isTSBSukunaLoaded = false     

-- Bağlantılar ve Değişkenler
local jumpConnection = nil 
local aimbotConnection = nil        
local espConnection = nil           
local killAuraConnection = nil        
local noClipLoop = nil                  
local flyConnection = nil               
local originalGravity = Workspace.Gravity 
local originalWalkSpeed = 16          
local originalBrightness = Lighting.Brightness or 1 
local originalFOV = 70 

local AIM_PART = "Head" 
local KILL_AURA_RADIUS = 50     
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
local SPACER_HEIGHT_SMALL = 50 
local SPACER_HEIGHT_LARGE = 150 
local TOTAL_FEATURES_COUNT = 40 
local PADDING_TOP_BOTTOM = 20 

local REQUIRED_CONTENT_HEIGHT = (BUTTON_HEIGHT + BUTTON_PADDING) * TOTAL_FEATURES_COUNT + SPACER_HEIGHT_SMALL + SPACER_HEIGHT_LARGE + PADDING_TOP_BOTTOM
local CONTENT_HEIGHT = math.max(REQUIRED_CONTENT_HEIGHT, (PANEL_HEIGHT - HEADER_HEIGHT) + 500)

-- Renkler 
local BACKGROUND_COLOR = Color3.fromRGB(40, 40, 40)
local BUTTON_COLOR = Color3.fromRGB(60, 60, 60)
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)
local ACCENT_COLOR = Color3.fromRGB(255, 85, 0)
local UNIVERSAL_COLOR = Color3.fromRGB(255, 192, 203) 
local SPEEDRUN_COLOR = Color3.fromRGB(0, 255, 0)
local TSB_GOJO_COLOR = Color3.fromRGB(0, 150, 255) 
local TSB_SUKUNA_COLOR = Color3.fromRGB(255, 0, 0) 

local espDrawings = {}

-- ===========================================
-- 2. GUI YAPISI VE HAREKETİ
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
Header.Text = "WESTTEAM-POWER ♕ — Unified Admin (V6.2.5)" 
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
-- 3. ÖZELLİK FONKSİYONLARI (Dahili 14)
-- ===========================================
local function toggleAntiAfk(button) isAntiAfkActive = not isAntiAfkActive; local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if isAntiAfkActive then coroutine.wrap(function() while isAntiAfkActive and Humanoid do Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) wait(10) end end)() button.Text = "Anti-AFK (Aktif)"; button.BackgroundColor3 = ACCENT_COLOR else button.Text = "Anti-AFK"; button.BackgroundColor3 = BUTTON_COLOR end end
local function setCharacterCollision(char, collisionState) if not char then return end; for _, part in ipairs(char:GetChildren()) do if part:IsA("BasePart") and not part:IsA("Accessory") and part.Name ~= "HumanoidRootPart" then part.CanCollide = collisionState end end end
local function noClipMonitor() while isNoClipActive do local char = LocalPlayer.Character; if char then setCharacterCollision(char, false) end; RunService.Heartbeat:Wait() end end
local function handleCharacterNoClip(char) if isNoClipActive then setCharacterCollision(char, false) end end
local function toggleNoClip(button) isNoClipActive = not isNoClipActive; if isNoClipActive then local char = LocalPlayer.Character; if char then setCharacterCollision(char, false) end; noClipLoop = coroutine.wrap(noClipMonitor)(); LocalPlayer.CharacterAdded:Connect(handleCharacterNoClip); button.Text = "NoClip (Aktif - Gelişmiş)"; button.BackgroundColor3 = ACCENT_COLOR else local char = LocalPlayer.Character; if char then setCharacterCollision(char, true) end; if noClipLoop then noClipLoop = nil end; button.Text = "NoClip"; button.BackgroundColor3 = BUTTON_COLOR end end
local function handleJumpRequest() local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if isInfiniteJumpActive and Humanoid and Humanoid.Health > 0 then Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end
local function toggleInfiniteJump(button) isInfiniteJumpActive = not isInfiniteJumpActive; if isInfiniteJumpActive then button.Text = "InfiniteJump (Aktif)"; button.BackgroundColor3 = ACCENT_COLOR; jumpConnection = UIS.JumpRequest:Connect(handleJumpRequest) else button.Text = "InfiniteJump"; button.BackgroundColor3 = BUTTON_COLOR; if jumpConnection then jumpConnection:Disconnect(); jumpConnection = nil end end end
local function antiFreezeLoop() while isAntiFreezeActive and LocalPlayer.Character do local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if Humanoid and Humanoid.Health > 0 then local currentState = Humanoid:GetState(); if currentState == Enum.HumanoidStateType.None or currentState == Enum.HumanoidStateType.Seated or currentState == Enum.HumanoidStateType.PlatformStanding or currentState == Enum.HumanoidStateType.Physics then Humanoid:ChangeState(Enum.HumanoidStateType.Running) end end; wait() end end
local function toggleAntiFreeze(button) isAntiFreezeActive = not isAntiFreezeActive; if isAntiFreezeActive then coroutine.wrap(antiFreezeLoop)(); button.Text = "Anti-Freeze (Aktif)"; button.BackgroundColor3 = ACCENT_COLOR else button.Text = "Anti-Freeze"; button.BackgroundColor3 = BUTTON_COLOR end end
local function findTarget() local minDistance = math.huge; local target = nil; local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"); if not myHRP then return nil end; for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.Health > 0 then local targetHRP = player.Character.HumanoidRootPart; local distance = (myHRP.Position - targetHRP.Position).Magnitude; if distance < minDistance then minDistance = distance; target = player.Character end end end; return target end
local function aimBotLoop() if not isAimBotActive or not LocalPlayer.Character or not Workspace.CurrentCamera then return end; local target = findTarget(); if target and target:FindFirstChild(AIM_PART) then local targetPart = target[AIM_PART]; local headPosition = targetPart.Position; Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, headPosition) end end
local function toggleAimBot(button) isAimBotActive = not isAimBotActive; if isAimBotActive then button.Text = "AimBot (Aktif - " .. AIM_PART .. ")"; button.BackgroundColor3 = ACCENT_COLOR; aimbotConnection = RunService.Heartbeat:Connect(aimBotLoop); UIS.MouseBehavior = Enum.MouseBehavior.LockCenter else button.Text = "AimBot"; button.BackgroundColor3 = BUTTON_COLOR; if aimbotConnection then aimbotConnection:Disconnect(); aimbotConnection = nil end; UIS.MouseBehavior = Enum.MouseBehavior.Default end end
local function createPlayerBoxESP(player) local char = player.Character; if not char then return end; for _, drawing in pairs(espDrawings[player] or {}) do drawing:Destroy() end; espDrawings[player] = {}; local Head = char:FindFirstChild("Head"); local HRP = char:FindFirstChild("HumanoidRootPart"); if not Head or not HRP then return end; local Billboard = Instance.new("BillboardGui"); Billboard.Name = "WESTTEAM_ESP_Billboard"; Billboard.Size = UDim2.new(0, 100, 0, 20); Billboard.Adornee = Head; Billboard.AlwaysOnTop = true; Billboard.MaxDistance = math.huge; Billboard.ExtentsOffset = Vector3.new(0, 1.5, 0); Billboard.Parent = CoreGui; local NameLabel = Instance.new("TextLabel"); NameLabel.Size = UDim2.new(1, 0, 1, 0); NameLabel.Text = player.Name; NameLabel.TextColor3 = Color3.fromRGB(0, 255, 255); NameLabel.TextStrokeTransparency = 0; NameLabel.BackgroundTransparency = 1; NameLabel.Font = Enum.Font.SourceSans; NameLabel.TextSize = 14; NameLabel.Parent = Billboard; espDrawings[player][1] = Billboard; local BoxFrame = Instance.new("Frame"); BoxFrame.Name = "WESTTEAM_ESP_BoxFrame"; BoxFrame.Size = UDim2.new(0, 2, 0, 2); BoxFrame.BackgroundTransparency = 1; BoxFrame.BorderSizePixel = 0; BoxFrame.ZIndex = 5; BoxFrame.Parent = PlayerGui; local drawBox = {}; for i=1, 4 do local edge = Instance.new("Frame"); edge.Name = "Edge" .. i; edge.BackgroundColor3 = Color3.fromRGB(0, 255, 255); edge.BorderSizePixel = 0; edge.ZIndex = 5; edge.Parent = BoxFrame; drawBox[i] = edge end; espDrawings[player][2] = BoxFrame end
local function updateBoxESP() if not isEspActive or not LocalPlayer.Character or not Workspace.CurrentCamera then return end; local camera = Workspace.CurrentCamera; for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer and player.Character then local char = player.Character; local HRP = char:FindFirstChild("HumanoidRootPart"); local Head = char:FindFirstChild("Head"); if HRP and Head then local boxFrame = espDrawings[player] and espDrawings[player][2]; if not boxFrame then continue end; local boxData = boxFrame:GetChildren(); local upperPos = Head.Position + Vector3.new(0, Head.Size.Y / 2, 0); local lowerPos = HRP.Position - Vector3.new(0, HRP.Size.Y / 2, 0); local upperScreen, upperVis = camera:WorldToScreenPoint(upperPos); local lowerScreen, lowerVis = camera:WorldToScreenPoint(lowerPos); if upperVis and lowerVis then local height = math.abs(upperScreen.Y - lowerScreen.Y); local width = height * 0.6; local center = Vector2.new(upperScreen.X, upperScreen.Y + height / 2); local topLeft = center - Vector2.new(width / 2, height / 2); local lineThickness = 1.5; boxData[1].Position = UDim2.new(0, topLeft.X, 0, topLeft.Y); boxData[1].Size = UDim2.new(0, lineThickness, 0, height); boxData[2].Position = UDim2.new(0, topLeft.X + width - lineThickness, 0, topLeft.Y); boxData[2].Size = UDim2.new(0, lineThickness, 0, height); boxData[3].Position = UDim2.new(0, topLeft.X, 0, topLeft.Y); boxData[3].Size = UDim2.new(0, width, 0, lineThickness); boxData[4].Position = UDim2.new(0, topLeft.X, 0, topLeft.Y + height - lineThickness); boxData[4].Size = UDim2.new(0, width, 0, lineThickness); boxFrame.Visible = true else boxFrame.Visible = false end else if espDrawings[player] then for _, drawing in pairs(espDrawings[player]) do drawing:Destroy() end; espDrawings[player] = nil end end end end end
local function toggleESP(button) isEspActive = not isEspActive; if isEspActive then button.Text = "ESP (Aktif - Box/İsim)"; button.BackgroundColor3 = ACCENT_COLOR; for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then createPlayerBoxESP(player); player.CharacterAdded:Connect(function(char) if isEspActive then createPlayerBoxESP(player) end end) end end; espConnection = RunService.RenderStepped:Connect(updateBoxESP) else for player, drawings in pairs(espDrawings) do for _, drawing in pairs(drawings) do drawing:Destroy() end; espDrawings = {} end; if espConnection then espConnection:Disconnect(); espConnection = nil end; button.Text = "ESP"; button.BackgroundColor3 = BUTTON_COLOR end end
local function freezeAllActivation(shouldFreeze) for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then local char = player.Character; if char then local HRP = char:FindFirstChild("HumanoidRootPart"); if HRP then if shouldFreeze then HRP.Velocity = Vector3.new(0, 0, 0); HRP.RotationalVelocity = Vector3.new(0, 0, 0); HRP.Anchored = true else HRP.Anchored = false end end end end end end
local function freezeAllLoop() while isFreezeAllActive do freezeAllActivation(true); RunService.Heartbeat:Wait() end; freezeAllActivation(false) end
local function toggleFreezeAll(button) isFreezeAllActive = not isFreezeAllActive; if isFreezeAllActive then button.Text = "Freeze All (Aktif - LALOL HUB)"; button.BackgroundColor3 = ACCENT_COLOR; coroutine.wrap(freezeAllLoop)() else button.Text = "Freeze All (LALOL HUB)"; button.BackgroundColor3 = BUTTON_COLOR end end
local function toggleFloat(button) isFloatActive = not isFloatActive; if isFloatActive then Workspace.Gravity = 10; button.Text = "Float (Aktif)"; button.BackgroundColor3 = ACCENT_COLOR else Workspace.Gravity = originalGravity; button.Text = "Float"; button.BackgroundColor3 = BUTTON_COLOR end end
local function animationGlitchLoop() local character = LocalPlayer.Character; local Humanoid = character and character:FindFirstChildOfClass("Humanoid"); if not character or not Humanoid then return end; local Anim = Instance.new("Animation"); local Animator = Humanoid:FindFirstChildOfClass("Animator"); if not Animator then return end; local animTrack = Animator:LoadAnimation(Anim); animTrack:Play(); while isAnimationGlitchActive and Humanoid.Health > 0 do local randomAnimId = ANIMATION_IDS[math.random(1, #ANIMATION_IDS)]; Anim.AnimationId = randomAnimId; animTrack = Animator:LoadAnimation(Anim); animTrack:Play(); wait(0.1); animTrack:Stop(); animTrack:Destroy() end; local tracks = Animator:GetPlayingAnimationTracks(); for _, track in ipairs(tracks) do track:Stop() end; Anim:Destroy() end
local function toggleAnimationGlitch(button) isAnimationGlitchActive = not isAnimationGlitchActive; if isAnimationGlitchActive then button.Text = "Animation Glitch (Aktif)"; button.BackgroundColor3 = ACCENT_COLOR; coroutine.wrap(animationGlitchLoop)() else button.Text = "Animation Glitch"; button.BackgroundColor3 = BUTTON_COLOR end end
local function killAuraLoop() local myChar = LocalPlayer.Character; local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart"); if not myChar or not myHRP then return end; for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer and player.Character then local targetChar = player.Character; local targetHRP = targetChar:FindFirstChild("HumanoidRootPart"); local targetHumanoid = targetChar:FindFirstChildOfClass("Humanoid"); if targetHRP and targetHumanoid and targetHumanoid.Health > 0 then local distance = (myHRP.Position - targetHRP.Position).Magnitude; if distance <= KILL_AURA_RADIUS then targetHumanoid:TakeDamage(KILL_AURA_DAMAGE) end end end end end
local function toggleKillAura(button) isKillAuraActive = not isKillAuraActive; if isKillAuraActive then button.Text = "Kill Aura (Aktif - " .. KILL_AURA_RADIUS .. "m)"; button.BackgroundColor3 = ACCENT_COLOR; killAuraConnection = RunService.Heartbeat:Connect(killAuraLoop) else button.Text = "Kill Aura"; button.BackgroundColor3 = BUTTON_COLOR; if killAuraConnection then killAuraConnection:Disconnect(); killAuraConnection = nil end end end
local function setWalkSpeed(speed) local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if Humanoid then Humanoid.WalkSpeed = speed end end
local function toggleWalkSpeed100(button) isWalkSpeedActive = not isWalkSpeedActive; if isWalkSpeedActive then setWalkSpeed(100); button.Text = "WalkSpeed: 100 (Aktif)"; button.BackgroundColor3 = Color3.fromRGB(135, 206, 250) else setWalkSpeed(originalWalkSpeed); button.Text = "WalkSpeed: 100"; button.BackgroundColor3 = BUTTON_COLOR end; LocalPlayer.CharacterAdded:Connect(function(char) if isWalkSpeedActive then local newHumanoid = char:WaitForChild("Humanoid"); newHumanoid.WalkSpeed = 100 end end) end
local function toggleFullBright(button) isFullBrightActive = not isFullBrightActive; if isFullBrightActive then originalBrightness = Lighting.Brightness; Lighting.Brightness = 5; Lighting.GlobalShadows = false; button.Text = "Full Bright (Aktif)"; button.BackgroundColor3 = Color3.fromRGB(255, 255, 100) else Lighting.Brightness = originalBrightness; Lighting.GlobalShadows = true; button.Text = "Full Bright"; button.BackgroundColor3 = BUTTON_COLOR end end
local function toggleFOV(button) isFOVActive = not isFOVActive; local camera = Workspace.CurrentCamera; if not camera then return end; if isFOVActive then originalFOV = camera.FieldOfView; camera.FieldOfView = 115; button.Text = "FOV: 115 (Aktif)"; button.BackgroundColor3 = Color3.fromRGB(85, 255, 255) else camera.FieldOfView = originalFOV; button.Text = "FOV: 115"; button.BackgroundColor3 = BUTTON_COLOR end end
local function toggleServerHop(button) if isServerHopRunning then return end; isServerHopRunning = true; button.Text = "**Server Hop (İşleniyor...)**"; button.BackgroundColor3 = Color3.fromRGB(255, 0, 255); local success, result = pcall(function() local currentPlaceId = game.PlaceId; TeleportService:Teleport(currentPlaceId) end); if not success then warn("Server Hop Başarısız: " .. tostring(result)); button.Text = "Server Hop (HATA)"; button.BackgroundColor3 = Color3.fromRGB(200, 50, 50) end; if not success then isServerHopRunning = false; wait(2); button.Text = "**Server Hop (Yeni Sunucuya Geç)**"; button.BackgroundColor3 = BUTTON_COLOR end end

-- ===========================================
-- 4. ÖZELLİK FONKSİYONLARI (Harici 26) - YENİDEN BAŞLATMA MANTIĞI
-- ===========================================

-- Güvenli Yükleme Fonksiyonu
local function safeLoad(url)
    local success, result = pcall(function()
        loadstring(game:HttpGet(url))() 
    end)
    if success then return true else warn("Harici Script Yüklenemedi (" .. url .. "): " .. tostring(result)) return false end
end

-- Rerun Toggle Oluşturucu
local function createRerunToggle(flagName, url, buttonText, activeColor)
    return function(button)
        -- Eğer zaten yüklüyse, önce bayrağı sıfırla ve butonu geçici olarak gri yap
        if _G[flagName] then 
            _G[flagName] = false
            button.Text = buttonText .. " (Yüklüydü - Yeniden Yükleniyor)"
            button.BackgroundColor3 = BUTTON_COLOR
            wait(0.1)
        end
        
        -- Scripti yüklemeyi dene
        _G[flagName] = safeLoad(url)
        
        if _G[flagName] then 
            button.Text = buttonText .. " (AÇILDI/YENİDEN BAŞLATILDI!)"
            button.BackgroundColor3 = activeColor
        else 
            button.Text = buttonText .. " (Hata)"
            button.BackgroundColor3 = BUTTON_COLOR
        end
    end
end

-- 4.1. Universal AimBot + 
local function toggleUniversalAimBot(button)
    if isUniversalAimBotLoaded then
        isUniversalAimBotLoaded = false 
        button.Text = "**Universal AimBot + (Yüklüydü)**"
        button.BackgroundColor3 = BUTTON_COLOR
        wait(0.1) 
    end
    isUniversalAimBotLoaded = safeLoad("https://rawscripts.net/raw/Universal-Script-scoot-ui-lib-62317")
    if isUniversalAimBotLoaded then 
        button.Text = "**Universal AimBot + (AÇILDI/YENİDEN BAŞLATILDI!)**"
        button.BackgroundColor3 = UNIVERSAL_COLOR
    else 
        button.Text = "**Universal AimBot + (Hata)**"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- 4.2. SPEEDRUNNER💎
local function toggleSpeedrunTimer(button)
    if isSpeedrunTimerLoaded then
        isSpeedrunTimerLoaded = false 
        button.Text = "SPEEDRUNNER💎 (Yüklüydü)"
        button.BackgroundColor3 = BUTTON_COLOR
        wait(0.1) 
    end
    isSpeedrunTimerLoaded = safeLoad("https://rawscripts.net/raw/Universal-Script-Speedrun-Timer-56594")
    if isSpeedrunTimerLoaded then 
        button.Text = "**SPEEDRUNNER💎 (AÇILDI/YENİDEN BAŞLATILDI!)**"
        button.BackgroundColor3 = SPEEDRUN_COLOR
    else 
        button.Text = "SPEEDRUNNER💎 (Hata)"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- 4.3. TSB-GOJO
local function toggleTSBGojo(button)
    if isTSBGojoLoaded then
        isTSBGojoLoaded = false 
        button.Text = "**TSB-GOJO (Key=CRAZY GOJO - Yüklüydü)**"
        button.BackgroundColor3 = BUTTON_COLOR
        wait(0.1) 
    end
    isTSBGojoLoaded = safeLoad("https://raw.githubusercontent.com/hehehe9028/The-strongest-battleground-/refs/heads/main/The%20strongest%20battleground%20RVVC%20SCRIPTS")
    if isTSBGojoLoaded then 
        button.Text = "**TSB-GOJO (Key=CRAZY GOJO - AÇILDI/YENİDEN BAŞLATILDI!)**"
        button.BackgroundColor3 = TSB_GOJO_COLOR
    else 
        button.Text = "**TSB-GOJO (Key=CRAZY GOJO - Hata)**"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- 4.4. TSB-SUKUNA 
local function toggleTSBSukuna(button)
    if isTSBSukunaLoaded then
        isTSBSukunaLoaded = false 
        button.Text = "**TSB-SUKUNA (Key=RVVC SUKUNA - Yüklüydü)**"
        button.BackgroundColor3 = BUTTON_COLOR
        wait(0.1) 
    end
    isTSBSukunaLoaded = safeLoad("https://raw.githubusercontent.com/hehehe9028/RVVC-SUKUNA-SCRIPT/refs/heads/main/Sukuna%20tsb%20RVVC%20SCRIPTS")
    if isTSBSukunaLoaded then 
        button.Text = "**TSB-SUKUNA (Key=RVVC SUKUNA - AÇILDI/YENİDEN BAŞLATILDI!)**"
        button.BackgroundColor3 = TSB_SUKUNA_COLOR
    else 
        button.Text = "**TSB-SUKUNA (Key=RVVC SUKUNA - Hata)**"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- 4.5. Load Fly GUI V4 (Dahili Yedekli)
local function toggleLoadFlyGUI(button)
    if isFlyGUILoaded and flyConnection then 
        if flyConnection then flyConnection:Disconnect() end
        local HRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if HRP then HRP.CanCollide = true end
        isFlyGUILoaded = false
        button.Text = "Fly GUI V4/Dahili Fly (Kapatıldı/Yeniden Yükleniyor)"
        button.BackgroundColor3 = BUTTON_COLOR
        wait(0.1)
    end

    local loaded = safeLoad("https://rawscripts.net/raw/Universal-Script-Fly-script-gui-v4-made-by-me-64278")
    
    if not loaded then
        -- Dahili V-Fly Yedek
        print("Harici Fly başarısız. Dahili (Yedek) V-Fly aktif ediliyor.")
        local velocity = Vector3.new(0,0,0)
        local speed = 1.5
        
        local char = LocalPlayer.Character
        local HRP = char and char:FindFirstChild("HumanoidRootPart")
        if HRP then HRP.CanCollide = false end

        isFlyGUILoaded = true

        flyConnection = RunService.Heartbeat:Connect(function()
            if not isFlyGUILoaded or not HRP or not char then 
                if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
                isFlyGUILoaded = false 
                return 
            end

            HRP.Velocity = Vector3.new(0,0,0)
            HRP.CFrame = HRP.CFrame + velocity
            
            if UIS:IsKeyDown(Enum.KeyCode.W) then velocity = HRP.CFrame.lookVector * speed
            elseif UIS:IsKeyDown(Enum.KeyCode.S) then velocity = -HRP.CFrame.lookVector * speed
            elseif UIS:IsKeyDown(Enum.KeyCode.A) then velocity = HRP.CFrame.rightVector * speed
            elseif UIS:IsKeyDown(Enum.KeyCode.D) then velocity = -HRP.CFrame.rightVector * speed
            elseif UIS:IsKeyDown(Enum.KeyCode.Space) then velocity = Vector3.new(0, speed, 0)
            elseif UIS:IsKeyDown(Enum.KeyCode.LeftControl) then velocity = Vector3.new(0, -speed, 0)
            else velocity = Vector3.new(0,0,0)
            end
        end)

        LocalPlayer.CharacterAdded:Connect(function(char)
            char:WaitForChild("HumanoidRootPart").CanCollide = false
        end)
        button.Text = "Fly GUI V4 (DAHİLİ YEDEK AKTİF!)"
        button.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
    else
        isFlyGUILoaded = true
        button.Text = "Fly GUI V4 (Açıldı!)"
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    end
end


-- Geri kalan tüm Harici Özelliklerin Yeniden Başlatma Mantığı
local togglePlayTime = createRerunToggle("isPlayTimeGUILoaded", "https://rawscripts.net/raw/Universal-Script-Play-time-63991", "Play Time", Color3.fromRGB(0, 170, 0))
local toggleDex = createRerunToggle("isDexLoaded", "https://raw.githubusercontent.com/wally-rblx/Scripts/main/Dex.lua", "**Dex (Exploder)**", Color3.fromRGB(255, 255, 0))
local toggleBrainrot = createRerunToggle("isBrainrotLoaded", "https://raw.githubusercontent.com/gumanba/Scripts/main/BrainrotEvolution", "**Brainrot Evelution SC**", Color3.fromRGB(85, 0, 170))
local toggleBackdoorScanner = createRerunToggle("isBackdoorScannerLoaded", "https://rawscripts.net/raw/Universal-Script-XP-Backdoor-Scanner-51591", "Backdoor XP SCANNER", Color3.fromRGB(0, 170, 0))
local toggleLalolHub = createRerunToggle("isLalolHubLoaded", "https://rawscripts.net/raw/Universal-Script-Lalol-Hub-why-44490", "LALOL HUB (Backdoor Scan)", Color3.fromRGB(200, 100, 255))
local toggleTigerX = createRerunToggle("isTigerXLoaded", "https://rawscripts.net/raw/Universal-Script-Tiger-hub-x-v4-42180", "**Tiger X (Very Op!)**", Color3.fromRGB(255, 165, 0))
local toggleK00pkidd = createRerunToggle("isK00pkiddLoaded", "https://rawscripts.net/raw/Universal-Script-k00pkidd-39401", "k00pkidd (Hacker)", Color3.fromRGB(0, 170, 0))
local toggleG00byd0lan = createRerunToggle("isG00byd0lanLoaded", "https://rawscripts.net/raw/Universal-Script-g00byd0lan-gui-v1-37056", "g00byd0lan (Hacker)", Color3.fromRGB(150, 0, 255))
local toggleUnixBackdoor = createRerunToggle("isUnixBackdoorLoaded", "https://rawscripts.net/raw/Universal-Script-VoidWare-61179", "**Unix Backdoor (Best)**", Color3.fromRGB(85, 85, 255))
local toggleCarFly = createRerunToggle("isCarFlyLoaded", "https://rawscripts.net/raw/Universal-Script-Vfly-script-by-me-11871", "Araba Uçurma Sc", Color3.fromRGB(100, 200, 150))
local toggleMM2SC = createRerunToggle("isMM2SCLoaded", "https://rawscripts.net/raw/Universal-Script-YARHM-12403", "**MM2 SC (OP)**", Color3.fromRGB(255, 50, 50))
local toggle99NightsSC = createRerunToggle("is99NightsLoaded", "https://rawscripts.net/raw/99-Nights-in-the-Forest-Drip-client-in-florest-54121", "99 Gece Sc(No Key🌐)", Color3.fromRGB(0, 100, 0))
local toggleHexagonHub = createRerunToggle("isHexagonLoaded", "https://rawscripts.net/raw/Brookhaven-RP-Hexagon-Hub-OFFICIAL-60494", "Hexagon (Brookhaven)", Color3.fromRGB(0, 150, 150))
local toggleNytheruneHub = createRerunToggle("isNytheruneLoaded", "https://rawscripts.net/raw/Brookhaven-RP-Nytherune-Hub-58124", "Nytherune Hub (Op)", Color3.fromRGB(255, 100, 0))
local toggleDripClient = createRerunToggle("isDripClientLoaded", "https://rawscripts.net/raw/Brookhaven-RP-Drip-Client-51784", "**Drip Client (Brookhaven op)**", Color3.fromRGB(138, 43, 226))
local toggleSabSc = createRerunToggle("isSabScLoaded", "https://rawscripts.net/raw/Universal-Script-Kurd-Hub-29484", "SAB SC (Kurd Hub)", Color3.fromRGB(255, 170, 0))
local toggleBrookhavenSC = createRerunToggle("isBrookhavenLoaded", "https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845", "Brookhaven SC 1 (Sander XY)", Color3.fromRGB(85, 255, 0))
local toggleBrookhaven2 = createRerunToggle("isBrookhaven2Loaded", "https://rawscripts.net/raw/Brookhaven-RP-FURIA-HUB-47441", "**FURIA HUB (Brookhaven OP)**", Color3.fromRGB(255, 105, 180))
local toggleCoolkiddExecutor = createRerunToggle("isCoolkiddLoaded", "https://rawscripts.net/raw/Universal-Script-c00lkidd-executor-2025-61657", "c00lkidd excutor.s", Color3.fromRGB(255, 20, 147))
local toggleWestteamW = createRerunToggle("isWestteamWLoaded", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM.lua", "WESTTEAM-W (ANA HUB)", Color3.fromRGB(0, 200, 255))
local toggleAdmPanel = createRerunToggle("isAdmPanelLoaded", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BY-WEST-UNİVERSAL.lua", "**WESTTEAM-ADM-PANEL**", Color3.fromRGB(255, 0, 0))


-- ===========================================
-- 5. BUTON OLUŞTURUCU 
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

local function createSpacer(height)
    local Spacer = Instance.new("Frame")
    Spacer.Name = "Spacer" .. height
    Spacer.Size = UDim2.new(1, 0, 0, height) 
    Spacer.BackgroundTransparency = 1
    Spacer.BorderSizePixel = 0
    Spacer.Parent = ScrollingFrame
end

-- ===========================================
-- 6. ÖZELLİKLERİ PANELE EKLEME (NİHAİ LİSTE 6.2.5)
-- ===========================================

-- Dahili Özellikler (14 Adet)
createButton("Anti-AFK", toggleAntiAfk)
createButton("NoClip", toggleNoClip) 
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
createButton("FOV: 115", toggleFOV) 
createButton("**Server Hop (Yeni Sunucuya Geç)**", toggleServerHop) 

-- Harici Araçlar (26 Adet)
createButton("**Universal AimBot +**", toggleUniversalAimBot) 
createButton("**SPEEDRUNNER💎**", toggleSpeedrunTimer) 
createButton("**TSB-GOJO (Key=CRAZY GOJO)**", toggleTSBGojo) 
createButton("**TSB-SUKUNA (Key=RVVC SUKUNA)**", toggleTSBSukuna) 

createButton("Fly GUI V4/Dahili Fly", toggleLoadFlyGUI) 
createButton("Play Time", togglePlayTime)

createButton("**Dex (Exploder)**", toggleDex) 
createButton("**Brainrot Evelution SC**", toggleBrainrot)

createButton("Backdoor XP SCANNER", toggleBackdoorScanner)
createButton("LALOL HUB (Backdoor Scan)", toggleLalolHub) 
createButton("Tiger X (Very Op!)", toggleTigerX) 
createButton("k00pkidd (Hacker)", toggleK00pkidd)
createButton("g00byd0lan (Hacker)", toggleG00byd0lan) 
createButton("**Unix Backdoor (Best)**", toggleUnixBackdoor) 
createButton("Araba Uçurma Sc", toggleCarFly) 
createButton("**MM2 SC (OP)**", toggleMM2SC) 
createButton("99 Gece Sc(No Key🌐)", toggle99NightsSC) 

createSpacer(SPACER_HEIGHT_SMALL) 

createButton("**Drip Client (Brookhaven op)**", toggleDripClient) 
createButton("Hexagon (Brookhaven)", toggleHexagonHub) 
createButton("Nytherune Hub (Op)", toggleNytheruneHub) 
createButton("SAB SC (Kurd Hub)", toggleSabSc) 
createButton("Brookhaven SC 1 (Sander XY)", toggleBrookhavenSC)
createButton("**FURIA HUB (Brookhaven OP)**", toggleBrookhaven2) 

createButton("c00lkidd excutor.s", toggleCoolkiddExecutor) 

createSpacer(SPACER_HEIGHT_LARGE) 

createButton("WESTTEAM-W (ANA HUB)", toggleWestteamW)
createButton("**WESTTEAM-ADM-PANEL**", toggleAdmPanel)

print("⚔️ WESTTEAM-POWER 6.2.5: TÜM ÖZELLİKLER BAŞARIYLA BİRLEŞTİRİLDİ. Toplam 40 Özellik.")
