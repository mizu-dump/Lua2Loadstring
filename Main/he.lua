-- InstaUGC X
-- v0.0.1
-- Please read the script page's Description, Thank you.

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local UGCID = Instance.new("TextBox")
local UGCID_2 = Instance.new("TextLabel")
local Award = Instance.new("TextButton")
local UIGradient = Instance.new("UIGradient")
local FAQHelp = Instance.new("TextButton")
local UIGradient_2 = Instance.new("UIGradient")
local Help = Instance.new("Frame")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local UIGradient_3 = Instance.new("UIGradient")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(249, 249, 249)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.284974098, 0, 0.349624068, 0)
Main.Size = UDim2.new(0, 588, 0, 293)

TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.294217676, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 235, 0, 27)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "InstaUGC"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = Main
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.935153604, 0)
TextLabel_2.Size = UDim2.new(0, 51, 0, 19)
TextLabel_2.Font = Enum.Font.Unknown
TextLabel_2.Text = "v0.0.1"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

UGCID.Name = "UGCID"
UGCID.Parent = Main
UGCID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UGCID.BorderColor3 = Color3.fromRGB(0, 0, 0)
UGCID.BorderSizePixel = 0
UGCID.Position = UDim2.new(0.226190478, 0, 0.443686008, 0)
UGCID.Size = UDim2.new(0, 313, 0, 32)
UGCID.Font = Enum.Font.Cartoon
UGCID.PlaceholderText = "1234567890"
UGCID.Text = ""
UGCID.TextColor3 = Color3.fromRGB(0, 0, 0)
UGCID.TextScaled = true
UGCID.TextSize = 29.000
UGCID.TextWrapped = true

UGCID_2.Name = "UGCID*"
UGCID_2.Parent = UGCID
UGCID_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UGCID_2.BackgroundTransparency = 1.000
UGCID_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
UGCID_2.BorderSizePixel = 0
UGCID_2.Position = UDim2.new(0, 0, -0.67567569, 0)
UGCID_2.Size = UDim2.new(0, 155, 0, 22)
UGCID_2.Font = Enum.Font.Cartoon
UGCID_2.Text = "UGC ID <font color=\"##ff0004\">*</font>"
UGCID_2.TextColor3 = Color3.fromRGB(0, 0, 0)
UGCID_2.TextScaled = true
UGCID_2.TextSize = 14.000
UGCID_2.TextWrapped = true

Award.Name = "Award"
Award.Parent = Main
Award.BackgroundColor3 = Color3.fromRGB(27, 7, 245)
Award.BorderColor3 = Color3.fromRGB(0, 0, 0)
Award.BorderSizePixel = 0
Award.Position = UDim2.new(0.323129267, 0, 1.04778159, 0)
Award.Size = UDim2.new(0, 200, 0, 46)
Award.Font = Enum.Font.Cartoon
Award.Text = "Award!"
Award.TextColor3 = Color3.fromRGB(255, 255, 255)
Award.TextScaled = true
Award.TextSize = 14.000
Award.TextWrapped = true

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(229, 229, 229)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient.Rotation = -90
UIGradient.Parent = Award

FAQHelp.Name = "FAQ/Help"
FAQHelp.Parent = Main
FAQHelp.BackgroundColor3 = Color3.fromRGB(27, 7, 245)
FAQHelp.BorderColor3 = Color3.fromRGB(0, 0, 0)
FAQHelp.BorderSizePixel = 0
FAQHelp.Position = UDim2.new(0.0119047621, 0, 0.0307167228, 0)
FAQHelp.Size = UDim2.new(0, 95, 0, 26)
FAQHelp.Font = Enum.Font.Cartoon
FAQHelp.Text = "FAQ/Help"
FAQHelp.TextColor3 = Color3.fromRGB(255, 255, 255)
FAQHelp.TextScaled = true
FAQHelp.TextSize = 14.000
FAQHelp.TextWrapped = true

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(229, 229, 229)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient_2.Rotation = -90
UIGradient_2.Parent = FAQHelp

Help.Name = "Help"
Help.Parent = ScreenGui
Help.BackgroundColor3 = Color3.fromRGB(249, 249, 249)
Help.BorderColor3 = Color3.fromRGB(0, 0, 0)
Help.BorderSizePixel = 0
Help.Position = UDim2.new(0.342709094, 0, 0.393251508, 0)
Help.Size = UDim2.new(0, 431, 0, 249)
Help.Visible = false

TextLabel_3.Parent = Help
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.295319736, 0, -0.000105346677, 0)
TextLabel_3.Size = UDim2.new(0, 172, 0, 22)
TextLabel_3.Font = Enum.Font.Unknown
TextLabel_3.Text = "Help"
TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

TextLabel_4.Parent = Help
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(-0.00166395144, 0, 0.164553225, 0)
TextLabel_4.Size = UDim2.new(0, 264, 0, 22)
TextLabel_4.Font = Enum.Font.Unknown
TextLabel_4.Text = "Why doesn't it give me the UGC?"
TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

TextLabel_5.Parent = Help
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0.000656234159, 0, 0.25290665, 0)
TextLabel_5.Size = UDim2.new(0, 381, 0, 22)
TextLabel_5.Font = Enum.Font.Unknown
TextLabel_5.Text = "A: Make sure you're playing the UGC's Linked game."
TextLabel_5.TextColor3 = Color3.fromRGB(255, 0, 4)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14.000
TextLabel_5.TextWrapped = true

TextLabel_6.Parent = Help
TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.BackgroundTransparency = 1.000
TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_6.BorderSizePixel = 0
TextLabel_6.Position = UDim2.new(0.000656234159, 0, 0.341260046, 0)
TextLabel_6.Size = UDim2.new(0, 381, 0, 22)
TextLabel_6.Font = Enum.Font.Unknown
TextLabel_6.Text = "If it still does not work, Contact @max96git on Twitter."
TextLabel_6.TextColor3 = Color3.fromRGB(255, 0, 4)
TextLabel_6.TextScaled = true
TextLabel_6.TextSize = 14.000
TextLabel_6.TextWrapped = true

Close.Name = "Close"
Close.Parent = Help
Close.BackgroundColor3 = Color3.fromRGB(27, 7, 245)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.260484159, 0, 0.814849734, 0)
Close.Size = UDim2.new(0, 200, 0, 36)
Close.Font = Enum.Font.Cartoon
Close.Text = "Got It!"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(229, 229, 229)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient_3.Rotation = -90
UIGradient_3.Parent = Close

-- Scripts:

local function SKEJE_fake_script() -- Award.LocalScript 
	local script = Instance.new('LocalScript', Award)

	local itemId = script.Parent.Parent.UGCID.Text
	local player = game.Players.LocalPlayer
	script.Parent.MouseButton1Click:connect(function()
		game:GetService("MarketplaceService"):PromptPurchase(player, itemId)
	end)
end
coroutine.wrap(SKEJE_fake_script)()
local function CWVYIPM_fake_script() -- FAQHelp.LocalScript 
	local script = Instance.new('LocalScript', FAQHelp)

	script.Parent.MouseButton1Click:Connect(function() 
	script.Parent.Parent.Parent.Help.Visible = true
	end)
end
coroutine.wrap(CWVYIPM_fake_script)()
local function PIDNRT_fake_script() -- Close.LocalScript 
	local script = Instance.new('LocalScript', Close)

	script.Parent.MouseButton1Click:Connect(function() 
	script.Parent.Parent.Visible = false	
	end)
end
Main.Visible = true
coroutine.wrap(PIDNRT_fake_script)()