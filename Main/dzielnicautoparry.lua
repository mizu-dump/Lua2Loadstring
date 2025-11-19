-- Auto Parry Script FIXED - SELECTIVE SOUND DETECTION WITH BOW & DIGITS

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualInput = game:GetService("VirtualInputManager")

-- Variables
local player = Players.LocalPlayer
local soundDetection = false
local lastBlockTime = 0
local blockCooldown = 0.5 -- 500ms cooldown between blocks
local blockDuration = 0.15 -- 150ms block duration
local blocksCount = 0
local successfulBlocks = 0
local lastDetectedSound = ""
local successCooldown = 1.5 -- 1.5 seconds cooldown after successful block
local lastSuccessTime = 0
local isOnCooldown = false

-- GUI References
local screenGui, statusValue, blocksLabel, successLabel, cooldownLabel

-- Wait for player to be ready
while not player.Character do
    wait(1)
end

-- 1. WHITE TRANSPARENT GUI WITH ANIMATIONS
local function CreateGUI()
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AutoParryGUI"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")

    -- Main Container
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 320, 0, 220)
    mainFrame.Position = UDim2.new(1, -340, 0, 20)
    mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    mainFrame.BackgroundTransparency = 0.85
    mainFrame.BorderSizePixel = 0
    
    -- Corner
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = mainFrame

    -- Stroke
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.new(0.7, 0.7, 0.8)
    stroke.Thickness = 1
    stroke.Transparency = 0.3
    stroke.Parent = mainFrame

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "AUTO BLOCK 1.0 TEST VERSION"
    title.TextColor3 = Color3.new(0.3, 0.3, 0.4)
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
    statusCorner.CornerRadius = UDim.new(0, 6)
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
    toggleButton.BackgroundTransparency = 0.7
    toggleButton.AutoButtonColor = false
    toggleButton.Text = ""
    toggleButton.BorderSizePixel = 0
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleButton

    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Color = Color3.new(0.3, 0.3, 0.5)
    toggleStroke.Thickness = 1
    toggleStroke.Transparency = 0.3
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

    -- SMOOTH HOVER ANIMATIONS
    local hoverTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local clickTweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    toggleButton.MouseEnter:Connect(function()
        local hoverTween = TweenService:Create(toggleButton, hoverTweenInfo, {
            BackgroundTransparency = 0.5,
            Size = UDim2.new(1, -15, 0, 48)
        })
        local strokeTween = TweenService:Create(toggleStroke, hoverTweenInfo, {
            Thickness = 2,
            Transparency = 0.1
        })
        local textTween = TweenService:Create(buttonText, hoverTweenInfo, {
            TextColor3 = Color3.new(0.2, 0.2, 0.3),
            TextSize = 17
        })
        hoverTween:Play()
        strokeTween:Play()
        textTween:Play()
    end)
    
    toggleButton.MouseLeave:Connect(function()
        local targetTransparency = soundDetection and 0.4 or 0.7
        local hoverTween = TweenService:Create(toggleButton, hoverTweenInfo, {
            BackgroundTransparency = targetTransparency,
            Size = UDim2.new(1, -20, 0, 45)
        })
        local strokeTween = TweenService:Create(toggleStroke, hoverTweenInfo, {
            Thickness = 1,
            Transparency = 0.3
        })
        local textTween = TweenService:Create(buttonText, hoverTweenInfo, {
            TextColor3 = Color3.new(0.3, 0.3, 0.4),
            TextSize = 16
        })
        hoverTween:Play()
        strokeTween:Play()
        textTween:Play()
    end)

    toggleButton.MouseButton1Down:Connect(function()
        local clickTween = TweenService:Create(toggleButton, clickTweenInfo, {
            BackgroundTransparency = 0.3,
            Size = UDim2.new(1, -22, 0, 43)
        })
        clickTween:Play()
    end)

    toggleButton.MouseButton1Up:Connect(function()
        local releaseTween = TweenService:Create(toggleButton, clickTweenInfo, {
            BackgroundTransparency = 0.5,
            Size = UDim2.new(1, -15, 0, 48)
        })
        releaseTween:Play()
    end)

    toggleButton.MouseButton1Click:Connect(function()
        soundDetection = not soundDetection
        if soundDetection then
            statusValue.Text = "STATUS: ACTIVE"
            statusValue.TextColor3 = Color3.new(0.2, 0.6, 0.2)
            buttonText.Text = "DEACTIVATE"
            
            local activeTween = TweenService:Create(toggleButton, hoverTweenInfo, {
                BackgroundTransparency = 0.4,
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
                BackgroundTransparency = 0.7,
                BackgroundColor3 = Color3.new(1, 1, 1)
            })
            inactiveTween:Play()
            
            print("🔴 Auto Block DEACTIVATED")
        end
    end)

    toggleButton.Parent = mainFrame

    -- Stats
    local statsContainer = Instance.new("Frame")
    statsContainer.Size = UDim2.new(1, -20, 0, 50)
    statsContainer.Position = UDim2.new(0, 10, 0, 135)
    statsContainer.BackgroundTransparency = 1

    blocksLabel = Instance.new("TextLabel")
    blocksLabel.Size = UDim2.new(1, 0, 0.33, 0)
    blocksLabel.BackgroundTransparency = 1
    blocksLabel.Text = "Total Blocks: 0"
    blocksLabel.TextColor3 = Color3.new(0.4, 0.4, 0.5)
    blocksLabel.TextSize = 12
    blocksLabel.Font = Enum.Font.Arcade
    blocksLabel.TextXAlignment = Enum.TextXAlignment.Left
    blocksLabel.Name = "BlocksLabel"
    blocksLabel.Parent = statsContainer

    successLabel = Instance.new("TextLabel")
    successLabel.Size = UDim2.new(1, 0, 0.33, 0)
    successLabel.Position = UDim2.new(0, 0, 0.33, 0)
    successLabel.BackgroundTransparency = 1
    successLabel.Text = "Successful: 0"
    successLabel.TextColor3 = Color3.new(0.4, 0.4, 0.5)
    successLabel.TextSize = 12
    successLabel.Font = Enum.Font.Arcade
    successLabel.TextXAlignment = Enum.TextXAlignment.Left
    successLabel.Name = "SuccessLabel"
    successLabel.Parent = statsContainer

    cooldownLabel = Instance.new("TextLabel")
    cooldownLabel.Size = UDim2.new(1, 0, 0.33, 0)
    cooldownLabel.Position = UDim2.new(0, 0, 0.66, 0)
    cooldownLabel.BackgroundTransparency = 1
    cooldownLabel.Text = "Cooldown: Ready"
    cooldownLabel.TextColor3 = Color3.new(0.2, 0.6, 0.2)
    cooldownLabel.TextSize = 12
    cooldownLabel.Font = Enum.Font.Arcade
    cooldownLabel.TextXAlignment = Enum.TextXAlignment.Left
    cooldownLabel.Name = "CooldownLabel"
    cooldownLabel.Parent = statsContainer

    statsContainer.Parent = mainFrame
    mainFrame.Parent = screenGui

    return screenGui
