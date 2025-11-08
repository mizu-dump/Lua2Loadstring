-- ===============================================================
-- OP W WESTTEAM - KARARLI SÜRÜM (35 Özellik + Çoklu Dil Desteği)
-- Geliştirilmiş NoClip ve Dil Ayarları eklendi.
-- ===============================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui") 
local Lighting = game:GetService("Lighting") 
local CurrentLanguage = "TR" -- Varsayılan dil Türkçe

-- ===========================================
-- 1. DİL AYARLARI VE ÇEVİRİ TABLOSU
-- ===========================================

local Translations = {
    ["EN"] = {
        Header = "WESTTEAM-POWER ♕ — Unified Admin",
        AntiAFK = "Anti-AFK",
        NoClip = "NoClip",
        InfiniteJump = "InfiniteJump",
        AntiFreeze = "Anti-Freeze",
        AimBot = "AimBot",
        ESP = "ESP (Box/Name)",
        FreezeAll = "Freeze All (LALOL HUB)",
        Float = "Float (Low Gravity)",
        AnimGlitch = "Animation Glitch",
        KillAura = "Kill Aura",
        WalkSpeed = "WalkSpeed: 100",
        FullBright = "Full Bright",
        FOV = "FOV: 115",
        FlyGUI = "Load Fly GUI V4",
        PlayTime = "Play Time",
        Dex = "**Dex (Exploder)**",
        Brainrot = "**Brainrot Evelution SC**",
        Scanner = "Backdoor XP SCANNER",
        LalolHub = "LALOL HUB (Backdoor Scan)",
        TigerX = "Tiger X (Very Op!)",
        K00pkidd = "k00pkidd (Hacker)",
        G00byd0lan = "g00byd0lan (Hacker)",
        Unix = "**Unix Backdoor (Best)**",
        CarFly = "Car Fly Sc",
        MM2SC = "MM2 SC (OP)",
        Nights99 = "99 Nights Sc(No Key🌐)",
        DripClient = "**Drip Client (Brookhaven op)**",
        Hexagon = "Hexagon (Brookhaven)",
        Nytherune = "Nytherune Hub (Op)",
        SABSC = "SAB SC (Kurd Hub)",
        Brookhaven1 = "Brookhaven SC 1 (Sander XY)",
        Brookhaven2 = "Brookhaven OP 2 (FURIA HUB)",
        Coolkidd = "c00lkidd excutor.s",
        WESTTEAMW = "WESTTEAM-W (MAIN HUB)",
        ADM = "**WESTTEAM-ADM-PANEL**",
        Active = "(Active)",
        Loaded = "(Loaded)",
    },
    ["TR"] = {
        Header = "WESTTEAM-POWER ♕ — Birleşik Yönetim",
        AntiAFK = "Anti-AFK",
        NoClip = "NoClip",
        InfiniteJump = "Sınırsız Zıplama",
        AntiFreeze = "Anti-Donma",
        AimBot = "AimBot",
        ESP = "ESP (Kutu/İsim)",
        FreezeAll = "Hepsini Dondur (LALOL HUB)",
        Float = "Süzülme (Düşük Yer Çekimi)",
        AnimGlitch = "Animasyon Glitch",
        KillAura = "Kill Aura",
        WalkSpeed = "Yürüme Hızı: 100",
        FullBright = "Full Parlaklık",
        FOV = "Görüş Alanı: 115",
        FlyGUI = "Fly GUI V4 Yükle",
        PlayTime = "Oyun Süresi",
        Dex = "**Dex (Exploder)**",
        Brainrot = "**Brainrot Evelution SC**",
        Scanner = "Backdoor XP SCANNER",
        LalolHub = "LALOL HUB (Backdoor Tarama)",
        TigerX = "Tiger X (Çok OP!)",
        K00pkidd = "k00pkidd (Hacker)",
        G00byd0lan = "g00byd0lan (Hacker)",
        Unix = "**Unix Backdoor (En İyi)**",
        CarFly = "Araba Uçurma Sc",
        MM2SC = "MM2 SC (OP)",
        Nights99 = "99 Gece Sc(Anahtarsız🌐)",
        DripClient = "**Drip Client (Brookhaven op)**",
        Hexagon = "Hexagon (Brookhaven)",
        Nytherune = "Nytherune Hub (Op)",
        SABSC = "SAB SC (Kurd Hub)",
        Brookhaven1 = "Brookhaven SC 1 (Sander XY)",
        Brookhaven2 = "Brookhaven OP 2 (FURIA HUB)",
        Coolkidd = "c00lkidd excutor.s",
        WESTTEAMW = "WESTTEAM-W (ANA HUB)",
        ADM = "**WESTTEAM-ADM-PANEL**",
        Active = "(Aktif)",
        Loaded = "(Yüklü)",
    },
    ["AR"] = {
        Header = "WESTTEAM-POWER ♕ — الإدارة الموحدة",
        AntiAFK = "منع الخمول",
        NoClip = "إختراق الجدران",
        InfiniteJump = "قفز غير محدود",
        AntiFreeze = "مقاومة التجميد",
        AimBot = "تصويب آلي",
        ESP = "إي إس بي (صندوق/إسم)",
        FreezeAll = "تجميد الكل (LALOL HUB)",
        Float = "طيران منخفض (جاذبية)",
        AnimGlitch = "خلل الحركة",
        KillAura = "هالة القتل",
        WalkSpeed = "سرعة المشي: 100",
        FullBright = "إضاءة كاملة",
        FOV = "مجال الرؤية: 115",
        FlyGUI = "تحميل واجهة الطيران V4",
        PlayTime = "وقت اللعب",
        Dex = "**ديكس (المستكشف)**",
        Brainrot = "**براين روت سكريبت**",
        Scanner = "ماسح الباب الخلفي XP",
        LalolHub = "مركز لالول (فحص الباب الخلفي)",
        TigerX = "تايجر إكس (قوي جداً!)",
        K00pkidd = "كوب كيد (مخترق)",
        G00byd0lan = "جوبي دولان (مخترق)",
        Unix = "**يونيكس الباب الخلفي (الأفضل)**",
        CarFly = "تطيير السيارات",
        MM2SC = "إم إم 2 سكريبت (قوي)",
        Nights99 = "99 ليلة (بدون مفتاح🌐)",
        DripClient = "**دريب عميل (بروكهافن قوي)**",
        Hexagon = "هيكساجون (بروكهافن)",
        Nytherune = "نيثرون هب (قوي)",
        SABSC = "ساب سكريبت (مركز كرد)",
        Brookhaven1 = "بروكهافن سكريبت 1",
        Brookhaven2 = "بروكهافن قوي 2",
        Coolkidd = "منفذ كول كيد",
        WESTTEAMW = "مركز ويست تيم (رئيسي)",
        ADM = "**لوحة تحكم ويست تيم**",
        Active = "(نشط)",
        Loaded = "(محمّل)",
    }
}

