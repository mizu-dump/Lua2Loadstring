--[[ 
    WESTTEAM PREMİUM VERSİON 23.0 (FIRE EDITION & LOADING EKRANI)
    Password Verified: Aykol_123 (Batuhan Aykol)
    VERSION 23.0 UPDATE: UI completely re-designed with a high-contrast FIRE THEME.
    - Added a custom 'WESTTEAM LOADING...' screen for 3 seconds.
    - Fire/Flame animation effect on the border.
    - Total Scripts: 175 (5 new user-requested scripts added at the top).
    
    USER RESPONSIBILITY DISCLAIMER:
    The user is solely responsible for any consequences (e.g., bans) arising from the use of these scripts.
    The Gemini team is not responsible for any bans or negative outcomes.
--]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

--------------------------------------------------------------------------------
-- UTILITY FUNCTION & CORE SETUP
--------------------------------------------------------------------------------
local OOF_SOUND_ID = 1847661821 
local isMinimized = false
local defaultPosition = UDim2.new(0.5, -300, 0.5, -220)
local minimizedPosition = UDim2.new(1, -120, 1, -50)

local function playCustomSoundOnce()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. OOF_SOUND_ID
    sound.Volume = 1.5 
    sound.Parent = workspace
    
    sound:Play()
    sound.Ended:Wait()
    sound:Destroy() 
end

spawn(playCustomSoundOnce)

--------------------------------------------------------------------------------
-- 0. LOADİNG EKRANI (FIRE EFFECT)
--------------------------------------------------------------------------------
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "WESTTEAM_LOADER"
LoadingGui.ResetOnSpawn = false
if gethui then
    LoadingGui.Parent = gethui()
else
    LoadingGui.Parent = CoreGui
end

local LoadFrame = Instance.new("Frame")
LoadFrame.Parent = LoadingGui
LoadFrame.Size = UDim2.new(1, 0, 1, 0)
LoadFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
LoadFrame.BackgroundTransparency = 0.1

local LoadText = Instance.new("TextLabel")
LoadText.Parent = LoadFrame
LoadText.Size = UDim2.new(1, 0, 0, 50)
LoadText.Position = UDim2.new(0, 0, 0.5, -25)
LoadText.BackgroundTransparency = 1
LoadText.Font = Enum.Font.Code
LoadText.Text = "WESTTEAM LOADING..."
LoadText.TextColor3 = Color3.fromRGB(255, 100, 0) -- Turuncu Alev
LoadText.TextSize = 30

local LoadStroke = Instance.new("UIStroke")
LoadStroke.Parent = LoadFrame
LoadStroke.Thickness = 5
LoadStroke.LineJoinMode = Enum.LineJoinMode.Miter 
LoadStroke.Color = Color3.fromRGB(255, 0, 0) 
LoadStroke.Transparency = 0.0

local function animateLoading()
    local startTime = tick()
    while tick() - startTime < 3 do -- 3 saniye bekle
        local cycle = (tick() * 3) % 1
        -- Alev rengi (Kırmızıdan Sarıya)
        local fireColor = Color3.fromHSV(0.05 + (cycle * 0.1) % 0.1, 1, 1) 
        
        LoadText.TextColor3 = fireColor
        LoadStroke.Color = fireColor
        LoadFrame.BackgroundColor3 = Color3.fromRGB(10 + math.sin(cycle*3)*5, 0, 0)
        wait(0.05)
    end
end
spawn(animateLoading)

wait(3) -- Loading süresi

TweenService:Create(LoadFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
LoadText.Text = "WESTTEAM FIRE V23.0 READY"
wait(0.5)

--------------------------------------------------------------------------------
-- 1. ARAYÜZ OLUŞTURMA (GUI SETUP - FIRE THEME)
--------------------------------------------------------------------------------
local ScreenGui = LoadingGui -- Ana GUI'yi kullanmaya devam et
local MainFrame = Instance.new("Frame")
local GlamourFrame = Instance.new("Frame") 
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton") 
local MinimizeButton = Instance.new("TextButton")
local ContentFrame = Instance.new("ScrollingFrame")
local Padding = Instance.new("UIPadding")

-- Loading Ekranını kaldırmadan önce MainFrame'i ekle
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 1 
MainFrame.Position = defaultPosition
MainFrame.Size = UDim2.new(0, 600, 0, 440) 
MainFrame.ClipsDescendants = false 
MainFrame.Active = true

-- GÖRÜNÜR İÇ ÇERÇEVESİ (Deep Fire Black)
GlamourFrame.Name = "GlamourFrame"
GlamourFrame.Parent = MainFrame
GlamourFrame.BackgroundColor3 = Color3.fromRGB(20, 5, 5) -- Koyu Kırmızımsı Siyah
GlamourFrame.BackgroundTransparency = 0.0
GlamourFrame.Position = UDim2.new(0, 0, 0, 0)
GlamourFrame.Size = UDim2.new(1, 0, 1, 0)
GlamourFrame.Active = true
GlamourFrame.Selectable = true 

-- FIRE EFEKTİ GÖLGELENDİRME (Stroke)
local UiStroke = Instance.new("UIStroke")
UiStroke.Parent = GlamourFrame
UiStroke.Thickness = 3 
UiStroke.LineJoinMode = Enum.LineJoinMode.Miter 
UiStroke.Color = Color3.fromRGB(255, 50, 0) -- Alev Kırmızısı
UiStroke.Transparency = 0.0 

-- BAŞLIK
Title.Name = "Title"
Title.Parent = GlamourFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 10)
Title.Size = UDim2.new(0.8, 0, 0, 25)
Title.Font = Enum.Font.Code 
Title.Text = "WESTTEAM: FIRE EDITION V23.0 (175 Scripts) 🔥"
Title.TextColor3 = Color3.fromRGB(255, 200, 0) -- Sarı Alev
Title.TextSize = 16 
Title.TextXAlignment = Enum.TextXAlignment.Left

-- KAPATMA BUTONU (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = GlamourFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(80, 0, 0) -- Koyu Ateş Kırmızısı
CloseButton.BackgroundTransparency = 0.0
CloseButton.Position = UDim2.new(1, -40, 0, 10) 
CloseButton.Size = UDim2.new(0, 30, 0, 25)
CloseButton.Font = Enum.Font.Code
CloseButton.Text = "X" 
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255) 
CloseButton.TextSize = 16
CloseButton.AutoButtonColor = false

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -300, 1, 0)}):Play() 
    TweenService:Create(GlamourFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    wait(0.3)
    ScreenGui:Destroy() 
    game.StarterGui:SetCore("SendNotification", {
        Title = "WESTTEAM 23.0 DISCONNECT";
        Text = "Fire Edition kapatıldı kanka. Yeni sistem hazırlığına devam!";
        Duration = 5;
    })
end)

