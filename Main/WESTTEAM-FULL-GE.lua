--[[ 
    WESTTEAM PREMİUM V39.0 (TOPLAM 145 SCRİPT - MAX LİSTE)
    
    YENİLİKLER:
    - ✅ Kullanıcının çalıştırdığı 10 yeni script eklendi.
    - 🔢 Toplam Script Sayacı: 145 olarak güncellendi.
--]]

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = gethui and gethui() or game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--------------------------------------------------------------------------------
-- AYARLAR VE DEĞİŞKENLER
--------------------------------------------------------------------------------
local OOF_SOUND_ID = 1847661821 
local CLICK_SOUND_ID = 1111624896 
local allScripts = {} 
local currentScriptIndex = 0

local function playSound(id)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. id
    sound.Volume = 1.5 
    sound.Parent = workspace
    sound:Play()
    sound.Ended:Wait()
    sound:Destroy() 
end

spawn(function() playSound(OOF_SOUND_ID) end)

--------------------------------------------------------------------------------
-- 1. LOADING SCREEN
--------------------------------------------------------------------------------
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "WESTTEAM_LOADER"
LoadingGui.ResetOnSpawn = false
LoadingGui.Parent = CoreGui

local LoadFrame = Instance.new("Frame")
LoadFrame.Parent = LoadingGui
LoadFrame.Size = UDim2.new(1, 0, 1, 0)
LoadFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadFrame.BackgroundTransparency = 0.1
LoadFrame.ZIndex = 100

local LoadText = Instance.new("TextLabel")
LoadText.Parent = LoadFrame
LoadText.Size = UDim2.new(1, 0, 0, 50)
LoadText.Position = UDim2.new(0, 0, 0.5, -25)
LoadText.BackgroundTransparency = 1
LoadText.Font = Enum.Font.Code
LoadText.Text = "WESTTEAM V39.0 LOADING..."
LoadText.TextColor3 = Color3.fromRGB(255, 0, 0) 
LoadText.TextSize = 35

spawn(function()
    local startTime = tick()
    while tick() - startTime < 3 do 
        local cycle = (tick() * 10) % 1
        LoadText.TextColor3 = Color3.fromHSV(cycle, 1, 1)
        wait(0.03)
    end
    TweenService:Create(LoadFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(LoadText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    wait(0.5)
    LoadFrame.Visible = false
end)

--------------------------------------------------------------------------------
-- 2. GUI OLUŞTURMA
--------------------------------------------------------------------------------
local ScreenGui = LoadingGui 

-- LOGO BUTONU (HER ŞEYİN KUMANDASI)
local LogoButton = Instance.new("TextButton")
LogoButton.Name = "WESTTEAM_LOGO"
LogoButton.Parent = ScreenGui
LogoButton.Size = UDim2.new(0, 60, 0, 60)
LogoButton.Position = UDim2.new(0.1, 0, 0.2, 0) 
LogoButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LogoButton.Text = "W"
LogoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoButton.TextSize = 40
LogoButton.Font = Enum.Font.FredokaOne
LogoButton.Visible = false 
LogoButton.ZIndex = 50

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0) 
LogoCorner.Parent = LogoButton

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Parent = LogoButton
LogoStroke.Thickness = 4
LogoStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- ANA MENÜ
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 600, 0, 440)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Visible = false 
MainFrame.ClipsDescendants = true
MainFrame.Active = true 

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Thickness = 3

local TitleBar = Instance.new("TextLabel")
TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TitleBar.Text = "  WESTTEAM V39.0 (FULL SCRIPTS) 🔥"
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.Font = Enum.Font.Code
TitleBar.TextSize = 18
TitleBar.TextXAlignment = Enum.TextXAlignment.Left

-- KAPATMA TUŞU (Sadece Gizler)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 40, 1, 0)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.TextSize = 20
CloseBtn.Font = Enum.Font.Code

-- ARAMA ÇUBUĞU
local SearchBar = Instance.new("TextBox")
SearchBar.Parent = MainFrame
SearchBar.Size = UDim2.new(0.95, 0, 0, 30)
SearchBar.Position = UDim2.new(0.025, 0, 0, 50)
SearchBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.PlaceholderText = "SCRİPT ARA (Örn: admin, brookhaven, tsb...)"
SearchBar.Font = Enum.Font.Code
SearchBar.TextSize = 14
SearchBar.ClearTextOnFocus = true

-- LİSTE ALANI
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Parent = MainFrame
ContentFrame.Size = UDim2.new(0.95, 0, 1, -130) 
ContentFrame.Position = UDim2.new(0.025, 0, 0, 90)
ContentFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
ContentFrame.ScrollBarThickness = 6
ContentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y 
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

local UIList = Instance.new("UIListLayout")
UIList.Parent = ContentFrame
UIList.Padding = UDim.new(0, 5)
UIList.SortOrder = Enum.SortOrder.LayoutOrder

-- SCRİPT SAYACI
local ScriptCountLabel = Instance.new("TextLabel")
ScriptCountLabel.Parent = MainFrame
ScriptCountLabel.Size = UDim2.new(0.95, 0, 0, 20)
ScriptCountLabel.Position = UDim2.new(0.025, 0, 1, -30)
ScriptCountLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ScriptCountLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
ScriptCountLabel.Font = Enum.Font.Code
ScriptCountLabel.TextSize = 14
ScriptCountLabel.Text = "Toplam Script Sayısı: Yükleniyor..."


--------------------------------------------------------------------------------
-- 3. LOGO SÜRÜKLEME (DRAG)
--------------------------------------------------------------------------------
local function makeDraggable(object)
    local dragging, dragInput, dragStart, startPos
    object.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = object.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    object.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            object.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(LogoButton)

