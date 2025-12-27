--// ⚡ ALDRICH PROJECT 01 - FINAL STORM EDITION
--// By Aldrich | Storm Theme | Key System | Script Hub

if not game:IsLoaded() then game.Loaded:Wait() end

--------------------------------------------------
-- CONFIG
--------------------------------------------------
local REQUIRED_KEY = "ArshakaWasHere"

--------------------------------------------------
-- SERVICES
--------------------------------------------------
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local guiParent = game:GetService("CoreGui")

--------------------------------------------------
-- CLEAN OLD GUI
--------------------------------------------------
pcall(function()
	guiParent:FindFirstChild("AldrichProject01"):Destroy()
	guiParent:FindFirstChild("AldrichKey01"):Destroy()
end)

--------------------------------------------------
-- KEY GUI
--------------------------------------------------
local keyGui = Instance.new("ScreenGui", guiParent)
keyGui.Name = "AldrichKey01"

local keyFrame = Instance.new("Frame", keyGui)
keyFrame.Size = UDim2.new(0,420,0,220)
keyFrame.Position = UDim2.new(0.5,-210,0.4,-110)
keyFrame.BackgroundColor3 = Color3.fromRGB(10,18,40)
keyFrame.Active = true
keyFrame.Draggable = true
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0,16)

local kTitle = Instance.new("TextLabel", keyFrame)
kTitle.Text = "⚡ ALDRICH PROJECT 01"
kTitle.Size = UDim2.new(1,0,0,40)
kTitle.BackgroundTransparency = 1
kTitle.Font = Enum.Font.GothamBlack
kTitle.TextSize = 18
kTitle.TextColor3 = Color3.fromRGB(180,220,255)

local kSub = Instance.new("TextLabel", keyFrame)
kSub.Text = "Enter Access Key"
kSub.Position = UDim2.new(0,0,0,40)
kSub.Size = UDim2.new(1,0,0,20)
kSub.BackgroundTransparency = 1
kSub.Font = Enum.Font.Gotham
kSub.TextSize = 13
kSub.TextColor3 = Color3.fromRGB(200,200,220)

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.PlaceholderText = "ArshakaWasHere"
keyBox.Size = UDim2.new(0.9,0,0,40)
keyBox.Position = UDim2.new(0.05,0,0,80)
keyBox.BackgroundColor3 = Color3.fromRGB(15,28,60)
keyBox.TextColor3 = Color3.fromRGB(255,255,255)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0,10)

local unlock = Instance.new("TextButton", keyFrame)
unlock.Text = "UNLOCK"
unlock.Size = UDim2.new(0.9,0,0,42)
unlock.Position = UDim2.new(0.05,0,0,140)
unlock.BackgroundColor3 = Color3.fromRGB(80,140,255)
unlock.TextColor3 = Color3.new(1,1,1)
unlock.Font = Enum.Font.GothamBold
unlock.TextSize = 14
Instance.new("UICorner", unlock).CornerRadius = UDim.new(0,10)

