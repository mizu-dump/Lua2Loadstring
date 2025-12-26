writefile("WHATHAVEYOUDONE.mp3", game:HttpGet("https://github.com/ian49972/smth/raw/refs/heads/main/WHATHAVEYOUDONE.mp3"))

local object = game:GetObjects("rbxassetid://10973669978")[1]
object.Parent = game.Workspace
object:PivotTo(game.Players.LocalPlayer.Character:GetPivot())

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

player.CharacterAdded:Connect(function(newChar)
    character = newChar
end)

local phaseModels = {
    [1] = "rbxassetid://10973669978",
    [2] = "rbxassetid://10980258642",
    [3] = "rbxassetid://10980269902",
    [4] = "rbxassetid://10394012803",
    [5] = "rbxassetid://16333160399",
    [6] = "rbxassetid://16333261175"
}
local phasePartsSucked = {0, 50, 100, 150, 200, 250}
local currentPhase = 1
local partsSucked = 0
local attractedParts = {}

local function isCharacterPart(part)
    local model = part:FindFirstAncestorWhichIsA("Model")
    return model and model:FindFirstChildWhichIsA("Humanoid") ~= nil
end

local function disableCollisions(model)
    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

local function changePhase(newPhase)
    if currentPhase == newPhase then return end
    
    local oldPosition = object:GetPivot()
    object:Destroy()
    
    object = game:GetObjects(phaseModels[newPhase])[1]
    object.Parent = game.Workspace
    object:PivotTo(oldPosition)
    disableCollisions(object)
    currentPhase = newPhase
    
    print("Big boy")
end

local function onPartDestroyed()
    partsSucked = partsSucked + 1
    for i, threshold in ipairs(phasePartsSucked) do
        if partsSucked >= threshold and currentPhase < i then
            changePhase(i)
            break
        end
    end
end

