local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local function createExplosion()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local position = character.HumanoidRootPart.Position
        local explosion = Instance.new("Explosion")
        explosion.Position = position
        explosion.BlastPressure = 200000
        explosion.BlastRadius = 35
        explosion.Parent = Workspace
    end
end

local function applyOutfitFromPlayer(targetPlayer)
    if not targetPlayer then return end
    LocalPlayer:LoadCharacterAppearance(targetPlayer.UserId)
end

local BG_COLOR = Color3.fromRGB(40, 40, 40)
local ACCENT_COLOR = Color3.fromRGB(80, 80, 80)
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)
local BUTTON_COLOR = Color3.fromRGB(70, 130, 180)
local EXPLODE_COLOR = Color3.fromRGB(200, 50, 50)
local TOGGLE_COLOR = Color3.fromRGB(15, 15, 15)
local START_BUTTON_COLOR = Color3.fromRGB(50, 150, 50)
local PLAYER_HEIGHT = 20

local OPEN_POSITION = UDim2.new(0.5, -125, 0.5, -150)
local CLOSED_POSITION = UDim2.new(0.5, -125, -1, 0)
local TWEEN_INFO = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local SplashScreen = Instance.new("ScreenGui")
SplashScreen.Name = "SplashScreen"
SplashScreen.ResetOnSpawn = false
SplashScreen.Parent = PlayerGui

local SplashFrame = Instance.new("Frame")
SplashFrame.Size = UDim2.new(1, 0, 1, 0)
SplashFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SplashFrame.Parent = SplashScreen

local SplashImage = Instance.new("ImageLabel")
SplashImage.Size = UDim2.new(0.8, 0, 0.8, 0)
SplashImage.Position = UDim2.new(0.5, 0, 0.4, 0)
SplashImage.AnchorPoint = Vector2.new(0.5, 0.5)
SplashImage.BackgroundTransparency = 1
SplashImage.Image = "rbxassetid://13778810222"
SplashImage.ScaleType = Enum.ScaleType.Fit
SplashImage.Parent = SplashFrame

local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.new(0.2, 0, 0.08, 0)
StartButton.Position = UDim2.new(0.5, 0, 0.85, 0)
StartButton.AnchorPoint = Vector2.new(0.5, 0.5)
StartButton.Text = "Start G2"
StartButton.Font = Enum.Font.SourceSansBold
StartButton.TextSize = 20
StartButton.TextColor3 = TEXT_COLOR
StartButton.BackgroundColor3 = START_BUTTON_COLOR
StartButton.Visible = false
StartButton.Parent = SplashFrame

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 8)
StartCorner.Parent = StartButton

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "G2_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui
ScreenGui.Enabled = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 345)
MainFrame.Position = CLOSED_POSITION
MainFrame.BackgroundColor3 = BG_COLOR
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Text = "G2 (قابل للسحب)"
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 16
TitleLabel.TextColor3 = TEXT_COLOR
TitleLabel.BackgroundColor3 = ACCENT_COLOR
TitleLabel.Parent = MainFrame

local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, 0, 0, 75)
ButtonContainer.Position = UDim2.new(0, 0, 1, -85)
ButtonContainer.BackgroundColor3 = BG_COLOR
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = MainFrame

local CenterLayout = Instance.new("UIListLayout")
CenterLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
CenterLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
CenterLayout.SortOrder = Enum.SortOrder.LayoutOrder
CenterLayout.Padding = UDim.new(0, 10)
CenterLayout.Parent = ButtonContainer

local ExplodeButton = Instance.new("TextButton")
ExplodeButton.Name = "ExplodeButton"
ExplodeButton.Size = UDim2.new(1, -20, 0, 35)
ExplodeButton.Position = UDim2.new(0, 10, 0, 0)
ExplodeButton.Text = "💥 تفجير اللاعب 💥"
ExplodeButton.Font = Enum.Font.SourceSansBold
ExplodeButton.TextSize = 18
ExplodeButton.TextColor3 = TEXT_COLOR
ExplodeButton.BackgroundColor3 = EXPLODE_COLOR
ExplodeButton.Parent = ButtonContainer

local ExplodeCorner = Instance.new("UICorner")
ExplodeCorner.CornerRadius = UDim.new(0, 5)
ExplodeCorner.Parent = ExplodeButton

ExplodeButton.MouseButton1Click:Connect(function()
    createExplosion()
    ExplodeButton.Text = "تم التفجير!"
    task.wait(1)
    ExplodeButton.Text = "💥 تفجير اللاعب 💥"
end)

local CopyButton = Instance.new("TextButton")
CopyButton.Size = UDim2.new(1, -20, 0, 35)
CopyButton.Position = UDim2.new(0, 10, 0, 45)
CopyButton.Text = "🔄 نسخ السكن الآن"
CopyButton.Font = Enum.Font.SourceSansBold
CopyButton.TextSize = 18
CopyButton.TextColor3 = TEXT_COLOR
CopyButton.BackgroundColor3 = BUTTON_COLOR
CopyButton.Parent = ButtonContainer

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 5)
CopyCorner.Parent = CopyButton

