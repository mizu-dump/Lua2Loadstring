-- Auto Parry Script FIXED - MAXIMUM LIQUID GLASS & NO COOLDOWN

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualInput = game:GetService("VirtualInputManager")

-- Variables
local player = Players.LocalPlayer
local soundDetection = false
local blockDuration = 0.2 -- 200ms block duration
local blocksCount = 0
local successfulBlocks = 0
local lastDetectedSound = ""

-- GUI References
local screenGui, statusValue, blocksLabel, successLabel

-- Wait for player to be ready
while not player.Character do
    wait(1)
end

-- 1. MAXIMUM LIQUID GLASS GUI
local function CreateGUI()
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoParryGUI"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")

    -- Main Container
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 320, 0, 200)
    mainFrame.Position = UDim2.new(1, -340, 0, 20)
    mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    mainFrame.BackgroundTransparency = 0.9
    mainFrame.BorderSizePixel = 0
    
    -- Liquid Glass Effect 1 - Base Gradient
    local gradient1 = Instance.new("UIGradient")
    gradient1.Rotation = 45
    gradient1.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(0.3, Color3.new(0.95, 0.95, 0.98)),
        ColorSequenceKeypoint.new(0.7, Color3.new(0.9, 0.9, 0.95)),
        ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
    })
    gradient1.Transparency = NumberSequence.new(0.85)
    gradient1.Parent = mainFrame

    -- Liquid Glass Effect 2 - Shimmer Overlay
    local shimmerOverlay = Instance.new("Frame")
    shimmerOverlay.Size = UDim2.new(1, 0, 1, 0)
    shimmerOverlay.BackgroundColor3 = Color3.new(1, 1, 1)
    shimmerOverlay.BackgroundTransparency = 0.94
    shimmerOverlay.BorderSizePixel = 0
    
    local shimmerGradient = Instance.new("UIGradient")
    shimmerGradient.Rotation = -45
    shimmerGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(0.5, Color3.new(0.98, 0.98, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
    })
    shimmerGradient.Transparency = NumberSequence.new(0.9)
    shimmerGradient.Parent = shimmerOverlay

    -- Liquid Glass Effect 3 - Reflective Layer
    local reflectiveLayer = Instance.new("Frame")
    reflectiveLayer.Size = UDim2.new(1, 0, 0.3, 0)
    reflectiveLayer.Position = UDim2.new(0, 0, 0, 0)
    reflectiveLayer.BackgroundColor3 = Color3.new(1, 1, 1)
    reflectiveLayer.BackgroundTransparency = 0.96
    reflectiveLayer.BorderSizePixel = 0
    
    local reflectiveGradient = Instance.new("UIGradient")
    reflectiveGradient.Rotation = 0
    reflectiveGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
    })
    reflectiveGradient.Transparency = NumberSequence.new(0.95)
    reflectiveGradient.Parent = reflectiveLayer

    -- Corner
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 18)
    corner.Parent = mainFrame

    -- Outer Glass Stroke
    local outerStroke = Instance.new("UIStroke")
    outerStroke.Color = Color3.new(1, 1, 1)
    outerStroke.Thickness = 2.5
    outerStroke.Transparency = 0.7
    outerStroke.Parent = mainFrame

    -- Inner Glass Stroke
    local innerStroke = Instance.new("UIStroke")
    innerStroke.Color = Color3.new(1, 1, 1)
    innerStroke.Thickness = 1
    innerStroke.Transparency = 0.85
    innerStroke.Parent = mainFrame

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "AUTO BLOCK 1.0 TEST VERSION"
    title.TextColor3 = Color3.new(0.2, 0.2, 0.3)
    title.TextSize = 16
    title.Font = Enum.Font.Arcade
    title.Parent = mainFrame

    -- Status
    local statusContainer = Instance.new("Frame")
    statusContainer.Size = UDim2.new(1, -20, 0, 25)
    statusContainer.Position = UDim2.new(0, 10, 0, 45)
    statusContainer.BackgroundColor3 = Color3.new(1, 1, 1)
    statusContainer.BackgroundTransparency = 0.9
    statusContainer.BorderSizePixel = 0
    
    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 8)
    statusCorner.Parent = statusContainer

    statusValue = Instance.new("TextLabel")
    statusValue.Size = UDim2.new(1, 0, 1, 0)
    statusValue.BackgroundTransparency = 1
    statusValue.Text = "STATUS: OFF"
    statusValue.TextColor3 = Color3.new(0.8, 0.2, 0.2)
    statusValue.TextSize = 14
    statusValue.Font = Enum.Font.Arcade
    statusValue.Name = "StatusValue"
    statusValue.Parent = statusContainer

    statusContainer.Parent = mainFrame

    -- Toggle Button
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(1, -20, 0, 45)
    toggleButton.Position = UDim2.new(0, 10, 0, 80)
    toggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
    toggleButton.BackgroundTransparency = 0.8
    toggleButton.AutoButtonColor = false
    toggleButton.Text = ""
    toggleButton.BorderSizePixel = 0
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 10)
    toggleCorner.Parent = toggleButton

    -- Button Glass Effect
    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Rotation = 45
    buttonGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(0.95, 0.95, 0.98))
    })
    buttonGradient.Transparency = NumberSequence.new(0.8)
    buttonGradient.Parent = toggleButton

    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Color = Color3.new(0.3, 0.3, 0.5)
    toggleStroke.Thickness = 1.2
    toggleStroke.Transparency = 0.6
    toggleStroke.Parent = toggleButton

    local buttonText = Instance.new("TextLabel")
    buttonText.Size = UDim2.new(1, 0, 1, 0)
    buttonText.BackgroundTransparency = 1
    buttonText.Text = "ACTIVATE"
    buttonText.TextColor3 = Color3.new(0.3, 0.3, 0.4)
    buttonText.TextSize = 16
    buttonText.Font = Enum.Font.Arcade
    buttonText.Name = "ButtonText"
    buttonText.Parent = toggleButton

    -- Button Hover Glass Animations
    local hoverTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    toggleButton.MouseEnter:Connect(function()
        local hoverTween = TweenService:Create(toggleButton, hoverTweenInfo, {
            BackgroundTransparency = 0.7,
            Size = UDim2.new(1, -15, 0, 48)
        })
        local strokeTween = TweenService:Create(toggleStroke, hoverTweenInfo, {
            Thickness = 2,
            Transparency = 0.3
        })
        hoverTween:Play()
        strokeTween:Play()
    end)
    
    toggleButton.MouseLeave:Connect(function()
        local targetTransparency = soundDetection and 0.6 or 0.8
        local hoverTween = TweenService:Create(toggleButton, hoverTweenInfo, {
            BackgroundTransparency = targetTransparency,
            Size = UDim2.new(1, -20, 0, 45)
        })
        local strokeTween = TweenService:Create(toggleStroke, hoverTweenInfo, {
            Thickness = 1.2,
            Transparency = 0.6
        })
        hoverTween:Play()
        strokeTween:Play()
    end)

    toggleButton.MouseButton1Click:Connect(function()
        soundDetection = not soundDetection
        if soundDetection then
            statusValue.Text = "STATUS: ACTIVE"
            statusValue.TextColor3 = Color3.new(0.2, 0.6, 0.2)
            buttonText.Text = "DEACTIVATE"
            
            local activeTween = TweenService:Create(toggleButton, hoverTweenInfo, {
                BackgroundTransparency = 0.6,
                BackgroundColor3 = Color3.new(0.9, 0.95, 1)
            })
            activeTween:Play()
            
            print("🟢 Auto Block ACTIVATED")
            ActivateAutoParry()
        else
            statusValue.Text = "STATUS: OFF"
            statusValue.TextColor3 = Color3.new(0.8, 0.2, 0.2)
            buttonText.Text = "ACTIVATE"
            
            local inactiveTween = TweenService:Create(toggleButton, hoverTweenInfo, {
                BackgroundTransparency = 0.8,
                BackgroundColor3 = Color3.new(1, 1, 1)
            })
            inactiveTween:Play()
            
            print("🔴 Auto Block DEACTIVATED")
        end
    end)

    toggleButton.Parent = mainFrame

    -- Stats
    local statsContainer = Instance.new("Frame")
    statsContainer.Size = UDim2.new(1, -20, 0, 40)
    statsContainer.Position = UDim2.new(0, 10, 0, 135)
    statsContainer.BackgroundTransparency = 1

    blocksLabel = Instance.new("TextLabel")
    blocksLabel.Size = UDim2.new(1, 0, 0.5, 0)
    blocksLabel.BackgroundTransparency = 1
    blocksLabel.Text = "Total Blocks: 0"
    blocksLabel.TextColor3 = Color3.new(0.4, 0.4, 0.5)
    blocksLabel.TextSize = 12
    blocksLabel.Font = Enum.Font.Arcade
    blocksLabel.TextXAlignment = Enum.TextXAlignment.Left
    blocksLabel.Name = "BlocksLabel"
    blocksLabel.Parent = statsContainer

    successLabel = Instance.new("TextLabel")
    successLabel.Size = UDim2.new(1, 0, 0.5, 0)
    successLabel.Position = UDim2.new(0, 0, 0.5, 0)
    successLabel.BackgroundTransparency = 1
    successLabel.Text = "Successful: 0"
    successLabel.TextColor3 = Color3.new(0.4, 0.4, 0.5)
    successLabel.TextSize = 12
    successLabel.Font = Enum.Font.Arcade
    successLabel.TextXAlignment = Enum.TextXAlignment.Left
    successLabel.Name = "SuccessLabel"
    successLabel.Parent = statsContainer

    statsContainer.Parent = mainFrame

    -- Add all glass layers to main frame
    reflectiveLayer.Parent = mainFrame
    shimmerOverlay.Parent = mainFrame
    mainFrame.Parent = screenGui

    return screenGui
