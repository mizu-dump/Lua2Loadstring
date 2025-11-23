-- // Mooze GUI (Full Fade + Mobile Typing + White Brackets & Purple Dash + Script Execution)
-- FINAL FIXED VERSION - Key works + TextBox disables during auth/hide

local correctKey = "a7k4291-p9m83j21kq-t5vxr74w" -- your key
local authDelay = 3
local customLogo = "rbxassetid://12806397802"
local scriptToExecute = [[
print("✅ Mooze Authenticated and Script Executed!")
loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Final.lua"))()
-- Your script here
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MoozeAuth"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 600, 0, 300)
Frame.Position = UDim2.new(0.5, -300, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.ClipsDescendants = true

-- Title Bar
local TitleBar = Instance.new("Frame", Frame)
TitleBar.Size = UDim2.new(1, 0, 0, 28)
TitleBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)

-- Logo
local Logo = Instance.new("ImageLabel", TitleBar)
Logo.BackgroundTransparency = 1
Logo.Size = UDim2.new(0, 20, 0, 20)
Logo.Position = UDim2.new(0, 5, 0, 4)
Logo.Image = customLogo

-- Title Text
local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.BackgroundTransparency = 1
TitleText.Position = UDim2.new(0, 30, 0, 0)
TitleText.Size = UDim2.new(1, -100, 1, 0)
TitleText.Font = Enum.Font.SourceSans
TitleText.Text = "Administrator: Steam"
TitleText.TextSize = 18
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CloseBtn = Instance.new("TextButton", TitleBar)
CloseBtn.Size = UDim2.new(0, 40, 0, 28)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18
CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- ASCII Art
local Ascii = Instance.new("TextLabel", Frame)
Ascii.BackgroundTransparency = 1
Ascii.Size = UDim2.new(1, 0, 0.8, 0)
Ascii.Position = UDim2.new(-0.067, 0, -0.1, 0)
Ascii.Font = Enum.Font.Code
Ascii.Text = [[
oooo    oooo oooooooooooo oooooo   oooo   .oooooo.   
`888   .8P'  `888'     `8  `888.   .8'   d8P'  `Y8b  
 888  d8'     888           `888. .8'   888      888 
 88888[       888oooo8       `888.8'    888      888 
 888`88b.     888    "        `888'     888      888 
 888  `88b.   888       o      888      `88b    d88' 
o888o  o888o o888ooooood8     o888o      `Y8bood8P'  
]]
Ascii.TextSize = 13
Ascii.TextColor3 = Color3.fromRGB(255, 255, 255)
Ascii.TextXAlignment = Enum.TextXAlignment.Center
Ascii.TextYAlignment = Enum.TextYAlignment.Center

-- Key Label
local KeyLabel = Instance.new("TextLabel", Frame)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Position = UDim2.new(0, 29, 0, 200)
KeyLabel.Size = UDim2.new(0, 140, 0, 28)
KeyLabel.Font = Enum.Font.Code
KeyLabel.RichText = true
KeyLabel.Text = '[<font color="rgb(255,255,255)">[</font><font color="rgb(170,85,255)">-</font><font color="rgb(255,255,255)">]</font>] <font color="rgb(255,255,255)">Key:</font>'
KeyLabel.TextSize = 14
KeyLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Invisible TextBox (fixed to actually accept input)
local KeyBox = Instance.new("TextBox", Frame)
KeyBox.BackgroundTransparency = 1
KeyBox.TextTransparency = 1
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.ClearTextOnFocus = false
KeyBox.Font = Enum.Font.Code
KeyBox.TextSize = 14
KeyBox.Position = UDim2.new(0, 177, 0, 200)
KeyBox.Size = UDim2.new(0, 320, 0, 28)
KeyBox.Text = ""

-- Tap to type (mobile + PC)
KeyLabel.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		if KeyBox.Active then KeyBox:CaptureFocus() end
	end
end)

-- Drag GUI (unchanged)
local dragging, startPos, dragStart
TitleBar.InputBegan:Connect(function(inp)
	if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = inp.Position
		startPos = Frame.Position
	end
end)
UIS.InputChanged:Connect(function(inp)
	if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
		local delta = inp.Position - dragStart
		Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
UIS.InputEnded:Connect(function(inp)
	if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

-- Typing Display
local typed = ""
local showUnderline = true
local function update()
	local underline = showUnderline and "▁" or ""
	KeyLabel.Text = string.format(
		'[<font color="rgb(255,255,255)">[</font><font color="rgb(170,85,255)">-</font><font color="rgb(255,255,255)">]</font>] <font color="rgb(255,255,255)">Key:</font> <font color="rgb(180,180,180)">%s</font><font color="rgb(255,255,255)">%s</font>',
		typed,
		underline
	)
end

KeyBox:GetPropertyChangedSignal("Text"):Connect(function()
	typed = KeyBox.Text
	update()
end)

task.spawn(function()
	while task.wait(0.5) do
		if KeyBox:IsFocused() and ScreenGui.Parent then
			showUnderline = not showUnderline
			update()
		end
	end
end)

-- ENTER KEY AUTH (NOW DISABLES TEXTBOX DURING AUTH & HIDE)
KeyBox.FocusLost:Connect(function(enterPressed)
	if enterPressed and KeyBox.Active then
		if KeyBox.Text == correctKey then
			-- Disable input completely
			KeyBox.Active = false
			KeyBox.TextEditable = false

			KeyLabel.Text = '[<font color="rgb(255,255,255)">[</font><font color="rgb(170,85,255)">-</font><font color="rgb(255,255,255)">]</font>] <font color="rgb(255,255,255)">Authenticating...</font>'
			task.wait(authDelay)

			KeyLabel.Text = '[<font color="rgb(255,255,255)">[</font><font color="rgb(170,85,255)">-</font><font color="rgb(255,255,255)">]</font>] <font color="rgb(255,255,255)">Hiding console in <font color="rgb(170,85,255)">5.00</font> seconds!</font>'
			task.wait(5)

			-- Fade out
			for _, obj in ipairs(ScreenGui:GetDescendants()) do
				local fadeProps = {}
				if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
					fadeProps.TextTransparency = 1
				end
				if obj:IsA("ImageLabel") then
					fadeProps.ImageTransparency = 1
				end
				if obj:IsA("Frame") then
					fadeProps.BackgroundTransparency = 1
				end
				if next(fadeProps) then
					TweenService:Create(obj, TweenInfo.new(1), fadeProps):Play()
				end
			end

			task.wait(1.1)
			ScreenGui:Destroy()
			loadstring(scriptToExecute)()
		else
			KeyLabel.Text = '[<font color="rgb(255,255,255)">[</font><font color="rgb(170,85,255)">-</font><font color="rgb(255,255,255)">]</font>] <font color="rgb(255,0,0)">Invalid key</font>'
			task.wait(2)
			KeyBox.Text = ""
			typed = ""
			update()
		end
	end
end)

-- Auto-focus on open
task.defer(function()
	task.wait(0.1)
	KeyBox:CaptureFocus()
end)

update()