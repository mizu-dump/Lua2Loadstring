-- HD Admin GUI (gris + grande + disco + billboard)
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "HDAdminGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 350) -- más grande para nuevo botón
frame.Position = UDim2.new(0.05, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Active = true
frame.Draggable = true

-- Título
local titulo = Instance.new("TextLabel", frame)
titulo.Size = UDim2.new(1, 0, 0, 40)
titulo.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
titulo.BorderSizePixel = 0
titulo.Text = "HD ADMIN GUI"
titulo.TextColor3 = Color3.fromRGB(255, 255, 255)
titulo.TextScaled = true
titulo.Font = Enum.Font.SourceSansBold

-- Función para crear botones
local function crearBoton(texto, y, comando)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0, 280, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, y)
	btn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	btn.TextColor3 = Color3.fromRGB(0, 0, 0)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 18
	btn.Text = texto

	btn.MouseButton1Click:Connect(function()
		local comandoFinal = comando
		if not comando:match("^;") then
			comandoFinal = ";" .. comando
		end
		TextChatService.TextChannels.RBXGeneral:SendAsync(comandoFinal)
	end)
end

-- Botones
crearBoton("🎵 Música Pitch 0.20", 50, "music 72089843969979 ;pitch 0.20")
crearBoton("⛔ Detener Música", 100, "unmusic")
crearBoton("⚡ Velocidad x2", 150, "speed me 50")
crearBoton("🐇 Saltar Alto", 200, "jumpheight me 200")
crearBoton("💿 Activar Disco", 250, "disco")
crearBoton("📝 Billboard Title 09", 300, "title me 09") -- nuevo botón