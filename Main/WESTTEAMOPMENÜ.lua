-- Servisler ve Temel Ayarlar 
local Player = game.Players.LocalPlayer
local FAST_SPEED = 50
local NORMAL_SPEED = 16
local isSpeedActive = false
local TweenService = game:GetService("TweenService")
local neonColors = {
    Color3.fromRGB(0, 255, 255), 
    Color3.fromRGB(255, 0, 255), 
    Color3.fromRGB(150, 0, 255)  
}
local colorIndex = 1

-- TEMEL FONKSİYONLAR 
local function toggleSpeed()
    isSpeedActive = not isSpeedActive
    local Humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid")
    if Humanoid then
        Humanoid.WalkSpeed = isSpeedActive and FAST_SPEED or NORMAL_SPEED
    end
    return isSpeedActive 
end

-- TÜM SCRİPTLERİ YÜKLEYEN ANA FONKSİYON
local function loadFullModule(Scroll)
    print("Tüm Script Modülü Yükleniyor...")
    
    -- BURASI GÜNCELLENDİ: SENİN EN SON 91 SCRİPTİNİN OLDUĞU YENİ RAW URL'Yİ ÇEKİYOR
    local moduleUrl = "https://pastebin.com/raw/4YDEg4qG" 
    
    local loaderButton = Scroll:FindFirstChild("LoadAllButton")
    if loaderButton then
        loaderButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
        loaderButton.Text = "⬇️ TÜM DİĞER SCRİPT'LERİ YÜKLENİYOR..."
    end

    local success, moduleFunction = pcall(function()
        return loadstring(game:HttpGet(moduleUrl))()
    end)
    
    if success and type(moduleFunction) == 'function' then
        moduleFunction(Scroll)
        print("Tüm Script Modülü Başarıyla Yüklendi! Artık 91 güncel buton ekranda.")
        if loaderButton then
            loaderButton:Destroy() 
        end
    else
        warn("Hata: Script Modülü Yüklenemedi. Mini Hub'ı kullanın.")
        if loaderButton then
            loaderButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
            loaderButton.Text = "❌ YÜKLEME BAŞARISIZ! TEKRAR DENE"
            wait(2)
            loaderButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            loaderButton.Text = "⬇️ TÜM DİĞER SCRİPT'LERİ YÜKLE"
        end
    end
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
-- MINI GUI OLUŞTURMA KISMI (RGB Neon)
---------------------------------------

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ExploitHubGUI"
ScreenGui.Parent = Player:FindFirstChild("PlayerGui") or Player.CharacterAdded:Wait().PlayerGui
ScreenGui.ResetOnSpawn = false

-- Ana Çerçeve (Hub) (Neon Animasyonlu)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 300)
Frame.Position = UDim2.new(0.5, -150, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 3 
Frame.BorderColor3 = neonColors[1] 
Frame.Parent = ScreenGui
-- Frame.Draggable = true # Sürükleme başlık üzerinden yapılacak

-- Başlık, Kapatma ve Sürükleme Kodları
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 30)
Header.Position = UDim2.new(0, 0, 0, 0)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Header.Text = "WESTTEAM OP MENÜ (91 ÖZELLİK)" -- BAŞLIK VE SAYI GÜNCELLENDİ
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.Font = Enum.Font.SourceSansBold
Header.TextSize = 14
Header.Parent = Frame

-- RGB ANIMASYON BAŞLANGICI
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true, 0)

local function animateColor()
    local nextIndex = colorIndex % #neonColors + 1
    local nextColor = neonColors[nextIndex]
    local tween = TweenService:Create(Frame, tweenInfo, {BorderColor3 = nextColor})
    tween:Play()
    colorIndex = nextIndex
end

coroutine.wrap(function()
    while Frame.Parent do
        animateColor()
        wait(1.5)
    end
end)()
-- RGB ANIMASYON SONU

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

-- SÜRÜKLEME DÜZELTİLMİŞ KOD (Başlık üzerinden)
local dragging, dragStart, startPosition
local UserInputService = game:GetService("UserInputService")

Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPosition = Frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		Frame.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
	end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
end)

-- Ana Özellikler Çerçevesi
local FeaturesFrame = Instance.new("Frame")
FeaturesFrame.Size = UDim2.new(1, 0, 1, -30)
FeaturesFrame.Position = UDim2.new(0, 0, 0, 30)
FeaturesFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FeaturesFrame.Parent = Frame

-- KAYDIRMA ÇERÇEVESİ
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -10, 1, -10)
Scroll.Position = UDim2.new(0, 5, 0, 5)
Scroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Scroll.BorderSizePixel = 0
-- 10 MİLYON PİKSEL BOŞLUK (GENİŞLEME PAYI)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 10000000) 
Scroll.Parent = FeaturesFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = Scroll
ListLayout.Padding = UDim.new(0, 5)
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.FillDirection = Enum.FillDirection.Vertical


-- ÖZELLİK EKLEME FONKSİYONU
local function createToggleFeature(name, callback, isToggle)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 35)
    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Button.Text = name .. (isToggle and " (KAPALI)" or "")
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 16
    Button.Parent = Scroll
    
    if name == "⬇️ TÜM DİĞER SCRİPT'LERİ YÜKLE" then
        Button.Name = "LoadAllButton" 
    end

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
            callback(Scroll)
        end
    end)
    return Button
end

-- TEMEL BUTONLAR
createToggleFeature("🚀 HIZ HACK (50) ", toggleSpeed, true) 
createToggleFeature("🏠 Ana Merkeze Işınlan (0, 100, 0)", function() 
    local targetPosition = Vector3.new(0, 100, 0)
    local HRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if HRP then
        HRP.CFrame = CFrame.new(targetPosition)
        print("Merkeze Işınlandı")
    end
end, false)

-- TÜM DİĞER SCRİPTLERİ YÜKLEYEN BUTON (LOADER)
createToggleFeature("⬇️ TÜM DİĞER SCRİPT'LERİ YÜKLE", loadFullModule, false)

print("WESTTEAM OP MENÜ Başlatıldı. 91 Script'lik tam modülü yüklemek için butona tıklayın.")
