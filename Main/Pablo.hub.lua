local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Crear GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 220, 0, 80)
frame.Position = UDim2.new(0.5, -110, 0.5, -40)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 24)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Coordenadas"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextStrokeTransparency = 0

local coordsLabel = Instance.new("TextLabel", frame)
coordsLabel.Size = UDim2.new(1, -10, 0, 50)
coordsLabel.Position = UDim2.new(0,5,0,25)
coordsLabel.BackgroundTransparency = 1
coordsLabel.Text = "X: 0 Y: 0 Z: 0"
coordsLabel.Font = Enum.Font.SourceSans
coordsLabel.TextSize = 16
coordsLabel.TextColor3 = Color3.new(1,1,1)
coordsLabel.TextXAlignment = Enum.TextXAlignment.Left
coordsLabel.TextYAlignment = Enum.TextYAlignment.Top

-- Animación arcoíris
local hue = 0
RunService.RenderStepped:Connect(function()
	hue = (hue + 0.5) % 360
	local rainbowColor = Color3.fromHSV(hue/360, 1, 1)
	frame.BackgroundColor3 = rainbowColor
end)

-- Función para actualizar coordenadas
local function updateCoords()
	if hrp and hrp.Parent then
		local pos = hrp.Position
		coordsLabel.Text = string.format("X: %.2f\nY: %.2f\nZ: %.2f", pos.X, pos.Y, pos.Z)
	end
end

-- Loop para actualizar coords
RunService.RenderStepped:Connect(updateCoords)