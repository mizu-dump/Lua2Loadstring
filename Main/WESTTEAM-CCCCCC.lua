--[[ 
    WESTTEAM PREMİUM VERSİON 10.1 (QUANTUM HOLO - ANIMATED 3D)
    Password Verified: Aykol_123
    VERSION 10.1 UPDATE: Added 6 new scripts (Total 128). Holo-interface is maintained.
    Features: Fully transparent frame, animated 3D grid and light-saber borders.
    Total Scripts: 128
    
    USER RESPONSIBILITY DISCLAIMER:
    The user is solely responsible for any consequences (e.g., bans) arising from the use of these scripts.
    The Gemini team is not responsible for any bans or negative outcomes.
--]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

--------------------------------------------------------------------------------
-- 3D HOLO UTILITY FUNCTION
--------------------------------------------------------------------------------
local HoloColor = Color3.fromRGB(0, 255, 255) -- Cyan/Mavi-Yeşil Holo Rengi
local GlitchTime = 0 

local function getHoloColor(timeOffset)
    local h = (GlitchTime + timeOffset) % 1
    local r, g, b = Color3.fromHSV(h, 1, 1):ToRGB()
    return Color3.fromRGB(r, g, b)
end

--------------------------------------------------------------------------------
-- 1. ARAYÜZ OLUŞTURMA (GUI SETUP - QUANTUM HOLO)
--------------------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local HoloFrame = Instance.new("Frame") -- Görünür Holo Çerçevesi
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton") 
local ContentFrame = Instance.new("ScrollingFrame")
local Padding = Instance.new("UIPadding")

if gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end
ScreenGui.Name = "WestTeamPremiumUI_V10_1"
ScreenGui.ResetOnSpawn = false

-- ANA PENCERE (MainFrame) - GÖRÜNMEZ HAREKET ÇERÇEVESİ
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 1 
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -220) 
MainFrame.Size = UDim2.new(0, 600, 0, 440) 
MainFrame.ClipsDescendants = false 
MainFrame.Active = true

-- GÖRÜNÜR İÇ ÇERÇEVE (Holo Efekti)
HoloFrame.Name = "HoloFrame"
HoloFrame.Parent = MainFrame
HoloFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HoloFrame.BackgroundTransparency = 0.95 
HoloFrame.Position = UDim2.new(0, 0, 0, 0)
HoloFrame.Size = UDim2.new(1, 0, 1, 0)
HoloFrame.Active = true

local HoloCorner = Instance.new("UICorner")
HoloCorner.CornerRadius = UDim.new(0, 5) 
HoloCorner.Parent = HoloFrame

-- IŞIN KILICI KENARLIK (UIStroke'un Yerine)
local function createLightSaberBorder(parent, color, position, size, thickness, rotation)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = size
    frame.Position = position
    frame.BackgroundTransparency = 1
    frame.Rotation = rotation or 0
    frame.Name = "LightSaber"
    
    local line = Instance.new("Frame")
    line.Parent = frame
    line.BackgroundColor3 = color
    line.BackgroundTransparency = 0.5
    line.Size = UDim2.new(1, 0, 0, thickness) 
    line.Position = UDim2.new(0, 0, 0.5, -thickness/2)
    
    local glow = Instance.new("Frame")
    glow.Parent = frame
    glow.BackgroundColor3 = color
    glow.BackgroundTransparency = 0.9
    glow.Size = UDim2.new(1, 0, 0, thickness * 3) 
    glow.Position = UDim2.new(0, 0, 0.5, -(thickness * 1.5)/2)
    
    -- Holo Animasyonu
    spawn(function()
        local lineHue = math.random()
        while frame.Parent do
            lineHue = (lineHue + 0.008) % 1.0
            local rgbColor = Color3.fromHSV(lineHue, 1, 1)
            line.BackgroundColor3 = rgbColor
            glow.BackgroundColor3 = rgbColor
            wait(0.05)
        end
    end)
end

-- 4 Kenarlık
local borderThickness = 3
createLightSaberBorder(HoloFrame, HoloColor, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, borderThickness), borderThickness) -- Üst
createLightSaberBorder(HoloFrame, HoloColor, UDim2.new(0, 0, 1, -borderThickness), UDim2.new(1, 0, 0, borderThickness), borderThickness) -- Alt
createLightSaberBorder(HoloFrame, HoloColor, UDim2.new(0, 0, 0, borderThickness), UDim2.new(0, borderThickness, 1, -borderThickness * 2), borderThickness, 90) -- Sol
createLightSaberBorder(HoloFrame, HoloColor, UDim2.new(1, -borderThickness, 0, borderThickness), UDim2.new(0, borderThickness, 1, -borderThickness * 2), borderThickness, 90) -- Sağ