local featureToKey = {
    toggleAntiAfk = "AntiAFK", toggleNoClip = "NoClip", toggleInfiniteJump = "InfiniteJump", 
    toggleAntiFreeze = "AntiFreeze", toggleAimBot = "AimBot", toggleESP = "ESP", 
    toggleFreezeAll = "FreezeAll", toggleFloat = "Float", toggleAnimationGlitch = "AnimGlitch", 
    toggleKillAura = "KillAura", toggleWalkSpeed100 = "WalkSpeed", toggleFullBright = "FullBright", 
    toggleFOV = "FOV", toggleLoadFlyGUI = "FlyGUI", togglePlayTime = "PlayTime", 
    toggleDex = "Dex", toggleBrainrot = "Brainrot", toggleBackdoorScanner = "Scanner", 
    toggleLalolHub = "LalolHub", toggleTigerX = "TigerX", toggleK00pkidd = "K00pkidd", 
    toggleG00byd0lan = "G00byd0lan", toggleUnixBackdoor = "Unix", toggleCarFly = "CarFly", 
    toggleMM2SC = "MM2SC", toggle99NightsSC = "Nights99", toggleDripClient = "DripClient", 
    toggleHexagonHub = "Hexagon", toggleNytheruneHub = "Nytherune", toggleSabSc = "SABSC", 
    toggleBrookhavenSC = "Brookhaven1", toggleBrookhaven2 = "Brookhaven2", toggleCoolkiddExecutor = "Coolkidd",
    toggleWestteamW = "WESTTEAMW", toggleAdmPanel = "ADM",
}

