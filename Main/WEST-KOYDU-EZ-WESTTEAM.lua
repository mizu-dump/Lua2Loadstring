-- ===============================================================
-- ♕ WESTTEAM-POWER 6.4.4: TAM VE GÜNCEL SÜRÜM (NoClip Hibrit + SERVER DISCO)
-- Bu kodda 61 özellik, stabil NoClip ve Harita/Menü RGB (Server Disco) bulunur.
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
-- 1. ÖZELLİK DURUMLARI (FLAG'LER) - (TOPLAM 61)
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
local isAntiLagActive = false 
local isXRayActive = false 
local isSpinActive = false 
local isDiscoActive = false -- 👑 GÜNCELLENMİŞ SERVER DISCO

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
local isTSBDripLoaded = false 
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
local isDripHubV3Loaded = false
local isSolarisHubLoaded = false
local isKRNLExecutorLoaded = false 
local isBTOOLSLoaded = false
local isInfiniteYieldLoaded = false
local isFEAdminLoaded = false
local isRoxploitLoaded = false
local isForsakenLoaded = false 
local isPVBLoaded = false 
local is99NightsRevisionLoaded = false
local isBloxFruitLoaded = false
local isGAGLoaded = false
local isShootaBrainrotLoaded = false 
local isDontWaketheBrainrotsLoaded = false
local isAdminPanelFELoaded = false 
local isInfinityAntiCheatLoaded = false 


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

-- NoClip Hibrit için
local noClipHRP
local noClipHumanoid
local bodyVelocity = nil
local noClipSpeed = 35 
local originalNoClipWalkSpeed = 16 

-- Disco için ORİJİNAL AYARLAR
local discoLoop
local originalAmbient = Lighting.Ambient
local originalColorShift_Top = Lighting.ColorShift_Top
local originalColorShift_Bottom = Lighting.ColorShift_Bottom
local originalOutdoorAmbient = Lighting.OutdoorAmbient
local originalSky = Lighting:FindFirstChildOfClass("Sky") and Lighting:FindFirstChildOfClass("Sky"):Clone()

-- Anti-Lag için orijinal değerler
local originalFogEnd = Lighting.FogEnd
local originalSkybox = nil
if Lighting:FindFirstChild("Sky") then originalSkybox = Lighting:FindFirstChild("Sky"):Clone() end

-- Panel Ayarları
local PANEL_WIDTH = 280
local PANEL_HEIGHT = 400
local HEADER_HEIGHT = 45
local BUTTON_HEIGHT = 30
local BUTTON_PADDING = 5
local TOTAL_FEATURES_COUNT = 61 -- Toplam özellik sayısı güncellendi
local PADDING_TOP_BOTTOM = 20 

-- İçerik yüksekliği 
local REQUIRED_CONTENT_HEIGHT = (BUTTON_HEIGHT + BUTTON_PADDING) * TOTAL_FEATURES_COUNT + 350
local CONTENT_HEIGHT = math.max(REQUIRED_CONTENT_HEIGHT, (PANEL_HEIGHT - HEADER_HEIGHT) + 500)

-- Renkler 
local BACKGROUND_COLOR = Color3.fromRGB(40, 40, 40)
local BUTTON_COLOR = Color3.fromRGB(60, 60, 60)
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)
local ACCENT_COLOR = Color3.fromRGB(255, 85, 0)
local ADMIN_PANEL_FE_COLOR = Color3.fromRGB(85, 85, 255) 
local INFINITY_AC_COLOR = Color3.fromRGB(0, 150, 200) 
local UNIVERSAL_COLOR = Color3.fromRGB(255, 192, 203) 
local SPEEDRUN_COLOR = Color3.fromRGB(0, 255, 0)
local TSB_GOJO_COLOR = Color3.fromRGB(0, 150, 255) 
local TSB_SUKUNA_COLOR = Color3.fromRGB(255, 0, 0) 
local ANTILAG_COLOR = Color3.fromRGB(139, 0, 0) 
local DRIPHUB_COLOR = Color3.fromRGB(173, 216, 230)
local SOLARIS_COLOR = Color3.fromRGB(255, 215, 0)
local KRNL_EXECUTOR_COLOR = Color3.fromRGB(255, 140, 0) 
local BTOOLS_COLOR = Color3.fromRGB(0, 153, 76)
local IY_COLOR = Color3.fromRGB(170, 0, 255)
local FE_ADMIN_COLOR = ACCENT_COLOR
local BACKDOOR_COLOR = Color3.fromRGB(255, 0, 100) 
local ROXPLOIT_COLOR = Color3.fromRGB(255, 69, 0) 
local XRAY_COLOR = Color3.fromRGB(0, 255, 170) 
local SPIN_COLOR = Color3.fromRGB(255, 170, 0) 
local TSB_DRIP_COLOR = Color3.fromRGB(255, 0, 170) 
local FORSAKEN_COLOR = Color3.fromRGB(170, 0, 0) 
local PVB_COLOR = Color3.fromRGB(139, 69, 19) 
local REVISION_FOREST_COLOR = Color3.fromRGB(34, 139, 34) 
local BLOXFRUIT_COLOR = Color3.fromRGB(0, 191, 255) 
local GAG_COLOR = Color3.fromRGB(255, 140, 0) 
local SHOOTABRAINROT_COLOR = Color3.fromRGB(170, 0, 170)
local DONTWAKE_COLOR = Color3.fromRGB(0, 255, 255)