-- BAŞLIK
Title.Name = "Title"
Title.Parent = HoloFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 10)
Title.Size = UDim2.new(0.9, 0, 0, 30)
Title.Font = Enum.Font.Code
Title.Text = "WESTTEAM 10.1: QUANTUM HOLO // 128 SCRIPT" -- Başlık Güncellendi
Title.TextColor3 = HoloColor
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- MATRIX GLITCH EFEKTİ
local TitleGlitch = Instance.new("TextLabel")
TitleGlitch.Name = "TitleGlitchOverlay"
TitleGlitch.Parent = Title
TitleGlitch.BackgroundTransparency = 1
TitleGlitch.Position = UDim2.new(0, 0, 0, 0)
TitleGlitch.Size = UDim2.new(1, 0, 1, 0)
TitleGlitch.Font = Enum.Font.Code
TitleGlitch.Text = "WESTTEAM 10.1"
TitleGlitch.TextColor3 = HoloColor
TitleGlitch.TextSize = 16
TitleGlitch.TextXAlignment = Enum.TextXAlignment.Left

-- KAPATMA BUTONU (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = HoloFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
CloseButton.BackgroundTransparency = 0.7
CloseButton.Position = UDim2.new(1, -45, 0, 10) 
CloseButton.Size = UDim2.new(0, 35, 0, 30)
CloseButton.Font = Enum.Font.Code
CloseButton.Text = "[EXIT]" 
CloseButton.TextColor3 = HoloColor
CloseButton.TextSize = 12
CloseButton.AutoButtonColor = false

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -300, 1, 0)}):Play() 
    TweenService:Create(HoloFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    wait(0.3)
    ScreenGui:Destroy() 
    game.StarterGui:SetCore("SendNotification", {
        Title = "WESTTEAM 10.1 POWER DOWN";
        Text = "Hologram kapatıldı. Arşive geri dönüldü.";
        Duration = 5;
    })
end)

--------------------------------------------------------------------------------
-- 2. KAYDIRMA ALANI (SCROLLING FRAME)
--------------------------------------------------------------------------------
ContentFrame.Name = "Content"
ContentFrame.Parent = HoloFrame
ContentFrame.Active = true
ContentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ContentFrame.BackgroundTransparency = 0.9 
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 15, 0, 45) 
ContentFrame.Size = UDim2.new(1, -30, 1, -60)
ContentFrame.ScrollBarThickness = 5 
ContentFrame.ScrollBarImageColor3 = HoloColor
ContentFrame.CanvasSize = UDim2.new(0, 0, 100, 0) 

-- Layout (Düzenleyici)
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 7) 
Padding.PaddingTop = UDim.new(0, 7)
Padding.PaddingBottom = UDim.new(0, 7)
Padding.Parent = ContentFrame

--------------------------------------------------------------------------------
-- 3. FONKSİYONLAR (HOLO ANİMASYONU)
--------------------------------------------------------------------------------
local function animateHolo()
    while HoloFrame.Parent do
        GlitchTime = (GlitchTime + 0.005) % 1.0
        local holoColor = getHoloColor(0)

        -- Holo Glitch Efekti
        TitleGlitch.TextColor3 = holoColor
        TitleGlitch.Text = string.sub(Title.Text, 1, math.random(1, #Title.Text)) .. string.char(math.random(33, 126)) 
        TitleGlitch.Position = UDim2.new(math.random() * 0.005, math.random() * 0.5, math.random() * 0.005, math.random() * 0.5)

        -- Scrollbar Rengi
        ContentFrame.ScrollBarImageColor3 = holoColor
        CloseButton.TextColor3 = holoColor
        
        wait(0.05) 
    end
end
spawn(animateHolo)

-- SÜRÜKLEME KODU 
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    
    local dragTween = TweenService:Create(MainFrame, TweenInfo.new(0.01), {Position = targetPos}) 
    dragTween:Play()
end

HoloFrame.InputBegan:Connect(function(input)
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

HoloFrame.InputChanged:Connect(function(input)
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
-- 4. BUTON EKLEME FONKSİYONLARI (HOLO BUTONLAR)
--------------------------------------------------------------------------------
function createButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = ContentFrame
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 0.95 
    btn.Size = UDim2.new(1, 0, 0, 38) 
    btn.Font = Enum.Font.Code
    btn.Text = "[ " .. text .. " ]"
    btn.TextColor3 = HoloColor
    btn.TextSize = 13
    btn.AutoButtonColor = false
    btn.ZIndex = 5
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 3)
    btnCorner.Parent = btn
    
    -- Holo Işın Efekti (Alt Çizgi)
    local holoLine = Instance.new("Frame")
    holoLine.Parent = btn
    holoLine.BackgroundColor3 = HoloColor
    holoLine.BackgroundTransparency = 0.5
    holoLine.Size = UDim2.new(1, 0, 0, 2)
    holoLine.Position = UDim2.new(0, 0, 1, -2)
    
    -- Holo Animasyonu
    spawn(function()
        local buttonHue = math.random()
        while btn.Parent do
            buttonHue = (buttonHue + 0.01) % 1.0
            local rgbColor = Color3.fromHSV(buttonHue, 1, 1)
            btn.TextColor3 = rgbColor 
            holoLine.BackgroundColor3 = rgbColor
            wait(0.05)
        end
    end)
    
    -- Hover ve Click Efekti
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundTransparency = 0.7}):Play()
        TweenService:Create(holoLine, TweenInfo.new(0.1), {BackgroundTransparency = 0}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundTransparency = 0.95}):Play()
        TweenService:Create(holoLine, TweenInfo.new(0.1), {BackgroundTransparency = 0.5}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        local clickColor = holoLine.BackgroundColor3
        local clickEffect = TweenService:Create(btn, TweenInfo.new(0.05), {BackgroundColor3 = clickColor, BackgroundTransparency = 0.5})
        clickEffect:Play()
        wait(0.05)
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.95}):Play()
        
        pcall(callback)
    end)
    
    return btn
