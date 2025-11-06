local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- spawn near player
local basePos = hrp.Position + Vector3.new(0,-5,0)

-- make BobWalk1 only (clean)
if workspace:FindFirstChild("BobWalk1") == nil then
    local BobWalk1 = Instance.new("Part", workspace)
    BobWalk1.CanCollide = false
    BobWalk1.Anchored = true
    BobWalk1.CFrame = CFrame.new(basePos)
    BobWalk1.Size = Vector3.new(1139.2593994140625, 1.5, 2048)
    BobWalk1.Name = "BobWalk1"
    BobWalk1.Transparency = 1
end

-- anti void again
if workspace:FindFirstChild("VoidPart") == nil then
    local VoidPart = Instance.new("Part", workspace)
    VoidPart.Position = hrp.Position + Vector3.new(0,-10,-40)
    VoidPart.Name = "VoidPart"
    VoidPart.Size = Vector3.new(2048, 1, 2048)
    VoidPart.Material = "ForceField"
    VoidPart.Anchored = true
    VoidPart.Transparency = 1
    VoidPart.CanCollide = false

    local TournamentAntiVoid = Instance.new("Part", VoidPart)
    TournamentAntiVoid.Name = "TAntiVoid"
    TournamentAntiVoid.Size = Vector3.new(2048, 15, 2048)
    TournamentAntiVoid.Position = hrp.Position + Vector3.new(0,15,-40)
    TournamentAntiVoid.Anchored = true
    TournamentAntiVoid.Transparency = 1
    TournamentAntiVoid.CanCollide = false
end