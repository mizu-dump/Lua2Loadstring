if game.Players.LocalPlayer.PlayerGui:FindFirstChild("CustomControlGui") then return end

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomControlGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local moveDirection = Vector3.zero
local holdingKeys = {W=false,A=false,S=false,D=false}

local autoJitterEnabled = false
local autoJitterADEnabled = false
local jitterDelay = 0.05
local buttonsVisible = true

local function styleButton(btn,color)
    btn.BackgroundColor3 = color
    btn.BackgroundTransparency = 0.1
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 20

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,12)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.new(1,1,1)
    stroke.Transparency = 0.3
    stroke.Parent = btn
end

local function createButton(name,text,pos,color)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Text = text
    b.Size = UDim2.new(0,55,0,55)
    b.Position = UDim2.new(0,pos.X,0,pos.Y)
    b.Visible = buttonsVisible
    b.Parent = screenGui
    styleButton(b,color)
    return b
end

local buttonW = createButton("ButtonW","W",Vector2.new(570,120),Color3.fromRGB(60,180,75))
local buttonA = createButton("ButtonA","A",Vector2.new(300,160),Color3.fromRGB(70,130,255))
local buttonS = createButton("ButtonS","S",Vector2.new(150,300),Color3.fromRGB(220,60,60))
local buttonD = createButton("ButtonD","D",Vector2.new(490,160),Color3.fromRGB(170,90,220))

local function resetKeys()
    for k in pairs(holdingKeys) do
        holdingKeys[k] = false
    end
end

local function reconnect()
    resetKeys()

    buttonW.MouseButton1Down:Connect(function() holdingKeys.W=true end)
    buttonW.MouseButton1Up:Connect(function() holdingKeys.W=false end)

    buttonA.MouseButton1Down:Connect(function() holdingKeys.A=true end)
    buttonA.MouseButton1Up:Connect(function() holdingKeys.A=false end)

    buttonS.MouseButton1Down:Connect(function() holdingKeys.S=true end)
    buttonS.MouseButton1Up:Connect(function() holdingKeys.S=false end)

    buttonD.MouseButton1Down:Connect(function() holdingKeys.D=true end)
    buttonD.MouseButton1Up:Connect(function() holdingKeys.D=false end)
end

local function toggleButtons()
    buttonsVisible = not buttonsVisible

    buttonW.Visible = buttonsVisible
    buttonA.Visible = buttonsVisible
    buttonS.Visible = buttonsVisible
    buttonD.Visible = buttonsVisible

    if not buttonsVisible then
        resetKeys()
        autoJitterEnabled = false
        autoJitterADEnabled = false
        humanoid:Move(Vector3.zero,true)
        game:GetService("UserInputService").ModalEnabled = false
    else
        game:GetService("UserInputService").ModalEnabled = true
        reconnect()
    end
end

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0,45,0,45)
toggleButton.Position = UDim2.new(0,20,0,20)
toggleButton.Text = "≡"
toggleButton.Parent = screenGui
styleButton(toggleButton,Color3.fromRGB(90,90,90))

local dragging=false
local dragStart,startPos

toggleButton.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true
        dragStart=i.Position
        startPos=toggleButton.Position
        i.Changed:Connect(function()
            if i.UserInputState==Enum.UserInputState.End then dragging=false end
        end)
    end
end)

toggleButton.InputChanged:Connect(function(i)
    if dragging and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then
        local d=i.Position-dragStart
        toggleButton.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
    end
end)

toggleButton.MouseButton1Click:Connect(toggleButtons)

game:GetService("RunService").RenderStepped:Connect(function()
    if buttonsVisible or autoJitterEnabled or autoJitterADEnabled then
        moveDirection=Vector3.zero
        if holdingKeys.W then moveDirection+=Vector3.new(0,0,-1) end
        if holdingKeys.S then moveDirection+=Vector3.new(0,0,1) end
        if holdingKeys.A then moveDirection+=Vector3.new(-1,0,0) end
        if holdingKeys.D then moveDirection+=Vector3.new(1,0,0) end
        humanoid:Move(moveDirection,true)
    end
end)

local UIS=game:GetService("UserInputService")

UIS.InputBegan:Connect(function(i,gp)
    if gp then return end
    if i.KeyCode==Enum.KeyCode.W then holdingKeys.W=true end
    if i.KeyCode==Enum.KeyCode.A then holdingKeys.A=true end
    if i.KeyCode==Enum.KeyCode.S then holdingKeys.S=true end
    if i.KeyCode==Enum.KeyCode.D then holdingKeys.D=true end
    if i.KeyCode==Enum.KeyCode.Four then autoJitterEnabled=not autoJitterEnabled autoJitterADEnabled=false resetKeys() end
    if i.KeyCode==Enum.KeyCode.Five then autoJitterADEnabled=not autoJitterADEnabled autoJitterEnabled=false resetKeys() end
end)

UIS.InputEnded:Connect(function(i,gp)
    if gp then return end
    if i.KeyCode==Enum.KeyCode.W then holdingKeys.W=false end
    if i.KeyCode==Enum.KeyCode.A then holdingKeys.A=false end
    if i.KeyCode==Enum.KeyCode.S then holdingKeys.S=false end
    if i.KeyCode==Enum.KeyCode.D then holdingKeys.D=false end
end)

task.spawn(function()
    while true do
        if autoJitterEnabled then
            holdingKeys.W=true holdingKeys.S=false
            task.wait(jitterDelay)
            holdingKeys.W=false holdingKeys.S=true
            task.wait(jitterDelay)
        else
            task.wait(0.1)
        end
    end
end)

task.spawn(function()
    while true do
        if autoJitterADEnabled then
            holdingKeys.A=true holdingKeys.D=false
            task.wait(jitterDelay)
            holdingKeys.A=false holdingKeys.D=true
            task.wait(jitterDelay)
        else
            task.wait(0.1)
        end
    end
end)

player.CharacterAdded:Connect(function(c)
    character=c
    humanoid=c:WaitForChild("Humanoid")
    reconnect()
    UIS.ModalEnabled=buttonsVisible
end)

reconnect()
