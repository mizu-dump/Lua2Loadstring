local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local spamming = false

-- NEW PERMANENT SPEED
local WALK_SPEED = 30

-- FAST BUT SAFE
local FIRE_DELAY = 0.03

-- Apply & lock speed
local function applySpeed()
	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.WalkSpeed ~= WALK_SPEED then
			humanoid.WalkSpeed = WALK_SPEED
		end
	end
end

-- Lock speed constantly
RunService.Heartbeat:Connect(applySpeed)

-- Reapply on respawn
player.CharacterAdded:Connect(function()
	task.wait(0.2)
	applySpeed()
end)

local function fireAbility()
	-- === DEMONIC STRIKE ===
	local demonicTool = player.Backpack:FindFirstChild("Demonic Strike")
	if ReplicatedStorage:FindFirstChild("remotes")
		and ReplicatedStorage.remotes:FindFirstChild("abilityCast") then
		ReplicatedStorage.remotes.abilityCast:FireServer(
			player,
			"Demonic Strike"
		)
	end

	if demonicTool and demonicTool:FindFirstChild("spellEvent") then
		demonicTool.spellEvent:FireServer(
			"FDF1EF52-E9A9-4891-BD92-7E39BBA81701"
		)
	end

	-- === GUARDIAN CALL ===
	local guardianTool = player.Backpack:FindFirstChild("Guardian Call")
	if ReplicatedStorage:FindFirstChild("remotes")
		and ReplicatedStorage.remotes:FindFirstChild("abilityCast") then
		ReplicatedStorage.remotes.abilityCast:FireServer(
			player,
			"Guardian Call"
		)
	end

	if guardianTool and guardianTool:FindFirstChild("abilityEvent") then
		guardianTool.abilityEvent:FireServer(
			"B42199C3-231A-40C2-A5D9-C35E1FFB2FE3"
		)
	end
end

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.V and not spamming then
		spamming = true
		task.spawn(function()
			while spamming do
				fireAbility()
				task.wait(FIRE_DELAY)
			end
		end)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.V then
		spamming = false
	end
end)
