-- Servisler ve Temel Ayarlar (Değişmedi)
local Player = game.Players.LocalPlayer
local FAST_SPEED = 50
local NORMAL_SPEED = 16
local isSpeedActive = false

-- TEMEL FONKSİYONLAR (Değişmedi)
local function toggleSpeed()
    isSpeedActive = not isSpeedActive
    local Humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid")
    if Humanoid then
        Humanoid.WalkSpeed = isSpeedActive and FAST_SPEED or NORMAL_SPEED
    end
    return isSpeedActive 
end

local function loadFullModule(Scroll)
    print("Tüm Modül Yükleniyor...")
    -- BURAYA YENİ RAW URL YAPILDI: https://pastebin.com/raw/7JL2Xg9k
    local moduleUrl = "https://pastebin.com/raw/7JL2Xg9k" 
    
    local success, moduleFunction = pcall(function()
        -- Modülü internetten çek ve çalıştırılabilir bir fonksiyon döndür
        return loadstring(game:HttpGet(moduleUrl))()
    end)
    
    if success and type(moduleFunction) == 'function' then
        -- Modül fonksiyonunu, butonları yerleştireceği ScrollFrame ile çağır
        moduleFunction(Scroll)
        print("Tüm Script Modülü Başarıyla Yüklendi! Artık tüm 20+ buton ekranda.")
    else
        -- Hata durumunda (Raw URL silinmiş/hatalıysa)
        warn("Hata: Script Modülü Yüklenemedi. Lütfen internet bağlantınızı ve Raw URL'yi kontrol edin.")
    end
    return false
end

-- Karakter yeniden yüklendiğinde durumu koruma (Değişmedi)
Player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    if isSpeedActive then
        character.Humanoid.WalkSpeed = FAST_SPEED
    else
        character.Humanoid.WalkSpeed = NORMAL_SPEED
    end
end)

---------------------------------------
-- MINI GUI OLUŞTURMA KISMI (Değişmedi)
---------------------------------------

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ExploitHubGUI"
ScreenGui.Parent = Player:FindFirstChild("PlayerGui") or Player.CharacterAdded:Wait().PlayerGui
ScreenGui.ResetOnSpawn = false

-- Ana Çerçeve (Hub) (Değişmedi)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 300)
Frame.Position = UDim2.new(0.5, -150, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 1
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Parent = ScreenGui
Frame.Draggable = true 

-- Başlık, Kapatma ve Sürükleme Kodları
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 30)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Header.Text = "⚠️ NİHAİ MOBİL HUB (MODÜLER - KISA) ⚠️"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.Font = Enum.Font.SourceSansBold
Header.TextSize = 14
Header.Parent = Frame
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

-- Ana Özellikler Çerçevesi (Değişmedi)
local FeaturesFrame = Instance.new("Frame")
FeaturesFrame.Size = UDim2.new(1, 0, 1, -30)
FeaturesFrame.Position = UDim2.new(0, 0, 0, 30)
FeaturesFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FeaturesFrame.Parent = Frame

-- KAYDIRMA ÇERÇEVESİ (Değişmedi)
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

-- ÖZELLİK EKLEME FONKSİYONU (Değişmedi)
local function createToggleFeature(name, callback, isToggle)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 35)
    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Button.Text = name .. (isToggle and " (KAPALI)" or "")
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 16
    Button.Parent = Scroll
    
    Button.MouseButton1Click:Connect(function()
        if isToggle then
            local isActive = callback()
            if isActive == true then
                Button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
                Button.Text = name .. " (AÇIK - " .. FAST_SPEED .. ")"
            else
                Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                Button.Text = name .. " (KAPALI)"
            end
        else
            callback()
        end
    end)
    return Button
end

-- TEMEL BUTONLAR
createToggleFeature("DOKUN VE HIZINI ARTTIR", toggleSpeed, true) 
createToggleFeature("Ana Merkeze Işınlan", function() 
    local targetPosition = Vector3.new(0, 100, 0)
    local HRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if HRP then
        HRP.CFrame = CFrame.new(targetPosition)
        print("Merkeze Işınlandı")
    end
end, false)
-- TÜM DİĞER SCRİPTLERİ YÜKLEYEN BUTON (LOADER)
createToggleFeature("⬇️ TÜM DİĞER SCRİPT'LERİ YÜKLE", function() loadFullModule(Scroll) end, false)

print("Mini Hub Başlatıldı. Tam modülü yüklemek için butona tıklayın.")
