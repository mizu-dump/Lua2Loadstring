-- ULTIMATE HYBRID v2: STICKY CAMLOCK + SILENT AIM (TOGGLEABLE)
-- Sticky Camlock: Locks & STICKS to ONE target (even offscreen/around corners) | Silent ALWAYS ON
-- Mobile + PC | Da Hood 2025 | Dynamic Prediction | Head Priority

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- =============================================
-- CONFIG (Tweak for your style)
-- =============================================
local FOV_RADIUS = 90
local SMOOTHNESS = 0.35  -- Higher = Snappier/Stickier (0.2=smooth, 0.5=instant)
local BASE_PREDICTION = 0.135
local partPriority = {"Head","UpperTorso","HumanoidRootPart","LowerTorso","LeftUpperArm","RightUpperArm"}

-- =============================================
-- STATE
-- =============================================
local CamlockEnabled = false
local LockedTarget = nil
local SilentAimTarget = nil

-- =============================================
-- FOV CIRCLE (Colors: Red=Silent | Green=Sticky Lock | Orange=No Target)
-- =============================================
local Circle = Drawing.new("Circle")
Circle.Radius = FOV_RADIUS
Circle.Thickness = 3
Circle.Filled = false
Circle.Transparency = 0.8
Circle.Visible = true
Circle.Color = Color3.fromRGB(255, 0, 0)

RunService.RenderStepped:Connect(function()
    Circle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
end)

-- =============================================
-- DYNAMIC PREDICTION (Distance + Velocity)
-- =============================================
local function GetDynamicPrediction(part)
    local hrp = part.Parent:FindFirstChild("HumanoidRootPart")
    if not hrp then return BASE_PREDICTION end
    local dist = (Camera.CFrame.Position - hrp.Position).Magnitude
    local velMag = hrp.AssemblyLinearVelocity.Magnitude
    local pred = BASE_PREDICTION + (dist / 1000) * (velMag / 50)
    return math.clamp(pred, 0.09, 0.38)
end

-- =============================================
-- GET BEST VISIBLE PART (Priority + Closest to center)
-- =============================================
local function GetBestPart(char)
    local center = Circle.Position
    local bestPart, bestDist = nil, math.huge
    for _, name in ipairs(partPriority) do
        local part = char:FindFirstChild(name)
        if part and part:IsA("BasePart") then
            local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
            if onScreen then
                local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                if dist < bestDist then
                    bestDist = dist
                    bestPart = part
                end
            end
        end
    end
    return bestPart
end

-- =============================================
-- STICKY CAMLOCK PART (Visible Best OR HRP Fallback - Even Offscreen!)
-- =============================================
local function GetCamlockPart(plr)
    local char = plr.Character
    if not char then return nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return nil end
    -- Priority: Best visible part
    local best = GetBestPart(char)
    if best then return best end
    -- Sticky Fallback: HRP (predict even offscreen/behind wall)
    local hrp = char:FindFirstChild("HumanoidRootPart")
    return hrp
end

-- =============================================
-- FIND CLOSEST IN FOV (For Silent Aim + Acquire)
-- =============================================
local function FindTarget()
    local center = Circle.Position
    local closestPart, closestDist, closestPlayer = nil, math.huge, nil
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local part = GetBestPart(plr.Character)
                if part then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                        if dist <= FOV_RADIUS and dist < closestDist then
                            closestDist = dist
                            closestPart = part
                            closestPlayer = plr
                        end
                    end
                end
            end
        end
    end
    return closestPart, closestPlayer
end

