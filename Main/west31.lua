-- Servisleri Tanımla
local Player = game.Players.LocalPlayer
local FAST_SPEED = 50
local NORMAL_SPEED = 16
local isSpeedActive = false

-- Ana Fonksiyonlar
local function toggleSpeed()
    isSpeedActive = not isSpeedActive
    local Humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid")
    if Humanoid then
        Humanoid.WalkSpeed = isSpeedActive and FAST_SPEED or NORMAL_SPEED
    end
    return isSpeedActive 
end

local function loadCMDS()
    print("CMDS Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-cmd-admin-commands-45089"))()
    print("CMDS Betiği Çalıştırıldı!")
    return false 
end

local function loadBackdoorScanner()
    print("BACKDOOR SCANNER Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-VoidWare-61179"))()
    print("BACKDOOR SCANNER Betiği Çalıştırıldı!")
    return false 
end

local function loadWestteamScanner()
    print("WESTTEAM BACKDOOR SCANNER Yükleniyor...")
    loadstring(game:HttpGet("https://gist.githubusercontent.com/aykolb89-collab/8b39e974d669ecded56b7fe036fcc6da/raw/77d113979c54bb9d6a3d7a645ce1fe401b6907fe/WESTTEAM-BACKDOOR-SCANNER"))()
    print("WESTTEAM BACKDOOR SCANNER Betiği Çalıştırıldı!")
    return false 
end

local function loadTpBar()
    print("TP BAR Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tp-menu-65222"))()
    print("TP BAR Betiği Çalıştırıldı!")
    return false 
end

local function loadWISL()
    print("WİSL Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-wisI-Universal-Project-55036"))()
    print("WİSL Betiği Çalıştırıldı!")
    return false 
end

local function loadAimbot()
    print("UNIVERSAL AIMBOT+ Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-scoot-ui-lib-62317"))()
    print("UNIVERSAL AIMBOT+ Betiği Çalıştırıldı!")
    return false 
end

local function loadKenger()
    print("Steal A Brainrot KENGER Yükleniyor...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iw929wiwiw/KenGerHub/refs/heads/main/Anti%20Hit"))()
    print("Steal A Brainrot KENGER Betiği Çalıştırıldı!")
    return false 
end

local function loadWestteamProX()
    print("WESTTEAM PRO X EXECUTOR Yükleniyor...")
    loadstring(game:HttpGet("https://gist.githubusercontent.com/aykolb89-collab/7a7d968617bdeaecb5399ce5cf616d9c/raw/f4d7c537ffa3a072b06321fdc34583b29bab7788/WESTTEAM%2520X%2520PRO.lua"))()
    print("WESTTEAM PRO X EXECUTOR Betiği Çalıştırıldı!")
    return false 
end

local function loadGrowAGardenXE()
    print("GROW A GARDEN XE Yükleniyor...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-xyzs/GAG/refs/heads/main/GrowAGardenXE"))()
    print("GROW A GARDEN XE Betiği Çalıştırıldı!")
    return false 
end

local function loadLALOLScanner()
    print("LALOL HUB BACKDOOR SCANNER Yükleniyor...")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
    print("LALOL HUB BACKDOOR SCANNER Betiği Çalıştırıldı!")
    return false 
end

local function loadXPScanner()
    print("XP BACKDOOR SCANNER Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-XP-Backdoor-Scanner-51591"))()
    print("XP BACKDOOR SCANNER Betiği Çalıştırıldı!")
    return false 
end

local function loadK00pkiddGUI()
    print("k00pkidd HACKER GUİ Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-k00pkidd-43053"))()
    print("k00pkidd HACKER GUİ Betiği Çalıştırıldı!")
    return false 
end

local function loadWESTTEAMHackerGUI()
    print("WESTTEAM HACKER GUİ Yükleniyor...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/WESTTEAM.lua"))()
    print("WESTTEAM HACKER GUİ Betiği Çalıştırıldı!")
    return false 
end

local function loadWESTTEAMAdminPanel()
    print("WESTTEAM ADMİN PANEL CLİENT Yükleniyor...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BY-WEST-UNİVERSAL.lua"))()
    print("WESTTEAM ADMİN PANEL CLİENT Betiği Çalıştırıldı!")
    return false 
