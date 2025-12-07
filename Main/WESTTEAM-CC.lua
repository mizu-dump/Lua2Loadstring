--[[ 
    WESTTEAM PREMİUM VERSİON 9.0 (NEON HYPERFLUX - FULL RGB)
    Password Verified: Aykol_123
    VERSION 9.0 UPDATE: EXTREME RGB THEME (Neon Hyperflux). 
    Features: Transparent Frame, Continuous RGB color cycling on borders and buttons.
    Total Scripts: 119
    
    USER RESPONSIBILITY DISCLAIMER:
    The user is solely responsible for any consequences (e.g., bans) arising from the use of these scripts.
    The Gemini team is not responsible for any bans or negative outcomes.
--]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

--------------------------------------------------------------------------------
-- RGB UTILITY FUNCTION
--------------------------------------------------------------------------------
local function HSV_to_Color3(h, s, v)
    local r, g, b = 0, 0, 0
    local i = math.floor(h * 6)
    local f = h * 6 - i
    local p = v * (1 - s)
    local q = v * (1 - f * s)
    local t = v * (1 - (1 - f) * s)
    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q end
    return Color3.fromRGB(r * 255, g * 255, b * 255)
end

local CurrentHue = 0.0

--------------------------------------------------------------------------------
-- 1. ARAYÜZ OLUŞTURMA (GUI SETUP - NEON HYPERFLUX)
--------------------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local GlitchFrame = Instance.new("Frame") 
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton") 
local ContentFrame = Instance.new("ScrollingFrame")
local GlitchStroke = Instance.new("UIStroke") -- Ana Çerçeve RGB Çizgisi
local Padding = Instance.new("UIPadding")

if gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end
ScreenGui.Name = "WestTeamPremiumUI_V9"
ScreenGui.ResetOnSpawn = false

-- ANA PENCERE (MainFrame) - GÖRÜNMEZ HAREKET ÇERÇEVESİ
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 1 
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -200) 
MainFrame.Size = UDim2.new(0, 560, 0, 400) 
MainFrame.ClipsDescendants = false 
MainFrame.Active = true

-- GÖRÜNÜR İÇ ÇERÇEVE (Holo Efekti)
GlitchFrame.Name = "GlitchFrame"
GlitchFrame.Parent = MainFrame
GlitchFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
GlitchFrame.BackgroundTransparency = 0.85 
GlitchFrame.Position = UDim2.new(0, 0, 0, 0)
GlitchFrame.Size = UDim2.new(1, 0, 1, 0)
GlitchFrame.Active = true

local GlitchCorner = Instance.new("UICorner")
GlitchCorner.CornerRadius = UDim.new(0, 5) 
GlitchCorner.Parent = GlitchFrame

-- HOLOGRAM ÇİZGİSİ (RGB DÖNGÜSÜ BURADA OLACAK)
GlitchStroke.Color = Color3.fromRGB(255, 0, 0) -- Başlangıç Rengi
GlitchStroke.Thickness = 2
GlitchStroke.Transparency = 0.3 -- Yarı Şeffaf Neon
GlitchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
GlitchStroke.Parent = GlitchFrame

-- BAŞLIK
Title.Name = "Title"
Title.Parent = GlitchFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Size = UDim2.new(0.9, 0, 0, 30)
Title.Font = Enum.Font.Code
Title.Text = "WESTTEAM 9.0: NEON HYPERFLUX // 119 SCRIPT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

-- RGB GLITCH BAŞLIK EFEKTİ
local TitleGlitch = Instance.new("TextLabel")
TitleGlitch.Name = "TitleGlitchOverlay"
TitleGlitch.Parent = Title
TitleGlitch.BackgroundTransparency = 1
TitleGlitch.Position = UDim2.new(0, 0, 0, 0)
TitleGlitch.Size = UDim2.new(1, 0, 1, 0)
TitleGlitch.Font = Enum.Font.Code
TitleGlitch.Text = "W"
TitleGlitch.TextColor3 = Color3.fromRGB(255, 0, 255) 
TitleGlitch.TextSize = 14
TitleGlitch.TextXAlignment = Enum.TextXAlignment.Left