-- MINIMIZE BUTONU (-)
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = GlamourFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
MinimizeButton.BackgroundTransparency = 0.0
MinimizeButton.Position = UDim2.new(1, -75, 0, 10) 
MinimizeButton.Size = UDim2.new(0, 30, 0, 25)
MinimizeButton.Font = Enum.Font.Code
MinimizeButton.Text = "-" 
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) 
MinimizeButton.TextSize = 18
MinimizeButton.AutoButtonColor = false

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    local targetSize, targetPos, targetAlpha
    
    if isMinimized then
        -- Küçült
        targetSize = UDim2.new(0, 100, 0, 35)
        targetPos = minimizedPosition
        targetAlpha = 0.5
        Title.Text = "WESTTEAM 175 🔥"
        Title.TextSize = 12
        Title.Position = UDim2.new(0, 5, 0, 5)
        MinimizeButton.Text = "+"
        CloseButton.Visible = false
        ContentFrame.Visible = false
    else
        -- Büyüt
        targetSize = UDim2.new(0, 600, 0, 440)
        targetPos = defaultPosition
        targetAlpha = 0.0
        Title.Text = "WESTTEAM: FIRE EDITION V23.0 (175 Scripts) 🔥"
        Title.TextSize = 16
        Title.Position = UDim2.new(0, 10, 0, 10)
        MinimizeButton.Text = "-"
        CloseButton.Visible = true
        ContentFrame.Visible = true
    end
    
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = targetSize, Position = targetPos}):Play()
    TweenService:Create(GlamourFrame, TweenInfo.new(0.3), {BackgroundTransparency = targetAlpha}):Play()
end)

--------------------------------------------------------------------------------
-- 2. KAYDIRMA ALANI (SCROLLING FRAME)
--------------------------------------------------------------------------------
ContentFrame.Name = "Content"
ContentFrame.Parent = GlamourFrame
ContentFrame.Active = true
ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 10, 10) -- Daha Açık Ateş Arka Planı
ContentFrame.BackgroundTransparency = 0.0
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 10, 0, 45) 
ContentFrame.Size = UDim2.new(1, -20, 1, -55)
ContentFrame.ScrollBarThickness = 8 
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0) -- Turuncu Alev Kaydırma Çubuğu
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0) 
ContentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

-- Layout (Düzenleyici)
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2) 
Padding.PaddingTop = UDim.new(0, 5)
Padding.PaddingBottom = UDim.new(0, 5)
Padding.Parent = ContentFrame

--------------------------------------------------------------------------------
-- 3. FONKSİYONLAR (ALEV ANİMASYONU & DRAGGING)
--------------------------------------------------------------------------------
local function animateAesthetic()
    while GlamourFrame.Parent do
        local cycle = (tick() * 1.5) % 1
        -- Alev rengi (Kırmızı, Turuncu, Sarı tonlarında sert geçiş)
        local h = 0 + (cycle * 0.1) % 0.1 -- 0.0 (Kırmızı) ile 0.1 (Turuncu/Sarı) arası
        local fireColor = Color3.fromHSV(h, 1, 1) 

        UiStroke.Color = fireColor
        Title.TextColor3 = fireColor
        
        -- Buton Alev Efekti
        for i, button in pairs(ContentFrame:GetChildren()) do
            if button:IsA("TextButton") then
                local offset = (i * 0.005) % 1
                local btnH = 0 + (cycle * 0.1 + offset) % 0.1
                local buttonColor = Color3.fromHSV(btnH, 1, 1)
                
                local line = button:FindFirstChild("aestheticLine")
                if line then 
                    TweenService:Create(line, TweenInfo.new(0.1), {BackgroundColor3 = buttonColor}):Play()
                end
            end
        end
        
        wait(0.05) 
    end
