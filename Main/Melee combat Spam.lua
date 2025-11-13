-- Server: validates melee attack requests and applies damage safely
-- Place this in ServerScriptService

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local PhysicsService = game:GetService("PhysicsService") -- optional
local MELEE_EVENT = ReplicatedStorage:WaitForChild("MeleeAttackEvent")

-- server config
local MAX_MELEE_RANGE = 8           -- studs max reach
local DAMAGE = 15                   -- damage per hit
local COOLDOWN = 0.1                -- minimum seconds between hits per attacker (server-enforced)

-- per-player cooldown table
local lastAttack = {}  -- [player] = os.clock() of last accepted attack

-- Helper to get character's primary part (HumanoidRootPart)
local function getRootPart(character)
    if not character then return nil end
    return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
end

-- Validate and apply damage
MELEE_EVENT.OnServerEvent:Connect(function(player, targetPlayerUserId)
    if typeof(targetPlayerUserId) ~= "number" then
        return -- invalid argument
    end

    -- basic cooldown check
    local now = os.clock()
    local last = lastAttack[player] or 0
    if now - last < COOLDOWN then
        return
    end

    -- ensure player and their character are valid
    local attackerChar = player.Character
    if not attackerChar then return end
    local attackerRoot = getRootPart(attackerChar)
    if not attackerRoot then return end

    -- ensure attacker actually has a melee tool equipped (server-side check)
    local toolEquipped = false
    local humanoid = attackerChar:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local equippedTool = humanoid and humanoid:FindFirstChildOfClass and humanoid:FindFirstChildOfClass("Tool")
        if equippedTool and equippedTool.Name == "MeleeTool" then
            toolEquipped = true
        end
    end
    if not toolEquipped then
        return
    end

    -- find the target player by userId
    local targetPlayer
    for _, pl in pairs(Players:GetPlayers()) do
        if pl.UserId == targetPlayerUserId then
            targetPlayer = pl
            break
        end
    end
    if not targetPlayer or not targetPlayer.Character then return end

    local targetRoot = getRootPart(targetPlayer.Character)
    local targetHum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not targetRoot or not targetHum or targetHum.Health <= 0 then return end

    -- distance check
    local dist = (attackerRoot.Position - targetRoot.Position).Magnitude
    if dist > MAX_MELEE_RANGE then
        return
    end

    -- optional line-of-sight check (raycast from attacker to target)
    local rayOrigin = attackerRoot.Position
    local rayDir = (targetRoot.Position - rayOrigin)
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = {attackerChar, targetPlayer.Character}
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    rayParams.IgnoreWater = true
    local rayResult = workspace:Raycast(rayOrigin, rayDir, rayParams)
    if rayResult then
        -- If a blocking object was hit before reaching the target, the raycast returns something.
        -- But because we excluded both characters, rayResult would be non-nil only if something else blocks.
        local hitPos = rayResult.Position
        local hitDist = (hitPos - rayOrigin).Magnitude
        if hitDist < rayDir.Magnitude - 0.5 then
            -- something in the way
            return
        end
    end

    -- passed validation: apply damage
    lastAttack[player] = now
    -- apply damage safely (Use Humanoid:TakeDamage for standard behavior)
    if targetHum and targetHum.Health > 0 then
        targetHum:TakeDamage(DAMAGE)
    end

    -- (optional) play server side effects here e.g. sound, hit particles, remote to attacker for feedback
end)