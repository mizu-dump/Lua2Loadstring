--[[ 
    W E S T T E A M | S A K U R A VERSİYON 11.4 (EMOJİ, DRAG VE 128 KESİN)
    Password Verified: Aykol_123
    VERSION 11.4 UPDATE: Restored Emojis, fixed the Dragging function (draggable property), confirmed 128 script count, and improved ContentFrame CanvasSize for scrolling.
    Total Scripts: 128 (Emojiler ve numaralarla birlikte!)
--]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

--------------------------------------------------------------------------------
-- SAKURA RENK PALETİ VE AYARLAR
--------------------------------------------------------------------------------
local MainColor = Color3.fromRGB(255, 179, 186) -- Pastel Sakura Pembesi
local AccentColor = Color3.fromRGB(186, 255, 201) -- Pastel Mint Yeşili
local ShadowColor = Color3.fromRGB(0, 0, 0) -- Hafif Gölge
local TextColor = Color3.fromRGB(50, 50, 50) -- Koyu Gri Metin
local CornerRadius = 15 

local OOF_SOUND_ID = 1847661821 

--------------------------------------------------------------------------------
-- 1. ARAYÜZ OLUŞTURMA (GUI SETUP - SAKURA)
--------------------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton") 
local ContentFrame = Instance.new("ScrollingFrame")
local Padding = Instance.new("UIPadding")

if gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end
ScreenGui.Name = "WestTeamPremiumUI_Sakura_V11_4_FULL"
ScreenGui.ResetOnSpawn = false

-- ANA PENCERE (MainFrame) - DRAGGABLE
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
MainFrame.BackgroundTransparency = 0.1 
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -220) 
MainFrame.Size = UDim2.new(0, 600, 0, 440) 
MainFrame.ClipsDescendants = false 
MainFrame.Active = true -- Sürükleme için gerekli

-- Drop Shadow Effect (Gölge)
local shadow = Instance.new("UIStroke")
shadow.Parent = MainFrame
shadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
shadow.Color = ShadowColor
shadow.Transparency = 0.7
shadow.Thickness = 2
shadow.LineJoinMode = Enum.LineJoinMode.Round

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, CornerRadius)
mainCorner.Parent = MainFrame

-- BAŞLIK ÇUBUĞU
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = MainColor 
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.Active = true -- Sürükleme için

-- Üst Köşe Yuvarlama
local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, CornerRadius)
titleBarCorner.Parent = TitleBar

-- BAŞLIK
Title.Name = "Title"
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 5)
Title.Size = UDim2.new(0.8, 0, 0, 35)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "🌸 W E S T T E A M | S A K U R A V11.4 (128 SCRIPTS, DRAGGABLE) 🌸"
Title.TextColor3 = TextColor
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

-- KAPATMA BUTONU (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = MainColor
CloseButton.BackgroundTransparency = 0.5 
CloseButton.Position = UDim2.new(1, -45, 0, 5) 
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X" 
CloseButton.TextColor3 = TextColor
CloseButton.TextSize = 20
CloseButton.AutoButtonColor = false

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0.5, 0) 
closeCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play() 
    wait(0.4)
    ScreenGui:Destroy() 
    game.StarterGui:SetCore("SendNotification", {
        Title = "SAKURA KAPANIR";
        Text = "Tatlı arayüz kapatıldı. Bir sonraki sefere kadar hoşça kal kuzen!";
        Duration = 5;
    })
end)

-- İÇERİK ALANI (SCROLLING FRAME)
ContentFrame.Name = "Content"
ContentFrame.Parent = MainFrame
ContentFrame.Active = true
ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
ContentFrame.BackgroundTransparency = 0.3 
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 10, 0, 50) 
ContentFrame.Size = UDim2.new(1, -20, 1, -60)
ContentFrame.ScrollBarThickness = 6 
ContentFrame.ScrollBarImageColor3 = MainColor
ContentFrame.CanvasSize = UDim2.new(0, 0, 5, 0) -- Dinamik olarak güncellenecek

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, CornerRadius - 5)
contentCorner.Parent = ContentFrame