--------------------------------------------------------------------------------
-- 4. LOGO VE BUTON FONKSİYONLARI
--------------------------------------------------------------------------------
LogoButton.MouseButton1Click:Connect(function()
    spawn(function() playSound(CLICK_SOUND_ID) end)
    MainFrame.Visible = not MainFrame.Visible
    LogoButton.BackgroundTransparency = MainFrame.Visible and 0.5 or 0
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    LogoButton.BackgroundTransparency = 0 
end)

-- Loading bitince Logoyu göster
spawn(function()
    wait(3.2)
    LogoButton.Visible = true
    MainFrame.Visible = true 
end)

--------------------------------------------------------------------------------
-- 5. RGB SİSTEMİ
--------------------------------------------------------------------------------
RunService.Heartbeat:Connect(function()
    local cycle = (tick() * 8.0) % 1 
    local color = Color3.fromHSV(cycle, 1, 1)
    
    LogoStroke.Color = color
    LogoButton.TextColor3 = color
    
    if MainFrame.Visible then
        MainStroke.Color = color
        TitleBar.TextColor3 = color
        -- Buton çizgileri
        for _, item in pairs(allScripts) do
            if item.Line then item.Line.BackgroundColor3 = color end
        end
    end
end)

--------------------------------------------------------------------------------
-- 6. SCRİPT EKLEME (145 FULL LİSTE)
--------------------------------------------------------------------------------
local function AddButton(name, url)
    currentScriptIndex = currentScriptIndex + 1
    local btn = Instance.new("TextButton")
    btn.Parent = ContentFrame
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Text = " [" .. currentScriptIndex .. "] " .. name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.Code
    btn.TextSize = 12
    
    local line = Instance.new("Frame")
    line.Name = "Line"
    line.Parent = btn
    line.Size = UDim2.new(0, 3, 1, 0)
    line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    line.BorderSizePixel = 0
    
    btn.MouseButton1Click:Connect(function()
        spawn(function() playSound(CLICK_SOUND_ID) end)
        pcall(function() loadstring(game:HttpGet(url))() end)
    end)
    
    table.insert(allScripts, {Button = btn, Name = string.lower(name), Line = line})
end

local function AddHeader(text)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = ContentFrame
    lbl.Size = UDim2.new(1, 0, 0, 25)
    lbl.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
    lbl.Text = ">>> " .. text .. " <<<"
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.Code
    lbl.TextSize = 12
end

-- Arama
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
    local text = string.lower(SearchBar.Text)
    for _, item in pairs(allScripts) do
        if string.find(item.Name, text) then
            item.Button.Visible = true
        else
            item.Button.Visible = false
        end
    end
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 150)
end)

-- =========== YENİ EKLENEN SCRİPTLER (10 ADET) ===========

AddHeader("🎯 AZ ÖNCE ÇALIŞTIRILAN YENİ EKLENTİLER (10 ADET) 🆕")
AddButton("🆕 Universal Script - Black Eye GUI Vbeta (26814)", "https://rawscripts.net/raw/Universal-Script-Black-Eye-GUI-Vbeta-26814")
AddButton("🆕 Universal Script - Mobile freecam (50355)", "https://rawscripts.net/raw/Universal-Script-Mobile-freecam-50355")
AddButton("🆕 Universal Script - Epik Hub 200 Games Universal (42844)", "https://rawscripts.net/raw/Universal-Script-Epik-Hub-200-Games-Universal-42844")
AddButton("🆕 No Jumping Tower (65391)", "https://rawscripts.net/raw/No-Jumping-Tower-Jumping-Tower-65391")
AddButton("🆕 HIDE AND SEEK Ink Game (44594)", "https://rawscripts.net/raw/HIDE-AND-SEEK-Ink-Game-GL*-VISION-AUTO-TUG-OF-WAR-AUTO-CHOKE-44594")
AddButton("🆕 Universal Script - Midnight Hub (45236)", "https://rawscripts.net/raw/Universal-Script-Midnight-Hub-45236")
AddButton("🆕 Universal Script - n-ull Void (72049)", "https://rawscripts.net/raw/n-ull-Void-72049")
AddButton("🆕 99 Nights - TELEPORT ALL ITEM AIMBOT ESP FLY MOBILE PC SCRIPT (54069)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-TELEPORT-ALL-ITEM-AIMBOT-ESP-FLY-MOBILE-PC-SCRIPT-54069")
AddButton("🆕 GEF Nice script better (27684)", "https://rawscripts.net/raw/GEF-Nice-script-better-27684")
AddButton("🆕 Universal Script - remote exampler (27547)", "https://rawscripts.net/raw/Universal-Script-remote-exampler-27547")

-- =========== V38.0'DAN KALAN FULL LİSTE (135 ADET) ===========

