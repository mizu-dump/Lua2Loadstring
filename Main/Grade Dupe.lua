-- ModuleScript: GradeGuiModule
local Module = {}

function Module.CreateGui(parent)
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "GradeDupeUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = parent
    screenGui.Enabled = false -- start hidden

    -- Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 320, 0, 140)
    frame.Position = UDim2.new(0.5, -160, 0.5, -70)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 36)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.fromRGB(45,45,45)
    title.BorderSizePixel = 0
    title.Text = "Grade Dupe Script" -- visual only
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 20
    title.Parent = frame

    -- Label
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.4, 0, 0, 26)
    label.Position = UDim2.new(0.05, 0, 0.35, -13)
    label.BackgroundTransparency = 1
    label.Text = "Enter Number"
    label.TextColor3 = Color3.fromRGB(230,230,230)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 18
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    -- TextBox
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.9, 0, 0, 34)
    textBox.Position = UDim2.new(0.05, 0, 0.45, -10)
    textBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
    textBox.Text = ""
    textBox.PlaceholderText = "0"
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 18
    textBox.ClearTextOnFocus = false
    textBox.Parent = frame

    -- Apply Button
    local applyBtn = Instance.new("TextButton")
    applyBtn.Size = UDim2.new(0.6, 0, 0, 36)
    applyBtn.Position = UDim2.new(0.2, 0, 0.8, -18)
    applyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    applyBtn.TextColor3 = Color3.fromRGB(255,255,255)
    applyBtn.Text = "Apply"
    applyBtn.Font = Enum.Font.SourceSansBold
    applyBtn.TextSize = 18
    applyBtn.Parent = frame

    -- Hint
    local hint = Instance.new("TextLabel")
    hint.Size = UDim2.new(1, 0, 0, 18)
    hint.Position = UDim2.new(0, 0, 1, -18)
    hint.BackgroundTransparency = 1
    hint.Text = "Press X to toggle"
    hint.TextColor3 = Color3.fromRGB(180,180,180)
    hint.Font = Enum.Font.SourceSansItalic
    hint.TextSize = 14
    hint.Parent = frame

    -- Return handles for usage
    return {
        ScreenGui = screenGui,
        Frame = frame,
        TextBox = textBox,
        ApplyButton = applyBtn
    }
end

return Module