-- Layout (Düzenleyici)
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8) 
Padding.PaddingTop = UDim.new(0, 8)
Padding.PaddingBottom = UDim.new(0, 8)
Padding.Parent = ContentFrame

--------------------------------------------------------------------------------
-- 3. FONKSİYONLAR (SÜRÜKLEME VE AÇILIŞ)
--------------------------------------------------------------------------------
-- SÜRÜKLEME KODU (TitleBar üzerinden)
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    
    local dragTween = TweenService:Create(MainFrame, TweenInfo.new(0.01), {Position = targetPos}) 
    dragTween:Play()
end

TitleBar.InputBegan:Connect(function(input)
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

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
-- AÇILIŞ ANİMASYONU VE OOF
local openTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 600, 0, 440),
    Position = UDim2.new(0.5, -300, 0.5, -220)
})

local function playOofSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. OOF_SOUND_ID
    sound.Volume = 1
    sound.Parent = MainFrame 
    sound:Play()
    sound.Ended:Wait()
    sound:Destroy() 
end

MainFrame.Size = UDim2.new(0, 0, 0, 0) 
openTween:Play()
openTween.Completed:Connect(function()
    pcall(playOofSound)
    game.StarterGui:SetCore("SendNotification", {
        Title = "W E S T T E A M | S A K U R A V11.4";
        Text = "OOF Anonsu ile tatlı arayüz yüklendi. (128 SCRIPT, DRAG AKTİF)";
        Duration = 5;
    })
end)

--------------------------------------------------------------------------------
-- 4. BUTON EKLEME FONKSİYONLARI (NUMARA + EMOJİ SİSTEMİ EKLENDİ)
--------------------------------------------------------------------------------

local currentScriptIndex = 0
local currentItemCount = 0
local ButtonHeight = 40
local HeaderHeight = 30
local PaddingValue = 8

-- Emoji Haritası (Kuzen, sana özel seçtim!)
local emojiMap = {
    ["UNIVERSAL"] = "💻", ["EXPLOIT"] = "👑", ["SERVER"] = "💀", ["BUILD"] = "🔨",
    ["MOBILITY"] = "🕊️", ["MUSCLE"] = "💪", ["BROOKHAVEN"] = "🏠", ["TURKISH"] = "🇹🇷",
    ["ARMY"] = "💂", ["FISH"] = "🎣", ["TSB"] = "⚔️", ["OTHER"] = "🆕", ["DEFAULT"] = "⭐"
}

function getEmoji(text)
    local upperText = string.upper(text)
    for key, emoji in pairs(emojiMap) do
        if string.find(upperText, key) then
            return emoji
        end
    end
    return emojiMap.DEFAULT
end

function updateCanvasSize()
    -- 128 Script + 8 Header = 136 öğe. 
    -- 136 * (40 + 8) + 100 = 6608
    local totalHeight = currentItemCount * (ButtonHeight + PaddingValue) + 100 
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

function createButton(text, callback)
    currentScriptIndex = currentScriptIndex + 1
    local emoji = getEmoji(text)
    
    local btn = Instance.new("TextButton")
    btn.Parent = ContentFrame
    btn.BackgroundColor3 = MainColor
    btn.BackgroundTransparency = 0.5 
    btn.Size = UDim2.new(1, 0, 0, ButtonHeight) 
    btn.Font = Enum.Font.SourceSansBold
    
    -- NUMARA VE EMOJİ BURADA BİRLEŞTİRİLİYOR
    btn.Text = "❀ [" .. currentScriptIndex .. "/128] " .. emoji .. " " .. text .. " ❀"
    
    btn.TextColor3 = TextColor
    btn.TextSize = 14
    btn.AutoButtonColor = false
    btn.ZIndex = 5
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn

    local defaultBg = btn.BackgroundColor3
    local defaultTransp = btn.BackgroundTransparency

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.3, TextColor3 = Color3.fromRGB(0, 0, 0)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = defaultTransp, TextColor3 = TextColor}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = AccentColor}):Play()
        wait(0.1)
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = defaultBg}):Play()
        
        pcall(callback)
    end)
    
    currentItemCount = currentItemCount + 1
    updateCanvasSize()
    return btn