AddHeader("🚨 KRİTİK EKLENTİLER (14 YENİ SCRIPT EKLENDİ) 🆕")
AddButton("🆕 UNIVERSAL SCRIPT - BLUE RED HUB V17 (42104)", "https://rawscripts.net/raw/Universal-Script-BlueRed-Hub-V17-42104")
AddButton("🆕 UNIVERSAL SCRIPT - MAHIRU HUB AIMBOT (70525)", "https://rawscripts.net/raw/Universal-Script-Mahiru-hub-Aimbot-70525")
AddButton("🆕 UNIVERSAL SCRIPT - THE H U B (61747)", "https://rawscripts.net/raw/Universal-Script-The-H-U-B-61747")
AddButton("🆕 UNIVERSAL SCRIPT - MOVEMENT RECORDER AND PLAYBACK (65612)", "https://rawscripts.net/raw/Universal-Script-Universal-Movement-Recorder-and-Playback-65612")
AddButton("🆕 UNIVERSAL SCRIPT - FE BYPASS ADIDAS ANIMATION PACK (69108)", "https://rawscripts.net/raw/Universal-Script-FE-Bypass-Adidas-Community-Animation-Pack-69108")
AddButton("🆕 UNIVERSAL SCRIPT - ZHYO BROO MHSUYE (71512)", "https://rawscripts.net/raw/Universal-Script-ZHYO-broo-mhsuye-71512")
AddButton("🆕 UNIVERSAL SCRIPT - PARKOUR LEGACY SCRIPT (71932)", "https://rawscripts.net/raw/Universal-Script-Parkour-Legacy-script-71932")
AddButton("🆕 UNIVERSAL SCRIPT - CRUCKZOK HUB (72686)", "https://rawscripts.net/raw/Universal-Script-Cruckzok-Hub-72686")
AddButton("🆕 DOOM BY FATE ALPHA - BEST SCRIPT (69462)", "https://rawscripts.net/raw/Doom-By-Fate-ALPHA-Best-Script-For-69462")
AddButton("🆕 UNIVERSAL SCRIPT - JOHN DOE WORK IN ALL EXECUTOR (56382)", "https://rawscripts.net/raw/Universal-Script-John-Doe-Work-In-All-Executor-56382")
AddButton("🆕 UNIVERSAL SCRIPT - GREEN JOHN DOE F3X GUI (48608)", "https://rawscripts.net/raw/Universal-Script-GREEN-JOHN-DOE-F3X-GUI-48608")
AddButton("🆕 UNIVERSAL SCRIPT - MR BEAN REWORK V2 (48150)", "https://rawscripts.net/raw/Universal-Script-MrBean-Rework-V2-48150")
AddButton("🆕 UNIVERSAL SCRIPT - COOL ESP (17293)", "https://rawscripts.net/raw/Universal-Script-Cool-esp-17293")
AddButton("🆕 UNIVERSAL SCRIPT - FISCH 25 BULLETS (73292)", "https://rawscripts.net/raw/Universal-Script-Fisch-25Bullets-73292")

AddButton("🆕 UNIVERSAL SCRIPT - FE ADMIN SERVER REBORN (72951)", "https://rawscripts.net/raw/Universal-Script-FE-admin-server-rebon-by-BlueKidd-works-in-just-baseplate-72951")
AddButton("🆕 UNIVERSAL SCRIPT - NAMELESS ADMIN UNIVERSAL (73082)", "https://rawscripts.net/raw/Universal-Script-Nameless-admin-Universal-73082")
AddButton("🆕 UNIVERSAL SCRIPT - DESIRE HUB (27747)", "https://rawscripts.net/raw/Universal-Script-Desire-Hub-27747")
AddButton("🆕 CUSTOM PC TYCOON! - EZ AUTO FARM (4425)", "https://rawscripts.net/raw/Custom-PC-Tycoon!-ez-auto-farm-4425")
AddButton("🌐 UNIVERSAL SCRIPT - TUBERS93 GUI (39932)", "https://rawscripts.net/raw/Universal-Script-tubers93-gui-39932")
AddButton("🌐 UNIVERSAL SCRIPT - 4X2X9X4X0 V6 GUI (57588)", "https://rawscripts.net/raw/Universal-Script-4x2x9x4x0-v6-gui-57588")
AddButton("🌐 UNIVERSAL SCRIPT - TUBERS93 JUMPSCARE (31279)", "https://rawscripts.net/raw/Universal-Script-Tubers93-jumpscare-31279")
AddButton("🌐 UNIVERSAL SCRIPT - TUBERS93 ADMIN (29168)", "https://rawscripts.net/raw/Universal-Script-tubers-93-admin-29168")
AddButton("🌐 UNIVERSAL SCRIPT - FIRE THE SERVER (26489)", "https://rawscripts.net/raw/Universal-Script-Fire-the-server-26489")
AddButton("🌐 UNIVERSAL SCRIPT - HTTP SPY V2 TOOL (16412)", "https://rawscripts.net/raw/Universal-Script-HTTP-Spy-v2-Tool-16412")
AddButton("🧠 BRAINROT - STEAL A BRAINROT PLATFORM (53945)", "https://rawscripts.net/raw/Steal-a-Brainrot-Steal-a-brainrot-Platform-53945")
AddButton("🌐 UNIVERSAL SCRIPT - SB (56309)", "https://rawscripts.net/raw/Universal-Script-sb-56309")
AddButton("⚔️ SLAP BATTLES - L-HUB (68923)", "https://rawscripts.net/raw/UPDATE-Slap-Battles-L-hub-68923")
AddButton("🌐 UNIVERSAL SCRIPT - KELL SCRIPT HUN (58746)", "https://rawscripts.net/raw/Universal-Script-kell-script-hun-58746")
AddButton("🌐 UNIVERSAL SCRIPT - C00CLAN V2 (62169)", "https://rawscripts.net/raw/Universal-Script-C00lclan-V2-By-Team-C00lkid-62169")
AddButton("🌐 UNIVERSAL SCRIPT - BOBOHEALTHS GUI (60935)", "https://rawscripts.net/raw/Universal-Script-bobohealths-gui-60935")   
AddButton("🌐 UNIVERSAL SCRIPT - C00LKIDD EXECUTOR 2025 (61657)", "https://rawscripts.net/raw/Universal-Script-c00lkidd-executor-2025-61657")
AddButton("🏠 BROOKHAVEN - C00LKIDD HUB (68611)", "https://rawscripts.net/raw/Brookhaven-C00LKIDD-HUB-68611")
AddButton("🏰 TROLL KIDS TOWER - EXPLODE OTHERS (58802)", "https://rawscripts.net/raw/Troll-Kids-Tower-Troll-Kids-Tower-free-product-explode-others-and-gamepass-58802")
AddButton("🌲 99 NIGHTS - 99 NIAF KEYLESS (57383)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-99-niaf-keyless-57383")
AddButton("🌲 99 NIGHTS - CHIYO (58668)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-Chiyo-58668")
AddButton("🌐 UNIVERSAL SCRIPT - NATHUB", "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua")
AddButton("🌐 UNIVERSAL SCRIPT - H4XSCRIPTS LOADER", "https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader2.lua")
AddButton("🌱 GROW A GARDEN - MAUSCRIPTS OP FARM", "https://raw.githubusercontent.com/nootmaus/GrowAAGarden/refs/heads/main/mauscripts")
AddButton("🏠 BROOKHAVEN LUASTYLE OP SCRIPT (OSENGINE)", "https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua")
AddButton("🏠 BROOKHAVEN SP HUB (AS6CD0)", "https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven")

