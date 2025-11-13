-- Hub: Part Rings
-- Autor: Tú
-- Roblox Lua

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local radius = 20
local speed = 10
local attracting = false
local mode = nil

-- Crear ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PartRingsHub"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Frame principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 220)
frame.Position = UDim2.new(0.5, -150, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 2
frame.Parent = screenGui
frame.Draggable = true
frame.Active = true

-- Título
local title = Instance.new("TextLabel")
title.Text = "Part Rings"
title.Size = UDim2.new(1,0,0,30)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundColor3 = Color3.fromRGB(20,20,20)
title.TextColor3 = Color3.fromRGB(0,255,255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.Parent = frame

-- Botón minimizar
local minimizeButton = Instance.new("TextButton")
minimizeButton.Text = "-"
minimizeButton.Size = UDim2.new(0,30,0,30)
minimizeButton.Position = UDim2.new(1, -35, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(200,50,50)
minimizeButton.TextColor3 = Color3.new(1,1,1)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 24
minimizeButton.Parent = frame

local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
    if not minimized then
        frame.Size = UDim2.new(0, 100, 0, 40)
        for _, child in pairs(frame:GetChildren()) do
            if child ~= title and child ~= minimizeButton then
                child.Visible = false
            end
        end
        minimized = true
    else
        frame.Size = UDim2.new(0, 300, 0, 220)
        for _, child in pairs(frame:GetChildren()) do
            child.Visible = true
        end
        title.Visible = true
        minimizeButton.Visible = true
        minimized = false
    end
end)

-- Radius
local radiusLabel = Instance.new("TextLabel")
radiusLabel.Text = "Radius: "..radius
radiusLabel.Size = UDim2.new(1, -20, 0, 20)
radiusLabel.Position = UDim2.new(0,10,0,40)
radiusLabel.TextColor3 = Color3.new(1,1,1)
radiusLabel.BackgroundTransparency = 1
radiusLabel.Font = Enum.Font.SourceSans
radiusLabel.TextSize = 18
radiusLabel.Parent = frame

local radiusBox = Instance.new("TextBox")
radiusBox.Size = UDim2.new(1, -20, 0, 20)
radiusBox.Position = UDim2.new(0,10,0,65)
radiusBox.Text = tostring(radius)
radiusBox.TextColor3 = Color3.new(1,1,1)
radiusBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
radiusBox.ClearTextOnFocus = false
radiusBox.Font = Enum.Font.SourceSans
radiusBox.TextSize = 18
radiusBox.Parent = frame

radiusBox.FocusLost:Connect(function()
    local val = tonumber(radiusBox.Text)
    if val and val >= 1 and val <= 100 then
        radius = val
        radiusLabel.Text = "Radius: "..radius
    else
        radiusBox.Text = tostring(radius)
    end
end)

-- Speed
local speedLabel = Instance.new("TextLabel")
speedLabel.Text = "Speed: "..speed
speedLabel.Size = UDim2.new(1, -20, 0, 20)
speedLabel.Position = UDim2.new(0,10,0,95)
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.BackgroundTransparency = 1
speedLabel.Font = Enum.Font.SourceSans
speedLabel.TextSize = 18
speedLabel.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(1, -20, 0, 20)
speedBox.Position = UDim2.new(0,10,0,120)
speedBox.Text = tostring(speed)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
speedBox.ClearTextOnFocus = false
speedBox.Font = Enum.Font.SourceSans
speedBox.TextSize = 18
speedBox.Parent = frame

speedBox.FocusLost:Connect(function()
    local val = tonumber(speedBox.Text)
    if val and val >= 1 and val <= 100 then
        speed = val
        speedLabel.Text = "Speed: "..speed
    else
        speedBox.Text = tostring(speed)
    end
end)

-- Botones Tornado y Esfera
local tornadoButton = Instance.new("TextButton")
tornadoButton.Text = "Inicio Tornado"
tornadoButton.Size = UDim2.new(1, -20, 0, 30)
tornadoButton.Position = UDim2.new(0,10,0,150)
tornadoButton.BackgroundColor3 = Color3.fromRGB(0,170,255)
tornadoButton.TextColor3 = Color3.new(1,1,1)
tornadoButton.Font = Enum.Font.SourceSansBold
tornadoButton.TextSize = 18
tornadoButton.Parent = frame

local sphereButton = Instance.new("TextButton")
sphereButton.Text = "Inicio Esfera"
sphereButton.Size = UDim2.new(1, -20, 0, 30)
sphereButton.Position = UDim2.new(0,10,0,185)
sphereButton.BackgroundColor3 = Color3.fromRGB(0,255,170)
sphereButton.TextColor3 = Color3.new(1,1,1)
sphereButton.Font = Enum.Font.SourceSansBold
sphereButton.TextSize = 18
sphereButton.Parent = frame

-- Función para atraer partes suavemente
local RunService = game:GetService("RunService")

local function attractPartsSmooth(shape)
    attracting = true
    mode = shape
    RunService.RenderStepped:Connect(function(deltaTime)
        if not attracting or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and not part.Anchored then
                local targetPos
                if shape == "tornado" then
                    local angle = tick()*speed/10
                    targetPos = hrp.Position + Vector3.new(math.cos(angle)*radius, (part.Position.Y-hrp.Position.Y)/2, math.sin(angle)*radius)
                elseif shape == "sphere" then
                    local angle = tick()*speed/10
                    local phi = tick()*speed/20
                    local x = math.sin(angle)*math.cos(phi)*radius
                    local y = math.sin(phi)*radius
                    local z = math.cos(angle)*math.cos(phi)*radius
                    targetPos = hrp.Position + Vector3.new(x,y,z)
                end
                -- Movimiento suave
                part.CFrame = CFrame.new(part.Position:Lerp(targetPos, 0.1))
            end
        end
    end)
end

tornadoButton.MouseButton1Click:Connect(function()
    attractPartsSmooth("tornado")
end)

sphereButton.MouseButton1Click:Connect(function()
    attractPartsSmooth("sphere")
end)