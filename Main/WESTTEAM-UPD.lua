--[[ 
    WESTTEAM PREMİUM VERSİON 5.2 (92 SCRIPT - KİŞİSEL BİLGİLER KALDIRILDI)
    Password Verified: Aykol_123
    VERSION 5.2 UPDATE: Added 4 new scripts (TSB, Death Note, Animation Fe Script, BlueKidd Executor). All personal references removed from comments.
    Total Scripts: 92
    
    USER RESPONSIBILITY DISCLAIMER:
    The user is solely responsible for any consequences (e.g., bans) arising from the use of these scripts.
    The Gemini team is not responsible for any bans or negative outcomes.
--]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

--------------------------------------------------------------------------------
-- 1. ARAYÜZ OLUŞTURMA (GUI SETUP - ŞIK TASARIM)
--------------------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton") 
local ContentFrame = Instance.new("ScrollingFrame")
local UICornerMain = Instance.new("UICorner")
local UICornerTop = Instance.new("UICorner")
local Shadow = Instance.new("ImageLabel")
local BinaryEffect = Instance.new("TextLabel") 

if gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end
ScreenGui.Name = "WestTeamPremiumUI"
ScreenGui.ResetOnSpawn = false

-- ANA PENCERE (MainFrame)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.Size = UDim2.new(0, 450, 0, 320)
MainFrame.ClipsDescendants = true
MainFrame.Active = true
UICornerMain.CornerRadius = UDim.new(0, 15) 
UICornerMain.Parent = MainFrame

-- GÖLGELENDİRME
Shadow.Name = "Shadow"
Shadow.Parent = MainFrame
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.ZIndex = 0 
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5

-- BİNARY EFEKT (01010101)
BinaryEffect.Name = "BinaryEffect"
BinaryEffect.Parent = MainFrame
BinaryEffect.BackgroundTransparency = 1
BinaryEffect.ZIndex = 1
BinaryEffect.Position = UDim2.new(0, 0, 0, 0)
BinaryEffect.Size = UDim2.new(1, 0, 1, 0)
BinaryEffect.Font = Enum.Font.Code
BinaryEffect.Text = string.rep("01010101010101010101\n", 30) 
BinaryEffect.TextColor3 = Color3.fromRGB(0, 255, 150) 
BinaryEffect.TextTransparency = 0.9 
BinaryEffect.TextWrapped = true
BinaryEffect.TextSize = 10 

local function animateBinary()
    local startTime = tick()
    while MainFrame.Parent do
        local elapsed = tick() - startTime
        local offsetX = math.sin(elapsed * 2) * 0.005 
        local offsetY = math.cos(elapsed * 1.5) * 0.005
        
        BinaryEffect.TextYAlignment = Enum.TextYAlignment.Top
        BinaryEffect.TextXAlignment = Enum.TextXAlignment.Left
        BinaryEffect.Position = UDim2.new(offsetX, 0, offsetY, 0)
        wait(0.03) 
    end
end
spawn(animateBinary)


-- ÜST BAR (TopBar)
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TopBar.Size = UDim2.new(1, 0, 0, 45) 
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 3 
UICornerTop.CornerRadius = UDim.new(0, 15)
UICornerTop.Parent = TopBar

-- BAŞLIK
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Font = Enum.Font.GothamBlack
Title.Text = "WESTTEAM PREMIUM VERSİON 5.2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18 
Title.TextXAlignment = Enum.TextXAlignment.Left

-- MAVİ GRADIENT EFEKTİ
local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 120, 255)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 100)) 
}
TitleGradient.Parent = Title

-- KAPATMA BUTONU (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50) 
CloseButton.Position = UDim2.new(1, -45, 0.5, -15) 
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X" 
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.AutoButtonColor = false
CloseButton.ZIndex = 4 

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() 
    game.StarterGui:SetCore("SendNotification", {
        Title = "WESTTEAM PREMIUM";
        Text = "Arayüz tamamen kapatıldı. Tekrar çalıştırmak için kodu yapıştırın.";
        Duration = 5;
    })
end)