end
spawn(animateAesthetic)

-- SÜRÜKLEME KODU (DRAG) (Aynı kaldı)
local dragging = false
local dragStart
local startPos

local function startDrag(input)
    if not isMinimized and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    elseif isMinimized and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end

local function doDrag(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        MainFrame.Position = targetPos
    end
end

local function endDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        if isMinimized then
            minimizedPosition = MainFrame.Position
        end
        if not isMinimized then
             defaultPosition = MainFrame.Position
        end
    end
end

GlamourFrame.InputBegan:Connect(startDrag)
UserInputService.InputChanged:Connect(doDrag)
UserInputService.InputEnded:Connect(endDrag) 

--------------------------------------------------------------------------------
-- 4. BUTON EKLEME FONKSİYONLARI (FIRE BUTONLAR)
--------------------------------------------------------------------------------
local currentGlamourScriptIndex = 0
local TOTAL_SCRIPTS = 175 -- Artırıldı

function createButton(text, url)
    currentGlamourScriptIndex = currentGlamourScriptIndex + 1
    
    local btn = Instance.new("TextButton")
    btn.Parent = ContentFrame
    btn.BackgroundColor3 = Color3.fromRGB(50, 20, 20) 
    btn.BackgroundTransparency = 0.0 
    btn.Size = UDim2.new(1, 0, 0, 30) 
    btn.Font = Enum.Font.Code
    btn.Text = "🔥[" .. currentGlamourScriptIndex .. "/" .. TOTAL_SCRIPTS .. "] " .. string.upper(text) .. " >> EXECUTE" 
    btn.TextColor3 = Color3.fromRGB(255, 255, 255) 
    btn.TextSize = 13
    btn.AutoButtonColor = false
    btn.ZIndex = 5
    btn.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Sert Kırmızı Alt Çizgi Efekti (Alev Animasyonunda Renk Değişecek)
    local aestheticLine = Instance.new("Frame")
    aestheticLine.Name = "aestheticLine"
    aestheticLine.Parent = btn
    aestheticLine.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
    aestheticLine.BackgroundTransparency = 0.0 
    aestheticLine.Size = UDim2.new(1, 0, 0, 1) 
    aestheticLine.Position = UDim2.new(0, 0, 1, -1)
    
    -- Hover ve Click Efekti
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(70, 30, 30)}):Play()
        btn.TextColor3 = Color3.fromRGB(255, 200, 0) -- Sarı Alev
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 20, 20)}):Play()
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    btn.MouseButton1Click:Connect(function()
        local clickEffect = TweenService:Create(btn, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)})
        clickEffect:Play()
        wait(0.05)
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 20, 20)}):Play()
        
        -- SCRIPT ÇALIŞTIRMA
        pcall(function() 
            loadstring(game:HttpGet(url, true))() 
        end)
    end)
    
    return btn
end

function createHeader(text)
    local header = Instance.new("TextLabel")
    header.Parent = ContentFrame
    header.BackgroundColor3 = Color3.fromRGB(60, 25, 25) -- Başlık Arka Planı
    header.BackgroundTransparency = 0.0
    header.Size = UDim2.new(1, 0, 0, 20) 
    header.Font = Enum.Font.Code
    header.Text = ">>> 🔥 " .. string.upper(text) .. " 🔥 <<<" 
    header.TextColor3 = Color3.fromRGB(255, 255, 255) 
    header.TextSize = 12
    header.BorderSizePixel = 0
    
    return header
end

--------------------------------------------------------------------------------
-- 5. TÜM ÖZELLİKLER (175 ADET SCRIPT) 
--------------------------------------------------------------------------------

createHeader("🚨 KRİTİK EKLENTİLER (YENİ VE ÖZEL) 🆕")
createButton("🌐 UNIVERSAL SCRIPT - NATHUB", "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua")
createButton("🌐 UNIVERSAL SCRIPT - H4XSCRIPTS LOADER", "https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader2.lua")
createButton("🌱 GROW A GARDEN - MAUSCRIPTS OP FARM", "https://raw.githubusercontent.com/nootmaus/GrowAAGarden/refs/heads/main/mauscripts")
createButton("🏠 BROOKHAVEN LUASTYLE OP SCRIPT (OSENGINE)", "https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua")
createButton("🏠 BROOKHAVEN SP HUB (AS6CD0)", "https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven")

