-- FLY GUI by DylanHub

-- Crear ScreenGui
local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

-- Marco principal
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 90)
frame.Position = UDim2.new(0.5, -160, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
frame.Active = true
frame.Draggable = true

-- Variables
local flying = false
local speed = 1
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Función para actualizar velocidad en el botón
local function updateSpeedLabel()
	speedLabel.Text = tostring(speed)
end

-- BOTÓN +
local plus = Instance.new("TextButton", frame)
plus.Size = UDim2.new(0, 80, 0, 40)
plus.Position = UDim2.new(0, 80, 0, 0)
plus.BackgroundColor3 = Color3.fromRGB(150, 170, 255)
plus.Text = "+"

-- BOTÓN -
local minus = Instance.new("TextButton", frame)
minus.Size = UDim2.new(0, 80, 0, 40)
minus.Position = UDim2.new(0, 80, 0, 45)
minus.BackgroundColor3 = Color3.fromRGB(150, 240, 255)
minus.Text = "-"

-- Velocidad actual
local speedLabel = Instance.new("TextLabel", frame)
speedLabel.Size = UDim2.new(0, 80, 0, 40)
speedLabel.Position = UDim2.new(0, 165, 0, 45)
speedLabel.BackgroundColor3 = Color3.fromRGB(255, 120, 20)
speedLabel.Text = tostring(speed)

-- BOTÓN FLY (ON / OFF)
local flyBtn = Instance.new("TextButton", frame)
flyBtn.Size = UDim2.new(0, 80, 0, 85)
flyBtn.Position = UDim2.new(0, 245, 0, 0)
flyBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 80)
flyBtn.Text = "FLY: OFF"

-- MECÁNICA DE VUELO
local bodyVel
local bodyGyro

local function activateFly()
	flying = true
	flyBtn.Text = "FLY: ON"

	bodyVel = Instance.new("BodyVelocity")
	bodyVel.MaxForce = Vector3.new(1e6, 1e6, 1e6)
	bodyVel.Velocity = Vector3.new(0, 0, 0)
	bodyVel.Parent = hrp

	bodyGyro = Instance.new("BodyGyro")
	bodyGyro.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
	bodyGyro.CFrame = hrp.CFrame
	bodyGyro.Parent = hrp

	-- Movimiento suave + resbalón
	while flying do
		task.wait()

		local move = Vector3.new(0, 0, 0)
		local hum = char:FindFirstChildOfClass("Humanoid")

		if hum.MoveDirection.Magnitude > 0 then
			move = hum.MoveDirection * speed
		else
			-- pequeño resbalón
			move = bodyVel.Velocity * 0.90
		end

		bodyVel.Velocity = hrp.CFrame:VectorToWorldSpace(move)
		bodyGyro.CFrame = workspace.CurrentCamera.CFrame
	end
end

local function deactivateFly()
	flying = false
	flyBtn.Text = "FLY: OFF"
	if bodyVel then bodyVel:Destroy() end
	if bodyGyro then bodyGyro:Destroy() end
end

-- BOTONES
plus.MouseButton1Click:Connect(function()
	if speed < 100 then
		speed = speed + 1
		updateSpeedLabel()
	end
end)

minus.MouseButton1Click:Connect(function()
	if speed > 1 then
		speed = speed - 1
		updateSpeedLabel()
	end
end)

flyBtn.MouseButton1Click:Connect(function()
	if flying then
		deactivateFly()
	else
		activateFly()
	end
end)