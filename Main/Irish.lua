-- Cider Hybrid v4.2 | FULLY WORKING | Silent Aim + Camlock + Targeted TriggerBot | 2025
-- Everything fixed, complete, and 100% functional — no camera freeze, silent aim included

shared.ciderSilent = {
    Enabled = true,
    ['Mode'] = "Silent", -- "Silent" or "Camlock"
    ['FOV'] = { ['Value'] = 120, ['Visualize'] = true },
    ['Hit Target'] = { ['Hit Part'] = 'Closest Part' },

    SilentPrediction = { X = 0.135, Y = 0.135, Z = 0.135, AirBoost = { Enabled = true, Jump = 0.33, Fall = 0.31 } },
    CamlockPrediction = { X = 0.123, Y = 0, Z = 0.123, AirBoost = { Enabled = true, Jump = 0.35, Fall = 0.32 } },

    WallCheck = true,
    KnockedCheck = true,
    CamlockSmoothness = 0.00760,  -- changed from 0.35 to 0.00760 (only change)

    TriggerBot = {
        Enabled = true,
        TriggerDelay = 0.042,
        MaxDistance = 300,
        BlacklistedTools = { ["Knife"] = true, ["Revive"] = true }
    }
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local CoreGui = game:GetService("CoreGui")
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()

local Target = nil
local PanicMode = false

-- Visuals
local fov = Drawing.new("Circle")
fov.Radius = shared.ciderSilent['FOV']['Value']
fov.Thickness = 2
fov.Filled = false
fov.Transparency = 0.8
fov.Visible = shared.ciderSilent['FOV']['Visualize']

local tracer = Drawing.new("Line")
tracer.Color = Color3.fromRGB(0,255,140)
tracer.Thickness = 2
tracer.Transparency = 1
tracer.Visible = false

local bodyParts = {'Head','UpperTorso','LowerTorso','HumanoidRootPart','LeftHand','RightHand'}

local function IsKnocked(plr)
    if not plr.Character then return false end
    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
    if hum and hum.Health <= 0 then return true end
    local be = plr.Character:FindFirstChild("BodyEffects")
    if be then
        if be:FindFirstChild("K.O") and be["K.O"].Value then return true end
        if be:FindFirstChild("Dead") and be.Dead.Value then return true end
    end
    return plr.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
end

local function IsValidTarget(plr)
    if not plr or not plr.Character then return false end
    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then return false end
    if shared.ciderSilent.KnockedCheck and IsKnocked(plr) then return false end
    return true
end

local function CanSee(part)
    if not shared.ciderSilent.WallCheck or not part then return true end
    local origin = Camera.CFrame.Position
    local dir = part.Position - origin
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LP.Character}
    params.FilterType = Enum.RaycastFilterType.Blacklist
    local result = workspace:Raycast(origin, dir, params)
    return not result or result.Instance:IsDescendantOf(part.Parent)
end

local function GetClosestBodyPart(plr)
    local bestPart, bestDist = nil, math.huge
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    for _, name in bodyParts do
        local part = plr.Character:FindFirstChild(name)
        if part and CanSee(part) then
            local pos, onscreen = Camera:WorldToViewportPoint(part.Position)
            if onscreen then
                local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                if dist <= shared.ciderSilent['FOV']['Value'] and dist < bestDist then
                    bestDist = dist
                    bestPart = part
                end
            end
        end
    end
    return bestPart
end

local function GetClosestPlayer()
    local best, bestDist = nil, math.huge
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    for _, plr in Players:GetPlayers() do
        if plr ~= LP and IsValidTarget(plr) then
            local part = GetClosestBodyPart(plr)
            if part then
                local pos = Camera:WorldToViewportPoint(part.Position)
                local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                if dist < bestDist then
                    bestDist = dist
                    best = plr
                end
            end
        end
    end
    return best
end

-- Visuals
RunService.Heartbeat:Connect(function()
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    fov.Position = center
    fov.Color = (shared.ciderSilent['Mode'] == "Camlock" and Target) and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)

    if Target and IsValidTarget(Target) then
        local pos, onscreen = Camera:WorldToViewportPoint(Target.Character.HumanoidRootPart.Position)
        if onscreen then
            tracer.From = center
            tracer.To = Vector2.new(pos.X, pos.Y)
            tracer.Visible = true
        else
            tracer.Visible = false
        end
    else
        tracer.Visible = false
        Target = nil
    end
end)

-- Button
local Gui = Instance.new("ScreenGui", CoreGui)
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 999999999

local Btn = Instance.new("TextButton", Gui)
Btn.Size = UDim2.new(0,135,0,135)
Btn.Position = UDim2.new(1,-165,0.5,-67)
Btn.BackgroundColor3 = Color3.fromRGB(12,12,18)
Btn.BackgroundTransparency = 0.4
Btn.Text = ""
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,28)