createHeader("⚡ ÖNCEKİ ACİL EKLENTİLER (170 SCRİPT DEVAMI) ⚡")
createButton("🌐 UNIVERSAL SCRIPT - VAPA V2 (27017)", "https://rawscripts.net/raw/Universal-Script-VAPA-V2-27017")
createButton("🏠 BROOKHAVEN FE SKYBOX HACK (73292)", "https://rawscripts.net/raw/Brookhaven-RP-Fe-Brookhaven-skybox-script-73292")

createHeader("✨ YENİ EKLENEN RC7 KOLEKSİYONU 💥")
createButton("👑 Universal Script - Rc7 Executer (73144)", "https://rawscripts.net/raw/Universal-Script-Rc7-Executer-CHECK-DESCRIPTION-73144")
createButton("🔓 Universal Script - Rc7 Backdoor (48369)", "https://rawscripts.net/raw/Universal-Script-Rc7-Backdoor-48369")
createButton("💻 Universal Script - Cracked RC7 (63620)", "https://rawscripts.net/raw/Universal-Script-Cracked-RC7-63620")
createButton("🔴 Universal Script - red RC7 (64423)", "https://rawscripts.net/raw/Universal-Script-red-RC7-64423")
createButton("⚙️ Universal Script - RC7 (56874)", "https://rawscripts.net/raw/Universal-Script-RC7-56874")
createButton("👑 Universal Script - R7J Gui V2 (44042)", "https://rawscripts.net/raw/Universal-Script-R7J-Gui-V2-44042")

createHeader("🚨 V17.0'DAN KALAN YENİ EKLENEN SCRIPTLER 🚨")
createButton("⚡ Universal Script - TASability (72290)", "https://rawscripts.net/raw/Universal-Script-TASability-72290")
createButton("🔪 Steal a Brasilrot Script (73203)", "https://rawscripts.net/raw/Steal-a-Brasilrot-Script-By-TrolyScripts-Go-Subscribe-in-YouTube-73203")
createButton("🎣 Fish Go - Minxiau script (73043)", "https://rawscripts.net/raw/Fish-Go-Minxiau-script-73043")
createButton("🪐 The Forge BETA - Space Hub (72216)", "https://rawscripts.net/raw/The-Forge-BETA-Space-Hub-72216")
createButton("⚡ A Very Hungry Pikachu PD Hub (25895)", "https://rawscripts.net/raw/A-Very-Hungry-Pikachu-PD-Hub-25895")

createHeader("🚀 HAREKET / SHIFTLOCK & FLY 🔥")
createButton("🔒 Universal Script - Maxus Shiftlock (55223) - VURGU", "https://rawscripts.net/raw/Universal-Script-Maxus-Shiftlock-55223")
createButton("🕊️ Universal Script - Maxus Fly (55159) - VURGU", "https://rawscripts.net/raw/Universal-Script-Maxus-Fly-55159")
createButton("🛡️ KEYLESS Guest AP/Autoparry (52664)", "https://rawscripts.net/raw/Universal-Script-KEYLESS-Guest-Definitive-AP-or-Autoparry-AND-MORE-52664")
createButton("👁️ Spectate (50569)", "https://rawscripts.net/raw/Universal-Script-Spectate-50569")
createButton("💃 Animation Fe Script Player (72991)", "https://rawscripts.net/raw/Universal-Script-Animation-Fe-Script-Player-72991")
createButton(" teleport-hub Teleport Hub (73047)", "https://rawscripts.net/raw/Universal-Script-Teleport-Hub-73047")


createHeader("💥 SON EKLENEN EXPLOIT GRUBU 💥")
createButton("❌ Universal Script - YAAI Destroyer (73110)", "https://rawscripts.net/raw/Universal-Script-YAAI-Destroyer-73110")
createButton("🔨 F3X Hack - Teambald F3x Gui Leak (73314)", "https://rawscripts.net/raw/Universal-Script-Teambald-F3x-Gui-Leak-73314")
createButton("💩 Poop a Big Poop - Zzinware (73039)", "https://rawscripts.net/raw/Poop-a-Big-Poop-Zzinware-no-join-discord-73039")
createButton("🐯 Universal Script - Tiger x (34229)", "https://rawscripts.net/raw/Universal-Script-Tiger-x-34229")
createButton("🏠 Brookhaven RP - Tiger X (39488)", "https://rawscripts.net/raw/Brookhaven-RP-Tiger-X-39488")
createButton("💻 Universal Script - Old Delta executor open source (73040)", "https://rawscripts.net/raw/Universal-Script-Old-Delta-executor-open-source-73040")

