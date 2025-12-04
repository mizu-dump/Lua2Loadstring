--=====================================================
-- Painel Aim Assist + ESP - LocalScript completo
-- Autor: Arthur
-- Uso: Apenas no seu jogo, legítimo (UI-only, Camera:Lerp)
--=====================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = Workspace.CurrentCamera

-- ======================
-- Estado / Config padrão
-- ======================
local STATE = {
    AimEnabled = false,
    FOVEnabled = true,
    WallCheck = true,
    Mode = "nearest",                
    AimPartIndex = 1,
    AimParts = {"Head","Neck","UpperTorso","LowerTorso","HumanoidRootPart","LeftFoot","RightFoot"},
    FOVRadius = 180,                 
    FOVTransparency = 0.35,          
    Smoothness = 0.14,               
    MaxDistance = 400,               
    ESPEnabled = true,
}

-- ======================
-- Helper utilities
-- ======================
local function clamp(n, a, b) return math.clamp(n or a, a, b) end

local function getPreferredPart(character)
    if not character then return nil end
    local name = STATE.AimParts[STATE.AimPartIndex] or "Head"
    local candidates = {name}
    for _, nm in ipairs(candidates) do
        local found = character:FindFirstChild(nm, true)
        if found and found:IsA("BasePart") then return found end
    end
    return character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
end

local function isVisible(originPos, targetPart)
    if not targetPart then return false end
    if not STATE.WallCheck then return true end
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    params.IgnoreWater = true

    local dir = targetPart.Position - originPos
    local ray = Workspace:Raycast(originPos, dir, params)
    if not ray then return true end
    if ray.Instance and ray.Instance:IsDescendantOf(targetPart.Parent) then return true end
    return false
end

local function findTargets()
    local camPos = Camera.CFrame.Position
    local viewport = Camera.ViewportSize
    local center = Vector2.new(viewport.X/2, viewport.Y/2)
    local found = {}

    for _, pl in ipairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild("Humanoid") and pl.Character.Humanoid.Health > 0 then
            local part = getPreferredPart(pl.Character)
            if part then
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen and screenPos.Z > 0 then
                    local screenDist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                    local worldDist = (part.Position - camPos).Magnitude
                    if screenDist <= STATE.FOVRadius and worldDist <= STATE.MaxDistance and isVisible(camPos, part) then
                        table.insert(found, {player = pl, part = part, screenDist = screenDist, worldDist = worldDist})
                    end
                end
            end
        end
    end
    return found
end

local function chooseTarget(list)
    if #list == 0 then return nil end
    if STATE.Mode == "first" then
        return list[1].player, list[1].part
    else
        table.sort(list, function(a,b) return a.screenDist < b.screenDist end)
        return list[1].player, list[1].part
    end
end

-- ======================
-- BUILD GUI (2 col rounded + draggable)
-- ======================
local gui = Instance.new("ScreenGui")
gui.Name = "Arthur_AimGui"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 420, 0, 340)
main.Position = UDim2.new(0.5, -210, 0.5, -170)
main.BackgroundColor3 = Color3.fromRGB(22,22,25)
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)
Instance.new("UIStroke", main).Thickness = 1; 
Instance.new("UIStroke", main).Transparency = 0.75; 
Instance.new("UIStroke", main).Color = Color3.fromRGB(50,50,60)

local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,46)
header.BackgroundColor3 = Color3.fromRGB(30,30,36)
Instance.new("UICorner", header).CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -120, 1, 0)
title.Position = UDim2.new(0,16,0,0)
title.BackgroundTransparency = 1
title.Text = "Painel Arthur — Aim Assist"
title.TextColor3 = Color3.fromRGB(235,235,240)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left

local btnMin = Instance.new("TextButton", header)
btnMin.Size = UDim2.new(0,36,0,28)
btnMin.Position = UDim2.new(1,-92,0,9)
btnMin.Text = "—"
btnMin.Font = Enum.Font.GothamBold
btnMin.TextSize = 18
btnMin.BackgroundColor3 = Color3.fromRGB(60,110,190)
btnMin.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btnMin).CornerRadius = UDim.new(0,6)

local btnClose = Instance.new("TextButton", header)
btnClose.Size = UDim2.new(0,36,0,28)
btnClose.Position = UDim2.new(1,-46,0,9)
btnClose.Text = "X"
btnClose.Font = Enum.Font.GothamBold
btnClose.TextSize = 16
btnClose.BackgroundColor3 = Color3.fromRGB(170,60,60)
btnClose.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", btnClose).CornerRadius = UDim.new(0,6)

local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,16,0,56)
content.Size = UDim2.new(1,-32,1,-72)
content.BackgroundTransparency = 1

local left = Instance.new("Frame", content)
left.Size = UDim2.new(0.5,-8,1,0)
left.Position = UDim2.new(0,0,0,0)
left.BackgroundTransparency = 1

local right = Instance.new("Frame", content)
right.Size = UDim2.new(0.5,-8,1,0)
right.Position = UDim2.new(0.5,8,0,0)
right.BackgroundTransparency = 1