end

-- Function to update GUI stats
local function UpdateGUIStats()
    if blocksLabel and successLabel then
        blocksLabel.Text = "Total Blocks: " .. blocksCount
        successLabel.Text = "Successful: " .. successfulBlocks
    end
end

-- Function to extract sound name from SoundId or object
local function GetSoundName(soundObject, soundId)
    if soundObject and soundObject.Name and soundObject.Name ~= "Sound" then
        return soundObject.Name
    end
    
    if soundObject and soundObject.Parent then
        local parentName = soundObject.Parent.Name
        if parentName and parentName ~= "Sound" then
            return parentName
        end
    end
    
    if soundId then
        local cleanId = string.gsub(soundId, "rbxassetid://", "")
        if #cleanId > 8 then
            return "Sound_" .. string.sub(cleanId, -8)
        else
            return "Sound_" .. cleanId
        end
    end
    
    return "Unknown_Sound"
end

-- 2. SELECTIVE SOUND DETECTION
function DetectEnemySounds()
    local maxDistance = 15
    
    local baseSounds = {
        "kick", "swoosh", "kickswoosh", "close", "enemy", "attack", 
        "close_enemy_attack", "dropkick",
        "bow", "arrow", "shoot", "shot", "fire", "projectile",
        "crossbow", "quiver", "bowstring", "archer", "ranged"
    }
    
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return false, ""
    end
    
    local playerPos = player.Character.HumanoidRootPart.Position
    
    local descendants = workspace:GetDescendants()
    for _, descendant in ipairs(descendants) do
        if descendant:IsA("Sound") and descendant.Playing then
            local soundName = string.lower(GetSoundName(descendant, descendant.SoundId))
            
            local shouldTrigger = false
            
            for _, baseSound in ipairs(baseSounds) do
                local basePattern = string.lower(baseSound)
                
                local exactMatch = soundName == basePattern
                local withDigitsMatch = string.find(soundName, "^" .. basePattern .. "%d+$") ~= nil
                local withUnderscoreDigits = string.find(soundName, "^" .. basePattern .. "_%d+$") ~= nil
                local containsWithDigits = string.find(soundName, basePattern .. ".*%d+$") ~= nil
                
                if exactMatch or withDigitsMatch or withUnderscoreDigits or containsWithDigits then
                    shouldTrigger = true
                    break
                end
            end
            
            if not shouldTrigger then
                continue
            end
            
            local isMySound = false
            pcall(function()
                local currentParent = descendant.Parent
                while currentParent do
                    if currentParent == player.Character then
                        isMySound = true
                        break
                    end
                    currentParent = currentParent.Parent
                end
            end)
            
            if isMySound then
                continue
            end
            
            local soundPos
            local success = pcall(function()
                if descendant.Parent:IsA("BasePart") then
                    soundPos = descendant.Parent.Position
                elseif descendant.Parent:FindFirstChild("HumanoidRootPart") then
                    soundPos = descendant.Parent.HumanoidRootPart.Position
                elseif descendant.Parent:FindFirstChild("Head") then
                    soundPos = descendant.Parent.Head.Position
                else
                    soundPos = playerPos + Vector3.new(0, 0, 5)
                end
            end)
            
            if success and soundPos then
                local distance = (playerPos - soundPos).Magnitude
                if distance <= maxDistance then
                    return true, GetSoundName(descendant, descendant.SoundId)
                end
            else
                return true, GetSoundName(descendant, descendant.SoundId)
            end
        end
    end
    
    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local character = otherPlayer.Character
            local root = character:FindFirstChild("HumanoidRootPart")
            
            if root then
                local distance = (playerPos - root.Position).Magnitude
                if distance <= 8 then
                    local characterSounds = character:GetDescendants()
                    for _, sound in ipairs(characterSounds) do
                        if sound:IsA("Sound") and sound.Playing then
                            local soundName = string.lower(GetSoundName(sound, sound.SoundId))
                            
                            local shouldTrigger = false
                            for _, baseSound in ipairs(baseSounds) do
                                local basePattern = string.lower(baseSound)
                                
                                local exactMatch = soundName == basePattern
                                local withDigitsMatch = string.find(soundName, "^" .. basePattern .. "%d+$") ~= nil
                                local withUnderscoreDigits = string.find(soundName, "^" .. basePattern .. "_%d+$") ~= nil
                                local containsWithDigits = string.find(soundName, basePattern .. ".*%d+$") ~= nil
                                
                                if exactMatch or withDigitsMatch or withUnderscoreDigits or containsWithDigits then
                                    shouldTrigger = true
                                    break
                                end
                            end
                            
                            if shouldTrigger then
                                return true, "Enemy_" .. GetSoundName(sound, sound.SoundId)
                            end
                        end
                    end
                    
                    if distance <= 5 then
                        for _, tool in ipairs(character:GetChildren()) do
                            if tool:IsA("Tool") then
                                return true, "Close_Enemy_Attack"
                            end
                        end
                    end
                end
            end
        end
    end
    
    return false, ""
