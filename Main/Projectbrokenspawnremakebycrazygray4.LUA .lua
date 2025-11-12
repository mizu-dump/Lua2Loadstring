-- Project Broken Spawn GUI v4.2.1 (Shrike + Polygoner + Fridge + Soul-Reaper + SCP-106 + CHRONO-SENTINEL + RUIN-IX)

-- Instances
local project = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local clear = Instance.new("TextButton")
local outputContainer = Instance.new("ScrollingFrame")
local output = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
local image = Instance.new("ImageLabel")
local TextBox = Instance.new("TextBox")
local execute = Instance.new("TextButton")
local logo = Instance.new("TextButton")
local R6 = Instance.new("TextButton")
local Re = Instance.new("TextButton")
local scriptlist = Instance.new("ScrollingFrame")

-- Root GUI
project.Name = "project"
project.Parent = game.CoreGui

-- Frame
Frame.Parent = project
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.236, 0, 0.143, 0)
Frame.Size = UDim2.new(0, 627, 0, 381)
Frame.Draggable = true

-- Title
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.048, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 597, 0, 22)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Project Broken Spawn v4.2.5"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 30
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Small image
image.Name = "image"
image.Parent = Frame
image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
image.BorderSizePixel = 0
image.Size = UDim2.new(0, 23, 0, 22)
image.Image = "rbxassetid://0"

-- Executor TextBox
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.016, 0, 0.144, 0)
TextBox.Size = UDim2.new(0, 464, 0, 193)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.MultiLine = true
TextBox.Text = "print('hello-world')"
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 19
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top

-- Output container
outputContainer.Parent = Frame
outputContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
outputContainer.Position = UDim2.new(0.5, 0, 0.669, 3)
outputContainer.Size = UDim2.new(0, 163, 0, 116)
outputContainer.ScrollBarThickness = 13
outputContainer.CanvasSize = UDim2.new(0, 0, 0, 200)
outputContainer.VerticalScrollBarInset = Enum.ScrollBarInset.Always

output.Parent = outputContainer
output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
output.Size = UDim2.new(1, 0, 1, 0)
output.Font = Enum.Font.SourceSans
output.Text = "Project Broken Spawn loaded successfully..."
output.TextColor3 = Color3.fromRGB(0, 0, 0)
output.TextSize = 14
output.TextWrapped = true
output.TextXAlignment = Enum.TextXAlignment.Left
output.TextYAlignment = Enum.TextYAlignment.Top

-- Buttons helper
local function createButton(btn, parent, x, y, w, h, text, textsize)
	btn.Name = text
	btn.Parent = parent
	btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	btn.Position = UDim2.new(x, 0, y, 0)
	btn.Size = UDim2.new(0, w, 0, h)
	btn.Font = Enum.Font.SourceSans
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(0, 0, 0)
	btn.TextSize = textsize
end

createButton(execute, Frame, 0.016, 0.685, 137, 27, "Execute", 25)
createButton(clear, Frame, 0.016, 0.790, 137, 23, "Clear", 25)
createButton(logo, Frame, 0.25, 0.685, 137, 27, "Load", 30)
createButton(R6, Frame, 0.25, 0.785, 137, 27, "R6", 30)
createButton(Re, Frame, 0.25, 0.890, 137, 27, "Re", 30)

-- Scriptlist (Right side)
scriptlist.Name = "scriptlist"
scriptlist.Parent = Frame
scriptlist.Active = true
scriptlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptlist.Position = UDim2.new(0.77, 0, 0.144, 0)
scriptlist.Size = UDim2.new(0, 145, 0, 316)
scriptlist.ScrollBarThickness = 13
scriptlist.CanvasSize = UDim2.new(0, 0, 0, 1000)
scriptlist.VerticalScrollBarInset = Enum.ScrollBarInset.Always

