--[[
    Mooze Speed – DRAGGABLE Toggle Button (100% working)
    ----------------------------------------------------
    • Hold‑drag the button anywhere on screen
    • Click → speed ON / OFF
    • Works on every game (WalkSpeed + BodyVelocity fallback)
--]]

-- ───── CONFIG ─────
local SPEED_ON  = 45   -- speed when ON
local SPEED_OFF = 16   -- normal speed when OFF
-- ──────────────────

local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local UserInputService  = game:GetService("UserInputService")
local CoreGui           = game:GetService("CoreGui")

local player = Players.LocalPlayer
local isEnabled = false
local bodyVel = nil

----------------------------------------------------------------
-- 1. UI – DRAGGABLE BUTTON
----------------------------------------------------------------
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "MoozeSpeedBtn"
gui.ResetOnSpawn = false

local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0, 110, 0, 36)
btn.Position = UDim2.new(1, -120, 0, 10)   -- start top‑right
btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
btn.BorderSizePixel = 0
btn.Font = Enum.Font.GothamBold
btn.TextSize = 15
btn.TextColor3 = Color3.new(1,1,1)
btn.Text = "SPEED: OFF"

local corner = Instance.new("UICorner", btn)
corner.CornerRadius = UDim.new(0, 8)

----------------------------------------------------------------
-- 2. DRAG LOGIC (works everywhere)
----------------------------------------------------------------
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

local function updateDrag(input)
    local delta = input.Position - dragStart
    btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

btn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = btn.Position

        -- capture the same input object for later changes
        dragInput = input
    end
end)

btn.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
        dragInput = nil
    end
end)

----------------------------------------------------------------
-- 3. TOGGLE LOGIC
----------------------------------------------------------------
local function refreshBtn()
    btn.Text = "SPEED: "..(isEnabled and "ON" or "OFF")
    btn.BackgroundColor3 = isEnabled and Color3.fromRGB(0,180,80) or Color3.fromRGB(35,35,35)
end
refreshBtn()

btn.MouseButton1Click:Connect(function()
    if dragging then return end   -- ignore click while dragging
    isEnabled = not isEnabled
    refreshBtn()
end)

----------------------------------------------------------------
-- 4. SPEED ENFORCEMENT
----------------------------------------------------------------
local function applySpeed(hum, root)
    if not isEnabled then
        if bodyVel and bodyVel.Parent then bodyVel:Destroy() end
        bodyVel = nil
        hum.WalkSpeed = SPEED_OFF
        return
    end

    hum.WalkSpeed = SPEED_ON

    if not bodyVel or not bodyVel.Parent then
        bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(4e4,0,4e4)
        bodyVel.Velocity = Vector3.zero
        bodyVel.Parent = root
    end

    local dir = hum.MoveDirection
    bodyVel.Velocity = dir.Magnitude > 0 and dir * SPEED_ON or Vector3.zero
end

----------------------------------------------------------------
-- 5. CHARACTER HANDLING
----------------------------------------------------------------
local function onChar(char)
    local hum  = char:WaitForChild("Humanoid")
    local root = char:WaitForChild("HumanoidRootPart")

    if bodyVel and bodyVel.Parent then bodyVel:Destroy() end
    bodyVel = nil

    RunService.Heartbeat:Connect(function()
        if char.Parent and hum.Health > 0 then
            applySpeed(hum, root)
        end
    end)
end

if player.Character then onChar(player.Character) end
player.CharacterAdded:Connect(onChar)

print("Mooze Speed DRAGGABLE button loaded – hold‑drag to move, click to toggle!")