local function makeLabel(parent, text, y)
    local l = Instance.new("TextLabel", parent)
    l.Size = UDim2.new(1,0,0,18)
    l.Position = UDim2.new(0,0,0,y)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = Color3.fromRGB(210,210,215)
    l.Font = Enum.Font.Gotham
    l.TextSize = 13
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end

local function makeBtn(parent, txt, y)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1,0,0,34)
    b.Position = UDim2.new(0,0,0,y)
    b.Text = txt
    b.Font = Enum.Font.GothamSemibold
    b.TextSize = 14
    b.TextColor3 = Color3.fromRGB(245,245,245)
    b.BackgroundColor3 = Color3.fromRGB(60,60,65)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    return b
end

local function makeBox(parent, placeholder, y)
    makeLabel(parent, placeholder, y-18)
    local t = Instance.new("TextBox", parent)
    t.Size = UDim2.new(1,0,0,30)
    t.Position = UDim2.new(0,0,0,y)
    t.PlaceholderText = tostring(placeholder)
    t.Text = ""
    t.TextColor3 = Color3.fromRGB(245,245,245)
    t.BackgroundColor3 = Color3.fromRGB(50,50,55)
    t.Font = Enum.Font.Gotham
    t.TextSize = 14
    Instance.new("UICorner", t).CornerRadius = UDim.new(0,6)
    return t
end

-- left column
makeLabel(left, "Controles",0)
local btnAim = makeBtn(left,"Assistência: OFF",26)
local btnFov = makeBtn(left,"FOV: ON",70)
local btnWall = makeBtn(left,"WallCheck: ON",114)
local btnMode = makeBtn(left,"Modo: Mais Perto",158)

-- right column
makeLabel(right,"Ajustes",0)
local boxFovSize = makeBox(right,"Tamanho FOV (px radius)",26)
local boxFovTrans = makeBox(right,"Transparência FOV (0-1)",68)
local boxSmooth = makeBox(right,"Suavidade (0.02-0.5)",110)
local boxMaxDist = makeBox(right,"Max Dist (studs)",152)
local btnPart = makeBtn(right,"Alvo: "..tostring(STATE.AimParts[STATE.AimPartIndex]),196)

-- big bottom button
local bigBtn = Instance.new("TextButton", content)
bigBtn.Size = UDim2.new(0,260,0,40)
bigBtn.Position = UDim2.new(0.5,-130,1,-48)
bigBtn.Text = STATE.AimEnabled and "Aim: DESLIGAR" or "Aim: LIGAR"
bigBtn.Font = Enum.Font.GothamBold
bigBtn.TextSize = 16
bigBtn.TextColor3 = Color3.fromRGB(245,245,245)
bigBtn.BackgroundColor3 = Color3.fromRGB(70,70,80)
Instance.new("UICorner", bigBtn).CornerRadius = UDim.new(0,10)

-- ======================
-- FOV visual
-- ======================
local fovHost = Instance.new("Frame", gui)
fovHost.Name = "FOV_Visual"
fovHost.AnchorPoint = Vector2.new(0.5,0.5)
fovHost.Position = UDim2.new(0.5,0,0.5,0)
fovHost.Size = UDim2.new(0, STATE.FOVRadius*2, 0, STATE.FOVRadius*2)
fovHost.BackgroundTransparency = 1
fovHost.Visible = STATE.FOVEnabled
local fovCircle = Instance.new("Frame", fovHost)
fovCircle.Size = UDim2.new(1,0,1,0)
fovCircle.BackgroundColor3 = Color3.fromRGB(255,255,255)
fovCircle.BackgroundTransparency = 1 - STATE.FOVTransparency
Instance.new("UICorner", fovCircle).CornerRadius = UDim.new(1,0)
local fovStrokeHost = Instance.new("Frame", fovHost)
fovStrokeHost.Size = UDim2.new(1,0,1,0)
fovStrokeHost.BackgroundTransparency = 1
local fovStroke = Instance.new("UIStroke", fovStrokeHost)
fovStroke.Thickness = 3
fovStroke.Transparency = 1 - STATE.FOVTransparency
fovStroke.Color = Color3.fromRGB(0,170,255)

-- ======================
-- UI interactions
-- ======================
local function updateFovVisual()
    local r = clamp(STATE.FOVRadius,20,800)
    fovHost.Size = UDim2.new(0,r*2,0,r*2)
    fovHost.Position = UDim2.new(0.5,0,0.5,0)
    fovStroke.Transparency = 1 - clamp(STATE.FOVTransparency,0,1)
    fovCircle.BackgroundTransparency = 1 - clamp(STATE.FOVTransparency,0,1)
    fovHost.Visible = STATE.FOVEnabled
end