-- All script buttons (includes RUIN-IX)
local scripts = {
	{"SSP.TXT", "https://pastefy.app/XHqVeb0d/raw"},
	{"PRIMADON.TXT", "https://pastebin.com/raw/37iQzQp3"},
	{"DABEBY-CAR.TXT", "https://pastefy.app/xtIOQGPy/raw"},
	{"HACKER-X.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Hacker%20X"},
	{"GRANDOSLA.TXT", "https://pastefy.app/Kql9VClT/raw"},
	{"EXVATOR.TXT", "https://pastefy.app/q74DFYYz/raw"},
	{"GONER.TXT", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Goner.lua"},
	{"HD-ADMIN.TXT", "https://raw.githubusercontent.com/PHGS971/HDadmin/refs/heads/main/HDadmin.lua"},
	{"MISTIC.TXT", "https://pastebin.com/raw/AaDfrnFK"},
	{"DOGGYARMY.TXT", "https://pastefy.app/ChM2b8Oh/raw"},
	{"POLARIA.TXT", "https://pastefy.app/xos3Of2N/raw"},
	{"BIPOLARIA.TXT", "https://pastebin.com/raw/8qFWEtWY"},
	{"ADMIN.TXT", "https://pastefy.app/ciJVZnxH/raw"},
	{"EXSER.TXT", "https://pastefy.app/7sO8ckTL/raw"},
	{"SPLITHEAD.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Split"},
	{"MJOLNIR.TXT", "https://pastefy.app/JWZk5sQi/raw"},
	{"BLUUDUUD.TXT", "https://pastebin.com/raw/CcHxT0Gj"},
	{"NEKO.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/neko"},
	{"BLACKFIGURE.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Figure"},
	{"FENRIER-PAINSIS.TXT", "https://pastefy.app/az0yaa2e/raw"},
	{"DEVOYANCE.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Devoyance"},
	{"SLEDGEHAMMER.TXT", "https://pastefy.app/jmJgSbvV/raw?part=Sledgehammer"},
	{"ALLAH MAP.TXT", "https://pastebin.com/raw/NNp1NJKT"},
	{"C4 BOMBA.TXT", "https://pastefy.app/M0r9UCNQ/raw"},
	{"STEVE.TXT", "https://rawscripts.net/raw/Universal-Script-Steve-script-24707"},
	{"GRABGUN.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/grab"},
	{"ALL SEEING HAND.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Flowey"},
	{"PATRICK.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Patrick"},
	{"SHRIKE.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Shrike"},
	{"POLYGONER.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Polygoner"},
	{"FRIDGE.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Fridge"},
	{"SOUL-REAPER.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Soulreaper.lua"},
	{"SCP-106.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/SCP-106"},
	{"CHRONO-SENTINEL.TXT", "https://raw.githubusercontent.com/Lock1213/Scripts/refs/heads/main/Chrono%20Sentinel%20(Converted%20With%20Music)"},
	{"RUIN-IX.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/RUIN%20IX"}  -- NEW: RUIN-IX
}

-- Add all script buttons
local y = 0
for _, info in ipairs(scripts) do
	local name, url = unpack(info)
	local b = Instance.new("TextButton")
	b.Parent = scriptlist
	b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	b.Position = UDim2.new(0, 0, 0, y)
	b.Size = UDim2.new(0, 132, 0, 23)
	b.Font = Enum.Font.SourceSans
	b.Text = name
	b.TextColor3 = Color3.fromRGB(0, 0, 0)
	b.TextSize = 20
	y = y + 24

	b.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(url, true))()
	end)
end

-- Execute button
execute.MouseButton1Click:Connect(function()
	local code = TextBox.Text
	if code ~= "" then
		local success, err = pcall(function()
			loadstring(code)()
		end)
		if success then
			output.Text = "Executed successfully!"
		else
			output.Text = "Error: " .. err
		end
	else
		output.Text = "Please enter a script."
	end
end)

-- Clear button
clear.MouseButton1Click:Connect(function()
	TextBox.Text = ""
	output.Text = "Output cleared."
end)

-- R6 button
R6.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/sunday102711-bit/E00KIDD-r6-by-me/refs/heads/main/R6%20Real"))()
end)

-- Re (respawn) button
Re.MouseButton1Click:Connect(function()
	local char = game.Players.LocalPlayer.Character
	if char then char.Humanoid.Health = 0 end
end)

-- Load (logo) button
logo.MouseButton1Click:Connect(function()
	local text = TextBox.Text
	if game.ReplicatedStorage:FindFirstChild("RemoteEvent") then
		game.ReplicatedStorage.RemoteEvent:FireServer(text)
	else
		output.Text = "RemoteEvent not found."
	end
end)