local DropdownButton = Instance.new("TextButton")
DropdownButton.Size = UDim2.new(1, -20, 0, 25)
DropdownButton.Position = UDim2.new(0, 10, 0, 40)
DropdownButton.Text = "👥 اختر لاعبًا..."
DropdownButton.Font = Enum.Font.SourceSans
DropdownButton.TextSize = 14
DropdownButton.TextColor3 = TEXT_COLOR
DropdownButton.BackgroundColor3 = ACCENT_COLOR
DropdownButton.Parent = MainFrame

local DropdownCorner = Instance.new("UICorner")
DropdownCorner.CornerRadius = UDim.new(0, 5)
DropdownCorner.Parent = DropdownButton

local NameListFrame = Instance.new("ScrollingFrame")
NameListFrame.Size = UDim2.new(1, -20, 0, 180)
NameListFrame.Position = UDim2.new(0, 10, 0, 65)
NameListFrame.BackgroundColor3 = BG_COLOR
NameListFrame.ScrollBarThickness = 6
NameListFrame.Visible = false
NameListFrame.Parent = MainFrame

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 5)
ListCorner.Parent = NameListFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 2)
ListLayout.Parent = NameListFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(1, -55, 0, 5)
ToggleButton.Text = "G2"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 30
ToggleButton.BackgroundColor3 = TOGGLE_COLOR
ToggleButton.TextColor3 = TEXT_COLOR
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

local isGuiOpen = false

local function toggleGui(open)
    local targetPosition = open and OPEN_POSITION or CLOSED_POSITION
    local tween = TweenService:Create(MainFrame, TWEEN_INFO, {Position = targetPosition})
    tween:Play()
    isGuiOpen = open
end

ToggleButton.MouseButton1Click:Connect(function()
    toggleGui(not isGuiOpen)
end)

local dragging = false
local dragStart = nil
local frameStart = nil

local function startDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if input.Position.Y < (MainFrame.AbsolutePosition.Y + TitleLabel.AbsoluteSize.Y) then
            dragging = true
            dragStart = input.Position
            frameStart = MainFrame.Position
            MainFrame.ZIndex = 2
        end
    end
end

TitleLabel.InputBegan:Connect(startDrag)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        local newX = frameStart.X.Offset + delta.X
        local newY = frameStart.Y.Offset + delta.Y
        
        MainFrame.Position = UDim2.new(frameStart.X.Scale, newX, frameStart.Y.Scale, newY)
    end
end)

local isListOpen = false
local selectedPlayer = nil

local function updatePlayerList()
    for _, child in NameListFrame:GetChildren() do
        if child:IsA("TextButton") then child:Destroy() end
    end

    local playerList = Players:GetPlayers()
    local totalHeight = 0

    for _, player in playerList do
        if player ~= LocalPlayer then
            local playerButton = Instance.new("TextButton")
            playerButton.Text = player.Name
            playerButton.Size = UDim2.new(1, 0, 0, PLAYER_HEIGHT)
            playerButton.TextXAlignment = Enum.TextXAlignment.Left
            playerButton.TextSize = 14
            playerButton.TextColor3 = TEXT_COLOR
            playerButton.BackgroundColor3 = ACCENT_COLOR
            playerButton.Parent = NameListFrame
            
            totalHeight = totalHeight + PLAYER_HEIGHT + 2

            local PlayerButtonCorner = Instance.new("UICorner")
            PlayerButtonCorner.CornerRadius = UDim.new(0, 4)
            PlayerButtonCorner.Parent = playerButton

            playerButton.MouseButton1Click:Connect(function()
                selectedPlayer = player
                DropdownButton.Text = "✅ " .. player.Name
                NameListFrame.Visible = false
                isListOpen = false
            end)
        end
    end
    
    NameListFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

DropdownButton.MouseButton1Click:Connect(function()
    isListOpen = not isListOpen
    NameListFrame.Visible = isListOpen
    
    if isListOpen then
        updatePlayerList()
    end
    
    local arrow = isListOpen and " ▲" or " ▼"
    if selectedPlayer then
        DropdownButton.Text = "✅ " .. selectedPlayer.Name .. arrow
    else
        DropdownButton.Text = "👥 اختر لاعبًا..." .. arrow
    end
end)

CopyButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        CopyButton.Text = "جاري النسخ..."
        CopyButton.Active = false
        
        applyOutfitFromPlayer(selectedPlayer)
        
        task.wait(1) 
        CopyButton.Text = "🔄 نسخ السكن الآن"
        CopyButton.Active = true
    else
        CopyButton.Text = "❌ اختر لاعبًا أولاً!"
        task.wait(1)
        CopyButton.Text = "🔄 نسخ السكن الآن"
    end
end)

task.wait(5)
StartButton.Visible = true

StartButton.MouseButton1Click:Connect(function()
    SplashScreen:Destroy()
    ScreenGui.Enabled = true
    toggleGui(true)
end)