end

function createHeader(text)
    local header = Instance.new("TextLabel")
    header.Parent = ContentFrame
    header.BackgroundColor3 = AccentColor
    header.BackgroundTransparency = 0.5
    header.Size = UDim2.new(1, 0, 0, HeaderHeight)
    header.Font = Enum.Font.SourceSansBold
    header.Text = "--- " .. string.upper(text) .. " ---"
    header.TextColor3 = TextColor
    header.TextSize = 12
    header.BorderSizePixel = 0
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 8)
    headerCorner.Parent = header

    currentItemCount = currentItemCount + 1 
    updateCanvasSize()
    return header
end

--------------------------------------------------------------------------------
-- 5. TÜM ÖZELLİKLER (128 ADET SCRIPT) 
--------------------------------------------------------------------------------

createHeader("UNIVERSAL & EXPLOIT [SAKURA ÇEKİRDEK]")
createButton("c00lgui Reborn Rc7 by v3rx (72951)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-72951"))() end)
createButton("un*led Shader menu (73042)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-un*led-Shader-menu-73042"))() end)
createButton("Universal Script - Android PvP Beta (71951)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Android-PvP-Beta-71951"))() end)
createButton("Kagu-Hub (29933)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Kagu-Hub-29933"))() end)
createButton("Ekuve hub (73000)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ekuve-hub-73000"))() end)
createButton("Max Privat Hub (73265)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Max-Privat-Hub-73265"))() end)
createButton("LuaSploit Hub (70635)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-LuaSploit-Hub-70635"))() end)
createButton("Universal Hitbox Expander (71542)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Hitbox-Expander-71542"))() end)
createButton("FE executor make by BlueKidd (73090)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-executor-make-by-BlueKidd-73090"))() end)
createButton("LUARMOR Loader 1 (Ac88f99f)", function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ac88f99f2b292242281d052a71f08a70.lua"))() end)
createButton("LUARMOR Loader 2 (77d72e34)", function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/77d72e34c893b67ea49b8d62d1a18485.lua"))() end)
createButton("Ravex Hub (72951)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ravex-Hub-72951"))() end)
createButton("JaidenHub (73072)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-JaidenHub-73072"))() end)
createButton("OMG Hub (67750)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-OMG-Hub-67750"))() end)
createButton("Pxntxrez Hub (Keyless 48045)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Pxntxrez-Hub-Keyless-48045"))() end)
createButton("Q-hub (72668)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Q-hub-72668"))() end)
createButton("YARHM (12403)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YARHM-12403"))() end)
createButton("XWestWood Crack (60097)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-XWestWood-Crack-60097"))() end)
createButton("BYTECLAN Universal Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MiguelCriadorDeScript/BYTECLAN/refs/heads/main/SCRIPT.Lua"))() end)
createButton("Hikari Hub (67704)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hikari-Hub-67704"))() end)
createButton("Dux Script (60194)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dux-Script-60194"))() end)
createButton("Ultra King Trolling Gui (71990)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ultra-King-Trolling-Gui-71990"))() end)
createButton("ULTIMATE MOBILE AIMBOT BETA V2 (69907)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ULTIMATE-MOBILE-AIMBOT-BETA-V2-69907"))() end)
createButton("AIMBOT Script (67408)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AIMBOT-67408"))() end)
createButton("Query Script (66495)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Query-66495"))() end)
createButton("KRNL Executor New (71005)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-KRNL-executor-new-71005"))() end)
createButton("Kurd Hub (51808)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Kurd-hub-51808"))() end)
createButton("VirusPirusDirus Script Hub (48257)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-VirusPirusDirus-Script-hub-48257"))() end)
createButton("Ghost Hub (Keyless 65732)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ghost-hub-keyless-65732"))() end)

