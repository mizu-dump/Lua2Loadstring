--[[ 
    WESTTEAM PREMİUM VERSİON 33.1 (CUSTOM NOTIFICATIONS EDITION)
    Password Verified: Aykol_123 (Batuhan Aykol)
    VERSION 33.1 CRITICAL FIXES & ENHANCEMENTS: 
    - CRITICAL: Notifications updated to custom, non-personal, and aggressive messages as requested. (Removed Zonguldak/Shipping references from notifications).
    - ULTRA SEARCH: Still using highly reliable, case-insensitive substring search (string.find).
    - FULL RGB: Dynamic RGB Aesthetic is preserved.
    - FEATURE: All previous scripts preserved.
    
    USER RESPONSIBILITY DISCLAIMER:
    The user is solely responsible for any consequences (e.g., bans) arising from the use of these scripts.
    The Gemini team is not responsible for any bans or negative outcomes.
--]]

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--------------------------------------------------------------------------------
-- UTILITY FUNCTION & CORE SETUP
--------------------------------------------------------------------------------
local OOF_SOUND_ID = 1847661821 
local isMinimized = false
local defaultPosition = UDim2.new(0.5, -300, 0.5, -220)
local minimizedPosition = UDim2.new(1, -120, 1, -50)
local allScripts = {} 
local isFiltering = false
local currentGlamourScriptIndex = 0
local TOTAL_SCRIPTS = 205 

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
-- 0. LOADİNG EKRANI (FULL RGB EFFECT)
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
LoadFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadFrame.BackgroundTransparency = 0.1

local LoadText = Instance.new("TextLabel")
LoadText.Parent = LoadFrame
LoadText.Size = UDim2.new(1, 0, 0, 50)
LoadText.Position = UDim2.new(0, 0, 0.5, -25)
LoadText.BackgroundTransparency = 1
LoadText.Font = Enum.Font.Code
LoadText.Text = "WESTTEAM LOADING..."
LoadText.TextColor3 = Color3.fromRGB(255, 0, 0) -- Başlangıç Kırmızı
LoadText.TextSize = 30

local LoadStroke = Instance.new("UIStroke")
LoadStroke.Parent = LoadFrame
LoadStroke.Thickness = 5
LoadStroke.LineJoinMode = Enum.LineJoinMode.Miter 
LoadStroke.Color = Color3.fromRGB(255, 0, 255) 
LoadStroke.Transparency = 0.0

local function animateLoading()
    local startTime = tick()
    while tick() - startTime < 3 do 
        local cycle = (tick() * 2) % 1
        local rgbColor = Color3.fromHSV(cycle, 1, 1) 
        
        LoadText.TextColor3 = rgbColor
        LoadStroke.Color = rgbColor
        LoadFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0):Lerp(rgbColor, 0.05) 
        wait(0.03)
    end
end
spawn(animateLoading)

wait(3) 

--------------------------------------------------------------------------------
-- 1. ARAYÜZ OLUŞTURMA (GUI SETUP - FULL RGB THEME)
--------------------------------------------------------------------------------
local ScreenGui = LoadingGui 
local MainFrame = Instance.new("Frame")
local GlamourFrame = Instance.new("Frame") 
local TitleBar = Instance.new("Frame") 
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton") 
local MinimizeButton = Instance.new("TextButton")
local SearchBar = Instance.new("TextBox") 
local ContentFrame = Instance.new("ScrollingFrame")
local Padding = Instance.new("UIPadding")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 1 
MainFrame.Position = defaultPosition
MainFrame.Size = UDim2.new(0, 600, 0, 440) 
MainFrame.ClipsDescendants = false 
MainFrame.Active = true

-- GÖRÜNÜR İÇ ÇERÇEVESİ (Full RGB Background)
GlamourFrame.Name = "GlamourFrame"
GlamourFrame.Parent = MainFrame
GlamourFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) 
GlamourFrame.BackgroundTransparency = 0.0
GlamourFrame.Position = UDim2.new(0, 0, 0, 0)
GlamourFrame.Size = UDim2.new(1, 0, 1, 0)
GlamourFrame.Active = true 
GlamourFrame.Selectable = true 

