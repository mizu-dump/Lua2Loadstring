local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Crear GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 220, 0, 100)
frame.Position = UDim2.new(0.5, -110, 0.5, -50)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0

-- Animación arcoíris para el fondo
local hue = 0
RunService.RenderStepped:Connect(function()
	hue = (hue + 0.5) % 360
	frame.BackgroundColor3 = Color3.fromHSV(hue/360, 0.8, 0.9)
end)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 24)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Teletransporte Automático"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = Color3.new(1,1,1)
title.TextStrokeTransparency = 0

local xBox = Instance.new("TextBox", frame)
xBox.Size = UDim2.new(0.3, -5, 0, 24)
xBox.Position = UDim2.new(0, 5, 0, 30)
xBox.PlaceholderText = "X"
xBox.Text = "0"

local yBox = Instance.new("TextBox", frame)
yBox.Size = UDim2.new(0.3, -5, 0, 24)
yBox.Position = UDim2.new(0.35, 0, 0, 30)
yBox.PlaceholderText = "Y"
yBox.Text = "10"

local zBox = Instance.new("TextBox", frame)
zBox.Size = UDim2.new(0.3, -5, 0, 24)
zBox.Position = UDim2.new(0.7, 0, 0, 30)
zBox.PlaceholderText = "Z"
zBox.Text = "0"

local toggleBtn = Instance.new("TextButton", frame)
toggleBtn.Size = UDim2.new(1, -10, 0, 24)
toggleBtn.Position = UDim2.new(0, 5, 0, 65)
toggleBtn.Text = "Activar Teletransporte"
toggleBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.Font = Enum.Font.SourceSans
toggleBtn.TextSize = 14

-- Estado
local active = false
local interval = 0.2

-- Función para obtener coordenadas
local function getTargetPosition()
	local x = tonumber(xBox.Text) or 0
	local y = tonumber(yBox.Text) or 0
	local z = tonumber(zBox.Text) or 0
	return Vector3.new(x,y,z)
end

-- Teletransporte automático
spawn(function()
	while true do
		if active and hrp and hrp.Parent then
			hrp.CFrame = CFrame.new(getTargetPosition())
		end
		wait(interval)
	end
end)

-- Botón activar/desactivar
toggleBtn.MouseButton1Click:Connect(function()
	active = not active
	toggleBtn.Text = active and "Desactivar Teletransporte" or "Activar Teletransporte"
end)