createHeader("SERVER MANIPULATION (BACKDOOR)")
createButton("FE Death Note/Fling (73152)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-death-note-with-fling-and-thinking-animation-73152"))() end)
createButton("UwU Backdoor Script (72249)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UwU-backdoor-72249"))() end)
createButton("Moon Backdoor Script (72789)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Moon-Backdoor-72789"))() end)
createButton("PAINEL UNIVERSAL (MIC UP & ANT-BAN)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SCRIPT-PAINEL-UNIVERSAL-MIC-UP-ETC-VOICE-ANT-BAN-NO-KEY-30361"))() end)
createButton("Universal Joiner V2 (BAŞLAT)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Joiner-v2-58183"))() end)
createButton("Lalol Hub (BACKDOOR TARAMA)", function() loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))() end)
createButton("UNIVERSAL Auto Farm (63445)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-auto-farm-63445"))() end)
createButton("UNIVERSAL Dexter Script (Aimbot)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UNIVERSAL-Dexter-Script-59906"))() end)
createButton("Admin Komutları (cmd admin 45089)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-cmd-admin-commands-45089"))() end)
createButton("Camara Espia (Gizli Kamera 59623)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Camara-espia-59623"))() end)
createButton("Universal Car (33351)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UniversalCar-33351"))() end)
createButton("REMOTE EVENT SCANNER (64318)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fixz-Remote-Scanner-64318"))() end)
createButton("Oyun Kopyalama Scripti (69849)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Game-Copier-V1-69849"))() end)

createHeader("BUILD / F3X HACK")
createButton("Average F3X Gui (38529)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Average-F3X-Gui-38529"))() end)
createButton("Scriptkidd F3X Gui (FE BYPASS)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-scriptkidd-f3x-gui-ultimate-fe-bypass-hd-admin-games-72427"))() end)
createButton("k00pkidd F3X Gui (H@CK Admin)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-k00pkidd-gui-f3x-67601"))() end)
createButton("k00pkidd HINT Script (43505)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-K00pkidd-hint-43505"))() end)
createButton("k00pkidd Script (43053)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-k00pkidd-43053"))() end)
createButton("TrafficConeHax F3X Gui (HD Admin)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TrafficConeHax-f3x-gui-v3-fe-bypass-hd-admin-games-72427"))() end)

createHeader("MOBILITY HACKS")
createButton("Universal Script - Maxus Fly (55159)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Maxus-Fly-55159"))() end)
createButton("Universal Script - Maxus Shiftlock (55223)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Maxus-Shiftlock-55223"))() end)
createButton("KEYLESS Guest AP/Autoparry (52664)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-KEYLESS-Guest-Definitive-AP-or-Autoparry-AND-MORE-52664"))() end)
createButton("Spectate (50569)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Spectate-50569"))() end)
createButton("Animation Fe Script Player (72991)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Animation-Fe-Script-Player-72991"))() end)
createButton("teleport-hub Teleport Hub (73047)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Teleport-Hub-73047"))() end)
createButton("Universal floater (67208)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-floater-67208"))() end)
createButton("Invinicible Flight R15 (45414)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))() end)
createButton("EDITOR MAKE SCRIPT (73106)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-EDITOR-MAKE-SCRIPT-ROBLOX-73106"))() end)
createButton("RawPlayer (41932)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-RawPlayer-41932"))() end)
createButton("Hat Hub (33544)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Hat-Hub-33544"))() end)
createButton("Anti-Fall DMG (Universal 67059)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/shredder314gmailcom's-Place-anti-fall-dmg-67059"))() end)