end

local function load99Nights()
    print("99 GECE SCRİPTİ KEY YOK! Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/99-Nights-in-the-Forest-Drip-client-in-florest-54121"))() 
    print("99 GECE SCRİPTİ KEY YOK! Betiği Çalıştırıldı!")
    return false 
end

local function loadChilliHub()
    print("STEAL A BRAİNROT CHİLLİ HUB Yükleniyor...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    print("STEAL A BRAİNROT CHİLLİ HUB Betiği Çalıştırıldı!")
    return false 
end

local function loadInfiniteYield()
    print("İNFİNİTE YİELD Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
    print("İNFİNİTE YİELD Betiği Çalıştırıldı!")
    return false 
end

local function loadYARHMMM2()
    print("YARHM MURDER MYSTERY 2 SCRİPT Yükleniyor...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Mathersg4/MM2/refs/heads/main/YARHM", true))()
    print("YARHM MURDER MYSTERY 2 SCRİPT Betiği Çalıştırıldı!")
    return false 
end

local function loadBrookhavenFuria()
    print("BROOKHAVEN FURIA HUB SCRİPT Yükleniyor...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dboas123432sx/bsx_hub/refs/heads/main/FURIAHUB-v1"))()
    print("BROOKHAVEN FURIA HUB SCRİPT Betiği Çalıştırıldı!")
    return false 
end

local function loadSpeedHubBloxFruit()
    print("SPEED HUB BLOX FRUİT SCRİPT Yükleniyor...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
    print("SPEED HUB BLOX FRUİT SCRİPT Betiği Çalıştırıldı!")
    return false 
end

local function loadUglyHubBrainrot()
    print("UGLY HUB STEAL A BRAİNROT Yükleniyor...")
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/53325754de16c11fbf8bf78101c1c881.lua"))()
    print("UGLY HUB STEAL A BRAİNROT Betiği Çalıştırıldı!")
    return false 
end

local function loadKurdHub()
    print("STEAL A BRAİNROT KURD HUB Yükleniyor...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Kurd-hub-51808"))()
    print("STEAL A BRAİNROT KURD HUB Betiği Çalıştırıldı!")
    return false 
end


-- Karakter yeniden yüklendiğinde durumu koruma
Player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    if isSpeedActive then
        character.Humanoid.WalkSpeed = FAST_SPEED
    else
        character.Humanoid.WalkSpeed = NORMAL_SPEED
    end
end)

---------------------------------------
-- GUI OLUŞTURMA KISMI 
---------------------------------------

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ExploitHubGUI"
ScreenGui.Parent = Player:FindFirstChild("PlayerGui") or Player.CharacterAdded:Wait().PlayerGui
ScreenGui.ResetOnSpawn = false

-- Ana Çerçeve (Hub)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 300)
Frame.Position = UDim2.new(0.5, -150, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 1
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Parent = ScreenGui
Frame.Draggable = true 

-- Başlık Çubuğu ve Sürükleme
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 30)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Header.Text = "⚠️ NİHAİ MOBİL HUB (1 MİLYAR PİKSEL) ⚠️"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.Font = Enum.Font.SourceSansBold
Header.TextSize = 14
Header.Parent = Frame

local dragging
local dragStart
local startPosition
Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPosition = Frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if dragging then
			local delta = input.Position - dragStart
			Frame.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
		end
	end
end)

-- Kapatma Butonu
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 20
CloseButton.Parent = Frame
CloseButton.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Ana Özellikler Çerçevesi
local FeaturesFrame = Instance.new("Frame")
FeaturesFrame.Size = UDim2.new(1, 0, 1, -30)
FeaturesFrame.Position = UDim2.new(0, 0, 0, 30)
FeaturesFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FeaturesFrame.Parent = Frame

