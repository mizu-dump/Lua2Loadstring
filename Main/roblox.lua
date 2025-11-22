-- Ultimate Double Jump LocalScript
local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Config
local maxJumps = 2
local jumpPower = 50
local airControl = 0.5 -- multiplies horizontal movement while in air

-- State
local jumpCount = 0
local character, humanoid, rootPart

-- Setup character
local function setupCharacter(char)
    character = char
    humanoid = char:WaitForChild("Humanoid")
    rootPart = char:WaitForChild("HumanoidRootPart")
    jumpCount = 0

    humanoid.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Landed then
            jumpCount = 0
        end
    end)
end

-- Handle jump input
uis.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
        if humanoid and jumpCount < maxJumps then
            jumpCount += 1
            humanoid.Jump = true
            -- Apply custom jump power and air control
            rootPart.Velocity = Vector3.new(rootPart.Velocity.X, jumpPower, rootPart.Velocity.Z)
        end
    end
end)

-- Optional: smooth air control
runService.RenderStepped:Connect(function()
    if humanoid and jumpCount > 0 and humanoid:GetState() ~= Enum.HumanoidStateType.Landed then
        local moveDir = Vector3.new(
            (uis:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (uis:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
            0,
            (uis:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (uis:IsKeyDown(Enum.KeyCode.W) and 1 or 0)
        )
        rootPart.Velocity = Vector3.new(
            moveDir.X * humanoid.WalkSpeed * airControl,
            rootPart.Velocity.Y,
            moveDir.Z * humanoid.WalkSpeed * airControl
        )
    end
end)

-- Connect character
if player.Character then
    setupCharacter(player.Character)
end
player.CharacterAdded:Connect(setupCharacter)