--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- terrain editor 
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
repeat task.wait() until player:FindFirstChild("PlayerGui")

local GUI_WIDTH = 280
local GUI_HEIGHT = 360

local gui = Instance.new("ScreenGui")
gui.Name = "TerrainEditorPro"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local frame = Instance.new("Frame")
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Position = UDim2.new(0.5,0,0.5,0)
frame.Size = UDim2.new(0,GUI_WIDTH,0,GUI_HEIGHT)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,16)
frame.Parent = gui

local title = Instance.new("TextLabel", frame)
title.Text = "🌍 Terrain Editor Pro v7.9"
title.Size = UDim2.new(1,0,0,32)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundColor3 = Color3.fromRGB(50,50,50)
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
Instance.new("UICorner", title).CornerRadius = UDim.new(0,12)

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Position = UDim2.new(0,10,0,36)
scroll.Size = UDim2.new(1,-20,1,-46)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 6
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,6)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local function makeButton(parent,text,color,callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1,0,0,28)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = color
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)
    btn.ZIndex = 3
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local mode = "Add"
local dragMode = false
local brushSize = 10
local undoStack = {}
local brushShapes = {"Cube","Sphere","Cylinder","FlatCube","FlatSphere"}
local currentShapeIndex = 1
local brushShape = brushShapes[currentShapeIndex]
local infJump = false
local dragging = false
local currentMaterial = "Grass"
local ropeGuiOpen = false

local modeBtn = makeButton(scroll,"🧱 Mode: Add",Color3.fromRGB(0,130,255),function()
    if mode=="Add" then
        mode="Remove"
        modeBtn.Text="🧱 Mode: Remove"
    else
        mode="Add"
        modeBtn.Text="🧱 Mode: Add"
    end
end)

local dragBtn = makeButton(scroll,"✋ Drag Mode: Off",Color3.fromRGB(100,100,100),function()
    dragMode = not dragMode
    dragBtn.Text = dragMode and "✋ Drag Mode: On" or "✋ Drag Mode: Off"
end)

local brushBtn = makeButton(scroll,"Change Brush Size ("..brushSize..")",Color3.fromRGB(70,70,70),function()
    brushSize += 5
    if brushSize>50 then brushSize=5 end
    brushBtn.Text="Change Brush Size ("..brushSize..")"
end)

local brushShapeBtn = makeButton(scroll,"🔹 Brush: "..brushShape,Color3.fromRGB(80,80,80),function()
    currentShapeIndex +=1
    if currentShapeIndex>#brushShapes then currentShapeIndex=1 end
    brushShape = brushShapes[currentShapeIndex]
    brushShapeBtn.Text="🔹 Brush: "..brushShape
end)

local infJumpBtn = makeButton(scroll,"♾️ Inf Jump: Off",Color3.fromRGB(150,50,200),function()
    infJump = not infJump
    infJumpBtn.Text = infJump and "♾️ Inf Jump: On" or "♾️ Inf Jump: Off"
end)

makeButton(scroll,"↩️ Undo",Color3.fromRGB(200,100,0),function()
    local last = table.remove(undoStack)
    if last and last[1] then
        local region = last[1]
        workspace.Terrain:FillBlock(region.CFrame, region.Size, Enum.Material.Air)
    end
end)

