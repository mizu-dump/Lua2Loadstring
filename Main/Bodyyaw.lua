-- ⚡ Instant Snap Body Yaw Script
-- Makes your character instantly face random directions fast
-- Put this in StarterCharacterScripts or run locally

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

-- ⚙️ Settings
local directionChangeInterval = 0.05 -- how often to change direction (smaller = faster)

while task.wait(directionChangeInterval) do
    local randomYaw = math.random(0, 360)
    root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.rad(randomYaw), 0)
end