-- RGB EFEKTİ GÖLGELENDİRME (Stroke)
local UiStroke = Instance.new("UIStroke")
UiStroke.Parent = GlamourFrame
UiStroke.Thickness = 3 
UiStroke.LineJoinMode = Enum.LineJoinMode.Miter 
UiStroke.Color = Color3.fromRGB(255, 0, 255) 
UiStroke.Transparency = 0.0 

-- BAŞLIK ÇUBUĞU (RGB)
TitleBar.Name = "TitleBar"
TitleBar.Parent = GlamourFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.Position = UDim2.new(0, 0, 0, 0)

-- BAŞLIK (RGB)
Title.Name = "Title"
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Size = UDim2.new(0.5, 0, 0, 25) 
Title.Font = Enum.Font.Code 
Title.Text = "WESTTEAM: OMEGA V33.1 ✨ CUSTOM NOTIFS & RGB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255) 
Title.TextSize = 14 
Title.TextXAlignment = Enum.TextXAlignment.Left

-- KAPATMA BUTONU (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0) 
CloseButton.BackgroundTransparency = 0.0
CloseButton.Position = UDim2.new(1, -40, 0, 5) 
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
    
    -- 2. Bildirim: Script Kapanırken
    game.StarterGui:SetCore("SendNotification", {
        Title = "WESTTEAM 33.1 KAPANDI";
        Text = "Ah Be Reis Bu Kadar Çabukmu Terk Ettin Bizi Ayıp Değilmi🥺";
        Duration = 5;
    })
    
    ScreenGui:Destroy() 
end)

-- MINIMIZE BUTONU (-)
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TitleBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
MinimizeButton.BackgroundTransparency = 0.0
MinimizeButton.Position = UDim2.new(1, -75, 0, 5) 
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
        targetSize = UDim2.new(0, 100, 0, 35)
        targetPos = minimizedPosition
        targetAlpha = 0.5
        Title.Text = "WESTTEAM 33.1 🔥"
        Title.TextSize = 12
        Title.Position = UDim2.new(0, 5, 0, 5)
        MinimizeButton.Text = "+"
        CloseButton.Visible = false
        ContentFrame.Visible = false
        SearchBar.Visible = false
    else
        targetSize = UDim2.new(0, 600, 0, 440)
        targetPos = defaultPosition
        targetAlpha = 0.0
        Title.Text = "WESTTEAM: OMEGA V33.1 ✨ CUSTOM NOTIFS & RGB"
        Title.TextSize = 14
        Title.Position = UDim2.new(0, 10, 0, 5)
        MinimizeButton.Text = "-"
        CloseButton.Visible = true
        ContentFrame.Visible = true
        SearchBar.Visible = true
    end
    
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = targetSize, Position = targetPos}):Play()
    TweenService:Create(GlamourFrame, TweenInfo.new(0.3), {BackgroundTransparency = targetAlpha}):Play()
end)

-- ARAMA ÇUBUĞU TANIMLAMASI (RGB)
SearchBar.Name = "SearchBar"
SearchBar.Parent = GlamourFrame
SearchBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20) 
SearchBar.BackgroundTransparency = 0.0
SearchBar.Position = UDim2.new(0, 10, 0, 45) 
SearchBar.Size = UDim2.new(1, -20, 0, 25)
SearchBar.Font = Enum.Font.Code
SearchBar.Text = "" 
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.PlaceholderText = "ULTRA SEARCH (örn: admin, tycoon, fe, keyless)"
SearchBar.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
SearchBar.TextSize = 14
SearchBar.ClearTextOnFocus = true
SearchBar.ZIndex = 5

-- ARAMA ÇUBUĞU RGB SÜSLEMESİ İÇİN ALAN
local SearchAesthetic = Instance.new("Frame")
SearchAesthetic.Parent = SearchBar
SearchAesthetic.Size = UDim2.new(1, 0, 1, 0)
SearchAesthetic.BackgroundTransparency = 1

local SearchStroke = Instance.new("UIStroke")
SearchStroke.Parent = SearchAesthetic
SearchStroke.Thickness = 2
SearchStroke.LineJoinMode = Enum.LineJoinMode.Miter 
SearchStroke.Color = Color3.fromRGB(0, 255, 255) 
SearchStroke.Transparency = 0.0