makeButton(scroll,"♻️ Reset",Color3.fromRGB(100,100,250),function()
    local confirmGui = Instance.new("Frame", gui)
    confirmGui.Size = UDim2.new(0,220,0,120)
    confirmGui.Position = UDim2.new(0.5,-110,0.5,-60)
    confirmGui.BackgroundColor3 = Color3.fromRGB(50,50,50)
    confirmGui.Active = true
    confirmGui.Draggable = true
    Instance.new("UICorner", confirmGui).CornerRadius = UDim.new(0,12)

    local msg = Instance.new("TextLabel", confirmGui)
    msg.Size = UDim2.new(1,-20,0,50)
    msg.Position = UDim2.new(0,10,0,10)
    msg.Text = "Are you sure you want to clear all terrain?"
    msg.TextColor3 = Color3.new(1,1,1)
    msg.TextWrapped = true
    msg.Font = Enum.Font.GothamBold
    msg.TextSize = 14
    msg.BackgroundTransparency = 1

    local yesBtn = makeButton(confirmGui,"✅ Yes",Color3.fromRGB(0,200,100),function()
        workspace.Terrain:Clear()
        undoStack = {}
        confirmGui:Destroy()
    end)
    yesBtn.Size = UDim2.new(0.45,0,0,28)
    yesBtn.Position = UDim2.new(0,10,1,-38)

    local noBtn = makeButton(confirmGui,"❌ No",Color3.fromRGB(200,50,50),function()
        confirmGui:Destroy()
    end)
    noBtn.Size = UDim2.new(0.45,0,0,28)
    noBtn.Position = UDim2.new(1,-10-yesBtn.Size.X.Offset,1,-38)
end)

local materials = {"Grass","Sand","Rock","Mud","Asphalt","Slate","Snow","Brick",
"Basalt","Cobblestone","CrackedLava","Glacier","Ground","LeafyGrass",
"Limestone","Pavement","Plastic","Salt","Sandstone","Water",
"Ice","Metal","Marble","Granite","Fabric","Foil","Glass"}

local matFrame = Instance.new("Frame", scroll)
matFrame.Size = UDim2.new(1,0,0,90)
matFrame.BackgroundTransparency = 1

local matScroll = Instance.new("ScrollingFrame", matFrame)
matScroll.Size = UDim2.new(1,-16,1,0)
matScroll.Position = UDim2.new(0,0,0,0)
matScroll.BackgroundTransparency = 1
matScroll.ScrollBarThickness = 6
matScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
matScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

local matGrid = Instance.new("UIGridLayout", matScroll)
matGrid.CellSize = UDim2.new(0,80,0,24)
matGrid.CellPadding = UDim2.new(0,4,0,4)
matGrid.SortOrder = Enum.SortOrder.LayoutOrder

for _,mat in ipairs(materials) do
    local b = Instance.new("TextButton", matScroll)
    b.Text = mat
    b.Font = Enum.Font.Gotham
    b.TextSize = 12
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(60,60,60)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
    b.ZIndex = 3
    b.MouseButton1Click:Connect(function()
        currentMaterial = mat
        for _,child in ipairs(matScroll:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(60,60,60)
            end
        end
        b.BackgroundColor3 = Color3.fromRGB(100,150,100)
    end)
end

local addRopeBtn = makeButton(scroll,"➰ Add Rope",Color3.fromRGB(200,150,50),function()
    if ropeGuiOpen then return end
    ropeGuiOpen = true
    local inputGui = Instance.new("Frame", gui)
    inputGui.Size = UDim2.new(0,260,0,160)
    inputGui.Position = UDim2.new(0.5,-130,0.5,-80)
    inputGui.BackgroundColor3 = Color3.fromRGB(45,45,45)
    inputGui.Active = true
    inputGui.Draggable = true
    Instance.new("UICorner", inputGui).CornerRadius = UDim.new(0,12)

    local closeBtn = Instance.new("TextButton", inputGui)
    closeBtn.Size = UDim2.new(0,20,0,20)
    closeBtn.Position = UDim2.new(1,-24,0,4)
    closeBtn.Text = "✖"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.BackgroundColor3 = Color3.fromRGB(180,50,50)
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,6)
    closeBtn.MouseButton1Click:Connect(function()
        inputGui:Destroy()
        ropeGuiOpen = false
    end)

    local b1 = Instance.new("TextBox", inputGui)
    b1.Size = UDim2.new(0,240,0,32)
    b1.Position = UDim2.new(0,10,0,10)
    b1.PlaceholderText = "First Block (Terrain Name)"
    b1.TextColor3 = Color3.new(1,1,1)
    b1.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Instance.new("UICorner", b1).CornerRadius = UDim.new(0,6)

    local b2 = Instance.new("TextBox", inputGui)
    b2.Size = UDim2.new(0,240,0,32)
    b2.Position = UDim2.new(0,10,0,54)
    b2.PlaceholderText = "Second Block (Terrain Name)"
    b2.TextColor3 = Color3.new(1,1,1)
    b2.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Instance.new("UICorner", b2).CornerRadius = UDim.new(0,6)

    local confirm = makeButton(inputGui,"✅ Create Rope",Color3.fromRGB(0,200,100),function()
        local p1 = workspace:FindFirstChild(b1.Text)
        local p2 = workspace:FindFirstChild(b2.Text)
        if p1 and p2 then
            local attach1 = Instance.new("Attachment",p1)
            attach1.Position = Vector3.new(0,p1.Size.Y/2,0)
            local attach2 = Instance.new("Attachment",p2)
            attach2.Position = Vector3.new(0,p2.Size.Y/2,0)
            local rope = Instance.new("RopeConstraint")
            rope.Attachment0 = attach1
            rope.Attachment1 = attach2
            rope.Visible = true
            rope.Thickness = 0.2
            rope.Parent = workspace
            inputGui:Destroy()
            ropeGuiOpen = false
        else
            warn("Block not found!")
        end
    end)
    confirm.Position = UDim2.new(0,10,0,100)
end)