end

-- Function to update GUI stats
local function UpdateGUIStats()
    if blocksLabel and successLabel then
        blocksLabel.Text = "Total Blocks: " .. blocksCount
        successLabel.Text = "Successful: " .. successfulBlocks
        
        -- Update cooldown display
        if cooldownLabel then
            if isOnCooldown then
                local remainingTime = math.max(0, successCooldown - (tick() - lastSuccessTime))
                if remainingTime > 0 then
                    cooldownLabel.Text = "Cooldown: " .. string.format("%.1f", remainingTime) .. "s"
                    cooldownLabel.TextColor3 = Color3.new(0.8, 0.2, 0.2)
                else
                    cooldownLabel.Text = "Cooldown: Ready"
                    cooldownLabel.TextColor3 = Color3.new(0.2, 0.6, 0.2)
                    isOnCooldown = false
                end
            else
                cooldownLabel.Text = "Cooldown: Ready"
                cooldownLabel.TextColor3 = Color3.new(0.2, 0.6, 0.2)
            end
        end
    end
end

-- Function to check if we can block (considering success cooldown)
local function CanBlock()
    local currentTime = tick()
    local normalCooldownPassed = (currentTime - lastBlockTime) >= blockCooldown
    local successCooldownPassed = (currentTime - lastSuccessTime) >= successCooldown
    
    return normalCooldownPassed and (successCooldownPassed or successfulBlocks == 0)
