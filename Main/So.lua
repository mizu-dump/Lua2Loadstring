local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

getgenv().SilentAimEnabled = true
getgenv().Prediction = 0.13432100
getgenv().FOV = 180
getgenv().HighlightColor = Color3.fromRGB(255, 0, 0)
getgenv().BorderThickness = 3

local target = nil
local highlight = nil
local fovCircle = nil

-- List of targetable body parts
local targetableParts = {
    "Head", "UpperTorso", "HumanoidRootPart", "LowerTorso",
    "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm",
    "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",
    "LeftUpperLeg", "RightLowerLeg", "RightFoot", "RightUpperLeg"
}

local function createFOVCircle()
    local gui = Instance.new("ScreenGui")
    gui.Name = "FOVCircle"
    gui.ResetOnSpawn = false
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    fovCircle = Instance.new("Frame")
    fovCircle.Size = UDim2.new(0, getgenv().FOV * 2, 0, getgenv().FOV * 2)
    fovCircle.Position = UDim2.new(0.5, -getgenv().FOV, 0.5, -getgenv().FOV)
    fovCircle.BackgroundTransparency = 1 -- Full transparency to make it invisible
    fovCircle.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = fovCircle
end

local function updateHighlight(part)
    if highlight then highlight:Destroy() end
    if part then
        highlight = Instance.new("Highlight")
        highlight.FillColor = getgenv().HighlightColor
        highlight.OutlineColor = getgenv().HighlightColor
        highlight.OutlineTransparency = 0
        highlight.FillTransparency = 0.7
        highlight.Parent = part.Parent -- Attach highlight to the parent (character)
    end
end

local function getClosestPartPosition(part)
    -- Return the position of the part as its closest point for aim
    return part.Position
end

local function getClosest()
    local closest, dist = nil, getgenv().FOV
    local closestPart = nil
    for _, plr in Players:GetPlayers() do
        if plr ~= LocalPlayer and plr.Character then
            for _, partName in ipairs(targetableParts) do
                local part = plr.Character:FindFirstChild(partName)
                if part then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local cx, cy = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2
                        local d = ((pos.X - cx) ^ 2 + (pos.Y - cy) ^ 2) ^ 0.5
                        if d < dist then
                            closest, dist = plr, d
                            closestPart = part -- Track the part we're interested in
                        end
                    end
                end
            end
        end
    end
    return closest, closestPart
end

local function predict(part)
    local vel = part.AssemblyLinearVelocity
    return part.Position + (vel * getgenv().Prediction)
end

local old
old = hookmetamethod(game, "__index", function(self, key)
    if not checkcaller() and getgenv().SilentAimEnabled and self == LocalPlayer:GetMouse() then
        if key == "Hit" or key == "Target" then
            if target and target.Character then
                local cx, cy = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2 -- Get center position
                for _, partName in ipairs(targetableParts) do
                    local part = target.Character:FindFirstChild(partName)
                    if part then
                        local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                        if onScreen then
                            local d = ((pos.X - cx) ^ 2 + (pos.Y - cy) ^ 2) ^ 0.5
                            if d <= getgenv().FOV then
                                local closestPoint = getClosestPartPosition(part) -- Get the closest point on the part
                                if (cx - pos.X)^2 + (cy - pos.Y)^2 <= (getgenv().FOV/2)^2 then -- Check if mouse is near center
                                    if key == "Hit" then
                                        return CFrame.new(closestPoint) -- Aim at the closest point
                                    elseif key == "Target" then
                                        return part -- Return the specific part
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
            local fallback, fallbackPart = getClosest()
            if fallback and fallback.Character then
                local cx, cy = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2 -- Get center position
                for _, partName in ipairs(targetableParts) do
                    local part = fallback.Character:FindFirstChild(partName)
                    if part then
                        local closestPoint = getClosestPartPosition(part) -- Get the closest point on the fallback part
                        local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                        if onScreen then
                            local d = ((pos.X - cx) ^ 2 + (pos.Y - cy) ^ 2) ^ 0.5
                            if (cx - pos.X)^2 + (cy - pos.Y)^2 <= (getgenv().FOV/2)^2 then -- Check if mouse is near center
                                if key == "Hit" then
                                    return CFrame.new(closestPoint) -- Aim at the closest point on fallback
                                elseif key == "Target" then
                                    return part
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return old(self, key)
end)

createFOVCircle()

RunService.RenderStepped:Connect(function()
    local inCircle = nil
    local minDist = getgenv().FOV
    for _, plr in Players:GetPlayers() do
        if plr ~= LocalPlayer and plr.Character then
            for _, partName in ipairs(targetableParts) do
                local part = plr.Character:FindFirstChild(partName)
                if part then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local cx, cy = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2
                        local d = ((pos.X - cx) ^ 2 + (pos.Y - cy) ^ 2) ^ 0.5
                        if d <= getgenv().FOV and d < minDist then
                            inCircle = plr
                            minDist = d
                            targetPart = part -- Track which part is being targeted
                        end
                    end
                end
            end
        end
    end

    if inCircle then
        if target ~= inCircle then
            target = inCircle
            updateHighlight(targetPart) -- Highlight the specific part instead of character
        end
    else
        if target then
            target = nil
            if highlight then highlight:Destroy() highlight = nil end
        end
    end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch or
       input.KeyCode == Enum.KeyCode.ButtonR2 then
    end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "ScriptBoxWatermark"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 300, 0, 30)
label.Position = UDim2.new(0.5, -150, 1, -50)
label.BackgroundTransparency = 1
label.Text = ""
label.TextColor3 = Color3.fromRGB(255, 0, 0)
label.Font = Enum.Font.GothamBold
label.TextSize = 16
label.TextStrokeTransparency = 0.7
label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
label.Parent = gui

spawn(function()
    wait(5)
    for i = 1, 30 do
        label.Position = label.Position + UDim2.new(0, 0, -0.033, 0)
        wait(0.016)
    end
end)