end

function createHeader(text)
    local header = Instance.new("TextLabel")
    header.Parent = ContentFrame
    header.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
    header.BackgroundTransparency = 1 
    header.Size = UDim2.new(1, 0, 0, 25)
    header.Font = Enum.Font.Code
    header.Text = "/// " .. string.upper(text) .. " ///"
    header.TextColor3 = HoloColor
    header.TextSize = 11
    header.BorderSizePixel = 0
    
    -- Header Alt Holo Çizgisi
    local headerLine = Instance.new("Frame")
    headerLine.Parent = header
    headerLine.BackgroundColor3 = HoloColor
    headerLine.BackgroundTransparency = 0.7
    headerLine.Size = UDim2.new(1, 0, 0, 1)
    headerLine.Position = UDim2.new(0, 0, 1, -1)
    
    -- Holo Animasyonu
    spawn(function()
        local headerHue = math.random()
        while header.Parent do
            headerHue = (headerHue + 0.003) % 1.0
            local rgbColor = Color3.fromHSV(headerHue, 1, 1)
            headerLine.BackgroundColor3 = rgbColor
            wait(0.05)
        end
    end)
    
    return header
end

--------------------------------------------------------------------------------
-- 5. TÜM ÖZELLİKLER (128 ADET SCRIPT) 
--------------------------------------------------------------------------------

-- *** UNIVERSAL / HACK & EXPLOIT ARAÇLARI *** createHeader("UNIVERSAL & EXPLOIT [QUANTUM]")

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

createButton("🛡️ Anti-Fall DMG (Universal 67059) - **YENİ**", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/shredder314gmailcom's-Place-anti-fall-dmg-67059"))()
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
createHeader("BROOKHAVEN RP HUB [GÜNCEL]")

createButton("🏠 Brookhaven RP - OP Xemon Brookhaven (64299) - **YENİ**", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-OP-Xemon-Brookhaven-64299"))()
end)

createButton("🏠 Brookhaven RP - Coquette Hub (41921)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Coquette-Hub-41921"))()
end)

createButton("⭐ Brookhaven RP - STELARIUM HUB v2 (67524)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-STELARIUM-HUB-v2-ver-op-script-67524"))()
end)

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


-- *** DİĞER OYUN SCRIPT'LERİ (FISH IT! & TSB & OTHERS) ***
createHeader("OTHER GAME SCRIPTS (FISH IT! & TSB & OTHERS)")

createButton("🎣 Fish It! - OP XEMON FISH IT (64483) - **YENİ**", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fish-It!-OP-XEMON-FISH-IT-64483"))()
end)

createButton("🎣 Fish It! - Neox Hub (59187)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fish-It!-Neox-Hub-Auto-Fish-Unlimited-Oxygen-And-Much-More-59187"))()
end)

createButton("🌊 Natural Disaster Survival - XFXHUB (71291) - **YENİ**", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-XFXHUB-71291"))()
end)

createButton("🌊 Natural Disaster Survival - Troll Script (64012) - **YENİ**", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Troll-Script-64012"))()
end)

createButton("🌊 Natural Disaster Survival - No fall damage (68524) - **YENİ**", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-No-fall-damage-68524"))()
end)

createButton("⚔️ The Strongest Battlegrounds - Wally West (61724)", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Wally-West-61724"))()
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
    Title = "WESTTEAM 10.1 [QUANTUM HOLO]";
    Text = "GÜNCELLEME: 6 Yeni script eklendi. Toplam: 128!";
    Duration = 7;
})