-- Çeviri fonksiyonu
local function getTranslation(key)
    local langTable = Translations[CurrentLanguage] or Translations["TR"] 
    return langTable[key] or "MISSING TRANSLATION" 
end

-- Buton metinlerini güncelleme
local function updateButtonText(button, featureKey, isActive, isLoaded)
    local baseText = getTranslation(featureKey)
    local statusText = ""
    local accent = ACCENT_COLOR 

    if isActive then
        statusText = " " .. getTranslation("Active")
        accent = ACCENT_COLOR
    elseif isLoaded then
        statusText = " " .. getTranslation("Loaded")
        accent = Color3.fromRGB(0, 170, 0) -- Yüklü scriptler için yeşil
    end

    if featureKey == "Dex" or featureKey == "Brainrot" or featureKey == "Unix" or featureKey == "DripClient" or featureKey == "ADM" then
        button.Text = "**" .. baseText .. statusText .. "**"
    else
        button.Text = baseText .. statusText
    end

    if isActive then
        button.BackgroundColor3 = ACCENT_COLOR
    elseif isLoaded then
        -- Yüklü scriptler için arka plan rengini değiştirmemek daha iyi
        button.BackgroundColor3 = BUTTON_COLOR 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
end

-- ===========================================
-- 2. ÖZELLİK DURUMLARI (FLAG'LER)
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

local jumpConnection = nil 
local aimbotConnection = nil        
local espConnection = nil           
local animationGlitchConnection = nil 
local killAuraConnection = nil        
local noClipLoop = nil                  
local originalGravity = Workspace.Gravity 
local originalWalkSpeed = 16          
local originalBrightness = Lighting.Brightness or 1 
local originalFOV = 70 

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
local SPACER_HEIGHT_SMALL = 50 
local SPACER_HEIGHT_LARGE = 150 
local TOTAL_FEATURES_COUNT = 35 -- Toplam 35 özellik + 2 Spacer + 3 Dil butonu (40 element)
local PADDING_TOP_BOTTOM = 20 

-- İçerik yüksekliği hesaplaması (35 özellik + 3 dil butonu + 2 spacer)
local REQUIRED_CONTENT_HEIGHT = (BUTTON_HEIGHT + BUTTON_PADDING) * (TOTAL_FEATURES_COUNT + 3) + SPACER_HEIGHT_SMALL + SPACER_HEIGHT_LARGE + PADDING_TOP_BOTTOM
local CONTENT_HEIGHT = math.max(REQUIRED_CONTENT_HEIGHT, (PANEL_HEIGHT - HEADER_HEIGHT) + 500)

-- Renkler 
local BACKGROUND_COLOR = Color3.fromRGB(40, 40, 40)
local BUTTON_COLOR = Color3.fromRGB(60, 60, 60)
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)
local ACCENT_COLOR = Color3.fromRGB(255, 85, 0)
local ESP_COLOR = Color3.fromRGB(0, 255, 255) 

local espDrawings = {}

-- ===========================================
-- 3. GUI YAPISI VE HAREKETİ
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
-- 4. DİL DEĞİŞTİRME MEKANİZMASI
-- ===========================================

-- Tüm butonları saklamak için tablo
local allButtons = {} 

