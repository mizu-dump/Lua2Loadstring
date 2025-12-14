game.Players.PlayerAdded:Connect(function(player)
	local backpack = player:WaitForChild("Backpack")

	local function makeTool(name)
		local tool = Instance.new("Tool")
		tool.Name = name
		tool.RequiresHandle = false
		tool.CanBeDropped = false
		tool.Parent = backpack
	end

	makeTool("Move")
	makeTool("Clone")
	makeTool("Delete")
end)