local espDrawings = {}
local originalTransparency = {}


-- ===========================================
-- 2. GUI YAPISI VE HAREKETİ (Düzeltilmiş)
-- ===========================================
local ScreenGui = Instance.new("ScreenGui"); ScreenGui.Name = "OP_W_WESTTEAM_GUI"; ScreenGui.ResetOnSpawn = false; ScreenGui.Parent = PlayerGui
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "WESTTEAM_POWER_Panel"
MainFrame.Size = UDim2.new(0, PANEL_WIDTH, 0, PANEL_HEIGHT)
MainFrame.Position = UDim2.new(0.05, 0, 0.5, -PANEL_HEIGHT / 2)
MainFrame.BackgroundColor3 = BACKGROUND_COLOR
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
local FrameCorner = Instance.new("UICorner"); FrameCorner.CornerRadius = UDim.new(0, 8); FrameCorner.Parent = MainFrame

local Header = Instance.new("TextLabel", MainFrame)
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, HEADER_HEIGHT - 5)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundColor3 = BACKGROUND_COLOR
Header.Text = "WESTTEAM-POWER ♕ — Unified Admin (V6.4.4)"
Header.TextColor3 = TEXT_COLOR
Header.Font = Enum.Font.SourceSansBold
Header.TextSize = 18
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.TextWrapped = true

local Line = Instance.new("Frame"); Line.Size = UDim2.new(1, -10, 0, 2); Line.Position = UDim2.new(0.5, 0, 0, HEADER_HEIGHT); Line.BackgroundColor3 = ACCENT_COLOR; Line.AnchorPoint = Vector2.new(0.5, 0); Line.BorderSizePixel = 0; Line.Parent = MainFrame

local ScrollingFrame = Instance.new("ScrollingFrame", MainFrame)
ScrollingFrame.Name = "FeaturesContainer"
ScrollingFrame.Size = UDim2.new(1, 0, 1, -HEADER_HEIGHT)
ScrollingFrame.Position = UDim2.new(0, 0, 0, HEADER_HEIGHT)
ScrollingFrame.BackgroundColor3 = BACKGROUND_COLOR
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, CONTENT_HEIGHT)
ScrollingFrame.ScrollBarThickness = 8

local Layout = Instance.new("UIListLayout"); Layout.Name = "FeatureLayout"; Layout.Padding = UDim.new(0, BUTTON_PADDING); Layout.SortOrder = Enum.SortOrder.LayoutOrder; Layout.Parent = ScrollingFrame
local Padding = Instance.new("UIPadding"); Padding.PaddingTop = UDim.new(0, PADDING_TOP_BOTTOM / 2); Padding.PaddingBottom = UDim.new(0, PADDING_TOP_BOTTOM / 2); Padding.PaddingLeft = UDim.new(0, 10); Padding.PaddingRight = UDim.new(0, 10); Padding.Parent = ScrollingFrame

local dragging = false
local dragStart = Vector2.new()
Header.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true; dragStart = UIS:GetMouseLocation() - MainFrame.AbsolutePosition; if input.UserInputType == Enum.UserInputType.Touch then UIS:CaptureFocus(input) end end end)
UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
RunService.Heartbeat:Connect(function() if dragging then local mousePos = UIS:GetMouseLocation(); local newX = (mousePos.X - dragStart.X) / ScreenGui.AbsoluteSize.X; local newY = (mousePos.Y - dragStart.Y) / ScreenGui.AbsoluteSize.Y; MainFrame.Position = UDim2.new(newX, 0, newY, 0) end end)


-- ===========================================
-- 3. ÖZELLİK FONKSİYONLARI (DAHİLİ 19 ADET)
-- ===========================================
local function toggleAntiAfk(button) isAntiAfkActive = not isAntiAfkActive; local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if isAntiAfkActive then coroutine.wrap(function() while isAntiAfkActive and Humanoid do Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) wait(10) end end)() button.Text = "Anti-AFK (Aktif)"; button.BackgroundColor3 = ACCENT_COLOR else button.Text = "Anti-AFK"; button.BackgroundColor3 = BUTTON_COLOR end end

-- ⚔️ GÜNCELLENMİŞ NO-CLIP: UNIVERSAL HİBRİT
local function universalNoClipLogic()
    if not noClipHRP or not noClipHRP.Parent or not noClipHumanoid then return end
    local camera = Workspace.CurrentCamera; if not camera then return end
    noClipHRP.CanCollide = false
    noClipHRP.Massless = true
    if noClipHumanoid:GetState() ~= Enum.HumanoidStateType.PlatformStanding then noClipHumanoid:ChangeState(Enum.HumanoidStateType.PlatformStanding) end
    local moveVector = Vector3.new(0,0,0)
    if UIS:IsKeyDown(Enum.KeyCode.W) then moveVector = moveVector + camera.CFrame.lookVector end
    if UIS:IsKeyDown(Enum.KeyCode.S) then moveVector = moveVector - camera.CFrame.lookVector end
    if UIS:IsKeyDown(Enum.KeyCode.A) then moveVector = moveVector - camera.CFrame.rightVector end
    if UIS:IsKeyDown(Enum.KeyCode.D) then moveVector = moveVector + camera.CFrame.rightVector end
    if UIS:IsKeyDown(Enum.KeyCode.Space) then moveVector = moveVector + Vector3.new(0, 1, 0) end
    if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.RightControl) then moveVector = moveVector - Vector3.new(0, 1, 0) end
    if moveVector.Magnitude > 0 and bodyVelocity then
        bodyVelocity.Velocity = moveVector.Unit * noClipSpeed
    elseif bodyVelocity then
        bodyVelocity.Velocity = Vector3.new(0,0,0)
    end
    if moveVector.Magnitude > 0 then
        noClipHRP.CFrame = noClipHRP.CFrame + (moveVector.Unit * 0.05)
    end