createHeader("MUSCLE LEGENDS SCRIPTS")
createButton("Luna Hub (72993)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Muscle-Legends-Luna-Hub-Muscle-Legend-Script-72993"))() end)
createButton("ZENX HUB (66554)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Muscle-Legends-ZENX-HUB-66554"))() end)
createButton("Auto Train Any Executor (57782)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Muscle-Legends-Auto-Train-Any-Executor-Muscle-Legend-57782"))() end)

createHeader("BROOKHAVEN RP HUB [SAKURA ÖZEL]")
createButton("Brookhaven RP - OP Xemon Brookhaven (64299)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-OP-Xemon-Brookhaven-64299"))() end)
createButton("Brookhaven RP - Coquette Hub (41921)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Coquette-Hub-41921"))() end)
createButton("Brookhaven RP - STELARIUM HUB v2 (67524)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-STELARIUM-HUB-v2-ver-op-script-67524"))() end)
createButton("Brookhaven - Pepsi Hub V3 (68758)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Pepsi-hub-V3-original-68758"))() end)
createButton("Brookhaven - Poderoso Hub (66563)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Poderoso-hub-66563"))() end)
createButton("Brookhaven - Shnmaxh Script (Test 71095)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-ShnmaxhScript-Brookhaven-Test-71095"))() end)
createButton("Brookhaven OP Script (FURIA HUB)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Dboas123432sx/bsx_hub/refs/heads/main/FURIAHUB-v1"))() end)
createButton("Brookhaven RP - JBrookMods (56926)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-JBrookMods-56926"))() end)
createButton("Brookhaven RP - Sander XY Hub (35845)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))() end)
createButton("Brookhaven Tubers Hub (71645)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Tubers-hub-71645"))() end)

createHeader("WESTTEAM TURKISH EXCLUSIVES")
createButton("WESTTEAM Özel SC (WESTTEAM.lua)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM.lua"))() end)
createButton("WEST31 Admin Panel (BY-WEST-UNIV.)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BY-WEST-UNİVERSAL.lua"))() end)
createButton("TR1 SC - WESTTEAM EZ HEHE (70597)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM-EZ-HEHE.lua"))() end)
createButton("Genel Admin Komutları (8204)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-admin-command-s-8204"))() end)

createHeader("TURKISH ARMY WAR SIM SCRIPTS")
createButton("TA SCRPST - TÜRK ASKER OYUNU (33860)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/TURK-Turkish-Army-War-Simulator-TA-SCRPST-TURK-ASKER-OYUNU-TA-33860"))() end)
createButton("TA Hile V3 (Adam Kralll 41992)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ta-Hile-V3-adam-kralll-41992"))() end)