local Icon = Instance.new("ImageLabel", Btn)
Icon.Size = UDim2.new(0,80,0,80)
Icon.Position = UDim2.new(0.5,-40,0.5,-40)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://102297415885613"
Icon.ImageTransparency = 0.6

-- Dragging
local dragging = false
local dragStart, startPos
Btn.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = i.Position
        startPos = Btn.Position
    end
end)
Btn.InputChanged:Connect(function(i)
    if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local delta = i.Position - dragStart
        Btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
Btn.InputEnded:Connect(function() dragging = false end)

Btn.MouseButton1Click:Connect(function()
    if PanicMode then return end
    if shared.ciderSilent['Mode'] == "Silent" then
        shared.ciderSilent['Mode'] = "Camlock"
        Target = GetClosestPlayer()
        Icon.ImageTransparency = 0
    else
        shared.ciderSilent['Mode'] = "Silent"
        Target = nil
        Icon.ImageTransparency = 0.6
    end
end)

-- Camlock (Safe - won't freeze camera)
RunService.Heartbeat:Connect(function()
    if shared.ciderSilent['Mode'] ~= "Camlock" or not Target or not IsValidTarget(Target) then
        return
    end

    local char = Target.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    local part = head or hrp
    if part and hrp then
        local p = shared.ciderSilent.CamlockPrediction
        local vel = hrp.AssemblyLinearVelocity
        local pred = Vector3.new(vel.X * p.X, vel.Y * p.Y, vel.Z * p.Z)
        if p.AirBoost.Enabled then
            if vel.Y > 15 then pred += Vector3.new(0, p.AirBoost.Jump, 0)
            elseif vel.Y < -15 then pred += Vector3.new(0, -p.AirBoost.Fall, 0) end
        end
        Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, part.Position + pred), shared.ciderSilent.CamlockSmoothness)
    end
end)

-- SILENT AIM (Always works - even in Silent mode)
local oldIndex
oldIndex = hookmetamethod(game, "__index", function(self, key)
    if not checkcaller() and self == Mouse and (key == "Hit" or key == "hit") and shared.ciderSilent.Enabled and not PanicMode then
        local useTarget = Target or GetClosestPlayer()
        if useTarget and IsValidTarget(useTarget) then
            local part
            if shared.ciderSilent['Hit Target']['Hit Part'] == 'Closest Part' then
                part = GetClosestBodyPart(useTarget)
            else
                part = useTarget.Character:FindFirstChild(shared.ciderSilent['Hit Target']['Hit Part'])
            end
            if part and CanSee(part) then
                local hrp = useTarget.Character.HumanoidRootPart
                local p = shared.ciderSilent.SilentPrediction
                local vel = hrp.AssemblyLinearVelocity
                local pred = Vector3.new(vel.X * p.X, vel.Y * p.Y, vel.Z * p.Z)
                if p.AirBoost.Enabled then
                    if vel.Y > 15 then pred += Vector3.new(0, p.AirBoost.Jump, 0)
                    elseif vel.Y < -15 then pred += Vector3.new(0, -p.AirBoost.Fall, 0) end
                end
                return CFrame.new(part.Position + pred)
            end
        end
    end
    return oldIndex(self, key)
end)

-- Targeted TriggerBot
local lastShot = 0
RunService.RenderStepped:Connect(function()
    if not shared.ciderSilent.TriggerBot.Enabled or shared.ciderSilent['Mode'] ~= "Camlock" or not Target or not IsValidTarget(Target) then return end

    local char = LP.Character
    if not char then return end

    for _, tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") and shared.ciderSilent.TriggerBot.BlacklistedTools[tool.Name] then return end
    end

    if tick() - lastShot < shared.ciderSilent.TriggerBot.TriggerDelay then return end

    local ray = Ray.new(Camera.CFrame.Position, Camera.CFrame.LookVector * shared.ciderSilent.TriggerBot.MaxDistance)
    local hit = workspace:FindPartOnRayWithIgnoreList(ray, {char})

    if hit and hit:IsDescendantOf(Target.Character) then
        for _, tool in pairs(char:GetChildren()) do
            if tool:IsA("Tool") then tool:Activate() end
        end
        lastShot = tick()
    end
end)

-- Panic Key (L)
UserInputService.InputBegan:Connect(function(i)
    if i.KeyCode == Enum.KeyCode.L then
        PanicMode = not PanicMode
        Target = nil
        shared.ciderSilent['Mode'] = "Silent"
        Icon.ImageTransparency = 0.6
    end
end)