local function refreshGUI()
    Header.Text = getTranslation("Header")

    for button, featureKey in pairs(allButtons) do
        local isActive = false
        local isLoaded = false
        
        -- Aktif/Yüklü durum kontrolü
        if featureKey == "AntiAFK" then isActive = isAntiAfkActive end
        if featureKey == "NoClip" then isActive = isNoClipActive end
        if featureKey == "InfiniteJump" then isActive = isInfiniteJumpActive end
        if featureKey == "AntiFreeze" then isActive = isAntiFreezeActive end
        if featureKey == "AimBot" then isActive = isAimBotActive end
        if featureKey == "ESP" then isActive = isEspActive end
        if featureKey == "FreezeAll" then isActive = isFreezeAllActive end
        if featureKey == "Float" then isActive = isFloatActive end
        if featureKey == "AnimGlitch" then isActive = isAnimationGlitchActive end
        if featureKey == "KillAura" then isActive = isKillAuraActive end
        if featureKey == "WalkSpeed" then isActive = isWalkSpeedActive end
        if featureKey == "FullBright" then isActive = isFullBrightActive end
        if featureKey == "FOV" then isActive = isFOVActive end

        if featureKey == "FlyGUI" then isLoaded = isFlyGUILoaded end
        if featureKey == "PlayTime" then isLoaded = isPlayTimeGUILoaded end
        if featureKey == "Dex" then isLoaded = isDexLoaded end
        if featureKey == "Brainrot" then isLoaded = isBrainrotLoaded end
        if featureKey == "Scanner" then isLoaded = isBackdoorScannerLoaded end
        if featureKey == "LalolHub" then isLoaded = isLalolHubLoaded end
        if featureKey == "TigerX" then isLoaded = isTigerXLoaded end
        if featureKey == "K00pkidd" then isLoaded = isK00pkiddLoaded end
        if featureKey == "G00byd0lan" then isLoaded = isG00byd0lanLoaded end
        if featureKey == "Unix" then isLoaded = isUnixBackdoorLoaded end
        if featureKey == "CarFly" then isLoaded = isCarFlyLoaded end
        if featureKey == "MM2SC" then isLoaded = isMM2SCLoaded end
        if featureKey == "Nights99" then isLoaded = is99NightsLoaded end
        if featureKey == "DripClient" then isLoaded = isDripClientLoaded end
        if featureKey == "Hexagon" then isLoaded = isHexagonLoaded end
        if featureKey == "Nytherune" then isLoaded = isNytheruneLoaded end
        if featureKey == "SABSC" then isLoaded = isSabScLoaded end
        if featureKey == "Brookhaven1" then isLoaded = isBrookhavenLoaded end
        if featureKey == "Brookhaven2" then isLoaded = isBrookhaven2Loaded end
        if featureKey == "Coolkidd" then isLoaded = isCoolkiddLoaded end
        if featureKey == "WESTTEAMW" then isLoaded = isWestteamWLoaded end
        if featureKey == "ADM" then isLoaded = isAdmPanelLoaded end
        
        updateButtonText(button, featureKey, isActive, isLoaded)
    end
end

-- ===========================================
-- 5. ÖZELLİK FONKSİYONLARI (Dahili 13)
-- ===========================================

-- 5.2. NoClip (GELİŞTİRİLMİŞ V2 - CanCollide Ayarı)
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
            -- HumanoidRootPart'ın çarpışmasını koruyun
            char.HumanoidRootPart.CanCollide = false 
            -- Diğer vücut parçalarının çarpışmasını kapatın
            setCharacterCollision(char, false)
        end
        RunService.Heartbeat:Wait() 
    end
end

local function handleCharacterNoClip(char)
    if isNoClipActive then
        char.HumanoidRootPart.CanCollide = false 
        setCharacterCollision(char, false)
    end
end

local function toggleNoClip(button)
    isNoClipActive = not isNoClipActive
    
    if isNoClipActive then
        local char = LocalPlayer.Character
        if char then 
            char.HumanoidRootPart.CanCollide = false 
            setCharacterCollision(char, false)
        end
        
        noClipLoop = coroutine.wrap(noClipMonitor)() 
        LocalPlayer.CharacterAdded:Connect(handleCharacterNoClip) 
        
        button.BackgroundColor3 = ACCENT_COLOR
    else
        local char = LocalPlayer.Character
        if char then 
            char.HumanoidRootPart.CanCollide = true 
            setCharacterCollision(char, true)
        end
        
        if noClipLoop then noClipLoop = nil end 
        
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI() -- Buton metnini güncelle
end