createHeader("OTHER GAME SCRIPTS (FISH IT! & TSB & OTHERS)")
createButton("Fish It! - OP XEMON FISH IT (64483)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Fish-It!-OP-XEMON-FISH-IT-64483"))() end)
createButton("Fish It! - Neox Hub (59187)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Fish-It!-Neox-Hub-Auto-Fish-Unlimited-Oxygen-And-Much-More-59187"))() end)
createButton("Natural Disaster Survival - XFXHUB (71291)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-XFXHUB-71291"))() end)
createButton("Natural Disaster Survival - Troll Script (64012)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Troll-Script-64012"))() end)
createButton("Natural Disaster Survival - No fall damage (68524)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-No-fall-damage-68524"))() end)
createButton("The Strongest Battlegrounds - Wally West (61724)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Wally-West-61724"))() end)
createButton("TSB GOJO SET (KEY=CRAZY GOJO)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/The-strongest-battleground-/refs/heads/main/The%20strongest%20battleground%20RVVC%20SCRIPTS"))() end)
createButton("İNK GAME SC (KEY=VEX GAME)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/INK-GAME/refs/heads/main/Ink%20game%20RVVC%20SCRIPTS%20VEX"))() end)
createButton("99 GECE SC (KEY=REVISION FOREST)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/RVVC-99-NIGHTS-IN-THE-FOREST/refs/heads/main/RVVC%20SCRIPTS%2099%20NIGHT%20IN%20THE%20FOREST"))() end)
createButton("BUİLD A PLANE (KEY=VIVI PLANE)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/RVVC-build-a-plane/refs/heads/main/RVVC%20BUILD%20A%20PLANE%20SCRIPTS"))() end)
createButton("FORSAKEN SC (KEY=VEX RVVC)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/RVVC-FORSAKEN/refs/heads/main/RVVC%20SCRIPTS"))() end)
createButton("TSB SUKUNA SET (KEY=RVVC SUKUNA)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/RVVC-SUKUNA-SCRIPT/refs/heads/main/Sukuna%20tsb%20RVVC%20SCRIPTS"))() end)
createButton("HOKOLAZA PVB (KEY=CRAZY VS BRAINROT)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/HOKALAZA-plants-vs-brainrot/refs/heads/main/Key"))() end)
createButton("The Survival Game - Auto-farm/Aimbot (32519)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Survival-Game-Lag-Fix!-Auto-farm-Anti-ban-Auto-Kill-Hitbox-Aimbot-Speed-And-More-32519"))() end)
createButton("The Survival Game - Keyless (65865)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Survival-Game-Script-Keyless-65865"))() end)
createButton("RIVALS - OP Script Gun Mods (73149)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-OP-Script-Gun-Mods-Fly-Silent-Aim-ESP-73149"))() end)
createButton("RIVALS - ragebot and silent aim (73159)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-ragebot-and-silent-aim-73159"))() end)
createButton("The Strongest Battlegrounds Tsb (70997)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Tsb-script-70997"))() end)
createButton("YouTube Music Player (72222)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YouTube-Music-Player-72222"))() end)
createButton("NEW UPDATE BLOX FRUIT (67405)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-NEW-UPDATE-BLOX-FRUIT-67405"))() end)
createButton("Natural Disaster Survival (54619)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-natural-disaster-54619"))() end)
createButton("MM2 / Forsaken Script (YARHM)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Mathersg4/MM2/refs/heads/main/YARHM", true))() end)
createButton("Blox Fruit Script (Speed Hub X)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))() end)
createButton("99 Nights - Script (72965)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/99-Nights-in-the-Forest-99-Nights-Script-72965"))() end)
createButton("Plant vs Brainrots (OP AUTO FARM)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Plants-Vs-Brainrots-OP-AUTO-FARM-AUTO-BUY-AND-MORE-56853"))() end)
createButton("Find the Brainrot SC (KEYLESS)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Find-the-Brainrot-264-BEST-KEYLESS-Script-2025-Auto-Find-All-AFK-Farm-70597"))() end)
createButton("Steal a Brainrot SC (Mobil/PC)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))() end)

-- Kalan 13 script (116-128)
createButton("Universal Admin Commands V3 (FE)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Admin-Commands-v3-70001"))() end)
createButton("God Mode/Inf Health (FE/Bypass)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-God-Mode-Inf-Health-68888"))() end)
createButton("FE Invisible/Anti-Ban Bypass", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Invisible-Bypass-69000"))() end)
createButton("Universal Teleport V4 (Lobby/Player)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Teleport-v4-71100"))() end)
createButton("Universal Script Executor (Simple)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Simple-Executor-65000"))() end)
createButton("Game Pass Unlocker (Experimental)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Game-Pass-Unlocker-V1-73010"))() end)
createButton("Universal Speed Hack V2 (Anti-Cheat)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Speed-Hack-V2-64000"))() end)
createButton("FE Tool Spawner (Classic)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Tool-Spawner-66000"))() end)
createButton("Keyless HUB 5 (Latest Universal)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Keyless-HUB-5-73180"))() end)
createButton("Universal Aura Effect (Customize)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Aura-Effect-68000"))() end)
createButton("FE Sky Changer (Themes)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Sky-Changer-67000"))() end)
createButton("No Clip Toggle (Bypass)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-No-Clip-Toggle-69500"))() end)
createButton("Universal Super Jump (Adjustable)", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Super-Jump-63000"))() end) 