--------------------------------------------------------------------------------
-- 2. KAYDIRMA ALANI (SCROLLING FRAME)
--------------------------------------------------------------------------------
ContentFrame.Name = "Content"
ContentFrame.Parent = GlamourFrame
ContentFrame.Active = true
ContentFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10) 
ContentFrame.BackgroundTransparency = 0.0
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 10, 0, 80) 
ContentFrame.Size = UDim2.new(1, -20, 1, -90)
ContentFrame.ScrollBarThickness = 8 
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 255) 
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
-- 3. FONKSİYONLAR (ANİMASYON & ULTRA SEARCH)
--------------------------------------------------------------------------------
local function animateAesthetic()
    RunService.Heartbeat:Connect(function()
        if not MainFrame.Parent then return end
        
        local cycle = (tick() * 1.0) % 1 
        local rgbColor = Color3.fromHSV(cycle, 1, 1) 
        
        -- FULL RGB Arayüz Estetiği
        UiStroke.Color = rgbColor
        Title.TextColor3 = rgbColor
        TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30):Lerp(rgbColor, 0.1) 
        GlamourFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15):Lerp(rgbColor, 0.05)
        
        -- RGB Search Bar Estetiği
        SearchStroke.Color = rgbColor
        SearchBar.TextColor3 = rgbColor
        
        -- Buton Estetiği
        for i, scriptData in ipairs(allScripts) do
            local element = scriptData.element
            if element:IsA("TextButton") then
                local offset = (i * 0.005) % 1
                local btnCycle = (cycle + offset) % 1
                local buttonColor = Color3.fromHSV(btnCycle, 1, 1)
                
                local line = element:FindFirstChild("aestheticLine")
                if line then 
                    line.BackgroundColor3 = buttonColor
                end
            elseif scriptData.type == "header" then
                 local headerColor = Color3.fromHSV((cycle + 0.5) % 1, 1, 1) 
                 element.TextColor3 = headerColor
            end
        end
    end)
end
spawn(animateAesthetic)

-- SÜRÜKLEME KODU (DRAG - GLAMOURFRAME DAHİL)
local dragging = false
local dragStart
local startPos

local function startDrag(input)
    if not isMinimized and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        if input.Target == TitleBar or input.Target.Parent == TitleBar or input.Target == GlamourFrame or input.Target.Parent == GlamourFrame then 
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
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

TitleBar.InputBegan:Connect(startDrag) 
GlamourFrame.InputBegan:Connect(startDrag) 
UserInputService.InputChanged:Connect(doDrag)
UserInputService.InputEnded:Connect(endDrag) 

-- ULTRA SEARCH (Basit ve Kapsayıcı SubString Arama)
local function ultraFilterScripts(searchText)
    local lowerSearchText = string.lower(searchText)
    local searchLength = #lowerSearchText
    
    if searchLength == 0 then
        -- Arama metni boşsa, her şeyi görünür yap
        for i, scriptData in ipairs(allScripts) do
            scriptData.element.Visible = true
        end
    else
        -- Başlık referanslarını ayarla (Adım 0)
        local currentHeaderData = nil
        for i, scriptData in ipairs(allScripts) do
            if scriptData.type == "header" then
                currentHeaderData = scriptData
            else 
                scriptData.headerData = currentHeaderData
            end
        end
        
        -- Adım 1: Scriptleri filtrele (İçerik Eşleşmesi)
        local visibleHeaders = {}
        
        for i, scriptData in ipairs(allScripts) do
            local element = scriptData.element
            local isHeader = (scriptData.type == "header")
            
            if not isHeader then 
                local lowerScriptText = string.lower(scriptData.text)
                local visible = false
                
                -- ULTRA SEARCH: Metnin herhangi bir yerinde büyük/küçük harf duyarsız eşleşme
                if string.find(lowerScriptText, lowerSearchText, 1, true) then 
                    visible = true
                end
                
                element.Visible = visible
                
                if visible and scriptData.headerData then
                    -- Script görünüyorsa, ait olduğu başlığın görünür olması gerektiğini işaretle
                    visibleHeaders[scriptData.headerData] = true 
                end
            end
        end
        
        -- Adım 2: Başlıkları güncelle
        for i, scriptData in ipairs(allScripts) do
            if scriptData.type == "header" then
                if visibleHeaders[scriptData] then
                    -- Altında görünür script varsa başlığı görünür yap
                    scriptData.element.Visible = true
                else
                    -- Altında görünür script yoksa başlığı gizle
                    scriptData.element.Visible = false
                end
            end
        end
    end
    
    -- Canvas boyutunu güncelle
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    wait(0.01) 
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    isFiltering = false
end