end
local function toggleNoClip(button) 
    isNoClipActive = not isNoClipActive
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    if not char then warn("Karakter bulunamadi."); isNoClipActive = false; button.Text = "**NoClip (Hata: Karakter Yok)**"; button.BackgroundColor3 = BUTTON_COLOR; return end 
    noClipHRP = char:FindFirstChild("HumanoidRootPart")
    noClipHumanoid = char:FindFirstChildOfClass("Humanoid")
    if not noClipHRP or not noClipHumanoid then warn("HumanoidRootPart veya Humanoid bulunamadi."); isNoClipActive = false; button.Text = "**NoClip (Hata: Parça Eksik)**"; button.BackgroundColor3 = BUTTON_COLOR; return end 
    if isNoClipActive then 
        originalNoClipWalkSpeed = noClipHumanoid.WalkSpeed 
        noClipHumanoid.WalkSpeed = 0 
        noClipHRP.CanCollide = false
        noClipHRP.Massless = true
        noClipHumanoid:ChangeState(Enum.HumanoidStateType.PlatformStanding) 
        bodyVelocity = Instance.new("BodyVelocity"); bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge); bodyVelocity.Parent = noClipHRP
        noClipLoop = RunService.Heartbeat:Connect(universalNoClipLogic)
        button.Text = "**NoClip (Aktif - UNIVERSAL HİBRİT)**"; 
        button.BackgroundColor3 = ACCENT_COLOR 
    else 
        if noClipLoop then noClipLoop:Disconnect(); noClipLoop = nil end
        if bodyVelocity then bodyVelocity:Destroy(); bodyVelocity = nil end 
        if noClipHRP and noClipHRP.Parent then noClipHRP.CanCollide = true; noClipHRP.Massless = false; noClipHRP.Velocity = Vector3.new(0, 0, 0) end
        if noClipHumanoid then noClipHumanoid.WalkSpeed = originalNoClipWalkSpeed; noClipHumanoid:ChangeState(Enum.HumanoidStateType.Running) end
        button.Text = "**NoClip (Universal Hibrit)**"; 
        button.BackgroundColor3 = BUTTON_COLOR 
    end 
end

-- 👑 SERVER DISCO VE HIZLI MENÜ RENK DEĞİŞİMİ FIX
local function getNewColor(hue)
    return Color3.fromHSV(hue % 1, 1, 1)
end
local function discoLogic()
    local hue = 0
    local cycleSpeed = 0.05 -- Hızlı Menü RGB
    local serverCycleSpeed = 0.003 

    if not Lighting:FindFirstChildOfClass("Sky") then
        local newSky = Instance.new("Sky"); newSky.Parent = Lighting
    end

    while isDiscoActive do
        hue = hue + cycleSpeed 
        local menuColor = getNewColor(hue)
        local serverHue = hue * (serverCycleSpeed / cycleSpeed) 
        local serverColor = getNewColor(serverHue)

        -- 1. Menü Renkleri (Hızlı Değişim GARANTİLİ)
        MainFrame.BackgroundColor3 = menuColor
        Header.BackgroundColor3 = menuColor
        Line.BackgroundColor3 = menuColor 

        for _, obj in ipairs(ScrollingFrame:GetChildren()) do
            if obj:IsA("TextButton") then
                if obj.BackgroundColor3 ~= ACCENT_COLOR and obj.BackgroundColor3 ~= Color3.fromRGB(255, 85, 0) then
                     obj.BackgroundColor3 = menuColor
                end
            end
        end

        -- 2. Server Renkleri (Map/Ortam Etkisi)
        Lighting.Ambient = serverColor
        Lighting.ColorShift_Top = serverColor
        Lighting.ColorShift_Bottom = serverColor
        Lighting.OutdoorAmbient = serverColor
        
        local sky = Lighting:FindFirstChildOfClass("Sky")
        if sky then
            sky.Skybox = "" 
            sky.CelestialBodiesShown = false
            sky.LightAmbient = serverColor
            sky.Ambient = serverColor
        end
        
        RunService.Heartbeat:Wait()
    end
    
    -- Disco kapandığında orijinal renklere geri dön (Server)
    Lighting.Ambient = originalAmbient
    Lighting.ColorShift_Top = originalColorShift_Top
    Lighting.ColorShift_Bottom = originalColorShift_Bottom
    Lighting.OutdoorAmbient = originalOutdoorAmbient
    
    local currentSky = Lighting:FindFirstChildOfClass("Sky")
    if currentSky then
        if originalSky and originalSky.Parent == nil then
            currentSky:Destroy()
        elseif originalSky then
            currentSky:Destroy()
            originalSky:Clone().Parent = Lighting
        end
    end
    
    -- Disco kapandığında orijinal renklere geri dön (Menü)
    MainFrame.BackgroundColor3 = BACKGROUND_COLOR
    Header.BackgroundColor3 = BACKGROUND_COLOR
    Line.BackgroundColor3 = ACCENT_COLOR
    for _, obj in ipairs(ScrollingFrame:GetChildren()) do
        if obj:IsA("TextButton") then
            if obj.BackgroundColor3 ~= ACCENT_COLOR and obj.BackgroundColor3 ~= Color3.fromRGB(255, 85, 0) then
                obj.BackgroundColor3 = BUTTON_COLOR
            end
        end
    end