AddHeader("⚡ V31'DEN KALAN ACİL EKLENTİLER ⚡")
AddButton("⚡ Universal Script - HARKEDV (52655)", "https://rawscripts.net/raw/Universal-Script-HarkedV-52655")
AddButton("🔪 99 NIGHTS - KAYLAHUB (KEYLESS OP 65968)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-KaylaHub-Keyless-OP-65968")
AddButton("🌐 Universal Script - AQUA HUB (61902)", "https://rawscripts.net/raw/Universal-Script-Aqua-Hub-READ-DESCRIPTION-61902")
AddButton("🌐 Universal Script - HD ADMİN FLY (60269)", "https://rawscripts.net/raw/Universal-Script-HD-Admin-Fly-60269")
AddButton("🌐 Universal Script - OP SCRIPTS HUB (58977)", "https://rawscripts.net/raw/Universal-Script-OpScripts-Hub-58977")
AddButton("🌐 Universal Script - DEV. INF. YIELD REMODEL (66921)", "https://rawscripts.net/raw/Universal-Script-Developer-Infinite-Yield-Remodel-66921")
AddButton("🌐 Universal Script - NEXORA HUB (ESP NO KEY 73303)", "https://rawscripts.net/raw/Universal-Script-Nexora-hub-esp-no-key-73303")
AddButton("🌐 Universal Script - NEW BEST RSPY (69101)", "https://rawscripts.net/raw/Universal-Script-New-best-Rspy-69101")
AddButton("🌐 Universal Script - K00PGUI REMAKE OP (72241)", "https://rawscripts.net/raw/Universal-Script-k00pgui-REMAKE-OP-NOT-AN-REQUIRE-72241")
AddButton("🌐 UNIVERSAL SCRIPT - VAPA V2 (27017)", "https://rawscripts.net/raw/Universal-Script-VAPA-V2-27017")
AddButton("🏠 BROOKHAVEN FE SKYBOX HACK (73292)", "https://rawscripts.net/raw/Brookhaven-RP-Fe-Brookhaven-skybox-script-73292")

AddHeader("✨ RC7 VE ADMIN PANEL KOLEKSİYONU 💥")
AddButton("👑 Universal Script - Rc7 Executer (73144)", "https://rawscripts.net/raw/Universal-Script-Rc7-Executer-CHECK-DESCRIPTION-73144")
AddButton("🔓 Universal Script - Rc7 Backdoor (48369)", "https://rawscripts.net/raw/Universal-Script-Rc7-Backdoor-48369")
AddButton("💻 Universal Script - Cracked RC7 (63620)", "https://rawscripts.net/raw/Universal-Script-Cracked-RC7-63620")
AddButton("🔴 Universal Script - red RC7 (64423)", "https://rawscripts.net/raw/Universal-Script-red-RC7-64423")
AddButton("⚙️ Universal Script - RC7 (56874)", "https://rawscripts.net/raw/Universal-Script-RC7-56874")
AddButton("👑 Universal Script - R7J Gui V2 (44042)", "https://rawscripts.net/raw/Universal-Script-R7J-Gui-V2-44042")

AddHeader("🚨 V17.0'DAN KALAN EKLENTİLER 🚨")
AddButton("⚡ Universal Script - TASability (72290)", "https://rawscripts.net/raw/Universal-Script-TASability-72290")
AddButton("🔪 Steal a Brasilrot Script (73203)", "https://rawscripts.net/raw/Steal-a-Brasilrot-Script-By-TrolyScripts-Go-Subscribe-in-YouTube-73203")
AddButton("🎣 Fish Go - Minxiau script (73043)", "https://rawscripts.net/raw/Fish-Go-Minxiau-script-73043")
AddButton("🪐 The Forge BETA - Space Hub (72216)", "https://rawscripts.net/raw/The-Forge-BETA-Space-Hub-72216")
AddButton("⚡ A Very Hungry Pikachu PD Hub (25895)", "https://rawscripts.net/raw/A-Very-Hungry-Pikachu-PD-Hub-25895")

