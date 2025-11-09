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
    fovCircle.BackgroundTransparency = 1
    fovCircle.Parent = gui

    local stroke = Instance.new("UIStroke")
    stroke.Color = getgenv().HighlightColor
    stroke.Thickness = getgenv().BorderThickness
    stroke.Transparency = 0
    stroke.Parent = fovCircle

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = fovCircle

    local inner = Instance.new("Frame")
    inner.Size = UDim2.new(1, -getgenv().BorderThickness*2, 1, -getgenv().BorderThickness*2)
    inner.Position = UDim2.new(0, getgenv().BorderThickness, 0, getgenv().BorderThickness)
    inner.BackgroundTransparency = 1
    inner.Parent = fovCircle

    local innerCorner = Instance.new("UICorner")
    innerCorner.CornerRadius = UDim.new(1, 0)
    innerCorner.Parent = inner
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

local function partIsTargetable(part)
    return table.find(targetableParts, part.Name) ~= nil
end

local function getClosest()
    local closest, dist = nil, getgenv().FOV
    for _, plr in Players:GetPlayers() do
        if plr ~= LocalPlayer and plr.Character then
            for _, partName in ipairs(targetableParts) do
                local part = plr.Character:FindFirstChild(partName)
                if part then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local cx, cy = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2
                        local d = ((pos.X - cx)^2 + (pos.Y - cy)^2)^0.5
                        if d < dist then
                            closest, dist, targetPart = plr, d, part
                        end
                    end
                end
            end
        end
    end
    return closest, targetPart
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
                for _, partName in ipairs(targetableParts) do
                    local part = target.Character:FindFirstChild(partName)
                    if part then
                        local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                        if onScreen then
                            local cx, cy = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2
                            local d = ((pos.X - cx)^2 + (pos.Y - cy)^2)^0.5
                            if d <= getgenv().FOV then
                                local pred = predict(part)
                                if key == "Hit" then
                                    return CFrame.new(pred)
                                elseif key == "Target" then
                                    return part
                                end
                            end
                        end
                    end
                end
            end
            
            local fallback, fallbackPart = getClosest()
            if fallback and fallback.Character then
                for _, partName in ipairs(targetableParts) do
                    local part = fallback.Character:FindFirstChild(partName)
                    if part then
                        local pred = predict(part)
                        if key == "Hit" then
                            return CFrame.new(pred)
                        elseif key == "Target" then
                            return part
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
                        local cx, cy = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2
                        local d = ((pos.X - cx)^2 + (pos.Y - cy)^2)^0.5
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