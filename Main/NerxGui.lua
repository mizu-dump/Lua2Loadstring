-- Combined Speed + Avatar Changer GUI (Rainbow, draggable, local-only)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local function getHumanoid()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "ComboGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromScale(0.25, 0.35)
frame.Position = UDim2.fromScale(0.37, 0.32)
frame.Active = true
frame.Draggable = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0.15, 0)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.fromScale(1, 0.12)
title.BackgroundTransparency = 1
title.Text = "Speed + Avatar"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)
title.Parent = frame

-- SPEED SECTION
local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.fromScale(0.85, 0.12)
speedBox.Position = UDim2.fromScale(0.075, 0.16)
speedBox.PlaceholderText = "WalkSpeed"
speedBox.TextScaled = true
speedBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.Parent = frame
Instance.new("UICorner", speedBox)

local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.fromScale(0.85, 0.12)
speedButton.Position = UDim2.fromScale(0.075, 0.30)
speedButton.Text = "Apply Speed"
speedButton.TextScaled = true
speedButton.Font = Enum.Font.GothamBold
speedButton.BackgroundColor3 = Color3.fromRGB(45,45,45)
speedButton.TextColor3 = Color3.new(1,1,1)
speedButton.Parent = frame
Instance.new("UICorner", speedButton)

speedButton.MouseButton1Click:Connect(function()
	local speed = tonumber(speedBox.Text)
	if speed then
		getHumanoid().WalkSpeed = speed
	end
end)

-- AVATAR SECTION
local userBox = Instance.new("TextBox")
userBox.Size = UDim2.fromScale(0.85, 0.12)
userBox.Position = UDim2.fromScale(0.075, 0.48)
userBox.PlaceholderText = "Username"
userBox.TextScaled = true
userBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
userBox.TextColor3 = Color3.new(1,1,1)
userBox.Parent = frame
Instance.new("UICorner", userBox)

local avatarButton = Instance.new("TextButton")
avatarButton.Size = UDim2.fromScale(0.85, 0.12)
avatarButton.Position = UDim2.fromScale(0.075, 0.62)
avatarButton.Text = "Change Outfit"
avatarButton.TextScaled = true
avatarButton.Font = Enum.Font.GothamBold
avatarButton.BackgroundColor3 = Color3.fromRGB(45,45,45)
avatarButton.TextColor3 = Color3.new(1,1,1)
avatarButton.Parent = frame
Instance.new("UICorner", avatarButton)

avatarButton.MouseButton1Click:Connect(function()
	local username = userBox.Text
	if username == "" then return end

	local success, userId = pcall(function()
		return Players:GetUserIdFromNameAsync(username)
	end)

	if not success then
		avatarButton.Text = "User not found"
		task.wait(1.5)
		avatarButton.Text = "Change Outfit"
		return
	end

	local humanoid = getHumanoid()
	local desc = Players:GetHumanoidDescriptionFromUserId(userId)
	humanoid:ApplyDescription(desc)
end)

-- Rainbow effect
local hue = 0
RunService.RenderStepped:Connect(function()
	hue += 0.005
	if hue > 1 then hue = 0 end
	frame.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
end)
