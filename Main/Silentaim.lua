local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

getgenv().SilentAimEnabled = true
getgenv().Prediction = 0.13432100
getgenv().FOV = 160
getgenv().HighlightColor = Color3.fromRGB(255, 0, 0)
getgenv().BorderThickness = 0

local target = nil
local highlight = nil
local fovCircle = nil

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

local function updateHighlight(plr)
    if highlight then highlight:Destroy() end
    if not (plr and plr.Character and plr.Character:FindFirstChild("Head")) then return end
    highlight = Instance.new("Highlight")
    highlight.FillColor = getgenv().HighlightColor
    highlight.OutlineColor = getgenv().HighlightColor
    highlight.OutlineTransparency = 0
    highlight.FillTransparency = 0.7
    highlight.Parent = plr.Character
end

local function getClosest()
    local closest, dist = nil, getgenv().FOV
    for _, plr in Players:GetPlayers() do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
            local head = plr.Character.Head
            local bodyEffects = plr.Character:FindFirstChild("BodyEffects")
            local ko = bodyEffects and bodyEffects:FindFirstChild("K.O") and bodyEffects["K.O"].Value
            local grabbed = plr.Character:FindFirstChild("GRABBING_CONSTRAINT")
            if not (ko or grabbed) then
                local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local cx, cy = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2
                    local d = ((pos.X - cx)^2 + (pos.Y - cy)^2)^0.5
                    if d < dist then
                        closest, dist = plr, d
                    end
                end
            end
        end
    end
    return closest
end

local function predict(part)
    local vel = part.AssemblyLinearVelocity
    return part.Position + (vel * getgenv().Prediction)
end

local old
old = hookmetamethod(game, "__index", function(self, key)
    if not checkcaller() and getgenv().SilentAimEnabled and self == LocalPlayer:GetMouse() then
        if key == "Hit" or key == "Target" then
            if target and target.Character and target.Character:FindFirstChild("Head") then
                local head = target.Character.Head
                local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local cx, cy = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2
                    local d = ((pos.X - cx)^2 + (pos.Y - cy)^2)^0.5
                    if d <= getgenv().FOV then
                        local pred = predict(head)
                        if key == "Hit" then
                            return CFrame.new(pred)
                        elseif key == "Target" then
                            return head
                        end
                    end
                end
            end
            local fallback = getClosest()
            if fallback and fallback.Character and fallback.Character:FindFirstChild("Head") then
                local head = fallback.Character.Head
                local pred = predict(head)
                if key == "Hit" then
                    return CFrame.new(pred)
                elseif key == "Target" then
                    return head
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
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
            local head = plr.Character.Head
            local bodyEffects = plr.Character:FindFirstChild("BodyEffects")
            local ko = bodyEffects and bodyEffects:FindFirstChild("K.O") and bodyEffects["K.O"].Value
            local grabbed = plr.Character:FindFirstChild("GRABBING_CONSTRAINT")
            if not (ko or grabbed) then
                local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local cx, cy = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2
                    local d = ((pos.X - cx)^2 + (pos.Y - cy)^2)^0.5
                    if d <= getgenv().FOV and d < minDist then
                        inCircle = plr
                        minDist = d
                    end
                end
            end
        end
    end

    if inCircle then
        if target ~= inCircle then
            target = inCircle
            updateHighlight(target)
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