--------------------------------------------------
-- MAIN GUI
--------------------------------------------------
local function createMainGUI()
	local gui = Instance.new("ScreenGui", guiParent)
	gui.Name = "AldrichProject01"
	gui.ResetOnSpawn = false

	local main = Instance.new("Frame", gui)
	main.Size = UDim2.new(0,640,0,420)
	main.Position = UDim2.new(0.25,0,0.18,0)
	main.BackgroundColor3 = Color3.fromRGB(8,14,32)
	main.Active = true
	main.Draggable = true
	Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

	-- Lightning Gradient
	local grad = Instance.new("UIGradient", main)
	grad.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0,Color3.fromRGB(10,18,40)),
		ColorSequenceKeypoint.new(0.5,Color3.fromRGB(20,40,90)),
		ColorSequenceKeypoint.new(1,Color3.fromRGB(10,18,40))
	}

	task.spawn(function()
		while task.wait(0.03) do
			grad.Rotation = (grad.Rotation + 0.3) % 360
		end
	end)

	-- Title
	local title = Instance.new("TextLabel", main)
	title.Text = "⚡ Aldrich Project 01"
	title.Size = UDim2.new(1,-20,0,36)
	title.Position = UDim2.new(0,10,0,8)
	title.BackgroundTransparency = 1
	title.Font = Enum.Font.GothamBlack
	title.TextSize = 20
	title.TextXAlignment = Left
	title.TextColor3 = Color3.fromRGB(190,230,255)

	-- Tabs
	local function tabBtn(text,x)
		local b = Instance.new("TextButton", main)
		b.Text = text
		b.Size = UDim2.new(0,300,0,32)
		b.Position = UDim2.new(0,10+x,0,50)
		b.BackgroundColor3 = Color3.fromRGB(30,80,180)
		b.TextColor3 = Color3.new(1,1,1)
		b.Font = Enum.Font.GothamBold
		b.TextSize = 13
		Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
		return b
	end

	local exeTab = tabBtn("EXECUTOR",0)
	local scriptTab = tabBtn("SCRIPTS",310)

	-- Pages
	local function page()
		local f = Instance.new("Frame", main)
		f.Size = UDim2.new(1,-20,1,-100)
		f.Position = UDim2.new(0,10,0,90)
		f.BackgroundTransparency = 1
		f.Visible = false
		return f
	end

	local exePage = page()
	exePage.Visible = true
	local scriptPage = Instance.new("ScrollingFrame", page())
	scriptPage.Parent = main
	scriptPage.CanvasSize = UDim2.new(0,0,0,0)
	scriptPage.ScrollBarThickness = 6

	-- Executor
	local codeBox = Instance.new("TextBox", exePage)
	codeBox.Size = UDim2.new(0.7,0,1,-10)
	codeBox.Position = UDim2.new(0,0,0,5)
	codeBox.MultiLine = true
	codeBox.ClearTextOnFocus = false
	codeBox.TextWrapped = true
	codeBox.TextXAlignment = Left
	codeBox.TextYAlignment = Top
	codeBox.Font = Enum.Font.Code
	codeBox.TextSize = 13
	codeBox.BackgroundColor3 = Color3.fromRGB(15,28,60)
	codeBox.TextColor3 = Color3.fromRGB(230,240,255)
	Instance.new("UICorner", codeBox).CornerRadius = UDim.new(0,12)

	local run = Instance.new("TextButton", exePage)
	run.Text = "EXECUTE"
	run.Size = UDim2.new(0.28,0,0,44)
	run.Position = UDim2.new(0.72,0,0,5)
	run.BackgroundColor3 = Color3.fromRGB(90,160,255)
	run.TextColor3 = Color3.new(1,1,1)
	run.Font = Enum.Font.GothamBold
	run.TextSize = 14
	Instance.new("UICorner", run).CornerRadius = UDim.new(0,10)

	run.MouseButton1Click:Connect(function()
		local f,e = loadstring(codeBox.Text)
		if f then pcall(f) else warn(e) end
	end)

	-- Search
	local search = Instance.new("TextBox", scriptPage)
	search.PlaceholderText = "Search script..."
	search.Size = UDim2.new(1,-10,0,32)
	search.Position = UDim2.new(0,5,0,5)
	search.BackgroundColor3 = Color3.fromRGB(12,24,50)
	search.TextColor3 = Color3.new(1,1,1)
	search.Font = Enum.Font.Gotham
	search.TextSize = 14
	Instance.new("UICorner", search).CornerRadius = UDim.new(0,8)

	-- SCRIPT LIST (ASLI)
	local scripts = {
		{"Guts","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/GUTS"},
		{"Devoyance","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Devoyance"},
		{"All Seeing Hand","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/hand"},
		{"Omni God","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Omni%20God"},
		{"Star Glitcher","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Spectrum%20Glitcher"},
		{"Rainbow King","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Rainbow%20Banisher"},
		{"Xester V2","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/XESTER%20V2"},
		{"Chrono Sentinel","https://raw.githubusercontent.com/Lock1213/Scripts/refs/heads/main/Chrono%20Sentinel%20(Converted%20With%20Music)"}
	}

	local buttons = {}
	local y = 45

	for _,v in ipairs(scripts) do
		local b = Instance.new("TextButton", scriptPage)
		b.Text = "⚡ "..v[1]
		b.Size = UDim2.new(1,-10,0,36)
		b.Position = UDim2.new(0,5,0,y)
		b.BackgroundColor3 = Color3.fromRGB(40,90,200)
		b.TextColor3 = Color3.new(1,1,1)
		b.Font = Enum.Font.GothamBold
		b.TextSize = 13
		Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)

		b.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(v[2]))()
		end)

		table.insert(buttons,{btn=b,name=v[1]})
		y += 42
	end

	scriptPage.CanvasSize = UDim2.new(0,0,0,y)

	search:GetPropertyChangedSignal("Text"):Connect(function()
		for _,v in ipairs(buttons) do
			v.btn.Visible = v.name:lower():find(search.Text:lower()) ~= nil
		end
	end)

	exeTab.MouseButton1Click:Connect(function()
		exePage.Visible = true
		scriptPage.Visible = false
	end)

	scriptTab.MouseButton1Click:Connect(function()
		exePage.Visible = false
		scriptPage.Visible = true
	end)

	-- Calm Sound
	local calm = Instance.new("Sound", SoundService)
	calm.SoundId = "rbxassetid://9118826046"
	calm.Volume = 0.25
	calm.Looped = true
	calm:Play()
end

--------------------------------------------------
-- KEY CHECK
--------------------------------------------------
unlock.MouseButton1Click:Connect(function()
	if keyBox.Text:lower() == REQUIRED_KEY:lower() then
		keyGui:Destroy()
		createMainGUI()
	else
		keyBox.Text = ""
		keyBox.PlaceholderText = "Wrong Key ⚡"
	end
end)