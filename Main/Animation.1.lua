local Players = game:GetService("Players")

local ANIMATION_IDS = {
    Idle  = "rbxassetid://739423853",
    Walk  = "rbxassetid://739423871",
    Run   = "rbxassetid://739423910",
    Jump  = "rbxassetid://739423880",
    Climb = "rbxassetid://739423891",
}

local function onCharacterAdded(character)
    local AnimateScript = character:WaitForChild("Animate")

    if not AnimateScript then 
        return 
    end

    local function replaceAnimation(moduleName, animIdKey, animInstanceName)
        local module = AnimateScript:FindFirstChild(moduleName)
        if module then
            local animInstance = module:FindFirstChild(animInstanceName)
            if animInstance and ANIMATION_IDS[animIdKey] then
                animInstance.AnimationId = ANIMATION_IDS[animIdKey]
            end
        end
    end

    replaceAnimation("idle", "Idle", "Animation1")

    replaceAnimation("walk", "Walk", "WalkAnim")

    replaceAnimation("run", "Run", "RunAnim")

    replaceAnimation("jump", "Jump", "JumpAnim")

    replaceAnimation("climb", "Climb", "ClimbAnim")
end

local player = Players.LocalPlayer
player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end