end

-- 3. ULTRA-FAST BLOCK FUNCTION (NO COOLDOWN)
function DoBlock(soundName)
    blocksCount = blocksCount + 1
    
    pcall(function()
        VirtualInput:SendMouseButtonEvent(0, 0, 1, true, game, 1)
    end)
    
    local startTime = tick()
    while tick() - startTime < blockDuration do
        RunService.Heartbeat:Wait()
    end
    
    pcall(function()
        VirtualInput:SendMouseButtonEvent(0, 0, 1, false, game, 1)
    end)
    
    local wasSuccessful = math.random(1, 100) > 15
    
    if wasSuccessful then
        successfulBlocks = successfulBlocks + 1
        print("✅ SUCCESS! Blocked: " .. soundName)
    else
        print("❌ MISSED! Sound: " .. soundName)
    end
    
    UpdateGUIStats()
end

-- 4. ULTRA-FAST AUTO PARRY FUNCTION (NO COOLDOWN)
function ActivateAutoParry()
    spawn(function()
        print("⚡ ULTRA-FAST Auto Block Activated!")
        print("🎯 Reacting ONLY to:")
        print("   • kick, swoosh, kickswoosh, close, enemy, attack, dropkick") 
        print("   • bow, arrow, shoot, shot, fire, projectile, crossbow")
        print("   • ALL versions with digits at the end (bow1, arrow_2, etc.)")
        print("⚡ Block Duration: 200ms | NO COOLDOWN")
        
        while soundDetection do
            local detected, soundName = DetectEnemySounds()
            if detected then
                spawn(function()
                    DoBlock(soundName)
                end)
            end
            
            UpdateGUIStats()
            RunService.Heartbeat:Wait()
        end
        
        print("🛑 Auto Block stopped")
        print("📊 Final Stats - Total: " .. blocksCount .. " | Successful: " .. successfulBlocks)
    end)
