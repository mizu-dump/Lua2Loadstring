-- CONFIG
local IMAGE_ID = "rbxassetid://77487936504413"
local TELEPORT_POSITIONS = {
    Vector3.new(467, 259.9, 895.9),
    Vector3.new(469.4, 260.6, 466.2),
    Vector3.new(495, 266.9, -7.5)
}

local player = game.Players.LocalPlayer
local teleport = false

-- GUI
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = false
gui.Parent = player:WaitForChild("PlayerGui")

-- VENTANA PRINCIPAL
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 260, 0, 200)
main.Position = UDim2.new(0.05, 0, 0.35, 0)
main.Active = true
main.Draggable = true
main.Parent = gui

-- ⭐ ARCOÍRIS EN LA VENTANA
task.spawn(function()
    local hue = 0
    while main do
        hue += 0.003
        if hue > 1 then hue = 0 end
        main.BackgroundColor3 = Color3.fromHSV(hue, 0.6, 0.9)
        task.wait(0.02)
    end
end)

-- TEXTO COORDENADAS
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Coords: 467, 259.9, 895.9"
title.Parent = main

-- BOTÓN ACTIVAR TP
local activate = Instance.new("TextButton")
activate.Size = UDim2.new(1, -20, 0, 35)
activate.Position = UDim2.new(0, 10, 0, 40)
activate.Text = "Activar"
activate.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
activate.TextColor3 = Color3.fromRGB(255, 255, 255)
activate.Parent = main

-- BOTÓN RESPAWN
local respawnBtn = Instance.new("TextButton")
respawnBtn.Size = UDim2.new(1, -20, 0, 35)
respawnBtn.Position = UDim2.new(0, 10, 0, 80)
respawnBtn.Text = "Respawnear"
respawnBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 150)
respawnBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
respawnBtn.Parent = main

-- BOTÓN MINIMIZAR
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 40, 0, 25)
minimize.Position = UDim2.new(1, -50, 0, 0)
minimize.Text = "_"
minimize.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.Parent = main

-- ICONO (ARCOÍRIS Y CON TU IMAGEN)
local icon = Instance.new("ImageButton")
icon.Size = UDim2.new(0, 70, 0, 70)
icon.Position = UDim2.new(0.05, 0, 0.6, 0)
icon.BackgroundTransparency = 0
icon.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
icon.BorderSizePixel = 3
icon.BorderColor3 = Color3.fromRGB(255, 255, 255)
icon.Active = true
icon.Draggable = true
icon.Visible = false
icon.Parent = gui

-- ⭐ ARCOÍRIS EN EL ICONO
task.spawn(function()
    local hue = 0
    while icon do
        hue += 0.01
        if hue > 1 then hue = 0 end
        icon.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
        task.wait(0.03)
    end
end)

-- CARGAR IMAGEN
local ok = pcall(function()
    icon.Image = IMAGE_ID
end)

if not ok or icon.Image == "" then
    icon.Image = ""
    local fb = Instance.new("TextLabel", icon)
    fb.Text = "ICONO"
    fb.Size = UDim2.new(1, 0, 1, 0)
    fb.BackgroundTransparency = 1
    fb.TextColor3 = Color3.fromRGB(255, 255, 255)
end

-- ACTIVAR / DESACTIVAR TP
activate.MouseButton1Click:Connect(function()
    teleport = not teleport
    activate.Text = teleport and "Desactivar" or "Activar"
end)

-- BOTÓN RESPAWN
respawnBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char then
        char:BreakJoints()
    end
end)

-- MINIMIZAR
minimize.MouseButton1Click:Connect(function()
    main.Visible = false
    icon.Visible = true
end)

-- RESTAURAR
icon.MouseButton1Click:Connect(function()
    icon.Visible = false
    main.Visible = true
end)

-- LOOP DE TELEPORT A 3 POSICIONES (más lento)
task.spawn(function()
    local index = 1
    while true do
        task.wait(1)  -- espera 1 segundo entre cada teleport
        if teleport then
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(TELEPORT_POSITIONS[index])
                index = index + 1
                if index > #TELEPORT_POSITIONS then
                    index = 1
                end
            end
        end
    end
end)