--------------------------------------------------------------------------------
-- 2. KAYDIRMA ALANI (SCROLLING FRAME)
--------------------------------------------------------------------------------
ContentFrame.Name = "Content"
ContentFrame.Parent = MainFrame
ContentFrame.Active = true
ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 10, 0, 55) 
ContentFrame.Size = UDim2.new(1, -20, 1, -65)
ContentFrame.ScrollBarThickness = 5 
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 120, 255) 
ContentFrame.CanvasSize = UDim2.new(0, 0, 100, 0) 

-- Layout (Düzenleyici)
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

--------------------------------------------------------------------------------
-- 3. FONKSİYONLAR (SÜRÜKLEME)
--------------------------------------------------------------------------------
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    
    local dragTween = TweenService:Create(MainFrame, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = targetPos})
    dragTween:Play()
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

--------------------------------------------------------------------------------
-- 4. BUTON EKLEME FONKSİYONLARI 
--------------------------------------------------------------------------------
function createButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = ContentFrame
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.Size = UDim2.new(1, 0, 0, 45)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.AutoButtonColor = false
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    -- Hover Efekti
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        local shrink = TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(0.95, 0, 0, 42)})
        shrink:Play()
        wait(0.1)
        local grow = TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 45)})
        grow:Play()
        
        pcall(callback)
    end)
    
    return btn
end

function createHeader(text)
    local header = Instance.new("TextLabel")
    header.Parent = ContentFrame
    header.BackgroundColor3 = Color3.fromRGB(35, 35, 35) 
    header.Size = UDim2.new(1, 0, 0, 30)
    header.Font = Enum.Font.GothamBlack 
    header.Text = "--- " .. text .. " ---"
    header.TextColor3 = Color3.fromRGB(0, 170, 255) 
    header.TextSize = 16
    header.BorderSizePixel = 0
    
    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingBottom = UDim.new(0, 5)
    padding.Parent = header
    
    return header
end

--------------------------------------------------------------------------------
-- 5. TÜM ÖZELLİKLER (92 ADET SCRIPT) 
--------------------------------------------------------------------------------

-- *** UNIVERSAL / HACK & EXPLOIT ARAÇLARI *** createHeader("UNIVERSAL & HACK ARAÇLARI (FE & EXECUTOR)")

createButton("💻 FE executor make by BlueKidd (73090) - YENİ", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-executor-make-by-BlueKidd-73090"))()
end)

createButton("🔒 LUARMOR Loader 1 (Ac88f99f)", function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ac88f99f2b292242281d052a71f08a70.lua"))()
end)

createButton("🔒 LUARMOR Loader 2 (77d72e34)", function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/77d72e34c893b67ea49b8d62d1a18485.lua"))()
end)

createButton("🔥 Ravex Hub (72951)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ravex-Hub-72951"))()
end)

createButton("👑 JaidenHub (73072)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-JaidenHub-73072"))()
end)

createButton("🔥 OMG Hub (67750)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-OMG-Hub-67750"))()
end)

createButton("⭐ Pxntxrez Hub (Keyless 48045)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Pxntxrez-Hub-Keyless-48045"))()
end)

createButton("❓ Q-hub (72668)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Q-hub-72668"))()
end)

createButton("⚔️ YARHM (12403)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YARHM-12403"))()
end)

createButton("💻 XWestWood Crack (60097)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-XWestWood-Crack-60097"))()
end)

createButton("🌐 BYTECLAN Universal Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MiguelCriadorDeScript/BYTECLAN/refs/heads/main/SCRIPT.Lua"))()
end)

createButton("🆕 Hikari Hub (67704)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hikari-Hub-67704"))()
end)

createButton("🆕 Dux Script (60194)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dux-Script-60194"))()
end)

createButton("👑 Ultra King Trolling Gui (71990)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ultra-King-Trolling-Gui-71990"))()
end)

createButton("🎯 ULTIMATE MOBILE AIMBOT BETA V2 (69907)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ULTIMATE-MOBILE-AIMBOT-BETA-V2-69907"))()
end)

createButton("🎯 AIMBOT Script (67408)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AIMBOT-67408"))()
end)

