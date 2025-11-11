-- MOOZE SILENT AIM – CENTERED + CLOSEST POINT + NAME ONLY
-- Inject → Red circle → Hits CLOSEST PART + Shows NAME only

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

-- =========================================
-- CUSTOM PREDICTION (CHANGE THIS)
-- =========================================
local PredictionValue = 0.131  -- 0.13 = fast, 0.15 = slow

-- =========================================
-- CENTERED FOV CIRCLE (RED)
-- =========================================
local FOV = Drawing.new("Circle")
FOV.Radius = 150 -- FOV size
FOV.Thickness = 3
FOV.Color = Color3.fromRGB(255, 0, 0)
FOV.Filled = false
FOV.Visible = true

-- =========================================
-- NAME TAG ONLY
-- =========================================
local NameTag = Drawing.new("Text")
NameTag.Size = 18
NameTag.Color = Color3.fromRGB(255, 255, 255)
NameTag.Outline = true
NameTag.Font = 2
NameTag.Visible = false

-- =========================================
-- UPDATE CIRCLE TO CENTER
-- =========================================
RunService.RenderStepped:Connect(function()
    FOV.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
end)

-- =========================================
-- GET CLOSEST POINT TO CENTER
-- =========================================
local CurrentTarget = nil
local function GetClosestPoint()
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    local closestPart, closestDist, targetPlayer = nil, math.huge, nil

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local char = player.Character
            local root = char.HumanoidRootPart
            local rootPos, onScreen = Camera:WorldToViewportPoint(root.Position)
            
            if onScreen then
                local rootDist = (Vector2.new(rootPos.X, rootPos.Y) - center).Magnitude
                if rootDist <= FOV.Radius then
                    for _, part in ipairs(char:GetChildren()) do
                        if part:IsA("BasePart") and part ~= root then
                            local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                            if onScreen then
                                local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                                if dist < closestDist then
                                    closestDist = dist
                                    closestPart = part
                                    targetPlayer = player
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    CurrentTarget = targetPlayer
    return closestPart
end

-- =========================================
-- UPDATE NAME TAG ONLY
-- =========================================
RunService.RenderStepped:Connect(function()
    local targetPart = GetClosestPoint()
    
    if targetPart and CurrentTarget then
        local head = CurrentTarget.Character:FindFirstChild("Head")
        if head then
            local screenPos = Camera:WorldToViewportPoint(head.Position)
            NameTag.Position = Vector2.new(screenPos.X - 50, screenPos.Y - 40)
            NameTag.Text = CurrentTarget.Name
            NameTag.Visible = true
        end
    else
        NameTag.Visible = false
    end
end)

-- =========================================
-- SILENT AIM HOOK (HITS CLOSEST POINT)
-- =========================================
local mt = getrawmetatable(game)
local old = mt.__index
setreadonly(mt, false)

mt.__index = newcclosure(function(self, index)
    if self == LocalPlayer:GetMouse() and (index == "Hit" or index == "Target") then
        local targetPart = GetClosestPoint()
        if targetPart then
            local pred = targetPart.Position + (targetPart.Velocity * PredictionValue)
            if index == "Hit" then
                return CFrame.new(pred)
            else
                return targetPart
            end
        end
    end
    return old(self, index)
end)

setreadonly(mt, true)

-- =========================================
-- CONSOLE COMMANDS
-- =========================================
print("SILENT AIM LOADED – HITS CLOSEST POINT")
print("RED CIRCLE = AIM ZONE")
print("NAME TAG = TARGET PLAYER")
print("PREDICTION: " .. PredictionValue)
print("CHANGE LIVE: PredictionValue = 0.15")
print("SHOOT ANYWHERE NEAR = HITS EXACT PART")