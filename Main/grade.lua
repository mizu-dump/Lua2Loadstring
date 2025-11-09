-- ServerScript in ServerScriptService
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get RemoteEvent
local updateEvent = ReplicatedStorage:WaitForChild("UpdateGrade")

-- Create leaderboard for each player
Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local grade = Instance.new("IntValue")
	grade.Name = "Grade"
	grade.Value = 0
	grade.Parent = leaderstats
end)

-- When a client requests to update their grade
updateEvent.OnServerEvent:Connect(function(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local grade = leaderstats:FindFirstChild("Grade")
		if grade then
			grade.Value += 1
		end
	end
end)