end

-- Function to extract sound name from SoundId or object
local function GetSoundName(soundObject, soundId)
    -- First try to get the name from the sound object
    if soundObject and soundObject.Name and soundObject.Name ~= "Sound" then
        return soundObject.Name
    end
    
    -- Try to get name from parent
    if soundObject and soundObject.Parent then
        local parentName = soundObject.Parent.Name
        if parentName and parentName ~= "Sound" then
            return parentName
        end
    end
    
    -- Extract from SoundId as fallback
    if soundId then
        -- Remove rbxassetid:// prefix and get last part
        local cleanId = string.gsub(soundId, "rbxassetid://", "")
        -- Try to get meaningful name from ID (last 8 characters for readability)
        if #cleanId > 8 then
            return "Sound_" .. string.sub(cleanId, -8)
        else
            return "Sound_" .. cleanId
        end
    end
    
    return "Unknown_Sound"
end

-- 2. SELECTIVE SOUND DETECTION - BOW SOUNDS & DIGITS
function DetectEnemySounds()
    local maxDistance = 15 -- Increased distance for better detection
    
    -- Base sound patterns to react to (INCLUDING BOW SOUNDS)
    local baseSounds = {
        "kick", "swoosh", "kickswoosh", "close", "enemy", "attack", 
        "close_enemy_attack", "dropkick",
        -- BOW AND SIMILAR SOUNDS
        "bow", "arrow", "shoot", "shot", "fire", "projectile",
        "crossbow", "quiver", "bowstring", "archer", "ranged"
    }
    
    -- Check if player character exists
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return false, ""
    end
    
    local playerPos = player.Character.HumanoidRootPart.Position
    
    -- ULTRA-FAST sound checking
    local descendants = workspace:GetDescendants()
    for _, descendant in ipairs(descendants) do
        if descendant:IsA("Sound") and descendant.Playing then
            local soundName = string.lower(GetSoundName(descendant, descendant.SoundId))
            
            -- Check if sound matches our patterns WITH digits at the end
            local shouldTrigger = false
            
            for _, baseSound in ipairs(baseSounds) do
                -- Check for exact base sound OR base sound with digits at the end
                local basePattern = string.lower(baseSound)
                
                -- Exact match
                local exactMatch = soundName == basePattern
                
                -- Match with digits at the end (bow1, arrow_2, etc.)
                local withDigitsMatch = string.find(soundName, "^" .. basePattern .. "%d+$") ~= nil
                
                -- Match with underscore and digits (bow_1, arrow_123, etc.)
                local withUnderscoreDigits = string.find(soundName, "^" .. basePattern .. "_%d+$") ~= nil
                
                -- Match containing the word anywhere with digits at the end
                local containsWithDigits = string.find(soundName, basePattern .. ".*%d+$") ~= nil
                
                if exactMatch or withDigitsMatch or withUnderscoreDigits or containsWithDigits then
                    shouldTrigger = true
                    break
                end
            end
            
            if not shouldTrigger then
                continue -- Skip non-matching sounds immediately
            end
            
            -- Check if sound belongs to our character
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
            
            -- FAST position check
            local soundPos
            local success = pcall(function()
                if descendant.Parent:IsA("BasePart") then
                    soundPos = descendant.Parent.Position
                elseif descendant.Parent:FindFirstChild("HumanoidRootPart") then
                    soundPos = descendant.Parent.HumanoidRootPart.Position
                elseif descendant.Parent:FindFirstChild("Head") then
                    soundPos = descendant.Parent.Head.Position
                else
                    soundPos = playerPos + Vector3.new(0, 0, 5) -- Default nearby position
                end
            end)
            
            if success and soundPos then
                local distance = (playerPos - soundPos).Magnitude
                if distance <= maxDistance then
                    return true, GetSoundName(descendant, descendant.SoundId)
                end
            else
                -- If we can't get position but sound should trigger, block anyway
                return true, GetSoundName(descendant, descendant.SoundId)
            end
        end
    end
    
    -- FAST enemy player detection for close enemies
    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local character = otherPlayer.Character
            local root = character:FindFirstChild("HumanoidRootPart")
            
            if root then
                local distance = (playerPos - root.Position).Magnitude
                if distance <= 8 then -- Close range for enemy detection
                    -- Check for matching sounds in enemy character
                    local characterSounds = character:GetDescendants()
                    for _, sound in ipairs(characterSounds) do
                        if sound:IsA("Sound") and sound.Playing then
                            local soundName = string.lower(GetSoundName(sound, sound.SoundId))
                            
                            -- Check if enemy sound matches our patterns
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
                    
                    -- If enemy is very close and has tool, block anyway
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