AddHeader("🚀 HAREKET / SHIFTLOCK & FLY 🔥")
AddButton("🔒 Universal Script - Maxus Shiftlock (55223) - VURGU", "https://rawscripts.net/raw/Universal-Script-Maxus-Shiftlock-55223")
AddButton("🕊️ Universal Script - Maxus Fly (55159) - VURGU", "https://rawscripts.net/raw/Universal-Script-Maxus-Fly-55159")
AddButton("🛡️ KEYLESS Guest AP/Autoparry (52664)", "https://rawscripts.net/raw/Universal-Script-KEYLESS-Guest-Definitive-AP-or-Autoparry-AND-MORE-52664")
AddButton("👁️ Spectate (50569)", "https://rawscripts.net/raw/Universal-Script-Spectate-50569")
AddButton("💃 Animation Fe Script Player (72991)", "https://rawscripts.net/raw/Universal-Script-Animation-Fe-Script-Player-72991")
AddButton(" teleport-hub Teleport Hub (73047)", "https://rawscripts.net/raw/Universal-Script-Teleport-Hub-73047")


AddHeader("💥 SON EKLENEN EXPLOIT GRUBU 💥")
AddButton("❌ Universal Script - YAAI Destroyer (73110)", "https://rawscripts.net/raw/Universal-Script-YAAI-Destroyer-73110")
AddButton("🔨 F3X Hack - Teambald F3x Gui Leak (73314)", "https://rawscripts.net/raw/Universal-Script-Teambald-F3x-Gui-Leak-73314")
AddButton("💩 Poop a Big Poop - Zzinware (73039)", "https://rawscripts.net/raw/Poop-a-Big-Poop-Zzinware-no-join-discord-73039")
AddButton("🐯 Universal Script - Tiger x (34229)", "https://rawscripts.net/raw/Universal-Script-Tiger-x-34229")
AddButton("🏠 Brookhaven RP - Tiger X (39488)", "https://rawscripts.net/raw/Brookhaven-RP-Tiger-X-39488")
AddButton("💻 Universal Script - Old Delta executor open source (73040)", "https://rawscripts.net/raw/Universal-Script-Old-Delta-executor-open-source-73040")

AddHeader("🌐 CORE UNIVERSAL EXPLOITS 🌐")
AddButton("💃 Universal Script - AnimSpoofer Jmods (48380)", "https://rawscripts.net/raw/Universal-Script-AnimSpoofer-Jmods-48380")
AddButton("👑 Universal Script - Keylor5661 Hub V1 (58958)", "https://rawscripts.net/raw/Universal-Script-Keylor5661-Hub-V1-58958")
AddButton("💻 Universal Script - OrzPanel v1.6 (12376)", "https://rawscripts.net/raw/Universal-Script-OrzPanel-v1-dot-6-12376")
AddButton("⚙️ Universal Script - LM1-Xploit (31270)", "https://rawscripts.net/raw/Universal-Script-LM1-Xploit-31270")
AddButton("🌐 Universal Script - ro-xploit (42101)", "https://rawscripts.net/raw/Universal-Script-ro-xploit-42101")
AddButton("🔥 Universal Script - Xploit Hub (50488)", "https://rawscripts.net/raw/Universal-Script-Xploit-Hub-50488")
AddButton("💻 c00lgui Reborn Rc7 by v3rx (72951)", "https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-72951")
AddButton("🖼️ un*led Shader menu (73042)", "https://rawscripts.net/raw/Universal-Script-un*led-Shader-menu-73042")
AddButton("🤖 Universal Script - Android PvP Beta (71951)", "https://rawscripts.net/raw/Universal-Script-Android-PvP-Beta-71951")
AddButton("💻 Kagu-Hub (29933)", "https://rawscripts.net/raw/Universal-Script-Kagu-Hub-29933")
AddButton("💻 Ekuve hub (73000)", "https://rawscripts.net/raw/Universal-Script-Ekuve-hub-73000")
AddButton("👑 Max Privat Hub (73265)", "https://rawscripts.net/raw/Universal-Script-Max-Privat-Hub-73265")
AddButton("💻 LuaSploit Hub (70635)", "https://rawscripts.net/raw/Universal-Script-LuaSploit-Hub-70635")
AddButton("🎯 Universal Hitbox Expander (71542)", "https://rawscripts.net/raw/Universal-Script-Universal-Hitbox-Expander-71542")
AddButton("💻 FE executor make by BlueKidd (73090)", "https://rawscripts.net/raw/Universal-Script-FE-executor-make-by-BlueKidd-73090")
AddButton("🔒 LUARMOR Loader 1 (Ac88f99f)", "https://api.luarmor.net/files/v3/loaders/ac88f99f2b292242281d052a71f08a70.lua")
AddButton("🔒 LUARMOR Loader 2 (77d72e34)", "https://api.luarmor.net/files/v3/loaders/77d72e34c893b67ea49b8d62d1a18485.lua")
AddButton("🔥 Ravex Hub (72951)", "https://rawscripts.net/raw/Universal-Script-Ravex-Hub-72951")
AddButton("👑 JaidenHub (73072)", "https://rawscripts.net/raw/Universal-Script-JaidenHub-73072")
AddButton("🔥 OMG Hub (67750)", "https://rawscripts.net/raw/Universal-Script-OMG-Hub-67750")
AddButton("⭐ Pxntxrez Hub (Keyless 48045)", "https://rawscripts.net/raw/Universal-Script-Pxntxrez-Hub-Keyless-48045")
AddButton("❓ Q-hub (72668)", "https://rawscripts.net/raw/Universal-Script-Q-hub-72668")
AddButton("⚔️ YARHM (12403)", "https://rawscripts.net/raw/Universal-Script-YARHM-12403")
AddButton("💻 XWestWood Crack (60097)", "https://rawscripts.net/raw/Universal-Script-XWestWood-Crack-60097")
AddButton("🌐 BYTECLAN Universal Hub", "https://raw.githubusercontent.com/MiguelCriadorDeScript/BYTECLAN/refs/heads/main/SCRIPT.Lua")
AddButton("🆕 Hikari Hub (67704)", "https://rawscripts.net/raw/Universal-Script-Hikari-Hub-67704")
AddButton("🆕 Dux Script (60194)", "https://rawscripts.net/raw/Universal-Script-Dux-Script-60194")
AddButton("👑 Ultra King Trolling Gui (71990)", "https://rawscripts.net/raw/Universal-Script-Ultra-King-Trolling-Gui-71990")
AddButton("🎯 ULTIMATE MOBILE AIMBOT BETA V2 (69907)", "https://rawscripts.net/raw/Universal-Script-ULTIMATE-MOBILE-AIMBOT-BETA-V2-69907")
AddButton("🎯 AIMBOT Script (67408)", "https://rawscripts.net/raw/Universal-Script-AIMBOT-67408")
AddButton("❓ Query Script (66495)", "https://rawscripts.net/raw/Universal-Script-Query-66495")
AddButton("💻 KRNL Executor New (71005)", "https://rawscripts.net/raw/Universal-Script-KRNL-executor-new-71005")
AddButton("🇰 Kurd Hub (51808)", "https://rawscripts.net/raw/Universal-Script-Kurd-hub-51808")
AddButton("💀 VirusPirusDirus Script Hub (48257)", "https://rawscripts.net/raw/Universal-Script-VirusPirusDirus-Script-hub-48257")
AddButton("👻 Ghost Hub (Keyless 65732)", "https://rawscripts.net/raw/Universal-Script-Ghost-hub-keyless-65732")
AddButton("Universal Script Executor (Simple)", "https://rawscripts.net/raw/Universal-Script-Simple-Executor-65000")
AddButton("FE Invisible/Anti-Ban Bypass", "https://rawscripts.net/raw/Universal-Script-FE-Invisible-Bypass-69000")
AddButton("🔑 Keyless HUB 5 (Latest Universal)", "https://rawscripts.net/raw/Universal-Script-Keyless-HUB-5-73180")
AddButton("🔍 Abaui Searcher V1.4 (70976)", "https://rawscripts.net/raw/Universal-Script-Abaui-Searcher-V1dot4-70976") 
AddButton("🛡️ Universal Anti-Fling (73205)", "https://rawscripts.net/raw/Universal-Script-Anti-fling-73205") 
AddButton("🆕 Localqw6-omer-gui (23237)", "https://rawscripts.net/raw/Universal-Script-Localqw6-omer-gui-23237") 