-- Input Debounce Logic
local lastInputTime = tick()
local debounceDelay = 0.05 

SearchBar.Changed:Connect(function()
    lastInputTime = tick()
    if isFiltering then return end
    
    isFiltering = true
    spawn(function()
        local myInputTime = lastInputTime
        wait(debounceDelay)
        
        if myInputTime == lastInputTime then
            ultraFilterScripts(SearchBar.Text)
        else
            isFiltering = false 
        end
    end)
end)


--------------------------------------------------------------------------------
-- 4. BUTON EKLEME FONKSİYONLARI 
--------------------------------------------------------------------------------
local function createButton(text, url)
    currentGlamourScriptIndex = currentGlamourScriptIndex + 1
    
    local btn = Instance.new("TextButton")
    btn.Parent = ContentFrame
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
    btn.BackgroundTransparency = 0.0 
    btn.Size = UDim2.new(1, 0, 0, 30) 
    btn.Font = Enum.Font.Code
    btn.Text = "🌟[" .. currentGlamourScriptIndex .. "/" .. TOTAL_SCRIPTS .. "] " .. string.upper(text) .. " >> EXECUTE" 
    btn.TextColor3 = Color3.fromRGB(255, 255, 255) 
    btn.TextSize = 13
    btn.AutoButtonColor = false
    btn.ZIndex = 5
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Visible = true 
    
    local aestheticLine = Instance.new("Frame")
    aestheticLine.Name = "aestheticLine"
    aestheticLine.Parent = btn
    aestheticLine.BackgroundColor3 = Color3.fromRGB(255, 0, 255) 
    aestheticLine.BackgroundTransparency = 0.0 
    aestheticLine.Size = UDim2.new(1, 0, 0, 1) 
    aestheticLine.Position = UDim2.new(0, 0, 1, -1)
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
        btn.TextColor3 = Color3.fromRGB(255, 200, 0) 
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    btn.MouseButton1Click:Connect(function()
        local clickEffect = TweenService:Create(btn, TweenInfo.new(0.05), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)})
        clickEffect:Play()
        wait(0.05)
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
        
        pcall(function() 
            loadstring(game:HttpGet(url, true))() 
        end)
    end)
    
    -- Script verisini tabloya ekle
    table.insert(allScripts, {text = btn.Text, element = btn, type = "button"})
    
    return btn
end

local function createHeader(text)
    local header = Instance.new("TextLabel")
    header.Parent = ContentFrame
    header.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
    header.BackgroundTransparency = 0.0
    header.Size = UDim2.new(1, 0, 0, 20) 
    header.Font = Enum.Font.Code
    header.Text = ">>> 🌟 " .. string.upper(text) .. " 🌟 <<<" 
    header.TextColor3 = Color3.fromRGB(255, 255, 255) 
    header.TextSize = 12
    header.BorderSizePixel = 0
    header.Visible = true 
    
    -- Header verisini tabloya ekle
    table.insert(allScripts, {text = text, element = header, type = "header"})
    
    return header
end

--------------------------------------------------------------------------------
-- 5. TÜM ÖZELLİKLER (205+ ADET SCRIPT - GÜNCELLENMİŞ TAM LİSTE)
--------------------------------------------------------------------------------

