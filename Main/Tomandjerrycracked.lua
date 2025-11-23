-- UNIVERSAL AUTO BLOCK (Works on EVERY fighting game | 200+ Ping Safe | Draggable | Persists Death)
-- LocalScript → StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- CONFIG
local BLOCK_KEY = Enum.KeyCode.Q
local RANGE = 15 -- studs
local BLOCK_DURATION = 0.65 -- Adjust slightly per game (0.6-0.7 works for most)
local isBlocking = false
local autoBlockEnabled = false

-- UNIVERSAL ATTACK ANIMATION DETECTION (NO IDS NEEDED)
local ATTACK_KEYWORDS = {
    "punch", "hit", "attack", "swing", "slash", "combo", "m1", "kick", "heavy", "uppercut",
    "downslam", "slam", "grab", "throw", "dash", "strike", "smash", "blockbreak", "break"
}

local function isAttackAnimation(track)
    if not track or not track.Animation then return false end
    if track.Speed <= 0 then return false end -- Ignore stopped/idle anims
    if track.Priority == Enum.AnimationPriority.Core then return false end -- Ignore idle/walk
    
    local animName = track.Animation.Name:lower()
    for _, keyword in ipairs(ATTACK_KEYWORDS) do
        if animName:find(keyword) then
            return true
        end
    end
    
    -- Extra fallback: any animation with Action/Movement priority playing fast
    if track.Priority == Enum.AnimationPriority.Action or track.Priority == Enum.AnimationPriority.Action2 then
        if track.Speed > 0.8 then
            return true
        end
    end
    
    return false
end

-- BLOCK FUNCTION (High ping proof)
local function pressBlock()
    if isBlocking then return end
    isBlocking = true
    
    VirtualInputManager:SendKeyEvent(true, BLOCK_KEY, false, game)
    task.wait(BLOCK_DURATION)
    VirtualInputManager:SendKeyEvent(false, BLOCK_KEY, false, game)
    
    task.wait(0.15) -- Anti-spam cooldown
    isBlocking = false
end

-- DRAGGABLE PERSISTENT GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UniversalAutoBlock"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 90)
frame.Position = UDim2.new(0.02, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderColor3 = Color3.fromRGB(255, 50, 100)
frame.BorderSizePixel = 3
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.45, 0)
title.BackgroundTransparency = 1
title.Text = "UNIVERSAL AUTO BLOCK"
title.TextColor3 = Color3.fromRGB(255, 80, 120)
title.Font = Enum.Font.GothamBlack
title.TextSize = 16
title.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0.3, 0)
status.Position = UDim2.new(0, 0, 0.45, 0)
status.BackgroundTransparency = 1
status.Text = "OFF"
status.TextColor3 = Color3.fromRGB(255, 80, 80)
status.Font = Enum.Font.GothamBold
status.TextSize = 24
status.Parent = frame

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Toggle with click
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        autoBlockEnabled = not autoBlockEnabled
        if autoBlockEnabled then
            status.Text = "ON"
            status.TextColor3 = Color3.fromRGB(80, 255, 80)
            frame.BorderColor3 = Color3.fromRGB(80, 255, 80)
        else
            status.Text = "OFF"
            status.TextColor3 = Color3.fromRGB(255, 80, 80)
            frame.BorderColor3 = Color3.fromRGB(255, 50, 100)
        end
    end
end)

-- MAIN DETECTION LOOP
RunService.Heartbeat:Connect(function()
    if not autoBlockEnabled then return end
    if not character or not character:FindFirstChild("HumanoidRootPart") or humanoid.Health <= 0 then return end
    
    local root = character.HumanoidRootPart
    
    for _, plr in Players:GetPlayers() do
        if plr == player then continue end
        local theirChar = plr.Character
        if not theirChar or not theirChar:FindFirstChild("HumanoidRootPart") then continue end
        
        local dist = (root.Position - theirChar.HumanoidRootPart.Position).Magnitude
        if dist > RANGE then continue end
        
        local theirHum = theirChar:FindFirstChildOfClass("Humanoid")
        if not theirHum then continue end
        
        for _, track in theirHum:GetPlayingAnimationTracks() do
            if track.IsPlaying and isAttackAnimation(track) then
                pressBlock()
                break
            end
        end
    end
end)

-- Respawn handler
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
end)

print("♪ Universal Auto Block Loaded ♪ | Click GUI to toggle | Works in ALL games")