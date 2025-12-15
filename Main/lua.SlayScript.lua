-- SERVER SCRIPT (ServerScriptService)

local Players = game:GetService("Players")

local function copyTools(fromPlayer, toPlayer)
	if not fromPlayer or not toPlayer then return end

	for _, tool in ipairs(fromPlayer.Backpack:GetChildren()) do
		if tool:IsA("Tool") then
			tool:Clone().Parent = toPlayer.Backpack
		end
	end

	if fromPlayer.Character then
		for _, tool in ipairs(fromPlayer.Character:GetChildren()) do
			if tool:IsA("Tool") then
				tool:Clone().Parent = toPlayer.Backpack
			end
		end
	end
end

Players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(msg)
		-- /copytool PlayerName
		local targetName = msg:match("^/copytool%s+(%S+)$")
		if targetName then
			local target = Players:FindFirstChild(targetName)
			if target then
				copyTools(target, player)
			end
		end
	end)
end)