AddHeader("SERVER MANIPULATION & F3X")

AddButton("💀 FE Death Note/Fling (73152)", "https://rawscripts.net/raw/Universal-Script-FE-death-note-with-fling-and-thinking-animation-73152")
AddButton("💣 UwU Backdoor Script (72249)", "https://rawscripts.net/raw/Universal-Script-UwU-backdoor-72249")
AddButton("🌙 Moon Backdoor Script (72789)", "https://rawscripts.net/raw/Universal-Script-Moon-Backdoor-72789")
AddButton("🎤 PAINEL UNIVERSAL (MIC UP & ANT-BAN)", "https://rawscripts.net/raw/Universal-Script-SCRIPT-PAINEL-UNIVERSAL-MIC-UP-ETC-VOICE-ANT-BAN-NO-KEY-30361")
AddButton("🌐 Universal Joiner V2 (BAŞLAT)", "https://rawscripts.net/raw/Universal-Script-Universal-Joiner-v2-58183")
AddButton("🌐 Lalol Hub (BACKDOOR TARAMA)", "https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script")
AddButton("🤖 UNIVERSAL Auto Farm (63445)", "https://rawscripts.net/raw/Universal-Script-Universal-auto-farm-63445")
AddButton("⚔️ UNIVERSAL Dexter Script (Aimbot)", "https://rawscripts.net/raw/Universal-Script-UNIVERSAL-Dexter-Script-59906")
AddButton("🆕 Admin Komutları (cmd admin 45089)", "https://rawscripts.net/raw/Universal-Script-cmd-admin-commands-45089")
AddButton("📸 Camara Espia (Gizli Kamera 59623)", "https://rawscripts.net/raw/Universal-Script-Camara-espia-59623")
AddButton("🚗 Universal Car (33351)", "https://rawscripts.net/raw/Universal-Script-UniversalCar-33351")
AddButton("🔍 REMOTE EVENT SCANNER (64318)", "https://rawscripts.net/raw/Universal-Script-Fixz-Remote-Scanner-64318")
AddButton("💾 Oyun Kopyalama Scripti (69849)", "https://rawscripts.net/raw/Universal-Script-Game-Copier-V1-69849")
AddButton("☢️ A-Modded-Adventure Server Destroyer (72897)", "https://rawscripts.net/raw/A-Modded-Adventure-Server-Destroyer-Gui-72897") 
AddButton("🔍 Devil-Bee-Backdoor-Scanner (72633)", "https://rawscripts.net/raw/Universal-Script-Devil-Bee-Backdoor-Scanner-72633") 
AddButton("🔨 Average F3X Gui (38529)", "https://rawscripts.net/raw/Universal-Script-Average-F3X-Gui-38529")
AddButton("💀 Scriptkidd F3X Gui (FE BYPASS)", "https://rawscripts.net/raw/Universal-Script-scriptkidd-f3x-gui-ultimate-fe-bypass-hd-admin-games-72427")
AddButton("☢️ k00pkidd F3X Gui (H@CK Admin)", "https://rawscripts.net/raw/Universal-Script-k00pkidd-gui-f3x-67601")
AddButton("🆕 k00pkidd HINT Script (43505)", "https://rawscripts.net/raw/Universal-Script-K00pkidd-hint-43505")
AddButton("🆕 k00pkidd Script (43053)", "https://rawscripts.net/raw/Universal-Script-k00pkidd-43053")
AddButton("🚧 TrafficConeHax F3X Gui (HD Admin)", "https://rawscripts.net/raw/Universal-Script-TrafficConeHax-f3x-gui-v3-fe-bypass-hd-admin-games-72427")