end
local function toggleDisco(button)
    isDiscoActive = not isDiscoActive
    
    if isDiscoActive then
        originalAmbient = Lighting.Ambient
        originalColorShift_Top = Lighting.ColorShift_Top
        originalColorShift_Bottom = Lighting.ColorShift_Bottom
        originalOutdoorAmbient = Lighting.OutdoorAmbient
        
        local currentSky = Lighting:FindFirstChildOfClass("Sky")
        originalSky = currentSky and currentSky:Clone() 

        discoLoop = coroutine.wrap(discoLogic)()
        button.Text = "**SERVER DISCO (AKTİF - MAP DEĞİŞTİ)**"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 255) 
    else
        if discoLoop then discoLoop = nil end
        button.Text = "Server Disco (Harita/Menü Renk Partisi)"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end
-- Diğer orijinal dahili özellik fonksiyonları (Kısaltıldı)
local function handleJumpRequest() local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if isInfiniteJumpActive and Humanoid and Humanoid.Health > 0 then Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end
local function toggleInfiniteJump(button) isInfiniteJumpActive = not isInfiniteJumpActive; if isInfiniteJumpActive then button.Text = "InfiniteJump (Aktif)"; button.BackgroundColor3 = ACCENT_COLOR; jumpConnection = UIS.JumpRequest:Connect(handleJumpRequest) else button.Text = "InfiniteJump"; button.BackgroundColor3 = BUTTON_COLOR; if jumpConnection then jumpConnection:Disconnect(); jumpConnection = nil end end end
local function antiFreezeLoop() while isAntiFreezeActive and LocalPlayer.Character do local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if Humanoid and Humanoid.Health > 0 then local currentState = Humanoid:GetState(); if currentState == Enum.HumanoidStateType.None or currentState == Enum.HumanoidStateType.Seated or currentState == Enum.HumanoidStateType.PlatformStanding or currentState == Enum.HumanoidStateType.Physics then Humanoid:ChangeState(Enum.HumanoidStateType.Running) end end; wait() end end
local function toggleAntiFreeze(button) isAntiFreezeActive = not isAntiFreezeActive; if isAntiFreezeActive then coroutine.wrap(antiFreezeLoop)(); button.Text = "Anti-Freeze (Aktif)"; button.BackgroundColor3 = ACCENT_COLOR else button.Text = "Anti-Freeze"; button.BackgroundColor3 = BUTTON_COLOR end end
local function findTarget() local minDistance = math.huge; local target = nil; local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"); if not myHRP then return nil end; for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.Health > 0 then local targetHRP = player.Character.HumanoidRootPart; local distance = (myHRP.Position - targetHRP.Position).Magnitude; if distance < minDistance then minDistance = distance; target = player.Character end end end; return target end
local function aimBotLoop() if not isAimBotActive or not LocalPlayer.Character or not Workspace.CurrentCamera then return end; local target = findTarget(); if target and target:FindFirstChild(AIM_PART) then local targetPart = target[AIM_PART]; local headPosition = targetPart.Position; Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, headPosition) end end
local function toggleAimBot(button) isAimBotActive = not isAimBotActive; if isAimBotActive then button.Text = "AimBot (Aktif - " .. AIM_PART .. ")"; button.BackgroundColor3 = ACCENT_COLOR; aimbotConnection = RunService.Heartbeat:Connect(aimBotLoop); UIS.MouseBehavior = Enum.MouseBehavior.LockCenter else button.Text = "AimBot"; button.BackgroundColor3 = BUTTON_COLOR; if aimbotConnection then aimbotConnection:Disconnect(); aimbotConnection = nil end; UIS.MouseBehavior = Enum.MouseBehavior.Default end end
local function createPlayerBoxESP(player) local char = player.Character; if not char then return end; for _, drawing in pairs(espDrawings[player] or {}) do drawing:Destroy() end; espDrawings[player] = {}; local Head = char:FindFirstChild("Head"); local HRP = char:FindFirstChild("HumanoidRootPart"); local Humanoid = char:FindFirstChildOfClass("Humanoid"); if not HRP or not Humanoid then return end; local Billboard = Instance.new("BillboardGui"); Billboard.Name = "WESTTEAM_ESP_Billboard"; Billboard.Size = UDim2.new(0, 100, 0, 20); Billboard.Adornee = Head; Billboard.AlwaysOnTop = true; Billboard.MaxDistance = math.huge; Billboard.ExtentsOffset = Vector3.new(0, 1.5, 0); Billboard.Parent = CoreGui; local NameLabel = Instance.new("TextLabel"); NameLabel.Size = UDim2.new(1, 0, 1, 0); NameLabel.Text = player.Name .. " [" .. math.floor(Humanoid.Health) .. "]"; NameLabel.TextColor3 = Color3.fromRGB(0, 255, 255); NameLabel.TextStrokeTransparency = 0; NameLabel.BackgroundTransparency = 1; NameLabel.Font = Enum.Font.SourceSans; NameLabel.TextSize = 14; NameLabel.Parent = Billboard; espDrawings[player][1] = Billboard; local BoxFrame = Instance.new("Frame"); BoxFrame.Name = "WESTTEAM_ESP_BoxFrame"; BoxFrame.Size = UDim2.new(0, 2, 0, 2); BoxFrame.BackgroundTransparency = 1; BoxFrame.BorderSizePixel = 0; BoxFrame.ZIndex = 5; BoxFrame.Parent = PlayerGui; local drawBox = {}; for i=1, 4 do local edge = Instance.new("Frame"); edge.Name = "Edge" .. i; edge.BackgroundColor3 = Color3.fromRGB(0, 255, 255); edge.BorderSizePixel = 0; edge.ZIndex = 5; edge.Parent = BoxFrame; drawBox[i] = edge end; espDrawings[player][2] = BoxFrame end
local function updateBoxESP() if not isEspActive or not LocalPlayer.Character or not Workspace.CurrentCamera then return end; local camera = Workspace.CurrentCamera; for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer and player.Character then local char = player.Character; local HRP = char:FindFirstChild("HumanoidRootPart"); local Head = char:FindFirstChild("Head"); if HRP and Head then local boxFrame = espDrawings[player] and espDrawings[player][2]; local billboard = espDrawings[player] and espDrawings[player][1]; if not boxFrame or not billboard then continue end; local boxData = boxFrame:GetChildren(); local upperPos = Head.Position + Vector3.new(0, Head.Size.Y / 2, 0); local lowerPos = HRP.Position - Vector3.new(0, HRP.Size.Y / 2, 0); local upperScreen, upperVis = camera:WorldToScreenPoint(upperPos); local lowerScreen, lowerVis = camera:WorldToScreenPoint(lowerPos); if upperVis and lowerVis then local height = math.abs(upperScreen.Y - lowerScreen.Y); local width = height * 0.6; local center = Vector2.new(upperScreen.X, upperScreen.Y + height / 2); local topLeft = center - Vector2.new(width / 2, height / 2); local lineThickness = 1.5; boxData[1].Position = UDim2.new(0, topLeft.X, 0, topLeft.Y); boxData[1].Size = UDim2.new(0, lineThickness, 0, height); boxData[2].Position = UDim2.new(0, topLeft.X + width - lineThickness, 0, topLeft.Y); boxData[2].Size = UDim2.new(0, lineThickness, 0, height); boxData[3].Position = UDim2.new(0, topLeft.X, 0, topLeft.Y); boxData[3].Size = UDim2.new(0, width, 0, lineThickness); boxData[4].Position = UDim2.new(0, topLeft.X, 0, topLeft.Y + height - lineThickness); boxData[4].Size = UDim2.new(0, width, 0, lineThickness); boxFrame.Visible = true else boxFrame.Visible = false end else if espDrawings[player] then for _, drawing in pairs(espDrawings[player]) do drawing:Destroy() end; espDrawings = {} end end end end end
local function toggleESP(button) isEspActive = not isEspActive; if isEspActive then button.Text = "ESP (Aktif - Box/İsim)"; button.BackgroundColor3 = ACCENT_COLOR; for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then createPlayerBoxESP(player); player.CharacterAdded:Connect(function(char) if isEspActive then createPlayerBoxESP(player) end end) end end; espConnection = RunService.RenderStepped:Connect(updateBoxESP) else for player, drawings in pairs(espDrawings) do for _, drawing in pairs(drawings) do drawing:Destroy() end; espDrawings = {} end; if espConnection then espConnection:Disconnect(); espConnection = nil end; button.Text = "ESP"; button.BackgroundColor3 = BUTTON_COLOR end end
local function freezeAllActivation(shouldFreeze) for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then local char = player.Character; if char then local HRP = char:FindFirstChild("HumanoidRootPart"); local Humanoid = char:FindFirstChildOfClass("Humanoid"); if HRP and Humanoid then if shouldFreeze then HRP.Velocity = Vector3.new(0, 0, 0); HRP.RotationalVelocity = Vector3.new(0, 0, 0); HRP.Anchored = true; Humanoid:ChangeState(Enum.HumanoidStateType.Seated) else HRP.Anchored = false; Humanoid:ChangeState(Enum.HumanoidStateType.Running) end end end end end end
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
local function toggleAntiLag(button) isAntiLagActive = not isAntiLagActive; if isAntiLagActive then originalFogEnd = Lighting.FogEnd; Lighting.FogEnd = 999999; Lighting.GlobalShadows = false; Lighting.Ambient = Color3.new(0, 0, 0); originalBrightness = Lighting.Brightness; Lighting.Brightness = 0.5; for _, effect in ipairs(Lighting:GetChildren()) do if effect:IsA("BloomEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") then effect.Enabled = false end end; local camera = Workspace.CurrentCamera; if camera then if camera:FindFirstChildOfClass("BlurEffect") then camera.BlurEffect.Enabled = false end; if camera:FindFirstChildOfClass("ColorCorrectionEffect") then camera.ColorCorrectionEffect.Enabled = false end end; if Workspace:FindFirstChild("Sky") then Workspace:FindFirstChild("Sky"):Destroy() end; if Lighting:FindFirstChild("Sky") then Lighting:FindFirstChild("Sky"):Destroy() end; button.Text = "**Anti-Lag (Aktif - FPS Yükseltici)**"; button.BackgroundColor3 = ANTILAG_COLOR else Lighting.FogEnd = originalFogEnd; Lighting.GlobalShadows = true; Lighting.Ambient = Color3.new(0.5, 0.5, 0.5); Lighting.Brightness = originalBrightness; for _, effect in ipairs(Lighting:GetChildren()) do if effect:IsA("BloomEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") then effect.Enabled = true end end; if originalSkybox then originalSkybox:Clone().Parent = Lighting end; button.Text = "Anti-Lag (FPS Yükseltici)"; button.BackgroundColor3 = BUTTON_COLOR end end
local function toggleXRay(button)
    isXRayActive = not isXRayActive
    local function processChildren(children)
        for _, part in ipairs(children) do
            if part:IsA("BasePart") and part.CanCollide and part.Transparency < 1 and not part:IsDescendantOf(LocalPlayer.Character) then
                if isXRayActive then
                    originalTransparency[part] = part.Transparency
                    part.Transparency = 0.7 
                    part.BrickColor = BrickColor.new("Really red") 
                else
                    if originalTransparency[part] ~= nil then
                        part.Transparency = originalTransparency[part] 
                        part.BrickColor = BrickColor.new("Medium stone grey") 
                        originalTransparency[part] = nil
                    end
                end
            end
            if #part:GetChildren() > 0 then
                processChildren(part:GetChildren())
            end
        end
    end
    if isXRayActive then
        processChildren(Workspace:GetChildren())
        button.Text = "**XRay (Aktif - Duvar Görüşü)**"
        button.BackgroundColor3 = XRAY_COLOR
    else
        for part, trans in pairs(originalTransparency) do
             if part and part.Parent then
                part.Transparency = trans 
                part.BrickColor = BrickColor.new("Medium stone grey") 
            end
        end
        originalTransparency = {}
        button.Text = "XRay"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end