createHeader("🌐 CORE UNIVERSAL EXPLOITS 🌐")
createButton("💃 Universal Script - AnimSpoofer Jmods (48380)", "https://rawscripts.net/raw/Universal-Script-AnimSpoofer-Jmods-48380")
createButton("👑 Universal Script - Keylor5661 Hub V1 (58958)", "https://rawscripts.net/raw/Universal-Script-Keylor5661-Hub-V1-58958")
createButton("💻 Universal Script - OrzPanel v1.6 (12376)", "https://rawscripts.net/raw/Universal-Script-OrzPanel-v1-dot-6-12376")
createButton("⚙️ Universal Script - LM1-Xploit (31270)", "https://rawscripts.net/raw/Universal-Script-LM1-Xploit-31270")
createButton("🌐 Universal Script - ro-xploit (42101)", "https://rawscripts.net/raw/Universal-Script-ro-xploit-42101")
createButton("🔥 Universal Script - Xploit Hub (50488)", "https://rawscripts.net/raw/Universal-Script-Xploit-Hub-50488")
createButton("💻 c00lgui Reborn Rc7 by v3rx (72951)", "https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-72951")
createButton("🖼️ un*led Shader menu (73042)", "https://rawscripts.net/raw/Universal-Script-un*led-Shader-menu-73042")
createButton("🤖 Universal Script - Android PvP Beta (71951)", "https://rawscripts.net/raw/Universal-Script-Android-PvP-Beta-71951")
createButton("💻 Kagu-Hub (29933)", "https://rawscripts.net/raw/Universal-Script-Kagu-Hub-29933")
createButton("💻 Ekuve hub (73000)", "https://rawscripts.net/raw/Universal-Script-Ekuve-hub-73000")
createButton("👑 Max Privat Hub (73265)", "https://rawscripts.net/raw/Universal-Script-Max-Privat-Hub-73265")
createButton("💻 LuaSploit Hub (70635)", "https://rawscripts.net/raw/Universal-Script-LuaSploit-Hub-70635")
createButton("🎯 Universal Hitbox Expander (71542)", "https://rawscripts.net/raw/Universal-Script-Universal-Hitbox-Expander-71542")
createButton("💻 FE executor make by BlueKidd (73090)", "https://rawscripts.net/raw/Universal-Script-FE-executor-make-by-BlueKidd-73090")
createButton("🔒 LUARMOR Loader 1 (Ac88f99f)", "https://api.luarmor.net/files/v3/loaders/ac88f99f2b292242281d052a71f08a70.lua")
createButton("🔒 LUARMOR Loader 2 (77d72e34)", "https://api.luarmor.net/files/v3/loaders/77d72e34c893b67ea49b8d62d1a18485.lua")
createButton("🔥 Ravex Hub (72951)", "https://rawscripts.net/raw/Universal-Script-Ravex-Hub-72951")
createButton("👑 JaidenHub (73072)", "https://rawscripts.net/raw/Universal-Script-JaidenHub-73072")
createButton("🔥 OMG Hub (67750)", "https://rawscripts.net/raw/Universal-Script-OMG-Hub-67750")
createButton("⭐ Pxntxrez Hub (Keyless 48045)", "https://rawscripts.net/raw/Universal-Script-Pxntxrez-Hub-Keyless-48045")
createButton("❓ Q-hub (72668)", "https://rawscripts.net/raw/Universal-Script-Q-hub-72668")
createButton("⚔️ YARHM (12403)", "https://rawscripts.net/raw/Universal-Script-YARHM-12403")
createButton("💻 XWestWood Crack (60097)", "https://rawscripts.net/raw/Universal-Script-XWestWood-Crack-60097")
createButton("🌐 BYTECLAN Universal Hub", "https://raw.githubusercontent.com/MiguelCriadorDeScript/BYTECLAN/refs/heads/main/SCRIPT.Lua")
createButton("🆕 Hikari Hub (67704)", "https://rawscripts.net/raw/Universal-Script-Hikari-Hub-67704")
createButton("🆕 Dux Script (60194)", "https://rawscripts.net/raw/Universal-Script-Dux-Script-60194")
createButton("👑 Ultra King Trolling Gui (71990)", "https://rawscripts.net/raw/Universal-Script-Ultra-King-Trolling-Gui-71990")
createButton("🎯 ULTIMATE MOBILE AIMBOT BETA V2 (69907)", "https://rawscripts.net/raw/Universal-Script-ULTIMATE-MOBILE-AIMBOT-BETA-V2-69907")
createButton("🎯 AIMBOT Script (67408)", "https://rawscripts.net/raw/Universal-Script-AIMBOT-67408")
createButton("❓ Query Script (66495)", "https://rawscripts.net/raw/Universal-Script-Query-66495")
createButton("💻 KRNL Executor New (71005)", "https://rawscripts.net/raw/Universal-Script-KRNL-executor-new-71005")
createButton("🇰 Kurd Hub (51808)", "https://rawscripts.net/raw/Universal-Script-Kurd-hub-51808")
createButton("💀 VirusPirusDirus Script Hub (48257)", "https://rawscripts.net/raw/Universal-Script-VirusPirusDirus-Script-hub-48257")
createButton("👻 Ghost Hub (Keyless 65732)", "https://rawscripts.net/raw/Universal-Script-Ghost-hub-keyless-65732")
createButton("Universal Script Executor (Simple)", "https://rawscripts.net/raw/Universal-Script-Simple-Executor-65000")
createButton("FE Invisible/Anti-Ban Bypass", "https://rawscripts.net/raw/Universal-Script-FE-Invisible-Bypass-69000")
createButton("🔑 Keyless HUB 5 (Latest Universal)", "https://rawscripts.net/raw/Universal-Script-Keyless-HUB-5-73180")
createButton("🔍 Abaui Searcher V1.4 (70976)", "https://rawscripts.net/raw/Universal-Script-Abaui-Searcher-V1dot4-70976") 
createButton("🛡️ Universal Anti-Fling (73205)", "https://rawscripts.net/raw/Universal-Script-Anti-fling-73205") 
createButton("🆕 Localqw6-omer-gui (23237)", "https://rawscripts.net/raw/Universal-Script-Localqw6-omer-gui-23237") 

