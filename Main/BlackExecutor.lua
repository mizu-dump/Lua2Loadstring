--[[
    BLACK EXECUTOR + ANIMATED LOADING + SETTINGS & SCRIPTS
    • 100% работает loadstring
    • Нет "Loading" после загрузки
    • Поле ввода + Execute/Clear
    • Draggable + Toggle
    • Вкладки Settings и Scripts
--]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

--=====================================================================
-- 1. ЗАГРУЗКА (АНИМАЦИЯ)
--=====================================================================
local LoadingGui = Instance.new("ScreenGui", pgui)
local Blur = Instance.new("BlurEffect", Lighting)
Blur.Size = 0

local Frame = Instance.new("Frame", LoadingGui)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 0, 0, 0)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.ClipsDescendants = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 25)

local ByLabel = Instance.new("TextLabel", Frame)
ByLabel.Size = UDim2.new(1, 0, 0, 20)
ByLabel.Position = UDim2.new(0, 0, 0.05, 0)
ByLabel.BackgroundTransparency = 1
ByLabel.Text = "by:JABA"
ByLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ByLabel.TextSize = 16
ByLabel.Font = Enum.Font.Gotham
ByLabel.TextXAlignment = Enum.TextXAlignment.Center

local TitleContainer = Instance.new("Frame", Frame)
TitleContainer.Size = UDim2.new(1, -20, 0, 70)
TitleContainer.Position = UDim2.new(0, 10, 0.18, 0)
TitleContainer.BackgroundTransparency = 1

local Avatar = Instance.new("ImageLabel", TitleContainer)
Avatar.Size = UDim2.new(0, 70, 0, 70)
Avatar.BackgroundTransparency = 1
Avatar.Image = "rbxassetid://139167145345956"
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(0, 35)

local Title = Instance.new("TextLabel", TitleContainer)
Title.Size = UDim2.new(1, -90, 1, 0)
Title.Position = UDim2.new(0, 90, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Loading"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 38
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local ProgressBar = Instance.new("Frame", Frame)
ProgressBar.Size = UDim2.new(0.8, 0, 0, 14)
ProgressBar.Position = UDim2.new(0.1, 0, 0.7, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", ProgressBar).CornerRadius = UDim.new(0, 8)

local ProgressFill = Instance.new("Frame", ProgressBar)
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(0, 255, 180)
Instance.new("UICorner", ProgressFill).CornerRadius = UDim.new(0, 8)

local UIGradient = Instance.new("UIGradient", ProgressFill)
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 160)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 180, 255))
}

local ProgressText = Instance.new("TextLabel", Frame)
ProgressText.Size = UDim2.new(1, 0, 0, 28)
ProgressText.Position = UDim2.new(0, 0, 0.83, 0)
ProgressText.BackgroundTransparency = 1
ProgressText.TextColor3 = Color3.fromRGB(255, 255, 255)
ProgressText.TextSize = 22
ProgressText.Font = Enum.Font.GothamBold
ProgressText.Text = "0%"

local StartSound = Instance.new("Sound", Frame)
StartSound.SoundId = "rbxassetid://107088157278833"
StartSound.Volume = 1

local FinishSound = Instance.new("Sound", Frame)
FinishSound.SoundId = "rbxassetid://121410002667274"
FinishSound.Volume = 1

-- Draggable
local dragging = false
local dragInput, dragStart, startPos
Frame.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = i.Position; startPos = Frame.Position
    end
end)
Frame.InputChanged:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
        dragInput = i
    end