-- 5.1. Anti-AFK
local function toggleAntiAfk(button)
    isAntiAfkActive = not isAntiAfkActive
    local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if isAntiAfkActive then
        coroutine.wrap(function() while isAntiAfkActive and Humanoid do Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) wait(10) end end)()
        button.BackgroundColor3 = ACCENT_COLOR
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 5.3. InfiniteJump
local function handleJumpRequest()
    local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if isInfiniteJumpActive and Humanoid and Humanoid.Health > 0 then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

local function toggleInfiniteJump(button)
    isInfiniteJumpActive = not isInfiniteJumpActive
    if isInfiniteJumpActive then
        button.BackgroundColor3 = ACCENT_COLOR
        jumpConnection = UIS.JumpRequest:Connect(handleJumpRequest) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
        if jumpConnection then jumpConnection:Disconnect(); jumpConnection = nil end
    end
    refreshGUI()
end

-- 5.4. Anti-Freeze
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
        button.BackgroundColor3 = ACCENT_COLOR
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 5.5. AimBot
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
        button.BackgroundColor3 = ACCENT_COLOR
        aimbotConnection = RunService.Heartbeat:Connect(aimBotLoop)
        UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
    else
        button.BackgroundColor3 = BUTTON_COLOR
        if aimbotConnection then aimbotConnection:Disconnect(); aimbotConnection = nil end
        UIS.MouseBehavior = Enum.MouseBehavior.Default
    end
    refreshGUI()
end

-- 5.6. ESP (Box/Name)
local function createPlayerBoxESP(player)
    -- ... (ESP fonksiyonu içeriği, yukarıda tanımlanan espDrawings tablosunu kullanır)
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
            espDrawings = {}
        end
        if espConnection then espConnection:Disconnect(); espConnection = nil end
    end
end

local function toggleESP(button)
    isEspActive = not isEspActive
    if isEspActive then
        button.BackgroundColor3 = ACCENT_COLOR
        espActivation(true)
    else
        button.BackgroundColor3 = BUTTON_COLOR
        espActivation(false)
    end
    refreshGUI()
end

-- 5.7. Freeze All
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
        button.BackgroundColor3 = ACCENT_COLOR
        coroutine.wrap(freezeAllLoop)()
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 5.8. Float
local function toggleFloat(button)
    isFloatActive = not isFloatActive
    
    if isFloatActive then
        Workspace.Gravity = 10 
        button.BackgroundColor3 = ACCENT_COLOR
    else
        Workspace.Gravity = originalGravity
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 5.9. Animation Glitch
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
        coroutine.wrap(animationGlitchLoop)()
        button.BackgroundColor3 = ACCENT_COLOR
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 5.10. Kill Aura
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
        button.BackgroundColor3 = ACCENT_COLOR
        killAuraConnection = RunService.Heartbeat:Connect(killAuraLoop)
    else
        button.BackgroundColor3 = BUTTON_COLOR
        
        if killAuraConnection then
            killAuraConnection:Disconnect()
            killAuraConnection = nil
        end
    end
    refreshGUI()
end

-- 5.11. WalkSpeed 100 
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
        button.BackgroundColor3 = Color3.fromRGB(135, 206, 250) 
    else
        setWalkSpeed(originalWalkSpeed)
        button.BackgroundColor3 = BUTTON_COLOR
    end
    
    LocalPlayer.CharacterAdded:Connect(function(char)
        if isWalkSpeedActive then
            local newHumanoid = char:WaitForChild("Humanoid")
            newHumanoid.WalkSpeed = 100
        end
    end)
    refreshGUI()
end