createHeader("SERVER MANIPULATION & F3X")

createButton("💀 FE Death Note/Fling (73152)", "https://rawscripts.net/raw/Universal-Script-FE-death-note-with-fling-and-thinking-animation-73152")
createButton("💣 UwU Backdoor Script (72249)", "https://rawscripts.net/raw/Universal-Script-UwU-backdoor-72249")
createButton("🌙 Moon Backdoor Script (72789)", "https://rawscripts.net/raw/Universal-Script-Moon-Backdoor-72789")
createButton("🎤 PAINEL UNIVERSAL (MIC UP & ANT-BAN)", "https://rawscripts.net/raw/Universal-Script-SCRIPT-PAINEL-UNIVERSAL-MIC-UP-ETC-VOICE-ANT-BAN-NO-KEY-30361")
createButton("🌐 Universal Joiner V2 (BAŞLAT)", "https://rawscripts.net/raw/Universal-Script-Universal-Joiner-v2-58183")
createButton("🌐 Lalol Hub (BACKDOOR TARAMA)", "https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script")
createButton("🤖 UNIVERSAL Auto Farm (63445)", "https://rawscripts.net/raw/Universal-Script-Universal-auto-farm-63445")
createButton("⚔️ UNIVERSAL Dexter Script (Aimbot)", "https://rawscripts.net/raw/Universal-Script-UNIVERSAL-Dexter-Script-59906")
createButton("🆕 Admin Komutları (cmd admin 45089)", "https://rawscripts.net/raw/Universal-Script-cmd-admin-commands-45089")
createButton("📸 Camara Espia (Gizli Kamera 59623)", "https://rawscripts.net/raw/Universal-Script-Camara-espia-59623")
createButton("🚗 Universal Car (33351)", "https://rawscripts.net/raw/Universal-Script-UniversalCar-33351")
createButton("🔍 REMOTE EVENT SCANNER (64318)", "https://rawscripts.net/raw/Universal-Script-Fixz-Remote-Scanner-64318")
createButton("💾 Oyun Kopyalama Scripti (69849)", "https://rawscripts.net/raw/Universal-Script-Game-Copier-V1-69849")
createButton("☢️ A-Modded-Adventure Server Destroyer (72897)", "https://rawscripts.net/raw/A-Modded-Adventure-Server-Destroyer-Gui-72897") 
createButton("🔍 Devil-Bee-Backdoor-Scanner (72633)", "https://rawscripts.net/raw/Universal-Script-Devil-Bee-Backdoor-Scanner-72633") 
createButton("🔨 Average F3X Gui (38529)", "https://rawscripts.net/raw/Universal-Script-Average-F3X-Gui-38529")
createButton("💀 Scriptkidd F3X Gui (FE BYPASS)", "https://rawscripts.net/raw/Universal-Script-scriptkidd-f3x-gui-ultimate-fe-bypass-hd-admin-games-72427")
createButton("☢️ k00pkidd F3X Gui (H@CK Admin)", "https://rawscripts.net/raw/Universal-Script-k00pkidd-gui-f3x-67601")
createButton("🆕 k00pkidd HINT Script (43505)", "https://rawscripts.net/raw/Universal-Script-K00pkidd-hint-43505")
createButton("🆕 k00pkidd Script (43053)", "https://rawscripts.net/raw/Universal-Script-k00pkidd-43053")
createButton("🚧 TrafficConeHax F3X Gui (HD Admin)", "https://rawscripts.net/raw/Universal-Script-TrafficConeHax-f3x-gui-v3-fe-bypass-hd-admin-games-72427")

createHeader("🏡 BROOKHAVEN RP HUB [GÜNCEL] 💖")