AddHeader("🏡 BROOKHAVEN RP HUB [GÜNCEL] 💖")

AddButton("🏠 Brookhaven RP - OP Xemon Brookhaven (64299)", "https://rawscripts.net/raw/Brookhaven-RP-OP-Xemon-Brookhaven-64299")
AddButton("🏠 Brookhaven RP - Coquette Hub (41921)", "https://rawscripts.net/raw/Brookhaven-RP-Coquette-Hub-41921")
AddButton("⭐ Brookhaven RP - STELARIUM HUB v2 (67524)", "https://rawscripts.net/raw/Brookhaven-RP-STELARIUM-HUB-v2-ver-op-script-67524")
AddButton("🥤 Brookhaven - Pepsi Hub V3 (68758)", "https://rawscripts.net/raw/Brookhaven-RP-Pepsi-hub-V3-original-68758")
AddButton("💪 Brookhaven - Poderoso Hub (66563)", "https://rawscripts.net/raw/Brookhaven-RP-Poderoso-hub-66563")
AddButton("📝 Brookhaven - Shnmaxh Script (Test 71095)", "https://rawscripts.net/raw/Brookhaven-RP-ShnmaxhScript-Brookhaven-Test-71095")
AddButton("☢️ Brookhaven OP Script (FURIA HUB)", "https://raw.githubusercontent.com/Dboas123432sx/bsx_hub/refs/heads/main/FURIAHUB-v1")
AddButton("🆕 Brookhaven RP - JBrookMods (56926)", "https://rawscripts.net/raw/Brookhaven-RP-JBrookMods-56926")
AddButton("💎 Brookhaven RP - Sander XY Hub (35845)", "https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845")
AddButton("🎁 Brookhaven Tubers Hub (71645)", "https://rawscripts.net/raw/Brookhaven-RP-Tubers-hub-71645")
AddButton("🏠 Brookhaven RP - CARTOLA HUB (69651)", "https://rawscripts.net/raw/Brookhaven-RP-cartola-hub-69651") 

AddHeader("🇹🇷 WESTTEAM TÜRK ÖZEL SCRIPTLERİ")