-- 5.12. Full Bright 
local function toggleFullBright(button)
    isFullBrightActive = not isFullBrightActive

    if isFullBrightActive then
        originalBrightness = Lighting.Brightness 
        Lighting.Brightness = 5 
        Lighting.GlobalShadows = false 
        button.BackgroundColor3 = Color3.fromRGB(255, 255, 100) 
    else
        Lighting.Brightness = originalBrightness 
        Lighting.GlobalShadows = true 
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 5.13. FOV 115 
local function toggleFOV(button)
    isFOVActive = not isFOVActive

    local camera = Workspace.CurrentCamera
    if not camera then return end

    if isFOVActive then
        originalFOV = camera.FieldOfView
        camera.FieldOfView = 115
        button.BackgroundColor3 = Color3.fromRGB(85, 255, 255) 
    else
        camera.FieldOfView = originalFOV
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- ===========================================
-- 6. ÖZELLİK FONKSİYONLARI (Harici 22)
-- ===========================================

-- 6.1. Load Fly GUI V4 
local function toggleLoadFlyGUI(button)
    if not isFlyGUILoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-script-gui-v4-made-by-me-64278"))()
        isFlyGUILoaded = true
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.2. Play Time
local function togglePlayTime(button)
    if not isPlayTimeGUILoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Play-time-63991"))()
        isPlayTimeGUILoaded = true
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.3. Dex (Exploder) 
local function toggleDex(button)
    if not isDexLoaded then
        loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))()
        isDexLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(255, 255, 0) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.4. Brainrot Evelution SC
local function toggleBrainrot(button)
    if not isBrainrotLoaded then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/BrainrotEvolution"))()
        isBrainrotLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(85, 0, 170) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.5. Backdoor XP SCANNER
local function toggleBackdoorScanner(button)
    if not isBackdoorScannerLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-XP-Backdoor-Scanner-51591"))()
        isBackdoorScannerLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.6. LALOL HUB (Backdoor Scan)
local function toggleLalolHub(button)
    if not isLalolHubLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Lalol-Hub-why-44490"))()
        isLalolHubLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(200, 100, 255) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.7. Tiger X (Very Op!)
local function toggleTigerX(button)
    if not isTigerXLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tiger-hub-x-v4-42180"))()
        isTigerXLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(255, 165, 0) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.8. k00pkidd (Hacker)
local function toggleK00pkidd(button)
    if not isK00pkiddLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-k00pkidd-39401"))()
        isK00pkiddLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.9. g00byd0lan (Hacker)
local function toggleG00byd0lan(button)
    if not isG00byd0lanLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-g00byd0lan-gui-v1-37056"))()
        isG00byd0lanLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(150, 0, 255) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.10. Unix Backdoor (Best)
local function toggleUnixBackdoor(button)
    if not isUnixBackdoorLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-VoidWare-61179"))()
        isUnixBackdoorLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(85, 85, 255) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.11. Araba Uçurma Sc 
local function toggleCarFly(button)
    if not isCarFlyLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Vfly-script-by-me-11871"))()
        isCarFlyLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(100, 200, 150)
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.12. MM2 SC (OP) 
local function toggleMM2SC(button)
    if not isMM2SCLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YARHM-12403"))()
        isMM2SCLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(255, 50, 50) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.13. 99 Gece Sc(No Key🌐) 
local function toggle99NightsSC(button)
    if not is99NightsLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/99-Nights-in-the-Forest-Drip-client-in-florest-54121"))()
        is99NightsLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(0, 100, 0) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.14. Hexagon (Brookhaven) 
local function toggleHexagonHub(button)
    if not isHexagonLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Hexagon-Hub-OFFICIAL-60494"))()
        isHexagonLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(0, 150, 150)
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.15. Nytherune Hub (Op)
local function toggleNytheruneHub(button)
    if not isNytheruneLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Nytherune-Hub-58124"))()
        isNytheruneLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.16. Drip Client (Brookhaven op) 
local function toggleDripClient(button)
    if not isDripClientLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Drip-Client-51784"))()
        isDripClientLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(138, 43, 226) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.17. SAB SC (Kurd Hub)
local function toggleSabSc(button)
    if not isSabScLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Kurd-Hub-29484"))()
        isSabScLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(255, 170, 0) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.18. Brookhaven SC (Sander XY)
local function toggleBrookhavenSC(button)
    if not isBrookhavenLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))()
        isBrookhavenLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(85, 255, 0) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.19. Brookhaven OP 2 (FURIA HUB)
