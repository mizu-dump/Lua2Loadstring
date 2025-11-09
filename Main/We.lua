--// Loopable WalkSpeed Script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local speed = 45  -- desired WalkSpeed

RunService.RenderStepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid.WalkSpeed ~= speed then
            humanoid.WalkSpeed = speed
        end
    end
end)