coroutine.wrap(function()
    while true do
        task.wait(2)
        local candidates = {}
        for _, obj in ipairs(game.Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Parent and not isCharacterPart(obj) and not obj:IsDescendantOf(object) and obj.Size.Magnitude < 20 and not table.find(attractedParts, obj) then
                local dist = (obj.Position - object:GetPivot().Position).Magnitude
                table.insert(candidates, {obj = obj, dist = dist})
            end
        end
        if #candidates > 0 then
            table.sort(candidates, function(a, b) return a.dist < b.dist end)
            local chosen = candidates[1].obj
            if chosen.Anchored then
                chosen.Anchored = false
            end
            table.insert(attractedParts, chosen)
        end
    end
end)()

RunService.Heartbeat:Connect(function(dt)
    for i = #attractedParts, 1, -1 do
        local obj = attractedParts[i]
        if obj and obj.Parent and not isCharacterPart(obj) then
            local objectPos = object:GetPivot().Position
            local dist = (obj.Position - objectPos).Magnitude
            if dist > 2 then
                local lerpAlpha = 0.2 * dt * (100 / dist)
                local newPos = obj.Position:Lerp(objectPos, lerpAlpha)
                obj.CFrame = CFrame.new(newPos) * obj.CFrame.Rotation
            else
                obj:Destroy()
                table.remove(attractedParts, i)
                onPartDestroyed()
            end
        else
            table.remove(attractedParts, i)
        end
    end
end)

local function getPhaseSettings()
    local phase = currentPhase
    if phase == 1 or phase == 2 or phase == 3 then
        return {
            minHeight = 5,
            maxHeight = 30,
            speed = 1,
            move = true
        }
    elseif phase == 4 then
        return {
            minHeight = 15,
            maxHeight = 25,
            speed = 0.7,
            move = true
        }
    elseif phase == 5 then
        return {
            minHeight = 25,
            maxHeight = 40,
            speed = 0.3,
            move = true
        }
    else
        return {
            minHeight = 35,
            maxHeight = 55,
            speed = 0,
            move = false
        }
    end
end

coroutine.wrap(function()
    while true do
        local settings = getPhaseSettings()
        if settings.move then
            local startCFrame = object:GetPivot()
            local playerPivot = character:GetPivot()
            local randomOffset = Vector3.new(math.random(-50, 50), math.random(settings.minHeight, settings.maxHeight), math.random(-50, 50))
            local targetPos = playerPivot.Position + randomOffset
            targetPos = Vector3.new(targetPos.X, math.max(targetPos.Y, playerPivot.Position.Y + settings.minHeight), targetPos.Z)
            local dir = targetPos - startCFrame.Position
            if dir.Magnitude < 1 then
                task.wait(1)
                continue
            end
            dir = dir.Unit
            local targetCFrame = CFrame.lookAt(targetPos, targetPos + dir)
            local duration = math.random(3/settings.speed, 10/settings.speed)
            local elapsed = 0
            while elapsed < duration do
                elapsed += RunService.Heartbeat:Wait()
                local alpha = elapsed / duration
                object:PivotTo(startCFrame:Lerp(targetCFrame, alpha))
            end
        else
            local currentCFrame = object:GetPivot()
            local currentPos = currentCFrame.Position
            local playerPivot = character:GetPivot()
            local targetCFrame = CFrame.lookAt(currentPos, playerPivot.Position)
            object:PivotTo(targetCFrame)
            task.wait(0.1)
        end
    end
end)()

coroutine.wrap(function()
    while true do
        task.wait(3)
        if not character or not character:FindFirstChild("HumanoidRootPart") then continue end
        
        local skullTemplate = game:GetObjects("rbxassetid://16940644099")[1]
        local skull = skullTemplate:Clone()
        skull.Parent = game.Workspace
        
        local launchSound = Instance.new("Sound")
        launchSound.SoundId = "rbxassetid://127670808213759"
        launchSound.Volume = 2
        launchSound.Parent = game.Workspace
        launchSound:Play()
        
        local objectCFrame = object:GetPivot()
        local spawnOffset = objectCFrame.LookVector * 5
        skull:PivotTo(CFrame.new(objectCFrame.Position + spawnOffset) * objectCFrame.Rotation)
        
        local playerPos = character.HumanoidRootPart.Position
        local skullDir = (playerPos - skull:GetPivot().Position).Unit
        local skullTargetCFrame = CFrame.lookAt(skull:GetPivot().Position, skull:GetPivot().Position + skullDir)
        skull:PivotTo(skullTargetCFrame)
        
        local speed = 50
        local moving = true
        coroutine.wrap(function()
            while skull and skull.Parent and moving do
                local dt = RunService.Heartbeat:Wait()
                local newPos = skull:GetPivot().Position + skullDir * speed * dt
                skull:PivotTo(CFrame.new(newPos) * skull:GetPivot().Rotation)
            end
        end)()
        
        task.delay(17, function()
            if skull and skull.Parent then
                skull:Destroy()
            end
        end)
        
        local touchedConnection
        local exploded = false
        touchedConnection = skull.DescendantAdded:Connect(function(desc)
            if desc:IsA("BasePart") then
                desc.Touched:Connect(function(other)
                    if not exploded and other and other.Parent then
                        exploded = true
                        moving = false
                        if touchedConnection then touchedConnection:Disconnect() end
                        
                        local explosionPos = skull:GetPivot().Position
                        local explosion = Instance.new("Explosion")
                        explosion.Position = explosionPos
                        explosion.BlastRadius = 10
                        explosion.BlastPressure = 0
                        explosion.Parent = game.Workspace
                        
                        local explodeSound = Instance.new("Sound")
                        explodeSound.SoundId = "rbxassetid://90854697257230"
                        explodeSound.Volume = 2
                        explodeSound.Parent = game.Workspace
                        explodeSound:Play()
                        
                        local playerRoot = character:FindFirstChild("HumanoidRootPart")
                        if playerRoot then
                            local dist = (playerRoot.Position - explosionPos).Magnitude
                            if dist <= 10 then
                                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                                if humanoid then
                                    humanoid:TakeDamage(45)
                                end
                            end
                        end
                        
                        skull:Destroy()
                    end
                end)
            end
        end)

        for _, desc in ipairs(skull:GetDescendants()) do
            if desc:IsA("BasePart") then
                desc.Touched:Connect(function(other)
                    if not exploded and other and other.Parent then
                        exploded = true
                        moving = false
                        if touchedConnection then touchedConnection:Disconnect() end
                        
                        local explosionPos = skull:GetPivot().Position
                        local explosion = Instance.new("Explosion")
                        explosion.Position = explosionPos
                        explosion.BlastRadius = 10
                        explosion.BlastPressure = 0
                        explosion.Parent = game.Workspace
                        
                        local explodeSound = Instance.new("Sound")
                        explodeSound.SoundId = "rbxassetid://90854697257230"
                        explodeSound.Volume = 2
                        explodeSound.Parent = game.Workspace
                        explodeSound:Play()
                        
                        local playerRoot = character:FindFirstChild("HumanoidRootPart")
                        if playerRoot then
                            local dist = (playerRoot.Position - explosionPos).Magnitude
                            if dist <= 10 then
                                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                                if humanoid then
                                    humanoid:TakeDamage(45)
                                end
                            end
                        end
                        
                        skull:Destroy()
                    end
                end)
            end
        end
    end
end)()

disableCollisions(object)

local sound = Instance.new("Sound")
sound.SoundId = getcustomasset("WHATHAVEYOUDONE.mp3")
sound.Volume = 2
sound.Parent = game.Workspace
sound.Looped = true
sound:Play()