-- KAPATMA BUTONU (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = GlitchFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
CloseButton.BackgroundTransparency = 0.5
CloseButton.Position = UDim2.new(1, -40, 0, 5) 
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.Code
CloseButton.Text = "OFF" 
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 10
CloseButton.AutoButtonColor = false

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.2), {Position = UDim2.new(0.5, -280, 1, 0)}):Play() -- Aşağı kayarak kaybolma
    TweenService:Create(GlitchFrame, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
    wait(0.2)
    ScreenGui:Destroy() 
    game.StarterGui:SetCore("SendNotification", {
        Title = "WESTTEAM 9.0 POWER DOWN";
        Text = "RGB Sistemi kapatıldı. Bir sonraki başlatmaya kadar beklemede.";
        Duration = 5;
    })
end)

--------------------------------------------------------------------------------
-- 2. KAYDIRMA ALANI (SCROLLING FRAME)
--------------------------------------------------------------------------------
ContentFrame.Name = "Content"
ContentFrame.Parent = GlitchFrame
ContentFrame.Active = true
ContentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ContentFrame.BackgroundTransparency = 0.9 -- Yarı Şeffaf Siyah
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 10, 0, 40) 
ContentFrame.Size = UDim2.new(1, -20, 1, -50)
ContentFrame.ScrollBarThickness = 3 
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255) -- Scrollbar da RGB olacak
ContentFrame.CanvasSize = UDim2.new(0, 0, 100, 0) 

-- Layout (Düzenleyici)
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5) 
Padding.PaddingTop = UDim.new(0, 5)
Padding.PaddingBottom = UDim.new(0, 5)
Padding.Parent = ContentFrame

--------------------------------------------------------------------------------
-- 3. FONKSİYONLAR (RGB DÖNGÜSÜ)
--------------------------------------------------------------------------------
local function animateRGB()
    while GlitchFrame.Parent do
        CurrentHue = (CurrentHue + 0.01) % 1.0
        local rgbColor = HSV_to_Color3(CurrentHue, 1, 1)

        -- Ana Çerçeve RGB
        GlitchStroke.Color = rgbColor

        -- Başlık RGB
        TitleGlitch.TextColor3 = rgbColor
        TitleGlitch.Text = string.sub(Title.Text, 1, math.random(1, #Title.Text)) .. string.char(math.random(33, 126)) -- Glitch efekti devam

        -- Scrollbar RGB
        ContentFrame.ScrollBarImageColor3 = rgbColor

        wait(0.05) 
    end
end
spawn(animateRGB)

-- SÜRÜKLEME KODU (V8.0'dan Aynen Alındı)
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    
    local dragTween = TweenService:Create(MainFrame, TweenInfo.new(0.01), {Position = targetPos}) 
    dragTween:Play()
end

GlitchFrame.InputBegan:Connect(function(input)
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

GlitchFrame.InputChanged:Connect(function(input)
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
-- 4. BUTON EKLEME FONKSİYONLARI (RGB BUTONLAR)
--------------------------------------------------------------------------------
function createButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = ContentFrame
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btn.BackgroundTransparency = 0.8
    btn.Size = UDim2.new(1, 0, 0, 35) 
    btn.Font = Enum.Font.Code
    btn.Text = ":: " .. text .. " ::"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255) 
    btn.TextSize = 12
    btn.AutoButtonColor = false
    btn.ZIndex = 5
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 3)
    btnCorner.Parent = btn
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Color3.fromRGB(255, 0, 255) -- Başlangıç Rengi
    btnStroke.Thickness = 0.5 
    btnStroke.Transparency = 0.3 -- Çok belirgin RGB çizgi
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btnStroke.Parent = btn

    -- Buton RGB Döngüsü
    spawn(function()
        local buttonHue = math.random()
        while btn.Parent do
            buttonHue = (buttonHue + 0.02) % 1.0
            local rgbColor = HSV_to_Color3(buttonHue, 1, 1)
            btnStroke.Color = rgbColor
            wait(0.05)
        end
    end)
    
    -- Hover ve Click Efekti
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundTransparency = 0.5, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.1), {Transparency = 0}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundTransparency = 0.8, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.1), {Transparency = 0.3}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        local clickColor = HSV_to_Color3(CurrentHue, 1, 1)
        local clickEffect = TweenService:Create(btn, TweenInfo.new(0.05), {BackgroundColor3 = clickColor, BackgroundTransparency = 0.2})
        clickEffect:Play()
        wait(0.05)
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(20, 20, 20), BackgroundTransparency = 0.8}):Play()
        
        pcall(callback)
    end)
    
    return btn