local spinConnection = nil
local spinAngle = 0
local function spinLoop()
    local char = LocalPlayer.Character
    local HRP = char and char:FindFirstChild("HumanoidRootPart")
    if not HRP then return end
    spinAngle = spinAngle + 0.5 
    HRP.CFrame = HRP.CFrame * CFrame.Angles(0, math.rad(spinAngle), 0)
end
local function toggleSpin(button)
    isSpinActive = not isSpinActive
    if isSpinActive then
        spinConnection = RunService.Heartbeat:Connect(spinLoop)
        button.Text = "**Spin (Aktif - Hızlı Dönme)**"
        button.BackgroundColor3 = SPIN_COLOR
    else
        if spinConnection then spinConnection:Disconnect(); spinConnection = nil end
        button.Text = "Spin"
        button.BackgroundColor3 = BUTTON_COLOR
    end
end


-- ===========================================
-- 4. ÖZELLİK FONKSİYONLARI (Harici 42 ADET)
-- ===========================================
local function safeLoad(url)
    local success, result = pcall(function()
        loadstring(game:HttpGet(url))() 
    end)
    if success then return true else warn("Harici Script Yüklenemedi (" .. url .. "): " .. tostring(result)) return false end
end

local function createRerunToggle(flagName, url, buttonText, activeColor)
    return function(button)
        if _G[flagName] then 
            _G[flagName] = false
            button.Text = buttonText .. " (Yüklüydü - Yeniden Yükleniyor)"
            button.BackgroundColor3 = BUTTON_COLOR
            wait(0.1)
        end
        
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