UIS.JumpRequest:Connect(function()
    if infJump then
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local function paintTerrain()
    local mouseHit = mouse.Hit
    if not mouseHit then return end

    local rayOrigin = mouseHit.Position + Vector3.new(0,50,0)
    local rayDirection = Vector3.new(0,-1000,0)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {}

    local rayResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
    if not rayResult then return end
    local hitPos = rayResult.Position

    local size
    if brushShape=="Cube" then size = Vector3.new(brushSize,brushSize,brushSize)
    elseif brushShape=="Sphere" then size = Vector3.new(brushSize,brushSize,brushSize)
    elseif brushShape=="FlatSphere" then size = Vector3.new(brushSize,brushSize/4,brushSize)
    elseif brushShape=="FlatCube" then size = Vector3.new(brushSize,2,brushSize)
    elseif brushShape=="Cylinder" then size = Vector3.new(brushSize,brushSize,brushSize)
    end

    local matEnum = Enum.Material[currentMaterial] or Enum.Material.Grass
    if mode=="Add" then
        if brushShape=="Cube" or brushShape=="FlatCube" then
            workspace.Terrain:FillBlock(CFrame.new(hitPos + Vector3.new(0,size.Y/2,0)), size, matEnum)
            table.insert(undoStack,{CFrame.new(hitPos + Vector3.new(0,size.Y/2,0)), size})
        elseif brushShape=="Sphere" or brushShape=="FlatSphere" then
            workspace.Terrain:FillBall(hitPos + Vector3.new(0,size.Y/2,0), size.X/2, matEnum)
            table.insert(undoStack,{CFrame.new(hitPos + Vector3.new(0,size.Y/2,0)), size})
        elseif brushShape=="Cylinder" then
            workspace.Terrain:FillCylinder(CFrame.new(hitPos + Vector3.new(0,size.Y/2,0)), size, matEnum)
            table.insert(undoStack,{CFrame.new(hitPos + Vector3.new(0,size.Y/2,0)), size})
        end
    elseif mode=="Remove" then
        workspace.Terrain:FillBlock(CFrame.new(hitPos + Vector3.new(0,size.Y/2,0)), size, Enum.Material.Air)
        table.insert(undoStack,{CFrame.new(hitPos + Vector3.new(0,size.Y/2,0)), size})
    end
end

mouse.Button1Down:Connect(function()
    if not dragMode then paintTerrain() end
end)

UIS.InputBegan:Connect(function(input)
    if (input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch) and dragMode then
        dragging = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        dragging = false
    end
end)

RunService.RenderStepped:Connect(function()
    if dragMode and dragging then
        paintTerrain()
    end
end)