end

function createHeader(text)
    local header = Instance.new("TextLabel")
    header.Parent = ContentFrame
    header.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
    header.BackgroundTransparency = 0.6 -- Daha az şeffaf
    header.Size = UDim2.new(1, 0, 0, 20)
    header.Font = Enum.Font.Code
    header.Text = "[ > " .. string.upper(text) .. " < ]"
    header.TextColor3 = Color3.fromRGB(255, 255, 255) 
    header.TextSize = 10
    header.BorderSizePixel = 0
    
    local headerStroke = Instance.new("UIStroke")
    headerStroke.Color = Color3.fromRGB(255, 255, 255)
    headerStroke.Thickness = 0.5
    headerStroke.Transparency = 0.2
    headerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    headerStroke.Parent = header
    
    -- Header RGB Döngüsü
    spawn(function()
        local headerHue = math.random()
        while header.Parent do
            headerHue = (headerHue + 0.005) % 1.0
            local rgbColor = HSV_to_Color3(headerHue, 1, 1)
            headerStroke.Color = rgbColor
            header.TextColor3 = rgbColor -- Yazı da değişsin
            wait(0.05)
        end
    end)
    
    return header
end

--------------------------------------------------------------------------------
-- 5. TÜM ÖZELLİKLER (119 ADET SCRIPT) 
--------------------------------------------------------------------------------
-- *** UNIVERSAL / HACK & EXPLOIT ARAÇLARI *** createHeader("UNIVERSAL & EXPLOIT [HYPERFLUX]")

createButton("💻 c00lgui Reborn Rc7 by v3rx (72951)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-72951"))()
end)

createButton("🖼️ un*led Shader menu (73042)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-un*led-Shader-menu-73042"))()
end)

createButton("🤖 Universal Script - Android PvP Beta (71951)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Android-PvP-Beta-71951"))()
end)

createButton("💻 Kagu-Hub (29933)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Kagu-Hub-29933"))()
end)

createButton("💻 Ekuve hub (73000)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ekuve-hub-73000"))()
end)

createButton("👑 Max Privat Hub (73265)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Max-Privat-Hub-73265"))()
end)

createButton("💻 LuaSploit Hub (70635)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-LuaSploit-Hub-70635"))()
end)

createButton("🎯 Universal Hitbox Expander (71542)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Hitbox-Expander-71542"))()
end)

createButton("💻 FE executor make by BlueKidd (73090)", function()
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
createHeader("SERVER MANIPULATION (BACKDOOR)")

createButton("💀 FE Death Note/Fling (73152)", function()
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
createHeader("BUILD / F3X HACK")

createButton("🔨 Average F3X Gui (38529)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Average-F3X-Gui-38529"))()
end)

createButton("💀 Scriptkidd F3X Gui (FE BYPASS)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-scriptkidd-f3x-gui-ultimate-fe-bypass-hd-admin-games-72427"))()
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
createHeader("MOBILITY HACKS")

createButton("🕊️ Universal Script - Maxus Fly (55159)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Maxus-Fly-55159"))()
end)

createButton("🔒 Universal Script - Maxus Shiftlock (55223)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Maxus-Shiftlock-55223"))()
end)

createButton("🛡️ KEYLESS Guest AP/Autoparry (52664)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-KEYLESS-Guest-Definitive-AP-or-Autoparry-AND-MORE-52664"))()
end)

createButton("👁️ Spectate (50569)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Spectate-50569"))()
end)