-- =============================================
-- MAIN LOOP (Sticky Camlock + Silent Sync)
-- =============================================
RunService.Heartbeat:Connect(function()
    local fovPart, fovPlr = FindTarget()
    SilentAimTarget = fovPart  -- Default: Closest in FOV

    if CamlockEnabled then
        local camPart = nil

        -- STICK to current lock if valid
        if LockedTarget and GetCamlockPart(LockedTarget) then
            camPart = GetCamlockPart(LockedTarget)
        end

        -- Acquire new if lost
        if not camPart then
            if fovPart then
                LockedTarget = fovPlr
                camPart = fovPart
                print("🔒 STICKY LOCK ACQUIRED:", LockedTarget.Name)
            end
        end

        if camPart then
            -- DYNAMIC PREDICT + LERP (STICKY!)
            local pred = GetDynamicPrediction(camPart)
            local vel = camPart.AssemblyLinearVelocity or camPart.Velocity or Vector3.new()
            local predicted = camPart.Position + vel * pred
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, predicted), SMOOTHNESS)
            Circle.Color = Color3.fromRGB(0, 255, 0)  -- Green = Sticky Locked
            SilentAimTarget = camPart  -- Sync Silent to Camlock target
        else
            Circle.Color = Color3.fromRGB(255, 165, 0)  -- Orange = Searching
            LockedTarget = nil
        end
    else
        Circle.Color = Color3.fromRGB(255, 0, 0)  -- Red = Silent Only
        LockedTarget = nil
    end
end)

-- =============================================
-- SILENT AIM (ALWAYS ACTIVE - Uses Synced Target)
-- =============================================
local mt = getrawmetatable(game)
local oldIndex = mt.__index
setreadonly(mt, false)
mt.__index = newcclosure(function(self, key)
    if self == LocalPlayer:GetMouse() and SilentAimTarget and (key == "Hit" or key == "Target") then
        local pred = GetDynamicPrediction(SilentAimTarget)
        local vel = SilentAimTarget.AssemblyLinearVelocity or SilentAimTarget.Velocity or Vector3.new()
        local predictedPos = SilentAimTarget.Position + vel * pred
        if key == "Hit" then
            return CFrame.new(predictedPos, predictedPos + Camera.CFrame.LookVector)
        elseif key == "Target" then
            return SilentAimTarget
        end
    end
    return oldIndex(self, key)
end)
setreadonly(mt, true)

-- =============================================
-- PRO DRAGGABLE BUTTON (Mobile + PC Perfect)
-- =============================================
local Gui = Instance.new("ScreenGui")
Gui.Name = "StickyHybrid"
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 999999
Gui.Parent = CoreGui

local Btn = Instance.new("TextButton")
Btn.Size = UDim2.new(0, 135, 0, 135)
Btn.Position = UDim2.new(1, -165, 0.5, -67)
Btn.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
Btn.BackgroundTransparency = 0.4
Btn.BorderSizePixel = 0
Btn.Text = ""
Btn.ZIndex = 999
Btn.Parent = Gui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 28)
BtnCorner.Parent = Btn

local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.new(0, 80, 0, 80)
Icon.Position = UDim2.new(0.5, -40, 0.5, -40)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://102297415885613"
Icon.ImageTransparency = 0.6
Icon.ScaleType = Enum.ScaleType.Fit
Icon.Parent = Btn

-- Pro Draggable (Works on Mobile + PC)
local dragging, dragInput, dragStart, startPos
local function updateInput(input)
    local delta = input.Position - dragStart
    Btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Btn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Btn.Position
        input.Changed:Connect(function()
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                updateInput(input)
            end
        end)
    end
end)

Btn.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updateInput(input)
    end
end)

Btn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Toggle (Instant Acquire on Enable)
Btn.MouseButton1Click:Connect(function()
    CamlockEnabled = not CamlockEnabled
    Icon.ImageTransparency = CamlockEnabled and 0 or 0.6
    if CamlockEnabled then
        print("🟢 STICKY CAMLOCK ENABLED - Acquiring target...")
    else
        LockedTarget = nil
        print("🔴 CAMLOCK OFF - Silent Aim Still Active")
    end
end)

-- Force Visible
task.spawn(function()
    while task.wait(2) do
        if Gui then Gui.Enabled = true end
    end
end)

-- Respawn Fix
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    Camera.CameraType = Enum.CameraType.Custom
end)

print("✅ ULTIMATE STICKY HYBRID v2 LOADED")
print("🟢 Button ON = Sticky Camlock (follows ANYWHERE) | Silent Synced")
print("🔴 Button OFF = Silent Aim on Closest FOV")
print("📈 Dynamic Pred | Head Pri | Snappiness:", SMOOTHNESS)
print("🚀 You're UNTOUCHABLE now")