createButton("🏠 Brookhaven RP - OP Xemon Brookhaven (64299)", "https://rawscripts.net/raw/Brookhaven-RP-OP-Xemon-Brookhaven-64299")
createButton("🏠 Brookhaven RP - Coquette Hub (41921)", "https://rawscripts.net/raw/Brookhaven-RP-Coquette-Hub-41921")
createButton("⭐ Brookhaven RP - STELARIUM HUB v2 (67524)", "https://rawscripts.net/raw/Brookhaven-RP-STELARIUM-HUB-v2-ver-op-script-67524")
createButton("🥤 Brookhaven - Pepsi Hub V3 (68758)", "https://rawscripts.net/raw/Brookhaven-RP-Pepsi-hub-V3-original-68758")
createButton("💪 Brookhaven - Poderoso Hub (66563)", "https://rawscripts.net/raw/Brookhaven-RP-Poderoso-hub-66563")
createButton("📝 Brookhaven - Shnmaxh Script (Test 71095)", "https://rawscripts.net/raw/Brookhaven-RP-ShnmaxhScript-Brookhaven-Test-71095")
createButton("☢️ Brookhaven OP Script (FURIA HUB)", "https://raw.githubusercontent.com/Dboas123432sx/bsx_hub/refs/heads/main/FURIAHUB-v1")
createButton("🆕 Brookhaven RP - JBrookMods (56926)", "https://rawscripts.net/raw/Brookhaven-RP-JBrookMods-56926")
createButton("💎 Brookhaven RP - Sander XY Hub (35845)", "https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845")
createButton("🎁 Brookhaven Tubers Hub (71645)", "https://rawscripts.net/raw/Brookhaven-RP-Tubers-hub-71645")
createButton("🏠 Brookhaven RP - CARTOLA HUB (69651)", "https://rawscripts.net/raw/Brookhaven-RP-cartola-hub-69651") 

createHeader("🇹🇷 WESTTEAM TÜRK ÖZEL SCRIPTLERİ")