-- Yeni Buton Fonksiyonları (Orijinal Koddan)
local toggleAdminPanelFE = createRerunToggle("isAdminPanelFELoaded", "https://rawscripts.net/raw/Universal-Script-rochips-panel-34286", "**Admin Panel FE (Rochips)**", ADMIN_PANEL_FE_COLOR)
local toggleInfinityAntiCheat = createRerunToggle("isInfinityAntiCheatLoaded", "https://rawscripts.net/raw/Universal-Script-Infinity-Anti-Cheat-Bypass-64350", "**Infinity Anti-Cheat Bypass**", INFINITY_AC_COLOR) 
local toggleUniversalAimBot = createRerunToggle("isUniversalAimBotLoaded", "https://rawscripts.net/raw/Universal-Script-scoot-ui-lib-62317", "**Universal AimBot +**", UNIVERSAL_COLOR)
local toggleSpeedrunTimer = createRerunToggle("isSpeedrunTimerLoaded", "https://rawscripts.net/raw/Universal-Script-Speedrun-Timer-56594", "SPEEDRUNNER💎", SPEEDRUN_COLOR)
local toggleTSBGojo = createRerunToggle("isTSBGojoLoaded", "https://raw.githubusercontent.com/hehehe9028/The-strongest-battleground-/refs/heads/main/The%20strongest%20battleground%20RVVC%20SCRIPTS", "**TSB-GOJO (Key=CRAZY GOJO)**", TSB_GOJO_COLOR)
local toggleTSBSukuna = createRerunToggle("isTSBSukunaLoaded", "https://raw.githubusercontent.com/hehehe9028/RVVC-SUKUNA-SCRIPT/refs/heads/main/Sukuna%20tsb%20RVVC%20SCRIPTS", "**TSB-SUKUNA (Key=RVVC SUKUNA)**", TSB_SUKUNA_COLOR)
local toggleForsaken = createRerunToggle("isForsakenLoaded", "https://raw.githubusercontent.com/hehehe9028/RVVC-FORSAKEN/refs/heads/main/RVVC%20SCRIPTS", "**Forsaken SC(Key=VEX RVVC)⚡**", FORSAKEN_COLOR)
local togglePVB = createRerunToggle("isPVBLoaded", "https://raw.githubusercontent.com/hehehe9028/HOKALAZA-plants-vs-brainrot/refs/heads/main/Key", "**Plants Vs Brainrots/PVB(Key=CRAZY VS BRAINROT) 🌱**", PVB_COLOR)
local toggle99NightsRevision = createRerunToggle("is99NightsRevisionLoaded", "https://raw.githubusercontent.com/hehehe9028/RVVC-99-NIGHTS-IN-THE-FOREST/refs/heads/main/RVVC%20SCRIPTS%2099%20NIGHT%20IN%20THE%20FOREST", "**99 Gece Sc(Key=REVISION FOREST)🌲**", REVISION_FOREST_COLOR)
local toggleBloxFruit = createRerunToggle("isBloxFruitLoaded", "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", "**Blox Fruit SC 🍍**", BLOXFRUIT_COLOR)
local toggleGAG = createRerunToggle("isGAGLoaded", "https://raw.githubusercontent.com/Nebula-xyzs/GAG/refs/heads/main/GrowAGardenXE", "**Grow A Garden/GAG SC 🥕**", GAG_COLOR)
local toggleShootaBrainrot = createRerunToggle("isShootaBrainrotLoaded", "https://raw.githubusercontent.com/gumanba/Scripts/main/ShootaBrainrot", "**Shoot A Brainrot OP SC 🧠**", SHOOTABRAINROT_COLOR)
local toggleDontWaketheBrainrots = createRerunToggle("isDontWaketheBrainrotsLoaded", "https://raw.githubusercontent.com/gumanba/Scripts/main/DontWaketheBrainrots", "**Bir Brainotu Uyandırma SC 😴**", DONTWAKE_COLOR)
local togglePlayTime = createRerunToggle("isPlayTimeGUILoaded", "https://rawscripts.net/raw/Universal-Script-Play-time-63991", "Play Time", Color3.fromRGB(0, 170, 0))
local toggleDex = createRerunToggle("isDexLoaded", "https://raw.githubusercontent.com/wally-rblx/Scripts/main/Dex.lua", "**Dex (Exploder)**", Color3.fromRGB(255, 255, 0))
local toggleBrainrot = createRerunToggle("isBrainrotLoaded", "https://raw.githubusercontent.com/gumanba/Scripts/main/BrainrotEvolution", "**Brainrot Evelution SC**", Color3.fromRGB(85, 0, 170))
local toggleBackdoorScanner = createRerunToggle("isBackdoorScannerLoaded", "https://rawscripts.net/raw/Universal-Script-Backdoor-64089", "Best Backdoor(2)", BACKDOOR_COLOR)
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
local toggleTSBDrip = createRerunToggle("isTSBDripLoaded", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Custom-movesets-Dr-ray-Gui-remake-19994", "**DRİP TSB(NO KEY)⭐**", TSB_DRIP_COLOR) 
local toggleSabSc = createRerunToggle("isSabScLoaded", "https://rawscripts.net/raw/Universal-Script-Kurd-Hub-29484", "SAB SC (Kurd Hub)", Color3.fromRGB(255, 170, 0))
local toggleBrookhavenSC = createRerunToggle("isBrookhavenLoaded", "https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845", "Brookhaven SC 1 (Sander XY)", Color3.fromRGB(85, 255, 0))
local toggleBrookhaven2 = createRerunToggle("isBrookhaven2Loaded", "https://rawscripts.net/raw/Brookhaven-RP-FURIA-HUB-47441", "**FURIA HUB (Brookhaven OP)**", Color3.fromRGB(255, 105, 180))
local toggleCoolkiddExecutor = createRerunToggle("isCoolkiddLoaded", "https://rawscripts.net/raw/Universal-Script-c00lkidd-executor-2025-61657", "c00lkidd excutor.s", Color3.fromRGB(255, 20, 147))
local toggleWestteamW = createRerunToggle("isWestteamWLoaded", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM.lua", "WESTTEAM-W (ANA HUB)", Color3.fromRGB(0, 200, 255))
local toggleAdmPanel = createRerunToggle("isAdmPanelLoaded", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BY-WEST-UNİVERSAL.lua", "**WESTTEAM-ADM-PANEL**", Color3.fromRGB(255, 0, 0))
local toggleDripHubV3 = createRerunToggle("isDripHubV3Loaded", "https://rawscripts.net/raw/Universal-Script-Drip-Hub-V3-63628", "**Drip Hub V3 (OP)**", DRIPHUB_COLOR)
local toggleSolarisHub = createRerunToggle("isSolarisHubLoaded", "https://rawscripts.net/raw/Universal-Script-Solaris-Hub-63162", "Solaris Hub (Gelişmiş)", SOLARIS_COLOR)
local toggleKRLExecutor = createRerunToggle("isKRNLExecutorLoaded", "https://rawscripts.net/raw/Universal-Script-Krnl-Executor-8368", "KRNL EXECUTOR💎", KRNL_EXECUTOR_COLOR)
local toggleBTOOLS = createRerunToggle("isBTOOLSLoaded", "https://rawscripts.net/raw/Universal-Script-Btools-Universal-Script-61614", "B-TOOLS (Universal)", BTOOLS_COLOR)
local toggleInfiniteYield = createRerunToggle("isInfiniteYieldLoaded", "https://rawscripts.net/raw/Universal-Script-Infinite-Yield-62162", "İnfiniteYield(adm powers)", IY_COLOR)
local toggleFEAdmin = createRerunToggle("isFEAdminLoaded", "https://rawscripts.net/raw/Universal-Script-FE-Admin-OP-Universal-48600", "FE Admin (OP/Universal)", FE_ADMIN_COLOR)
local toggleRoxploit = createRerunToggle("isRoxploitLoaded", "https://rawscripts.net/raw/Universal-Script-RoXploit-by-KrystalTeam-9328", "Roxploit EXPLODER(Backdoor-)", ROXPLOIT_COLOR)

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
-- 6. ÖZELLİKLERİ PANELE EKLEME (NİHAİ LİSTE 6.4.4)
-- ===========================================

-- Dahili Özellikler (19 Adet)
createButton("Anti-AFK", toggleAntiAfk)
createButton("**NoClip (Universal Hibrit)**", toggleNoClip) 
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
createButton("Anti-Lag (FPS Yükseltici)", toggleAntiLag) 
createButton("**Server Hop (Yeni Sunucuya Geç)**", toggleServerHop) 
createButton("**XRay (Duvar Görüşü)**", toggleXRay) 
createButton("**Spin (Hızlı Dönme)**", toggleSpin) 
createButton("**Server Disco (Harita/Menü Renk Partisi)**", toggleDisco) -- 🎊 GÜNCEL

-- Harici Araçlar - Global (13 Adet)
createButton("**Infinity Anti-Cheat Bypass**", toggleInfinityAntiCheat) 
createButton("**Admin Panel FE (Rochips)**", toggleAdminPanelFE)
createButton("**Universal AimBot +**", toggleUniversalAimBot) 
createButton("SPEEDRUNNER💎", toggleSpeedrunTimer) 
createButton("**TSB-GOJO (Key=CRAZY GOJO)**", toggleTSBGojo) 
createButton("**TSB-SUKUNA (Key=RVVC SUKUNA)**", toggleTSBSukuna) 
createButton("**Forsaken SC(Key=VEX RVVC)⚡**", toggleForsaken) 
createButton("**Plants Vs Brainrots/PVB(Key=CRAZY VS BRAINROT) 🌱**", togglePVB) 
createButton("**99 Gece Sc(Key=REVISION FOREST)🌲**", toggle99NightsRevision)
createButton("**Blox Fruit SC 🍍**", toggleBloxFruit)
createButton("**Grow A Garden/GAG SC 🥕**", toggleGAG)
createButton("**Shoot A Brainrot OP SC 🧠**", toggleShootaBrainrot)
createButton("**Bir Brainotu Uyandırma SC 😴**", toggleDontWaketheBrainrots)

createButton("Fly GUI V4/Dahili Fly", toggleLoadFlyGUI) 
createButton("Play Time", togglePlayTime)

createButton("**Dex (Exploder)**", toggleDex) 
createButton("**Brainrot Evelution SC**", toggleBrainrot)

createButton("Best Backdoor(2)", toggleBackdoorScanner) 
createButton("LALOL HUB (Backdoor Scan)", toggleLalolHub) 
createButton("Tiger X (Very Op!)", toggleTigerX) 
createButton("k00pkidd (Hacker)", toggleK00pkidd)
createButton("Roxploit EXPLODER(Backdoor-)", toggleRoxploit) 

createButton("g00byd0lan (Hacker)", toggleG00byd0lan) 
createButton("**Unix Backdoor (Best)**", toggleUnixBackdoor) 
createButton("Araba Uçurma Sc", toggleCarFly) 
createButton("**MM2 SC (OP)**", toggleMM2SC) 

-- Önceki 99 Gece Scripti (Eski URL)
createButton("99 Gece Sc(No Key🌐)", toggle99NightsSC) 

createSpacer(50) -- 50px

-- Harici Araçlar - Oyun/Exploit (14 Adet)
createButton("**DRİP TSB(NO KEY)⭐**", toggleTSBDrip) 
createButton("Hexagon (Brookhaven)", toggleHexagonHub) 
createButton("Nytherune Hub (Op)", toggleNytheruneHub) 
createButton("SAB SC (Kurd Hub)", toggleSabSc) 
createButton("Brookhaven SC 1 (Sander XY)", toggleBrookhavenSC)
createButton("**FURIA HUB (Brookhaven OP)**", toggleBrookhaven2) 
createButton("c00lkidd excutor.s", toggleCoolkiddExecutor) 

-- GÜNCEL VE YENİ EKLENEN SCRİPTLER
createButton("**Drip Hub V3 (OP)**", toggleDripHubV3)
createButton("Solaris Hub (Gelişmiş)", toggleSolarisHub)
createButton("KRNL EXECUTOR💎", toggleKRLExecutor) 
createButton("B-TOOLS (Universal)", toggleBTOOLS)
createButton("İnfiniteYield(adm powers)", toggleInfiniteYield) 
createButton("FE Admin (OP/Universal)", toggleFEAdmin)

createSpacer(300) -- 300px BÜYÜK BOŞLUK 

-- Ana Hublar
createButton("WESTTEAM-W (ANA HUB)", toggleWestteamW)
createButton("**WESTTEAM-ADM-PANEL**", toggleAdmPanel)

print("✅ WESTTEAM-POWER 6.4.4: NİHAİ 61 ÖZELLİKLİ SÜRÜM YÜKLENDİ (NoClip Hibrit ve Server Disco Dahil). BAŞARILAR!")