end)
UserInputService.InputChanged:Connect(function(i)
    if dragging and i == dragInput then
        local delta = i.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

TweenService:Create(Blur, TweenInfo.new(0.8), {Size = 15}):Play()
task.wait(1)
StartSound:Play()
TweenService:Create(Frame, TweenInfo.new(0.5), {Size = UDim2.new(0, 460, 0, 190)}):Play()

task.spawn(function()
    local dots = 0
    while Frame.Parent do
        dots = (dots + 1) % 4
        Title.Text = "Loading" .. string.rep(".", dots)
        task.wait(0.5)
    end
end)

task.wait(0.5)
local stops = {math.random(20,40), math.random(50,70), math.random(80,90)}
table.sort(stops)
local i, sidx = 1, 1
while i <= 100 do
    ProgressFill.Size = UDim2.new(i/100, 0, 1, 0)
    ProgressText.Text = i .. "%"
    if sidx <= #stops and i == stops[sidx] then
        task.wait(0.3); sidx += 1
    else
        task.wait(0.01)
    end
    i += 1
end

Title.Text = "Completed!"
ProgressText.Text = "100%"
FinishSound:Play()

local Notify = Instance.new("Frame", LoadingGui)
Notify.AnchorPoint = Vector2.new(1,0)
Notify.Position = UDim2.new(1.2,0,0.1,0)
Notify.Size = UDim2.new(0,230,0,60)
Notify.BackgroundColor3 = Color3.fromRGB(10,10,10)
Instance.new("UICorner", Notify).CornerRadius = UDim.new(0,12)
local Stroke = Instance.new("UIStroke", Notify)
Stroke.Thickness = 3
Stroke.Color = Color3.fromRGB(0,255,180)
Stroke.Transparency = 1
local NLabel = Instance.new("TextLabel", Notify)
NLabel.Size = UDim2.new(1,0,1,0)
NLabel.BackgroundTransparency = 1
NLabel.Text = "Loaded"
NLabel.TextColor3 = Color3.new(1,1,1)
NLabel.Font = Enum.Font.GothamBold
NLabel.TextSize = 26
NLabel.TextTransparency = 1

TweenService:Create(Notify, TweenInfo.new(0.8), {Position = UDim2.new(0.98,0,0.1,0)}):Play()
TweenService:Create(NLabel, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
TweenService:Create(Stroke, TweenInfo.new(0.8), {Transparency = 0}):Play()

task.wait(2.5)
TweenService:Create(Notify, TweenInfo.new(0.8), {Position = UDim2.new(1.2,0,0.1,0)}):Play()
task.wait(1); Notify:Destroy()

task.wait(0.5)
LoadingGui:Destroy()
Blur:Destroy()

--=====================================================================
-- 2. EXECUTOR
--=====================================================================
local ExecutorGui = Instance.new("ScreenGui", pgui)

local Executor = Instance.new("Frame", ExecutorGui)
Executor.Size = UDim2.new(0,0,0,0)
Executor.Position = UDim2.new(0.5,0,0.5,0)
Executor.AnchorPoint = Vector2.new(0.5,0.5)
Executor.BackgroundColor3 = Color3.fromRGB(10,10,10)
Executor.ClipsDescendants = true
Instance.new("UICorner", Executor).CornerRadius = UDim.new(0,20)
local Stroke = Instance.new("UIStroke", Executor)
Stroke.Color = Color3.fromRGB(40,40,40); Stroke.Thickness = 2

-- CodeBox
local CodeBox = Instance.new("TextBox", Executor)
CodeBox.Size = UDim2.new(0.9,0,0.52,0)
CodeBox.Position = UDim2.new(0.05,0,0.07,0)
CodeBox.BackgroundColor3 = Color3.fromRGB(20,20,20)
CodeBox.TextColor3 = Color3.fromRGB(200,200,200)
CodeBox.PlaceholderText = "Enter code..."
CodeBox.MultiLine = true
CodeBox.TextWrapped = true
CodeBox.Font = Enum.Font.Code
CodeBox.TextSize = 15
Instance.new("UICorner", CodeBox).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke", CodeBox).Color = Color3.fromRGB(50,50,50)

-- Execute & Clear
local ExecuteBtn = Instance.new("TextButton", Executor)
ExecuteBtn.Size = UDim2.new(0.43,0,0.13,0)
ExecuteBtn.Position = UDim2.new(0.05,0,0.83,0)
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(0,140,255)
ExecuteBtn.Text = "Execute"
ExecuteBtn.TextColor3 = Color3.new(1,1,1)
ExecuteBtn.Font = Enum.Font.GothamBold
ExecuteBtn.TextSize = 20
Instance.new("UICorner", ExecuteBtn).CornerRadius = UDim.new(0,40)
Instance.new("UIStroke", ExecuteBtn).Color = Color3.fromRGB(0,100,200)

local ClearBtn = Instance.new("TextButton", Executor)
ClearBtn.Size = UDim2.new(0.43,0,0.13,0)
ClearBtn.Position = UDim2.new(0.52,0,0.83,0)
ClearBtn.BackgroundColor3 = Color3.fromRGB(180,40,40)
ClearBtn.Text = "Clear"
ClearBtn.TextColor3 = Color3.new(1,1,1)
ClearBtn.Font = Enum.Font.GothamBold
ClearBtn.TextSize = 20
Instance.new("UICorner", ClearBtn).CornerRadius = UDim.new(0,40)
Instance.new("UIStroke", ClearBtn).Color = Color3.fromRGB(140,20,20)

-- Notification Function
local function notify(text, err)
    local n = Instance.new("Frame", ExecutorGui)
    n.Size = UDim2.new(0.8,0,0.09,0)
    n.Position = UDim2.new(0.1,0,-0.15,0)
    n.BackgroundColor3 = err and Color3.fromRGB(180,40,40) or Color3.fromRGB(40,180,40)
    Instance.new("UICorner", n).CornerRadius = UDim.new(0,16)
    local t = Instance.new("TextLabel", n)
    t.Size = UDim2.new(1,0,1,0)
    t.BackgroundTransparency = 1
    t.Text = text
    t.TextColor3 = Color3.new(1,1,1)
    t.Font = Enum.Font.Gotham
    t.TextSize = 18

    TweenService:Create(n, TweenInfo.new(0.5), {Position = UDim2.new(0.1,0,0.05,0)}):Play()
    task.delay(2.5, function()
        TweenService:Create(n, TweenInfo.new(0.5), {Position = UDim2.new(0.1,0,-0.15,0)}):Play()
        task.wait(0.6); n:Destroy()
    end)
end

-- Execute
ExecuteBtn.MouseButton1Click:Connect(function()
    local code = CodeBox.Text
    if code:gsub("%s","") == "" then notify("Empty!", true); return end
    local success, err = pcall(function()
        local func, loadErr = loadstring(code)
        if not func then error(loadErr or "Failed") end
        setfenv(func, getfenv())
        func()
    end)
    notify(success and "Executed!" or "Error: "..tostring(err), not success)
end)

-- Clear
ClearBtn.MouseButton1Click:Connect(function()
    CodeBox.Text = ""
    notify("Cleared!", false)
end)

-- Draggable Executor
local exDragging = false
Executor.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        exDragging = true; dragStart = i.Position; startPos = Executor.Position
    end
end)
UserInputService.InputChanged:Connect(function(i)
    if exDragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - dragStart
        Executor.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)
Executor.InputEnded:Connect(function() exDragging = false end)

-- Toggle
local Toggle = Instance.new("TextButton", ExecutorGui)
Toggle.Size = UDim2.new(0.12,0,0.08,0)
Toggle.Position = UDim2.new(0.94,0,0.02,0)
Toggle.AnchorPoint = Vector2.new(1,0)
Toggle.BackgroundColor3 = Color3.fromRGB(0,140,255)
Toggle.Text = "Right Arrow"
Toggle.TextColor3 = Color3.new(1,1,1)
Toggle.Font = Enum.Font.GothamBold
Toggle.TextSize = 26
Toggle.Visible = false
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0,50)
Instance.new("UIStroke", Toggle).Color = Color3.fromRGB(0,100,200)