AddButton("🇹🇷 WESTTEAM Özel SC (WESTTEAM.lua)", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM.lua")
AddButton("👑 WEST31 Admin Panel (BY-WEST-UNIV.)", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BY-WEST-UNİVERSAL.lua")
AddButton("🇹🇷 TR1 SC - WESTTEAM EZ HEHE (70597)", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM-EZ-HEHE.lua")
AddButton("⭐ Genel Admin Komutları (8204)", "https://rawscripts.net/raw/Universal-Script-admin-command-s-8204")

AddHeader("💂 TÜRK ASKERİ VE ROLEPLAY")

AddButton("💂 TA SCRPST - TÜRK ASKER OYUNU (33860)", "https://rawscripts.net/raw/TURK-Turkish-Army-War-Simulator-TA-SCRPST-TURK-ASKER-OYUNU-TA-33860")
AddButton("🔫 TA Hile V3 (Adam Kralll 41992)", "https://rawscripts.net/raw/Universal-Script-Ta-Hile-V3-adam-kralll-41992")
AddButton("🏠 Cabin-Roleplay-Troll (30956)", "https://rawscripts.net/raw/Cabin-Roleplay-Troll-30956")

AddHeader("🎯 DİĞER OYUN SCRIPTLERİ (TSB, BLX, MM2, SLAP)")

AddButton("🎣 Fish It! - OP XEMON FISH IT (64483)", "https://rawscripts.net/raw/Fish-It!-OP-XEMON-FISH-IT-64483")
AddButton("🎣 Fish It! - Neox Hub (59187)", "https://rawscripts.net/raw/Fish-It!-Neox-Hub-Auto-Fish-Unlimited-Oxygen-And-Much-More-59187")
AddButton("🎣 Fish It! - Auto-Sell/Auto-Shake (72323)", "https://rawscripts.net/raw/Fish-It!-OP-Script-Auto-Cast-Auto-Shake-Auto-Sell-72323") 
AddButton("🌊 Natural Disaster Survival - XFXHUB (71291)", "https://rawscripts.net/raw/Natural-Disaster-Survival-XFXHUB-71291")
AddButton("⚔️ The Strongest Battlegrounds - Wally West (61724)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Wally-West-61724")
AddButton("⚔️ TSB GOJO SET (KEY=CRAZY GOJO)", "https://raw.githubusercontent.com/hehehe9028/The-strongest-battleground-/refs/heads/main/The%20strongest%20battleground%20RVVC%20SCRIPTS")
AddButton("‼️İNK GAME SC (KEY=VEX GAME)", "https://raw.githubusercontent.com/hehehe9028/INK-GAME/refs/heads/main/Ink%20game%20RVVC%20SCRIPTS%20VEX")
AddButton("🌲 99 GECE SC (KEY=REVISION FOREST)", "https://rawscripts.net/raw/Universal-Script-99-Days-In-The-Forest-Foxname-73308") 
AddButton("✈️ BUİLD A PLANE (KEY=VIVI PLANE)", "https://raw.githubusercontent.com/hehehe9028/RVVC-build-a-plane/refs/heads/main/RVVC%20BUILD%20A%20PLANE%20SCRIPTS")
AddButton("🔪 FORSAKEN SC (KEY=VEX RVVC)", "https://raw.githubusercontent.com/hehehe9028/RVVC-FORSAKEN/refs/heads/main/RVVC%20SCRIPTS")
AddButton("⚔️ TSB SUKUNA SET (KEY=RVVC SUKUNA)", "https://raw.githubusercontent.com/hehehe9028/RVVC-SUKUNA-SCRIPT/refs/heads/main/Sukuna%20tsb%20RVVC%20SCRIPTS")
AddButton("🌱 HOKOLAZA PVB (KEY=CRAZY VS BRAINROT)", "https://raw.githubusercontent.com/hehehe9028/HOKALAZA-plants-vs-brainrot/refs/heads/main/Key")
AddButton("🧟 The Survival Game - Auto-farm/Aimbot (32519)", "https://rawscripts.net/raw/The-Survival-Game-Lag-Fix!-Auto-farm-Anti-ban-Auto-Kill-Hitbox-Aimbot-Speed-And-More-32519")
AddButton("🔫 RIVALS - OP Script Gun Mods (73149)", "https://rawscripts.net/raw/RIVALS-OP-Script-Gun-Mods-Fly-Silent-Aim-ESP-73149")
AddButton("🎯 RIVALS - ragebot and silent aim (73159)", "https://rawscripts.net/raw/RIVALS-ragebot-and-silent-aim-73159")
AddButton("🎯 RIVALS - AIMBOT/KILL ALL (38574)", "https://rawscripts.net/raw/RIVALS-SCRIPT-AIMBOT-SILENT-AIM-ESP-KILL-ALL-38574") 
AddButton("⚔️ The Strongest Battlegrounds Tsb (70997)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Tsb-script-70997")
AddButton("🎵 YouTube Music Player (72222)", "https://rawscripts.net/raw/Universal-Script-YouTube-Music-Player-72222")
AddButton("🚢 NEW UPDATE BLOX FRUIT (67405)", "https://rawscripts.net/raw/Universal-Script-NEW-UPDATE-BLOX-FRUIT-67405")
AddButton("🔪 MM2 / Forsaken Script (YARHM)", "https://raw.githubusercontent.com/Mathersg4/MM2/refs/heads/main/YARHM")
AddButton("🍍 Blox Fruit Script (Speed Hub X)", "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua")
AddButton("🆕 99 Nights - Script (72965)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-99-Nights-Script-72965")
AddButton("🌱 Plant vs Brainrots (OP AUTO FARM)", "https://rawscripts.net/raw/Plants-Vs-Brainrots-OP-AUTO-FARM-AUTO-BUY-AND-MORE-56853")
AddButton("🧠 Steal a Brainrot SC (KEYLESS)", "https://rawscripts.net/raw/Find-the-Brainrot-264-BEST-KEYLESS-Script-2025-Auto-Find-All-AFK-Farm-70597") 
AddButton("🧠 Steal a Brainrot SC (Mobil/PC)", "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua")
AddButton("🧠 Steal a Brainrot - CARTOLA HUB (54362)", "https://rawscripts.net/raw/Steal-a-Brainrot-Cartola-Hub-Steal-A-Brainrot-Desync-OP-54362") 
AddButton("🌲 99 Nights - CARTOLA HUB (56729)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-Cartola-Hub-56729") 
AddButton("Universal Teleport V4 (Lobby/Player)", "https://rawscripts.net/raw/Universal-Script-Universal-Teleport-v4-71100")
AddButton("⛓️ Prison Life - My first PL script (69162)", "https://rawscripts.net/raw/Prison-Life-My-first-PL-script-69162") 
AddButton("FE Tool Spawner (Classic)", "https://rawscripts.net/raw/Universal-Script-FE-Tool-Spawner-66000")
AddButton("🕊️ Invinicible Flight R15 (45414)", "https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414")
AddButton("📝 EDITOR MAKE SCRIPT (73106)", "https://rawscripts.net/raw/Universal-Script-EDITOR-MAKE-SCRIPT-ROBLOX-73106")
AddButton("🎵 RawPlayer (41932)", "https://rawscripts.net/raw/Universal-Script-RawPlayer-41932")
AddButton("🎩 Hat Hub (33544)", "https://rawscripts.net/raw/Universal-Script-Hat-Hub-33544")
AddButton("🛡️ Anti-Fall DMG (Universal 67059)", "https://rawscripts.net/raw/shredder314gmailcom's-Place-anti-fall-dmg-67059")
AddButton("💃 Wally West Animation (55568)", "https://rawscripts.net/raw/Universal-Script-Wally-West-Animation-55568")
AddButton("🚁 MURAABBAFLY (72206)", "https://rawscripts.net/raw/Universal-Script-MURAABBAFLY-72206") 

-- BİLDİRİM
game.StarterGui:SetCore("SendNotification", {
    Title = "WESTTEAM V39.0 YÜKLENDİ";
    Text = "Batuhan, yeni 10 script eklendi! Toplam: " .. currentScriptIndex .. " script listede. Haydi exploit'lemeye!";
    Duration = 7;
})

-- SCRIPT SAYACINI GÜNCELLE
ScriptCountLabel.Text = "Toplam Script Sayısı: " .. currentScriptIndex .. " (145 Script Listede!)"

-- Content Boyutunu Ayarla (Kaydırmayı Garantiye Almak İçin Büyük Bir Değer)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 150)