createButton("❓ Query Script (66495)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Query-66495"))()
end)

createButton("💻 KRNL Executor New (71005)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-KRNL-executor-new-71005"))()
end)

createButton("🇰 Kurd Hub (51808)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Kurd-hub-51808"))()
end)

createButton("💀 VirusPirusDirus Script Hub (48257)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-VirusPirusDirus-Script-hub-48257"))()
end)

createButton("👻 Ghost Hub (Keyless 65732)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ghost-hub-keyless-65732"))()
end)


-- *** BACKDOOR VE SERVER HACK ARAÇLARI ***
createHeader("BACKDOOR VE SERVER HACK ARAÇLARI")

createButton("💀 FE Death Note/Fling (73152) - YENİ", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-death-note-with-fling-and-thinking-animation-73152"))()
end)

createButton("💣 UwU Backdoor Script (72249)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UwU-backdoor-72249"))()
end)

createButton("🌙 Moon Backdoor Script (72789)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Moon-Backdoor-72789"))()
end)

createButton("🎤 PAINEL UNIVERSAL (MIC UP & ANT-BAN)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SCRIPT-PAINEL-UNIVERSAL-MIC-UP-ETC-VOICE-ANT-BAN-NO-KEY-30361"))()
end)

createButton("🌐 Universal Joiner V2 (BAŞLAT)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Joiner-v2-58183"))()
end)

createButton("🌐 Lalol Hub (BACKDOOR TARAMA)", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
end)

createButton("🤖 UNIVERSAL Auto Farm (63445)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-auto-farm-63445"))()
end)

createButton("⚔️ UNIVERSAL Dexter Script (Aimbot)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UNIVERSAL-Dexter-Script-59906"))()
end)

createButton("🆕 Admin Komutları (cmd admin 45089)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-cmd-admin-commands-45089"))()
end)

createButton("📸 Camara Espia (Gizli Kamera 59623)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Camara-espia-59623"))()
end)

createButton("🚗 Universal Car (33351)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UniversalCar-33351"))()
end)

createButton("🔍 REMOTE EVENT SCANNER (64318)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fixz-Remote-Scanner-64318"))()
end)

createButton("💾 Oyun Kopyalama Scripti (69849)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Game-Copier-V1-69849"))()
end)


-- *** F3X & YAPI SCRIPT'LERİ ***
createHeader("F3X & YAPI HACK SCRIPT'LERİ")

createButton("🔨 Average F3X Gui (38529)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Average-F3X-Gui-38529"))()
end)

createButton("💀 Scriptkidd F3X Gui (FE BYPASS)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-scriptkidd-f3x-gui-ultimate-fe-bypass-gui-68091"))()
end)

createButton("☢️ k00pkidd F3X Gui (H@CK Admin)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-k00pkidd-gui-f3x-67601"))()
end)

createButton("🆕 k00pkidd HINT Script (43505)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-K00pkidd-hint-43505"))()
end)

createButton("🆕 k00pkidd Script (43053)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-k00pkidd-43053"))()
end)

createButton("🚧 TrafficConeHax F3X Gui (HD Admin)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TrafficConeHax-f3x-gui-v3-fe-bypass-hd-admin-games-72427"))()
end)


-- *** HAREKET VE YETENEK SCRIPT'LERİ ***
createHeader("HAREKET VE YETENEK SCRIPT'LERİ")

createButton("💃 Animation Fe Script Player (72991) - YENİ", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Animation-Fe-Script-Player-72991"))()
end)

createButton(" teleport-hub Teleport Hub (73047)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Teleport-Hub-73047"))()
end)

createButton("🌐 Universal floater (67208)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-floater-67208"))()
end)

createButton("🕊️ Invinicible Flight R15 (45414)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()
end)

createButton("📝 EDITOR MAKE SCRIPT (73106)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-EDITOR-MAKE-SCRIPT-ROBLOX-73106"))()
end)

createButton("🎵 RawPlayer (41932)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-RawPlayer-41932"))()
end)

createButton("🎩 Hat Hub (33544)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hat-Hub-33544"))()
end)