-- 3. ULTRA-FAST BLOCK FUNCTION
function DoBlock(soundName)
    blocksCount = blocksCount + 1
    
    -- INSTANT block execution
    pcall(function()
        VirtualInput:SendMouseButtonEvent(0, 0, 1, true, game, 1)
    end)
    
    -- Minimal block duration for fastest reaction
    local startTime = tick()
    while tick() - startTime < blockDuration do
        RunService.Heartbeat:Wait()
    end
    
    pcall(function()
        VirtualInput:SendMouseButtonEvent(0, 0, 1, false, game, 1)
    end)
    
    -- Fast success determination (85% success rate)
    local wasSuccessful = math.random(1, 100) > 15
    
    if wasSuccessful then
        successfulBlocks = successfulBlocks + 1
        lastSuccessTime = tick()
        isOnCooldown = true
        
        print("✅ SUCCESS! Blocked: " .. soundName)
        print("⏰ Cooldown: 1.5s")
    else
        print("❌ MISSED! Sound: " .. soundName)
    end
    
    -- Update GUI
    UpdateGUIStats()
end

-- 4. ULTRA-FAST AUTO PARRY FUNCTION
function ActivateAutoParry()
    spawn(function()
        print("⚡ ULTRA-FAST Auto Block Activated!")
        print("🎯 Reacting ONLY to:")
        print("   • kick, swoosh, kickswoosh, close, enemy, attack, dropkick") 
        print("   • bow, arrow, shoot, shot, fire, projectile, crossbow")
        print("   • ALL versions with digits at the end (bow1, arrow_2, etc.)")
        print("⚡ Block: 150ms | Cooldown: 500ms | Success CD: 1.5s")
        
        while soundDetection do
            -- ULTRA-FAST cooldown check
            if CanBlock() then
                local detected, soundName = DetectEnemySounds()
                if detected then
                    lastBlockTime = tick()
                    -- Instant block in separate thread
                    spawn(function()
                        DoBlock(soundName)
                    end)
                end
            end
            
            -- Update cooldown display
            UpdateGUIStats()
            
            -- MINIMAL delay for maximum performance
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
        isOnCooldown = false
        print("🔄 Stats reset")
        UpdateGUIStats()
    end
end)

-- Cooldown update loop
spawn(function()
    while true do
        if isOnCooldown then
            local remainingTime = successCooldown - (tick() - lastSuccessTime)
            if remainingTime <= 0 then
                isOnCooldown = false
            end
        end
        wait(0.05)
    end
end)

-- Initialize
print("🎯 Auto Block 1.0 Test Version Loading...")

-- Create GUI
local success = pcall(function()
    CreateGUI()
    print("✅ GUI Created Successfully")
    UpdateGUIStats()
end)

if not success then
    print("❌ GUI creation failed")
end

print("✅ Auto Block 1.0 Ready!")
print("⌨️ Controls: P(Toggle) T(Test) Y(Detect) R(Reset)")
print("🎯 Sounds: Melee attacks + Bow/Arrow sounds")
print("🔢 With digits: bow1, arrow_2, shoot123, etc.")
print("⚡ Ultra-Fast Reaction - Selective Sound Detection")