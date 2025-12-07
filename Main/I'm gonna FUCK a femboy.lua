--[[
    INFINITE AUTO BONDS - Never Delete, Perfect Landing
    Classic look • Falls on ground • Stays forever
]]

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local BOND_DECAL_ID = 123280663984547

-- Toggle Button
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InfiniteBonds"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.26, 0, 0.18, 0)
button.Position = UDim2.new(0.075, 0, 0.083, 0)
button.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Text = "INFINITE BONDS [OFF]"
button.Font = Enum.Font.SourceSansBold
button.BorderSizePixel = 0
button.Parent = screenGui

local aspect = Instance.new("UIAspectRatioConstraint")
aspect.AspectRatio = 2.4
aspect.Parent = button

-- Main loop control
local running = false

local function createInfiniteBond()
    local character = player.Character or player.CharacterAdded:Wait()
    local head = character:FindFirstChild("Head")
    if not head then return end

    local spawnCF = head.CFrame * CFrame.new(0, 30, 0) -- High enough to fall nicely

    local bond = Instance.new("Part")
    bond.Name = "InfiniteBond"
    bond.Size = Vector3.new(1.96, 0.15, 1)
    bond.CFrame = spawnCF
    bond.Material = Enum.Material.Leather
    bond.Color = Color3.fromRGB(235, 185, 146) -- Perfect bond skin color
    bond.CanCollide = true
    bond.Anchored = false
    bond.Shape = Enum.PartType.Block
    bond.TopSurface = Enum.SurfaceType.Smooth
    bond.BottomSurface = Enum.SurfaceType.Smooth
    bond.Parent = workspace

    -- Decals on top and bottom (classic bond face)
    for _, face in pairs({Enum.NormalId.Top, Enum.NormalId.Bottom}) do
        local decal = Instance.new("Decal")
        decal.Face = face
        decal.Texture = "rbxassetid://" .. BOND_DECAL_ID
        decal.Parent = bond
    end

    -- Make it fall and land perfectly without bouncing/sinking
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(0, math.huge, 0)
    bv.Velocity = Vector3.new(0, -10, 0) -- Slight downward push for clean fall
    bv.P = 3000
    bv.Parent = bond

    -- Remove BodyVelocity when it touches ground so it rests perfectly
    local touchedConn
    touchedConn = bond.Touched:Connect(function(hit)
        if hit and hit.CanCollide and hit.Parent ~= character then
            if bv and bv.Parent then
                bv:Destroy()
            end
            touchedConn:Disconnect()
        end
    end)

    -- NEVER DELETE IT — stays forever
end

-- Spam loop
local function startBonds()
    if running then return end
    running = true
    button.Text = "INFINITE BONDS [ON]"
    button.BackgroundColor3 = Color3.fromRGB(56, 255, 0)

    spawn(function()
        while running do
            pcall(createInfiniteBond) -- pcall so it never breaks
            task.wait(0.1) -- Fast but smooth spam rate
        end
    end)
end

local function stopBonds()
    running = false
    button.Text = "INFINITE BONDS [OFF]"
    button.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
end

-- Toggle
button.Activated:Connect(function()
    if running then
        stopBonds()
    else
        startBonds()
    end
end)

print("Infinite Auto Bonds loaded! Click button to spam forever.")