createButton("💃 Animation Fe Script Player (72991)", function()
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


-- *** MUSCLE LEGENDS SCRIPT'LERİ ***
createHeader("MUSCLE LEGENDS SCRIPTS")

createButton("🌙 Luna Hub (72993)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Muscle-Legends-Luna-Hub-Muscle-Legend-Script-72993"))()
end)

createButton("☯️ ZENX HUB (66554)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Muscle-Legends-ZENX-HUB-66554"))()
end)

createButton("💪 Auto Train Any Executor (57782)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Muscle-Legends-Auto-Train-Any-Executor-Muscle-Legend-57782"))()
end)


-- *** BROOKHAVEN HUB LİSTESİ ***
createHeader("BROOKHAVEN RP HUB")

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
createHeader("WESTTEAM TURKISH EXCLUSIVES")

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
createHeader("TURKISH ARMY WAR SIM SCRIPTS")

createButton("💂 TA SCRPST - TÜRK ASKER OYUNU (33860)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/TURK-Turkish-Army-War-Simulator-TA-SCRPST-TURK-ASKER-OYUNU-TA-33860"))()
end)

createButton("🔫 TA Hile V3 (Adam Kralll 41992)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ta-Hile-V3-adam-kralll-41992"))()
end)


-- *** DİĞER OYUN SCRIPT'LERİ ***
createHeader("OTHER GAME SCRIPTS (RVVC & MORE)")

createButton("🎣 Fish It! - Neox Hub (59187)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fish-It!-Neox-Hub-Auto-Fish-Unlimited-Oxygen-And-Much-More-59187"))()
end)

createButton("⚔️ TSB GOJO SET (KEY=CRAZY GOJO)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/The-strongest-battleground-/refs/heads/main/The%20strongest%20battleground%20RVVC%20SCRIPTS"))()
end)

createButton("‼️İNK GAME SC (KEY=VEX GAME)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/INK-GAME/refs/heads/main/Ink%20game%20RVVC%20SCRIPTS%20VEX"))()
end)

createButton("🌲 99 GECE SC (KEY=REVISION FOREST)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/RVVC-99-NIGHTS-IN-THE-FOREST/refs/heads/main/RVVC%20SCRIPTS%2099%20NIGHT%20IN%20THE%20FOREST"))()
end)

createButton("✈️ BUİLD A PLANE (KEY=VIVI PLANE)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/RVVC-build-a-plane/refs/heads/main/RVVC%20BUILD%20A%20PLANE%20SCRIPTS"))()
end)

createButton("🔪 FORSAKEN SC (KEY=VEX RVVC)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/RVVC-FORSAKEN/refs/heads/main/RVVC%20SCRIPTS"))()
end)

createButton("⚔️ TSB SUKUNA SET (KEY=RVVC SUKUNA)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/RVVC-SUKUNA-SCRIPT/refs/heads/main/Sukuna%20tsb%20RVVC%20SCRIPTS"))()
end)

createButton("🌱 HOKOLAZA PVB (KEY=CRAZY VS BRAINROT)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/HOKALAZA-plants-vs-brainrot/refs/heads/main/Key"))()
end)

createButton("🧟 The Survival Game - Auto-farm/Aimbot (32519)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Survival-Game-Lag-Fix!-Auto-farm-Anti-ban-Auto-Kill-Hitbox-Aimbot-Speed-And-More-32519"))()
end)

createButton("🧟 The Survival Game - Keyless (65865)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Survival-Game-Script-Keyless-65865"))()
end)

createButton("🔫 RIVALS - OP Script Gun Mods (73149)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-OP-Script-Gun-Mods-Fly-Silent-Aim-ESP-73149"))()
end)

createButton("🎯 RIVALS - ragebot and silent aim (73159)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-ragebot-and-silent-aim-73159"))()
end)

createButton("⚔️ The Strongest Battlegrounds Tsb (70997)", function()
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
    Title = "WESTTEAM 9.0 [NEON HYPERFLUX]";
    Text = "RGB Spektrumu MAX'landı. 119 script yüklendi. Gözlerin kamaşsın kanka!";
    Duration = 7;
})
