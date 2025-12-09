local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local AttackRemote = RS.Systems.ActionsSystem.Network:WaitForChild("Attack")
local NetworkRemote = LocalPlayer.Character:WaitForChild("Network") -- hotbar switch remote

-- SETTINGS
_G.AuraEnabled = false
_G.AuraRange = 15
_G.AuraDelay = 0.1
_G.Whitelist = { "Friend1", "Friend2" } -- names of friends
local ATTACK_ID = "1"

local CurrentWeaponSlot = 1

-- TRACK HOTBAR SLOT
NetworkRemote.OnClientEvent:Connect(function(...)
	local args = {...}
	if args[1] == "hotbarSlot" then
		CurrentWeaponSlot = args[2]
	end
end)

--====================================================
-- GUI CREATION
--====================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "WeaponAuraGUI"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- OPEN BUTTON
local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(0, 120, 0, 30)
OpenBtn.Position = UDim2.new(0, 20, 0.7, 0)
OpenBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
OpenBtn.Text = "Open Aura GUI"
OpenBtn.TextColor3 = Color3.new(1,1,1)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.Parent = ScreenGui
Instance.new("UICorner", OpenBtn)

-- MAIN FRAME
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0.1,0,0.35,0)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Visible = true
Frame.Parent = ScreenGui
Instance.new("UICorner", Frame)

-- TITLE
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,25)
Title.Position = UDim2.new(0,0,0,0)
Title.Text = "Weapon Aura (KILL AURA)"
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = Frame

-- CLOSE BUTTON
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0,22,0,22)
CloseBtn.Position = UDim2.new(1,-26,0,4)
CloseBtn.BackgroundColor3 = Color3.fromRGB(170,0,0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Parent = Frame
Instance.new("UICorner", CloseBtn)

CloseBtn.MouseButton1Click:Connect(function()
	Frame.Visible = false
	OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
	Frame.Visible = true
	OpenBtn.Visible = false
end)

-- TOGGLE AURA
local Toggle = Instance.new("TextButton")
Toggle.Size = UDim2.new(1,-20,0,30)
Toggle.Position = UDim2.new(0,10,0,35)
Toggle.Text = "Aura: OFF"
Toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
Toggle.TextColor3 = Color3.new(1,1,1)
Toggle.Font = Enum.Font.GothamBold
Toggle.Parent = Frame
Instance.new("UICorner", Toggle)

Toggle.MouseButton1Click:Connect(function()
	_G.AuraEnabled = not _G.AuraEnabled
	if _G.AuraEnabled then
		Toggle.Text = "Aura: ON"
		Toggle.BackgroundColor3 = Color3.fromRGB(0,170,0)
	else
		Toggle.Text = "Aura: OFF"
		Toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
	end
end)

-- RANGE BOX
local RangeBox = Instance.new("TextBox")
RangeBox.Size = UDim2.new(1,-20,0,25)
RangeBox.Position = UDim2.new(0,10,0,70)
RangeBox.Text = tostring(_G.AuraRange)
RangeBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
RangeBox.TextColor3 = Color3.new(1,1,1)
RangeBox.Parent = Frame
Instance.new("UICorner", RangeBox)

RangeBox.FocusLost:Connect(function()
	local val = tonumber(RangeBox.Text)
	if val then _G.AuraRange = val end
end)

-- DELAY BOX
local DelayBox = Instance.new("TextBox")
DelayBox.Size = UDim2.new(1,-20,0,25)
DelayBox.Position = UDim2.new(0,10,0,105)
DelayBox.Text = tostring(_G.AuraDelay)
DelayBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
DelayBox.TextColor3 = Color3.new(1,1,1)
DelayBox.Parent = Frame
Instance.new("UICorner", DelayBox)

DelayBox.FocusLost:Connect(function()
	local val = tonumber(DelayBox.Text)
	if val then _G.AuraDelay = val end
end)

--====================================================
-- DRAG LOGIC (PC + Mobile)
--====================================================
local dragging, dragStart, startPos
Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Frame.Position
	end
end)
Frame.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

--====================================================
-- RADIUS VISUALIZER
--====================================================
local RangePart = Instance.new("Part")
RangePart.Shape = Enum.PartType.Ball
RangePart.Anchored = true
RangePart.CanCollide = false
RangePart.Material = Enum.Material.Neon
RangePart.Transparency = 0.7
RangePart.Size = Vector3.new(_G.AuraRange*2,0.2,_G.AuraRange*2)
RangePart.Color = Color3.fromRGB(0,255,0)
RangePart.Parent = workspace

RunService.RenderStepped:Connect(function()
	local char = LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root then
		RangePart.Position = root.Position - Vector3.new(0,3,0)
		RangePart.Size = Vector3.new(_G.AuraRange*2,0.2,_G.AuraRange*2)
		RangePart.Transparency = _G.AuraEnabled and 0.55 or 0.85
	end
end)

--====================================================
-- WEAPON AURA LOOP (Slot 1 only)
--====================================================
task.spawn(function()
	while true do
		task.wait(_G.AuraDelay)
		if not _G.AuraEnabled then continue end
		local char = LocalPlayer.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if not root then continue end

		-- Only attack if slot 1 is equipped
		if CurrentWeaponSlot ~= 1 then continue end

		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character and not table.find(_G.Whitelist, plr.Name) then
				local tRoot = plr.Character:FindFirstChild("HumanoidRootPart")
				if tRoot and (tRoot.Position - root.Position).Magnitude <= _G.AuraRange then
					AttackRemote:InvokeServer(plr.Character, ATTACK_ID)
				end
			end
		end
	end
end)