local function toggleBrookhaven2(button)
    if not isBrookhaven2Loaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-FURIA-HUB-47441"))()
        isBrookhaven2Loaded = true
        button.BackgroundColor3 = Color3.fromRGB(255, 105, 180) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.20. c00lkidd excutor.s
local function toggleCoolkiddExecutor(button)
    if not isCoolkiddLoaded then
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lkidd-executor-2025-61657"))()
        isCoolkiddLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(255, 20, 147) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.21. WESTTEAM-W (Ana Script)
local function toggleWestteamW(button)
    if not isWestteamWLoaded then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM.lua"))()
        isWestteamWLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(0, 200, 255) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end

-- 6.22. WESTTEAM-ADM-PANEL (Nihai Yönetim)
local function toggleAdmPanel(button)
    if not isAdmPanelLoaded then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BY-WEST-UNİVERSAL.lua"))()
        isAdmPanelLoaded = true
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
    else
        button.BackgroundColor3 = BUTTON_COLOR
    end
    refreshGUI()
end


-- ===========================================
-- 7. BUTON OLUŞTURUCU VE İLİŞKİLENDİRME
-- ===========================================

local function createButton(text, clickFunction, featureKey)
    local Button = Instance.new("TextButton")
    Button.Name = text:gsub(" ", "") .. "Button"
    Button.Size = UDim2.new(1, 0, 0, BUTTON_HEIGHT) 
    Button.BackgroundColor3 = BUTTON_COLOR
    Button.TextColor3 = TEXT_COLOR
    Button.Text = text -- İlk başta placeholder metin
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
    
    -- Dil yenilemesi için butonu ve anahtarını sakla
    if featureKey then
        allButtons[Button] = featureKey
    end

    return Button
end

-- Yeni: Boşluk oluşturucu
local function createSpacer(height)
    local Spacer = Instance.new("Frame")
    Spacer.Name = "Spacer" .. height
    Spacer.Size = UDim2.new(1, 0, 0, height) 
    Spacer.BackgroundTransparency = 1
    Spacer.BorderSizePixel = 0
    Spacer.Parent = ScrollingFrame
end

-- Dil butonu oluşturucu
local function createLangButton(text, langCode)
    local Button = Instance.new("TextButton")
    Button.Name = langCode .. "LangButton"
    Button.Size = UDim2.new(0.32, 0, 0, BUTTON_HEIGHT) 
    Button.BackgroundColor3 = BUTTON_COLOR
    Button.TextColor3 = TEXT_COLOR
    Button.Text = text
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 14
    Button.BorderSizePixel = 0
    Button.Parent = ScrollingFrame 

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        CurrentLanguage = langCode
        print("Dil " .. langCode .. " olarak ayarlandı.")
        refreshGUI()
        -- Tüm dil butonlarının rengini sıfırla, aktif olanı vurgula
        for _, child in ipairs(ScrollingFrame:GetChildren()) do
            if string.find(child.Name, "LangButton") then
                child.BackgroundColor3 = BUTTON_COLOR
            end
        end
        Button.BackgroundColor3 = ACCENT_COLOR 
    end)

    return Button
end

-- ===========================================
-- 8. ÖZELLİKLERİ PANELE EKLEME (NİHAİ LİSTE)
-- ===========================================

-- Dil Seçenekleri (İlk Elementler)
local LangFrame = Instance.new("Frame")
LangFrame.Size = UDim2.new(1, 0, 0, BUTTON_HEIGHT)
LangFrame.BackgroundTransparency = 1
LangFrame.Parent = ScrollingFrame

local LangLayout = Instance.new("UIListLayout")
LangLayout.FillDirection = Enum.FillDirection.Horizontal
LangLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
LangLayout.Padding = UDim.new(0, 5) 
LangLayout.Parent = LangFrame

createLangButton("ENGLISH", "EN").Parent = LangFrame
createLangButton("TÜRKÇE", "TR").Parent = LangFrame
createLangButton("عربي", "AR").Parent = LangFrame

