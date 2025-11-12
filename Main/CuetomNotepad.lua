local Players = game:GetService("Players")
local player = Players.LocalPlayer

local fileName = "NotepadBySheScripts.txt"
if not isfile(fileName) then writefile(fileName, "") end
getgenv().NoteText = readfile(fileName)

pcall(function() player.PlayerGui.CustomNotePad:Destroy() end)

local noteGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
noteGui.Name = "CustomNotePad"
noteGui.ResetOnSpawn = false
noteGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local mainFrame = Instance.new("Frame", noteGui)
mainFrame.Name = "MainPanel"
mainFrame.Size = UDim2.new(0, 450, 0, 300)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)

-- Shadow effect
local shadow = Instance.new("UIStroke", mainFrame)
shadow.Color = Color3.fromRGB(50, 50, 50)
shadow.Thickness = 2
shadow.Transparency = 0.5

local titleBar = Instance.new("TextLabel", mainFrame)
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.Text = "Untitled - Notepad by SheScripts"
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.Font = Enum.Font.Bodoni -- atau Enum.Font.GothamBold
titleBar.TextSize = 18
titleBar.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UIPadding", titleBar).PaddingLeft = UDim.new(0, 12)
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 12)
local titleStroke = Instance.new("UIStroke", titleBar)
titleStroke.Color = Color3.fromRGB(180, 180, 180)
titleStroke.Thickness = 1

local scrollPanel = Instance.new("ScrollingFrame", mainFrame)
scrollPanel.Name = "TextScroll"
scrollPanel.Size = UDim2.new(1, -20, 1, -80)
scrollPanel.Position = UDim2.new(0, 10, 0, 45)
scrollPanel.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollPanel.ScrollBarThickness = 6
scrollPanel.BackgroundTransparency = 1
scrollPanel.BorderSizePixel = 0

local noteBox = Instance.new("TextBox", scrollPanel)
noteBox.Name = "ContentBox"
noteBox.Size = UDim2.new(1, -10, 0, 100)
noteBox.Position = UDim2.new(0, 5, 0, 0)
noteBox.Text = getgenv().NoteText
noteBox.TextXAlignment = Enum.TextXAlignment.Left
noteBox.TextYAlignment = Enum.TextYAlignment.Top
noteBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
noteBox.TextColor3 = Color3.fromRGB(255, 255, 255)
noteBox.Font = Enum.Font.Code
noteBox.TextSize = 14
noteBox.MultiLine = true
noteBox.ClearTextOnFocus = false
noteBox.TextEditable = true
noteBox.RichText = true

local LuaKeywords = {
	"and","break","do","else","elseif","end","false","for","function",
	"if","in","local","nil","not","or","repeat","return","then","true","until","while"
}

noteBox:GetPropertyChangedSignal("Text"):Connect(function()
	local text = noteBox.Text
	for _, word in pairs(LuaKeywords) do
		text = text:gsub("(%f[%w])"..word.."(%f[%W])","<font color='#00FFFF'>"..word.."</font>")
	end
	noteBox.Text = text
	getgenv().NoteText = noteBox.Text
	writefile(fileName, getgenv().NoteText)
	scrollPanel.CanvasSize = UDim2.new(0, 0, 0, noteBox.TextBounds.Y + 15)
end)

-- Clear Button
local clearButton = Instance.new("TextButton", mainFrame)
clearButton.Name = "ClearButton"
clearButton.Size = UDim2.new(1, -20, 0, 35)
clearButton.Position = UDim2.new(0, 10, 1, -40)
clearButton.Text = "🗑️ Clear Text"
clearButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
clearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clearButton.Font = Enum.Font.GothamBold
clearButton.TextSize = 16
local clearCorner = Instance.new("UICorner", clearButton)
clearCorner.CornerRadius = UDim.new(0.4, 0)
local clearStroke = Instance.new("UIStroke", clearButton)
clearStroke.Color = Color3.fromRGB(80, 80, 80)
clearStroke.Thickness = 2

clearButton.MouseButton1Click:Connect(function()
	noteBox.Text = ""
	writefile(fileName, "")
	scrollPanel.CanvasSize = UDim2.new(0, 0, 0, 0)
end)

-- Toggle Button
local toggleButton = Instance.new("TextButton", noteGui)
toggleButton.Name = "ToggleNotePad"
toggleButton.Size = UDim2.new(0, 150, 0, 40)
toggleButton.Position = UDim2.new(1, -170, 0, 80)
toggleButton.Text = "📝 Open Notepad"
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 16
local toggleCorner = Instance.new("UICorner", toggleButton)
toggleCorner.CornerRadius = UDim.new(0.4, 0)
local toggleStroke = Instance.new("UIStroke", toggleButton)
toggleStroke.Color = Color3.fromRGB(80, 80, 80)
toggleStroke.Thickness = 2

toggleButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
	toggleButton.Text = mainFrame.Visible and "❌ Close Notepad" or "📝 Open Notepad"
end)