-- **1,000,000,000 PİKSEL KAYDIRMA ÇERÇEVESİ**
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -10, 1, -10)
Scroll.Position = UDim2.new(0, 5, 0, 5)
Scroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Scroll.BorderSizePixel = 0
Scroll.CanvasSize = UDim2.new(0, 0, 0, 1000000000) 
Scroll.Parent = FeaturesFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = Scroll
ListLayout.Padding = UDim.new(0, 5)
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- ÖZELLİK EKLEME FONKSİYONU
local function createToggleFeature(name, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 35)
    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Button.Text = name .. " (KAPALI)"
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 16
    Button.Parent = Scroll
    
    Button.MouseButton1Click:Connect(function()
        local isActive = callback()
        
        -- Tek seferlik komutlar için
        if isActive == false and name ~= "DOKUN VE HIZINI ARTTIR" then
            local originalColor = Button.BackgroundColor3
            Button.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
            Button.Text = name .. " (YÜKLENİYOR...)"
            wait(0.5)
            Button.BackgroundColor3 = originalColor
            Button.Text = name
        end
        
        -- Toggle komutları için
        if isActive == true then
            Button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            Button.Text = name .. " (AÇIK - " .. (name == "DOKUN VE HIZINI ARTTIR" and FAST_SPEED or "ON") .. ")"
        elseif isActive == false and name == "DOKUN VE HIZINI ARTTIR" then
            Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            Button.Text = name .. " (KAPALI)"
        end
    end)
    return Button
end

-- ÖZELLİKLERİ EKLE
createToggleFeature("🗺️ STEAL A BRAİNROT KURD HUB", loadKurdHub)
createToggleFeature("🌀 SPEED HUB BLOX FRUİT SCRİPT", loadSpeedHubBloxFruit)
createToggleFeature("🤢 UGLY HUB STEAL A BRAİNROT", loadUglyHubBrainrot)
createToggleFeature("🔪 YARHM MURDER MYSTERY 2 SCRİPT", loadYARHMMM2)
createToggleFeature("🏡 BROOKHAVEN FURIA HUB SCRİPT", loadBrookhavenFuria)
createToggleFeature("♾️ İNFİNİTE YİELD", loadInfiniteYield)
createToggleFeature("🔥 99 GECE SCRİPTİ KEY YOK!", load99Nights)
createToggleFeature("🌶️ MOBİL STEAL A BRAİNROT CHİLLİ HUB", loadChilliHub)
createToggleFeature("🌶️ PC STEAL A BRAİNROT CHİLLİ HUB", loadChilliHub)
createToggleFeature("👑 WESTTEAM ADMİN PANEL CLİENT", loadWESTTEAMAdminPanel)
createToggleFeature("⚡ WESTTEAM HACKER GUİ", loadWESTTEAMHackerGUI)
createToggleFeature("💻 XP BACKDOOR SCANNER", loadXPScanner)
createToggleFeature("☠️ k00pkidd HACKER GUİ", loadK00pkiddGUI)
createToggleFeature("🚨 LALOL HUB BACKDOOR SCANNER", loadLALOLScanner)
createToggleFeature("🌱 GROW A GARDEN XE", loadGrowAGardenXE)
createToggleFeature("🔥 WESTTEAM PRO X EXECUTOR", loadWestteamProX)
createToggleFeature("🧠 Steal A Brainrot KENGER", loadKenger) 
createToggleFeature("🎯 UNİVERSAL AİMBOT+", loadAimbot) 
createToggleFeature("🔍 WESTTEAM BACKDOOR SCANNER", loadWestteamScanner)
createToggleFeature("🔍 BACKDOOR SCANNER", loadBackdoorScanner)
createToggleFeature("🎮 CMDS", loadCMDS) 
createToggleFeature("🗺️ TP BAR", loadTpBar)
createToggleFeature("🌌 WİSL", loadWISL)
createToggleFeature("DOKUN VE HIZINI ARTTIR", toggleSpeed) 
createToggleFeature("Ana Merkeze Işınlan", function() 
    local targetPosition = Vector3.new(0, 100, 0)
    local HRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if HRP then
        HRP.CFrame = CFrame.new(targetPosition)
        print("Merkeze Işınlandı")
    end
    return false 
end)

print("Hub başlatıldı.")