createHeader("🚨 KRİTİK EKLENTİLER (4 YENİ SCRIPT EKLENDİ) 🆕")
createButton("🆕 UNIVERSAL SCRIPT - FE ADMIN SERVER REBORN (72951)", "https://rawscripts.net/raw/Universal-Script-FE-admin-server-rebon-by-BlueKidd-works-in-just-baseplate-72951")
createButton("🆕 UNIVERSAL SCRIPT - NAMELESS ADMIN UNIVERSAL (73082)", "https://rawscripts.net/raw/Universal-Script-Nameless-admin-Universal-73082")
createButton("🆕 UNIVERSAL SCRIPT - DESIRE HUB (27747)", "https://rawscripts.net/raw/Universal-Script-Desire-Hub-27747")
createButton("🆕 CUSTOM PC TYCOON! - EZ AUTO FARM (4425)", "https://rawscripts.net/raw/Custom-PC-Tycoon!-ez-auto-farm-4425")
createButton("🌐 UNIVERSAL SCRIPT - TUBERS93 GUI (39932)", "https://rawscripts.net/raw/Universal-Script-tubers93-gui-39932")
createButton("🌐 UNIVERSAL SCRIPT - 4X2X9X4X0 V6 GUI (57588)", "https://rawscripts.net/raw/Universal-Script-4x2x9x4x0-v6-gui-57588")
createButton("🌐 UNIVERSAL SCRIPT - TUBERS93 JUMPSCARE (31279)", "https://rawscripts.net/raw/Universal-Script-Tubers93-jumpscare-31279")
createButton("🌐 UNIVERSAL SCRIPT - TUBERS93 ADMIN (29168)", "https://rawscripts.net/raw/Universal-Script-tubers-93-admin-29168")
createButton("🌐 UNIVERSAL SCRIPT - FIRE THE SERVER (26489)", "https://rawscripts.net/raw/Universal-Script-Fire-the-server-26489")
createButton("🌐 UNIVERSAL SCRIPT - HTTP SPY V2 TOOL (16412)", "https://rawscripts.net/raw/Universal-Script-HTTP-Spy-v2-Tool-16412")
createButton("🧠 BRAINROT - STEAL A BRAINROT PLATFORM (53945)", "https://rawscripts.net/raw/Steal-a-Brainrot-Steal-a-brainrot-Platform-53945")
createButton("🌐 UNIVERSAL SCRIPT - SB (56309)", "https://rawscripts.net/raw/Universal-Script-sb-56309")
createButton("⚔️ SLAP BATTLES - L-HUB (68923)", "https://rawscripts.net/raw/UPDATE-Slap-Battles-L-hub-68923")
createButton("🌐 UNIVERSAL SCRIPT - KELL SCRIPT HUN (58746)", "https://rawscripts.net/raw/Universal-Script-kell-script-hun-58746")
createButton("🌐 UNIVERSAL SCRIPT - C00CLAN V2 (62169)", "https://rawscripts.net/raw/Universal-Script-C00lclan-V2-By-Team-C00lkid-62169")
createButton("🌐 UNIVERSAL SCRIPT - BOBOHEALTHS GUI (60935)", "https://rawscripts.net/raw/Universal-Script-bobohealths-gui-60935")   
createButton("🌐 UNIVERSAL SCRIPT - C00LKIDD EXECUTOR 2025 (61657)", "https://rawscripts.net/raw/Universal-Script-c00lkidd-executor-2025-61657")
createButton("🏠 BROOKHAVEN - C00LKIDD HUB (68611)", "https://rawscripts.net/raw/Brookhaven-C00LKIDD-HUB-68611")
createButton("🏰 TROLL KIDS TOWER - EXPLODE OTHERS (58802)", "https://rawscripts.net/raw/Troll-Kids-Tower-Troll-Kids-Tower-free-product-explode-others-and-gamepass-58802")
createButton("🌲 99 NIGHTS - 99 NIAF KEYLESS (57383)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-99-niaf-keyless-57383")
createButton("🌲 99 NIGHTS - CHIYO (58668)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-Chiyo-58668")
createButton("🌐 UNIVERSAL SCRIPT - NATHUB", "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua")
createButton("🌐 UNIVERSAL SCRIPT - H4XSCRIPTS LOADER", "https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader2.lua")
createButton("🌱 GROW A GARDEN - MAUSCRIPTS OP FARM", "https://raw.githubusercontent.com/nootmaus/GrowAAGarden/refs/heads/main/mauscripts")
createButton("🏠 BROOKHAVEN LUASTYLE OP SCRIPT (OSENGINE)", "https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua")
createButton("🏠 BROOKHAVEN SP HUB (AS6CD0)", "https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven")

