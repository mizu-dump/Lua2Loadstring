-- Get the players
local player1 = game.Players.Player1 -- Replace with the name of the player you want to copy from
local player2 = game.Players.Player2 -- Replace with the name of the player you want to copy to

-- Function to copy backpack
local function copyBackpack(fromPlayer, toPlayer)
    -- Clear the toPlayer's backpack
    for _, item in pairs(toPlayer.Backpack:GetChildren()) do
        item:Destroy()
    end
    
    -- Copy items from fromPlayer's backpack to toPlayer's backpack
    for _, item in pairs(fromPlayer.Backpack:GetChildren()) do
        local newItem = item:Clone()
        newItem.Parent = toPlayer.Backpack
    end
end

-- Call the function
copyBackpack(player1, player2)
