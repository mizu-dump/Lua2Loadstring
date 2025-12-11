--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Don't skid this niggers

local gui = Instance.new("ScreenGui")
gui.Name = "Venguim Logo by S0ppyKidd"
gui.Parent = game.CoreGui

-- eye
local Eye = Instance.new("ImageLabel")
Eye.Size = UDim2.new(0, 100, 0, 100)
Eye.Position = UDim2.new(-0.127, 0, 0.408, 0)
Eye.BackgroundTransparency = 1
Eye.Image = "rbxassetid://88383929068128"
Eye.Parent = gui

local corner = Instance.new("UICorner", Eye)
corner.CornerRadius = UDim.new(1, 0)

-- pupil thing
local Pupil = Instance.new("ImageLabel")
Pupil.Size = UDim2.new(0, 90, 0, 90)
Pupil.Position = UDim2.new(0.5, -35, 0.5, -35)
Pupil.BackgroundTransparency = 1
Pupil.Image = "rbxassetid://81187522045491"
Pupil.Parent = Eye

local corner2 = Instance.new("UICorner", Pupil)
corner2.CornerRadius = UDim.new(1, 0)

-- ids
local NORMAL_EYE = "rbxassetid://88383929068128"
local BLINK_EYE  = "rbxassetid://129457447739984"

local function movePupil(x, y, t)
	Pupil:TweenPosition(UDim2.new(0.1, x, 0.1, y), "Out", "Sine", t, true)
	task.wait(t)
end

local function blink()
	-- blink
	Pupil.Visible = false
	Eye.Image = BLINK_EYE
	task.wait(0.28)

	-- random
	Eye.Image = NORMAL_EYE
	Pupil.Visible = true
	task.wait(0.4)
end

-- intro
Eye:TweenPosition(UDim2.new(0.458, 0, 0.408, 0), "Out", "Linear", 0.4, true)
task.wait(3)
Eye:TweenPosition(UDim2.new(0, 9, 0, 190), "Out", "Sine", 0.7, true)
task.wait(1)

-- Moviment
while true do
	movePupil(10, 10, 0.2)
	task.wait(2.5)
	if math.random() < 0.25 then blink() end

	movePupil(-10, -10, 0.2)
	task.wait(2.5)
	if math.random() < 0.3 then blink() end

	movePupil(10, -10, 0.2)
	task.wait(2.5)

	movePupil(-10, -4, 0.2)
	task.wait(2.5)
	if math.random() < 0.2 then blink() end

	movePupil(-10, 10, 0.2)
	task.wait(2.5)

	movePupil(-12, -12, 0.22)
	task.wait(2.5)
	if math.random() < 0.4 then blink() end

	-- eye
	movePupil(-14, 0, 0.4)
	task.wait(0.2)
	movePupil(-13, 0, 0.06)
	task.wait(0.2)
	movePupil(-14, 0, 0.06)
	task.wait(2.5)
	if math.random() < 0.55 then blink() end

	movePupil(10, -10, 0.25)
	task.wait(2.5)
	if math.random() < 0.25 then blink() end
end