-- Dahili Özellikler (13 Adet)
createButton(getTranslation("AntiAFK"), toggleAntiAfk, "AntiAFK")
createButton(getTranslation("NoClip"), toggleNoClip, "NoClip") 
createButton(getTranslation("InfiniteJump"), toggleInfiniteJump, "InfiniteJump")
createButton(getTranslation("AntiFreeze"), toggleAntiFreeze, "AntiFreeze")
createButton(getTranslation("AimBot"), toggleAimBot, "AimBot")
createButton(getTranslation("ESP"), toggleESP, "ESP")
createButton(getTranslation("FreezeAll"), toggleFreezeAll, "FreezeAll")
createButton(getTranslation("Float"), toggleFloat, "Float")
createButton(getTranslation("AnimGlitch"), toggleAnimationGlitch, "AnimGlitch")
createButton(getTranslation("KillAura"), toggleKillAura, "KillAura")
createButton(getTranslation("WalkSpeed"), toggleWalkSpeed100, "WalkSpeed") 
createButton(getTranslation("FullBright"), toggleFullBright, "FullBright") 
createButton(getTranslation("FOV"), toggleFOV, "FOV") 

-- Harici Araçlar (22 Adet)
createButton(getTranslation("FlyGUI"), toggleLoadFlyGUI, "FlyGUI")
createButton(getTranslation("PlayTime"), togglePlayTime, "PlayTime")

-- KRİTİK GELİŞTİRİCİ ARACI
createButton(getTranslation("Dex"), toggleDex, "Dex") 
createButton(getTranslation("Brainrot"), toggleBrainrot, "Brainrot")

-- Backdoor & Hacking Tools Grubu
createButton(getTranslation("Scanner"), toggleBackdoorScanner, "Scanner")
createButton(getTranslation("LalolHub"), toggleLalolHub, "LalolHub") 
createButton(getTranslation("TigerX"), toggleTigerX, "TigerX") 
createButton(getTranslation("K00pkidd"), toggleK00pkidd, "K00pkidd")
createButton(getTranslation("G00byd0lan"), toggleG00byd0lan, "G00byd0lan") 
createButton(getTranslation("Unix"), toggleUnixBackdoor, "Unix") 
createButton(getTranslation("CarFly"), toggleCarFly, "CarFly") 
createButton(getTranslation("MM2SC"), toggleMM2SC, "MM2SC") 
createButton(getTranslation("Nights99"), toggle99NightsSC, "Nights99") 

-- Özel Spacer (50 Piksel Boşluk)
createSpacer(SPACER_HEIGHT_SMALL) 

-- Brookhaven Hub'ları
createButton(getTranslation("DripClient"), toggleDripClient, "DripClient") 
createButton(getTranslation("Hexagon"), toggleHexagonHub, "Hexagon") 
createButton(getTranslation("Nytherune"), toggleNytheruneHub, "Nytherune") 
createButton(getTranslation("SABSC"), toggleSabSc, "SABSC") 
createButton(getTranslation("Brookhaven1"), toggleBrookhavenSC, "Brookhaven1")
createButton(getTranslation("Brookhaven2"), toggleBrookhaven2, "Brookhaven2") 

-- Diğer Harici Araçlar
createButton(getTranslation("Coolkidd"), toggleCoolkiddExecutor, "Coolkidd") 

-- Özel Spacer (150 Piksel Boşluk - Ana Hub'lardan önce)
createSpacer(SPACER_HEIGHT_LARGE) 

-- Ana WESTTEAM Hub'ları (2 Adet)
createButton(getTranslation("WESTTEAMW"), toggleWestteamW, "WESTTEAMW")
createButton(getTranslation("ADM"), toggleAdmPanel, "ADM")

-- Başlangıçta GUI'yi varsayılan dil (TR) ile yenile
refreshGUI()

-- Varsayılan dil butonu rengini ayarla
for _, child in ipairs(LangFrame:GetChildren()) do
    if child.Name == "TRLangButton" then
        child.BackgroundColor3 = ACCENT_COLOR 
    end
end

print("OP W WESTTEAM GUI: 35 özellik, geliştirilmiş NoClip ve TR/EN/AR dil desteği ile güncellendi!")

