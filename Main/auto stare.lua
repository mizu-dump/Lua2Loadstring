local p = game:GetService("Players").LocalPlayer
local ps = game:GetService("Players")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local cam = workspace.CurrentCamera

local on = false
local target = nil
local root = nil

local gui = Instance.new("ScreenGui")
gui.Name = "LockUI"
gui.ResetOnSpawn = false
gui.Parent = p:WaitForChild("PlayerGui")

local btn = Instance.new("TextButton")
btn.Size = UDim2.fromScale(0.22, 0.1)
btn.Position = UDim2.fromScale(0.39, 0.65)
btn.Text = "OFF"
btn.TextScaled = true
btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
btn.TextColor3 = Color3.new(1,1,1)
btn.AutoButtonColor = false
btn.Parent = gui

Instance.new("UICorner", btn).CornerRadius = UDim.new(0.25, 0)

local drag = false
local moved = false
local startPos
local startUI
local thresh = 8

btn.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		drag = true
		moved = false
		startPos = i.Position
		startUI = btn.Position
	end
end)

btn.InputChanged:Connect(function(i)
	if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
		local d = i.Position - startPos
		if math.abs(d.X) > thresh or math.abs(d.Y) > thresh then
			moved = true
			btn.Position = UDim2.new(
				startUI.X.Scale, startUI.X.Offset + d.X,
				startUI.Y.Scale, startUI.Y.Offset + d.Y
			)
		end
	end
end)

local function getTarget()
	if not root then return nil end
	local best = nil
	local dist = math.huge
	local look = cam.CFrame.LookVector
	for _,v in ipairs(ps:GetPlayers()) do
		if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = v.Character.HumanoidRootPart
			local dir = hrp.Position - cam.CFrame.Position
			local mag = dir.Magnitude
			if mag > 0 then
				local dot = look:Dot(dir.Unit)
				if dot > 0.7 and mag < dist then
					dist = mag
					best = v
				end
			end
		end
	end
	return best
end

btn.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		drag = false
		if not moved then
			on = not on
			btn.Text = on and "ON" or "OFF"
			if on then
				if not target then
					target = getTarget()
				end
			else
				target = nil
			end
		end
	end
end)

local function bind(c)
	root = c:WaitForChild("HumanoidRootPart")
	target = nil
end

if p.Character then
	bind(p.Character)
end

p.CharacterAdded:Connect(bind)

rs.RenderStepped:Connect(function()
	if not on or not target or not root then return end
	if not target.Character then
		target = nil
		return
	end

	local tr = target.Character:FindFirstChild("HumanoidRootPart")
	if not tr then return end

	root.CFrame = CFrame.lookAt(
		root.Position,
		Vector3.new(tr.Position.X, root.Position.Y, tr.Position.Z)
	)
end)
