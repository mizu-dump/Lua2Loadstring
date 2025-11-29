--// Health Bar Billboard GUI Script
local player = game.Players.LocalPlayer

player.CharacterAdded:Connect(function(character)
    -- Wait for humanoid
    local humanoid = character:WaitForChild("Humanoid")
    local head = character:WaitForChild("Head")

    -- Create billboard
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(4, 0, 0.5, 0)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = head

    -- Create health bar background
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    bg.BorderSizePixel = 0
    bg.Parent = billboard

    -- Create health bar (green)
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, 0, 1, 0)
    bar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    bar.BorderSizePixel = 0
    bar.Parent = bg

    -- Update health bar
    local function update()
        local hp = humanoid.Health
        local max = humanoid.MaxHealth

        bar.Size = UDim2.new(hp / max, 0, 1, 0)

        -- Optional: change color based on hp %
        if hp / max < 0.3 then
            bar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        elseif hp / max < 0.6 then
            bar.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        else
            bar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        end
    end

    humanoid.HealthChanged:Connect(update)
    update()
end)