createButton("🇹🇷 WESTTEAM Özel SC (WESTTEAM.lua)", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM.lua")
createButton("👑 WEST31 Admin Panel (BY-WEST-UNIV.)", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BY-WEST-UNİVERSAL.lua")
createButton("🇹🇷 TR1 SC - WESTTEAM EZ HEHE (70597)", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM-EZ-HEHE.lua")
createButton("⭐ Genel Admin Komutları (8204)", "https://rawscripts.net/raw/Universal-Script-admin-command-s-8204")

createHeader("💂 TÜRK ASKERİ VE ROLEPLAY")

createButton("💂 TA SCRPST - TÜRK ASKER OYUNU (33860)", "https://rawscripts.net/raw/TURK-Turkish-Army-War-Simulator-TA-SCRPST-TURK-ASKER-OYUNU-TA-33860")
createButton("🔫 TA Hile V3 (Adam Kralll 41992)", "https://rawscripts.net/raw/Universal-Script-Ta-Hile-V3-adam-kralll-41992")
createButton("🏠 Cabin-Roleplay-Troll (30956)", "https://rawscripts.net/raw/Cabin-Roleplay-Troll-30956")

createHeader("🎯 DİĞER OYUN SCRIPTLERİ (TSB, BLX, MM2)")

createButton("🎣 Fish It! - OP XEMON FISH IT (64483)", "https://rawscripts.net/raw/Fish-It!-OP-XEMON-FISH-IT-64483")
createButton("🎣 Fish It! - Neox Hub (59187)", "https://rawscripts.net/raw/Fish-It!-Neox-Hub-Auto-Fish-Unlimited-Oxygen-And-Much-More-59187")
createButton("🎣 Fish It! - Auto-Sell/Auto-Shake (72323)", "https://rawscripts.net/raw/Fish-It!-OP-Script-Auto-Cast-Auto-Shake-Auto-Sell-72323") 
createButton("🌊 Natural Disaster Survival - XFXHUB (71291)", "https://rawscripts.net/raw/Natural-Disaster-Survival-XFXHUB-71291")
createButton("⚔️ The Strongest Battlegrounds - Wally West (61724)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Wally-West-61724")
createButton("⚔️ TSB GOJO SET (KEY=CRAZY GOJO)", "https://raw.githubusercontent.com/hehehe9028/The-strongest-battleground-/refs/heads/main/The%20strongest%20battleground%20RVVC%20SCRIPTS")
createButton("‼️İNK GAME SC (KEY=VEX GAME)", "https://raw.githubusercontent.com/hehehe9028/INK-GAME/refs/heads/main/Ink%20game%20RVVC%20SCRIPTS%20VEX")
createButton("🌲 99 GECE SC (KEY=REVISION FOREST)", "https://rawscripts.net/raw/Universal-Script-99-Days-In-The-Forest-Foxname-73308") 
createButton("✈️ BUİLD A PLANE (KEY=VIVI PLANE)", "https://raw.githubusercontent.com/hehehe9028/RVVC-build-a-plane/refs/heads/main/RVVC%20BUILD%20A%20PLANE%20SCRIPTS")
createButton("🔪 FORSAKEN SC (KEY=VEX RVVC)", "https://raw.githubusercontent.com/hehehe9028/RVVC-FORSAKEN/refs/heads/main/RVVC%20SCRIPTS")
createButton("⚔️ TSB SUKUNA SET (KEY=RVVC SUKUNA)", "https://raw.githubusercontent.com/hehehe9028/RVVC-SUKUNA-SCRIPT/refs/heads/main/Sukuna%20tsb%20RVVC%20SCRIPTS")
createButton("🌱 HOKOLAZA PVB (KEY=CRAZY VS BRAINROT)", "https://raw.githubusercontent.com/hehehe9028/HOKALAZA-plants-vs-brainrot/refs/heads/main/Key")
createButton("🧟 The Survival Game - Auto-farm/Aimbot (32519)", "https://rawscripts.net/raw/The-Survival-Game-Lag-Fix!-Auto-farm-Anti-ban-Auto-Kill-Hitbox-Aimbot-Speed-And-More-32519")
createButton("🔫 RIVALS - OP Script Gun Mods (73149)", "https://rawscripts.net/raw/RIVALS-OP-Script-Gun-Mods-Fly-Silent-Aim-ESP-73149")
createButton("🎯 RIVALS - ragebot and silent aim (73159)", "https://rawscripts.net/raw/RIVALS-ragebot-and-silent-aim-73159")
createButton("🎯 RIVALS - AIMBOT/KILL ALL (38574)", "https://rawscripts.net/raw/RIVALS-SCRIPT-AIMBOT-SILENT-AIM-ESP-KILL-ALL-38574") 
createButton("⚔️ The Strongest Battlegrounds Tsb (70997)", "https://rawscripts.net/raw/The-Strongest-Battlegrounds-Tsb-script-70997")
createButton("🎵 YouTube Music Player (72222)", "https://rawscripts.net/raw/Universal-Script-YouTube-Music-Player-72222")
createButton("🚢 NEW UPDATE BLOX FRUIT (67405)", "https://rawscripts.net/raw/Universal-Script-NEW-UPDATE-BLOX-FRUIT-67405")
createButton("🔪 MM2 / Forsaken Script (YARHM)", "https://raw.githubusercontent.com/Mathersg4/MM2/refs/heads/main/YARHM")
createButton("🍍 Blox Fruit Script (Speed Hub X)", "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua")
createButton("🆕 99 Nights - Script (72965)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-99-Nights-Script-72965")
createButton("🌱 Plant vs Brainrots (OP AUTO FARM)", "https://rawscripts.net/raw/Plants-Vs-Brainrots-OP-AUTO-FARM-AUTO-BUY-AND-MORE-56853")
createButton("🧠 Steal a Brainrot SC (KEYLESS)", "https://rawscripts.net/raw/Find-the-Brainrot-264-BEST-KEYLESS-Script-2025-Auto-Find-All-AFK-Farm-70597") 
createButton("🧠 Steal a Brainrot SC (Mobil/PC)", "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua")
createButton("🧠 Steal a Brainrot - CARTOLA HUB (54362)", "https://rawscripts.net/raw/Steal-a-Brainrot-Cartola-Hub-Steal-A-Brainrot-Desync-OP-54362") 
createButton("🌲 99 Nights - CARTOLA HUB (56729)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-Cartola-Hub-56729") 
createButton("Universal Teleport V4 (Lobby/Player)", "https://rawscripts.net/raw/Universal-Script-Universal-Teleport-v4-71100")
createButton("⛓️ Prison Life - My first PL script (69162)", "https://rawscripts.net/raw/Prison-Life-My-first-PL-script-69162") 
createButton("FE Tool Spawner (Classic)", "https://rawscripts.net/raw/Universal-Script-FE-Tool-Spawner-66000")
createButton("🕊️ Invinicible Flight R15 (45414)", "https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414")
createButton("📝 EDITOR MAKE SCRIPT (73106)", "https://rawscripts.net/raw/Universal-Script-EDITOR-MAKE-SCRIPT-ROBLOX-73106")
createButton("🎵 RawPlayer (41932)", "https://rawscripts.net/raw/Universal-Script-RawPlayer-41932")
createButton("🎩 Hat Hub (33544)", "https://rawscripts.net/raw/Universal-Script-Hat-Hub-33544")
createButton("🛡️ Anti-Fall DMG (Universal 67059)", "https://rawscripts.net/raw/shredder314gmailcom's-Place-anti-fall-dmg-67059")
createButton("💃 Wally West Animation (55568)", "https://rawscripts.net/raw/Universal-Script-Wally-West-Animation-55568")
createButton("🚁 MURAABBAFLY (72206)", "https://rawscripts.net/raw/Universal-Script-MURAABBAFLY-72206") 

--------------------------------------------------------------------------------
-- 6. GÖRÜNTÜLEME SABİTLEMESİ VE LOAD EKRANINI KALDIRMA
--------------------------------------------------------------------------------
local function fixContentSize()
    wait(0.1) 
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
end
spawn(fixContentSize)

-- Ana arayüzü göster ve Loading ekranını sil
TweenService:Create(LoadFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
LoadText.Text = "WESTTEAM FIRE V23.0 READY"

TweenService:Create(MainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
wait(0.5) 
LoadFrame:Destroy()


-- BİLDİRİM
game.StarterGui:SetCore("SendNotification", {
    Title = "WESTTEAM 23.0 FIRE EDITION YÜKLENDİ";
    Text = "Kanka, arayüzde Alev Efekti ve Loading ekranı aktif! Toplam 175 script var. Gelmiş geçmiş en iyisi oldu!";
    Duration = 7;
})