-- Assign buttons
btnAim.MouseButton1Click:Connect(function()
    STATE.AimEnabled = not STATE.AimEnabled
    btnAim.Text = STATE.AimEnabled and "Assistência: ON" or "Assistência: OFF"
    bigBtn.Text = STATE.AimEnabled and "Aim: DESLIGAR" or "Aim: LIGAR"
end)
btnFov.MouseButton1Click:Connect(function()
    STATE.FOVEnabled = not STATE.FOVEnabled
    btnFov.Text = STATE.FOVEnabled and "FOV: ON" or "FOV: OFF"
    updateFovVisual()
end)
btnWall.MouseButton1Click:Connect(function()
    STATE.WallCheck = not STATE.WallCheck
    btnWall.Text = STATE.WallCheck and "WallCheck: ON" or "WallCheck: OFF"
end)
btnMode.MouseButton1Click:Connect(function()
    if STATE.Mode=="nearest" then STATE.Mode="first"; btnMode.Text="Modo: Primeiro"
    else STATE.Mode="nearest"; btnMode.Text="Modo: Mais Perto" end
end)
btnPart.MouseButton1Click:Connect(function()
    STATE.AimPartIndex = STATE.AimPartIndex + 1
    if STATE.AimPartIndex > #STATE.AimParts then STATE.AimPartIndex = 1 end
    btnPart.Text = "Alvo: "..tostring(STATE.AimParts[STATE.AimPartIndex])
end)
bigBtn.MouseButton1Click:Connect(function()
    STATE.AimEnabled = not STATE.AimEnabled
    btnAim.Text = STATE.AimEnabled and "Assistência: ON" or "Assistência: OFF"
    bigBtn.Text = STATE.AimEnabled and "Aim: DESLIGAR" or "Aim: LIGAR"
end)

boxFovSize.FocusLost:Connect(function() local n=tonumber(boxFovSize.Text) if n then STATE.FOVRadius=clamp(n,20,800); updateFovVisual() else boxFovSize.Text=tostring(STATE.FOVRadius) end end)
boxFovTrans.FocusLost:Connect(function() local n=tonumber(boxFovTrans.Text) if n then STATE.FOVTransparency=clamp(n,0,1); updateFovVisual() else boxFovTrans.Text=tostring(STATE.FOVTransparency) end end)
boxSmooth.FocusLost:Connect(function() local n=tonumber(boxSmooth.Text) if n then STATE.Smoothness=clamp(n,0.02,0.5) else boxSmooth.Text=tostring(STATE.Smoothness) end end)
boxMaxDist.FocusLost:Connect(function() local n=tonumber(boxMaxDist.Text) if n then STATE.MaxDistance=clamp(n,50,5000) else boxMaxDist.Text=tostring(STATE.MaxDistance) end end)

-- minimize / close
local minimized = false
btnMin.MouseButton1Click:Connect(function()
    minimized = not minimized
    content.Visible = not minimized
    if minimized then main.Size = UDim2.new(0,420,0,46)
    else main.Size = UDim2.new(0,420,0,340) end
end)
btnClose.MouseButton1Click:Connect(function() gui:Destroy() end)

LocalPlayer.CharacterAdded:Connect(function()
    gui.Parent = PlayerGui
    updateFovVisual()
end)

-- ======================
-- DRAG PANEL
-- ======================
do
    local dragging = false
    local dragInput, dragStart, startPos
    local function update(input)
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            clamp(startPos.X.Scale,0,1),
            startPos.X.Offset + delta.X,
            clamp(startPos.Y.Scale,0,1),
            startPos.Y.Offset + delta.Y
        )
    end
    header.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            input.Changed:Connect(function()
                if input.UserInputState==Enum.UserInputState.End then dragging=false end
            end)
        end
    end)
    header.InputChanged:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input==dragInput and dragging then update(input) end
    end)
end

-- ======================
-- MAIN LOOP: Aim + ESP
-- ======================
RunService.RenderStepped:Connect(function()
    updateFovVisual()
    -- AIM
    if STATE.AimEnabled then
        local found = findTargets()
        if #found>0 then
            local targetPlayer,targetPart = chooseTarget(found)
            if targetPlayer and targetPart then
                local camPos = Camera.CFrame.Position
                local desired = CFrame.new(camPos,targetPart.Position)
                Camera.CFrame = Camera.CFrame:Lerp(desired,STATE.Smoothness)
            end
        end
    end
    -- ESP
    if STATE.ESPEnabled then
        for _, pl in ipairs(Players:GetPlayers()) do
            if pl~=LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = pl.Character.HumanoidRootPart
                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    -- simples: coloca um ponto na tela (pode evoluir)
                    if not hrp:FindFirstChild("ESPDot") then
                        local dot = Instance.new("Frame")
                        dot.Name = "ESPDot"
                        dot.Size = UDim2.new(0,6,0,6)
                        dot.AnchorPoint = Vector2.new(0.5,0.5)
                        dot.BackgroundColor3 = Color3.fromRGB(255,0,0)
                        dot.ZIndex = 10
                        dot.Parent = gui
                    end
                    hrp.ESPDot.Position = UDim2.new(0, screenPos.X,0,screenPos.Y)
                end
            end
        end
    end
end)

print("Painel Arthur carregado — AimAssist + ESP UI pronto (móvel).")