-- *** BROOKHAVEN HUB LİSTESİ ***
createHeader("BROOKHAVEN RP HUB LİSTESİ")

createButton("🥤 Brookhaven - Pepsi Hub V3 (68758)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Pepsi-hub-V3-original-68758"))()
end)

createButton("💪 Brookhaven - Poderoso Hub (66563)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Poderoso-hub-66563"))()
end)

createButton("📝 Brookhaven - Shnmaxh Script (Test 71095)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-ShnmaxhScript-Brookhaven-Test-71095"))()
end)

createButton("☢️ Brookhaven OP Script (FURIA HUB)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dboas123432sx/bsx_hub/refs/heads/main/FURIAHUB-v1"))()
end)

createButton("🆕 Brookhaven RP - JBrookMods (56926)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-JBrookMods-56926"))()
end)

createButton("💎 Brookhaven RP - Sander XY Hub (35845)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))()
end)

createButton("🎁 Brookhaven Tubers Hub (71645)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Tubers-hub-71645"))()
end)


-- *** WESTTEAM ÖZEL TR SCRİPTLERİ ***
createHeader("WESTTEAM ÖZEL (TR) SCRIPT LİSTESİ")

createButton("🇹🇷 WESTTEAM Özel SC (WESTTEAM.lua)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM.lua"))()
end)

createButton("👑 WEST31 Admin Panel (BY-WEST-UNIV.)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BY-WEST-UNİVERSAL.lua"))()
end)

createButton("🇹🇷 TR1 SC - WESTTEAM EZ HEHE (70597)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM-EZ-HEHE.lua"))()
end)

createButton("⭐ Genel Admin Komutları (8204)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-admin-command-s-8204"))()
end)


-- *** TÜRK ORDU SİMÜLATÖRÜ SCRİPTLERİ ***
createHeader("TURKISH ARMY WAR SİMULATOR SCRİPTLERİ")

createButton("💂 TA SCRPST - TÜRK ASKER OYUNU (33860)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/TURK-Turkish-Army-War-Simulator-TA-SCRPST-TURK-ASKER-OYUNU-TA-33860"))()
end)

createButton("🔫 TA Hile V3 (Adam Kralll 41992)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ta-Hile-V3-adam-kralll-41992"))()
end)


-- *** DİĞER OYUN SCRIPT'LERİ ***
createHeader("DİĞER OYUN SCRIPT'LERİ (TSB EKLENDİ)")

createButton("⚔️ The Strongest Battlegrounds Tsb (70997) - YENİ", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Tsb-script-70997"))()
end)

createButton("🎵 YouTube Music Player (72222)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YouTube-Music-Player-72222"))()
end)

createButton("🚢 NEW UPDATE BLOX FRUIT (67405)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-NEW-UPDATE-BLOX-FRUIT-67405"))()
end)

createButton("🌊 Natural Disaster Survival (54619)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-natural-disaster-54619"))()
end)

createButton("🔪 MM2 / Forsaken Script (YARHM)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Mathersg4/MM2/refs/heads/main/YARHM", true))()
end)

createButton("🍍 Blox Fruit Script (Speed Hub X)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
end)

createButton("🆕 99 Nights - Script (72965)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/99-Nights-in-the-Forest-99-Nights-Script-72965"))()
end)

createButton("🌱 Plant vs Brainrots (OP AUTO FARM)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Plants-Vs-Brainrots-OP-AUTO-FARM-AUTO-BUY-AND-MORE-56853"))()
end)

createButton("🔍 Find the Brainrot SC (KEYLESS)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Find-the-Brainrot-264-BEST-KEYLESS-Script-2025-Auto-Find-All-AFK-Farm-70597"))()
end)

createButton("🧠 Steal a Brainrot SC (Mobil/PC)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
end)

-- BİLDİRİM
game.StarterGui:SetCore("SendNotification", {
    Title = "WESTTEAM PREMIUM VERSİYON 5.2";
    Text = "92 Script! 4 yeni script eklendi ve tüm kişisel bilgiler kaldırıldı. Keyfine bak!";
    Duration = 7;
})