createHeader("⚡ V31'DEN KALAN ACİL EKLENTİLER ⚡")
createButton("🆕 UNIVERSAL SCRIPT - HARKEDV (52655)", "https://rawscripts.net/raw/Universal-Script-HarkedV-52655")
createButton("🆕 99 NIGHTS - KAYLAHUB (KEYLESS OP 65968)", "https://rawscripts.net/raw/99-Nights-in-the-Forest-KaylaHub-Keyless-OP-65968")
createButton("🆕 UNIVERSAL SCRIPT - AQUA HUB (61902)", "https://rawscripts.net/raw/Universal-Script-Aqua-Hub-READ-DESCRIPTION-61902")
createButton("🆕 UNIVERSAL SCRIPT - HD ADMİN FLY (60269)", "https://rawscripts.net/raw/Universal-Script-HD-Admin-Fly-60269")
createButton("🆕 UNIVERSAL SCRIPT - OP SCRIPTS HUB (58977)", "https://rawscripts.net/raw/Universal-Script-OpScripts-Hub-58977")
createButton("🆕 UNIVERSAL SCRIPT - DEV. INF. YIELD REMODEL (66921)", "https://rawscripts.net/raw/Universal-Script-Developer-Infinite-Yield-Remodel-66921")
createButton("🆕 UNIVERSAL SCRIPT - NEXORA HUB (ESP NO KEY 73303)", "https://rawscripts.net/raw/Universal-Script-Nexora-hub-esp-no-key-73303")
createButton("🆕 UNIVERSAL SCRIPT - NEW BEST RSPY (69101)", "https://rawscripts.net/raw/Universal-Script-New-best-Rspy-69101")
createButton("🆕 UNIVERSAL SCRIPT - K00PGUI REMAKE OP (72241)", "https://rawscripts.net/raw/Universal-Script-k00pgui-REMAKE-OP-NOT-AN-REQUIRE-72241")
createButton("🌐 UNIVERSAL SCRIPT - VAPA V2 (27017)", "https://rawscripts.net/raw/Universal-Script-VAPA-V2-27017")
createButton("🏠 BROOKHAVEN FE SKYBOX HACK (73292)", "https://rawscripts.net/raw/Brookhaven-RP-Fe-Brookhaven-skybox-script-73292")

createHeader("✨ RC7 VE ADMIN PANEL KOLEKSİYONU 💥")
createButton("👑 Universal Script - Rc7 Executer (73144)", "https://rawscripts.net/raw/Universal-Script-Rc7-Executer-CHECK-DESCRIPTION-73144")
createButton("🔓 Universal Script - Rc7 Backdoor (48369)", "https://rawscripts.net/raw/Universal-Script-Rc7-Backdoor-48369")
createButton("💻 Universal Script - Cracked RC7 (63620)", "https://rawscripts.net/raw/Universal-Script-Cracked-RC7-63620")
createButton("🔴 Universal Script - red RC7 (64423)", "https://rawscripts.net/raw/Universal-Script-red-RC7-64423")
createButton("⚙️ Universal Script - RC7 (56874)", "https://rawscripts.net/raw/Universal-Script-RC7-56874")
createButton("👑 Universal Script - R7J Gui V2 (44042)", "https://rawscripts.net/raw/Universal-Script-R7J-Gui-V2-44042")

createHeader("🚨 V17.0'DAN KALAN EKLENTİLER 🚨")
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

createHeader("🎯 DİĞER OYUN SCRIPTLERİ (TSB, BLX, MM2, SLAP)")

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
LoadText.Text = "WESTTEAM OMEGA V33.1 READY"

TweenService:Create(MainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
wait(0.5) 
LoadFrame:Destroy()

-- 1. Bildirim: Script Açılırken
local playerName = LocalPlayer and LocalPlayer.Name or "Kanka"
game.StarterGui:SetCore("SendNotification", {
    Title = "WESTTEAM 33.1 BAŞLATILDI";
    Text = "Hoşgeldin " .. playerName .. " Beğenirsen Hoş Kalırız🔥Yok Etmeye Başla😏";
    Duration = 7;
})