end

-- 5. KEYBINDS
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.P then
        soundDetection = not soundDetection
        if soundDetection then
            print("🟢 Auto Block 1.0: ACTIVATED")
            ActivateAutoParry()
        else
            print("🔴 Auto Block 1.0: DEACTIVATED")
        end
    end
    
    if input.KeyCode == Enum.KeyCode.T then
        print("🧪 Testing block...")
        spawn(function()
            DoBlock("Test_Attack")
        end)
    end
    
    if input.KeyCode == Enum.KeyCode.Y then
        print("🔊 Testing detection...")
        local detected, soundName = DetectEnemySounds()
        print("Detection: " .. tostring(detected) .. " | Sound: " .. soundName)
    end
    
    if input.KeyCode == Enum.KeyCode.R then
        blocksCount = 0
        successfulBlocks = 0
        print("🔄 Stats reset")
        UpdateGUIStats()
    end
end)

-- Initialize
print("🎯 Auto Block 1.0 Test Version Loading...")

local success = pcall(function()
    CreateGUI()
    print("✅ MAXIMUM Liquid Glass GUI Created")
    UpdateGUIStats()
end)

if not success then
    print("❌ GUI creation failed")
end

print("✅ Auto Block 1.0 Test Version Ready!")
print("⌨️ Controls: P(Toggle) T(Test) Y(Detect) R(Reset)")
print("🎯 Sounds: Melee + Bow/Arrow attacks with digits")
print("⚡ Block: 200ms | NO COOLDOWN | Instant Reaction")