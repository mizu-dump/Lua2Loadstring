-- LocalScript inside StarterGui

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false -- Keeps GUI after respawn
screenGui.Parent = playerGui

-- Create Lag Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 80, 0, 40) -- Small size
button.Position = UDim2.new(1, -90, 0.5, -20) -- Right side, vertically centered
button.Text = "Lag"
button.TextScaled = true
button.Parent = screenGui

-- Freeze function
local function fakeLag(seconds)
    local start = tick()
    while tick() - start < seconds do
        -- Busy-wait to simulate freeze
    end
end

-- Connect click
button.MouseButton1Click:Connect(function()
    fakeLag(1) -- Freeze for 1 second
end)