local visible = true
Toggle.MouseButton1Click:Connect(function()
    if visible then
        TweenService:Create(Executor, TweenInfo.new(0.5), {Size = UDim2.new(0,0,0,0)}):Play()
        Toggle.Text = "Right Arrow"
    else
        TweenService:Create(Executor, TweenInfo.new(0.5), {Size = UDim2.new(0.7,0,0.55,0)}):Play()
        Toggle.Text = "Left Arrow"
    end
    visible = not visible
end)

-- Open Executor Animation
TweenService:Create(Executor, TweenInfo.new(0.9, Enum.EasingStyle.Back), {Size = UDim2.new(0.7,0,0.55,0)}):Play()
task.wait(0.5)
for _,c in Executor:GetChildren() do
    if c:IsA("GuiObject") then
        c.BackgroundTransparency = 1; c.Visible = true
        TweenService:Create(c, TweenInfo.new(0.6), {BackgroundTransparency = 0}):Play()
        if c:IsA("TextBox") or c:IsA("TextButton") then
            c.TextTransparency = 1
            TweenService:Create(c, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
        end
    end
end
task.wait(0.5)
Toggle.Visible = true
Toggle.Text = "Left Arrow"

--=====================================================================
-- 3. ВКЛАДКИ SETTINGS & SCRIPTS
--=====================================================================

local TabsContainer = Instance.new("Frame", Executor)
TabsContainer.Size = UDim2.new(0.9, 0, 0, 30)
TabsContainer.Position = UDim2.new(0.05, 0, 0.62, 0)
TabsContainer.BackgroundTransparency = 1

local TabButtons = {}

local function createTabButton(name, pos)
    local btn = Instance.new("TextButton", TabsContainer)
    btn.Size = UDim2.new(0, 100, 1, 0)
    btn.Position = UDim2.new(pos, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)
    return btn
end

TabButtons.Settings = createTabButton("Settings", 0)
TabButtons.Scripts = createTabButton("Scripts", 0.35)

local Pages = {}

-- SETTINGS PAGE
local SettingsPage = Instance.new("Frame", Executor)
SettingsPage.Size = UDim2.new(0.9,0,0.18,0)
SettingsPage.Position = UDim2.new(0.05,0,0.72,0)
SettingsPage.BackgroundTransparency = 1
Pages.Settings = SettingsPage