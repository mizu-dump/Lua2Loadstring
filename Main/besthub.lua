local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

local GUI_WIDTH, GUI_HEIGHT = 400, 360
local TITLE_HEIGHT, NAV_HEIGHT, FOOTER_HEIGHT = 30, 30, 30
local BUTTON_HEIGHT, BUTTON_PADDING = 30, 5

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "C00lclanGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- 📢 Notificación al cargar
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "bluuclan v1",
    Text = "welcome to bluuclan v1!",
    Icon = "rbxassetid://87486058304609",
    Duration = 5
})

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, GUI_WIDTH, 0, GUI_HEIGHT)
mainFrame.Position = UDim2.new(0.5, -GUI_WIDTH/2, 0.5, -GUI_HEIGHT/2)
mainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- 🔹 Barra de título
local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, TITLE_HEIGHT)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 60)
titleBar.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -30, 1, 0)
titleLabel.Position = UDim2.new(0, 4, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "BLUUCLAN UI V1(created by bluududK4ng)"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local minBtn = Instance.new("TextButton", titleBar)
minBtn.Size = UDim2.new(0, 30, 1, 0)
minBtn.Position = UDim2.new(1, -30, 0, 0)
minBtn.Text = "_"
minBtn.Font = Enum.Font.SourceSansBold
minBtn.TextSize = 18
minBtn.TextColor3 = Color3.new(1, 1, 1)
minBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 80)
minBtn.BorderSizePixel = 0

-- 🔹 Logo
local logo = Instance.new("ImageLabel")
logo.BackgroundTransparency = 1
logo.Size = UDim2.new(1, -20, 0, 80)
logo.Position = UDim2.new(0, 10, 0, TITLE_HEIGHT + 5)
logo.Image = "rbxassetid://87486058304609"
logo.ScaleType = Enum.ScaleType.Fit
logo.Parent = mainFrame

-- 🔹 Navegación por páginas
local navBar = Instance.new("Frame", mainFrame)
navBar.Size = UDim2.new(1, 0, 0, NAV_HEIGHT)
navBar.Position = UDim2.new(0, 0, 0, TITLE_HEIGHT + 85)
navBar.BackgroundColor3 = Color3.fromRGB(0, 0, 40)
navBar.BorderSizePixel = 0

local navButtons = {}

local function createNavButton(name, xPos, callback)
    local btn = Instance.new("TextButton", navBar)
    btn.Size = UDim2.new(0, 80, 1, 0)
    btn.Position = UDim2.new(0, xPos, 0, 0)
    btn.Text = name
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(10, 10, 80)
    btn.BorderSizePixel = 0
    btn.MouseButton1Click:Connect(callback)
    navButtons[name] = btn
end

-- 🔹 Frame para botones con scroll
local buttonFrame = Instance.new("ScrollingFrame", mainFrame)
buttonFrame.Size = UDim2.new(1, -10, 0, GUI_HEIGHT - TITLE_HEIGHT - NAV_HEIGHT - FOOTER_HEIGHT - 95)
buttonFrame.Position = UDim2.new(0, 5, 0, TITLE_HEIGHT + NAV_HEIGHT + 90)
buttonFrame.BackgroundTransparency = 1
buttonFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
buttonFrame.ScrollBarThickness = 6

local UIGridLayout = Instance.new("UIGridLayout", buttonFrame)
UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
UIGridLayout.CellSize = UDim2.new(0, 120, 0, BUTTON_HEIGHT)
UIGridLayout.CellPadding = UDim2.new(0, BUTTON_PADDING, 0, BUTTON_PADDING)

-- 🔹 Scripts por categoría
local pages = {
    ["All"] = {
        {"Grab knife", "https://raw.githubusercontent.com/ret..."},
        {"JOHN DOE", "https://raw.githubusercontent.com/ret..."},
        {"C00lclan ui", "https://raw.githubusercontent.com/cfs..."},
        {"Infinity yield", "https://raw.githubusercontent.com/Edg..."},
        {"Hathub baseplant", "https://raw.githubusercontent.com/ink..."},
        {"Fly", "https://raw.githubusercontent.com/XNE..."},
        {"Sword V3 baseplant", "https://raw.githubusercontent.com/Swo..."},
        {"C00lexecutor", "https://raw.githubusercontent.com/rtl..."},
        {"Neko V4 baseplant", "https://pastebin.com/raw/au2Fxadh"},
        {"Fe animations baseplant", "https://pastebin.com/raw/vezRxWTi"},
        {"Zero Gravity v3", "https://raw.githubusercontent.com/Bac..."},
        {"FE Powers", "https://raw.githubusercontent.com/0Be..."}
    },
    ["FE"] = {
        {"Neko V4 baseplant", "https://pastebin.com/raw/au2Fxadh"},
        {"FE Powers", "https://raw.githubusercontent.com/0Be..."},
        {"Fe animations baseplant", "https://pastebin.com/raw/vezRxWTi"}
    },
    ["Baseplant"] = {
        {"Sword V3 baseplant", "https://raw.githubusercontent.com/Swo..."},
        {"Hathub baseplant", "https://raw.githubusercontent.com/ink..."},
        {"Neko V4 baseplant", "https://pastebin.com/raw/au2Fxadh"},
        {"FE Powers", "https://raw.githubusercontent.com/0Be..."},
        {"Fe animations baseplant", "https://pastebin.com/raw/vezRxWTi"}
    },
    ["Trolls"] = {
        {"Grab knife", "https://raw.githubusercontent.com/ret..."},
        {"JOHN DOE", "https://raw.githubusercontent.com/ret..."},
        {"C00lclan ui", "https://raw.githubusercontent.com/cfs..."},
        {"Infinity yield", "https://raw.githubusercontent.com/Edg..."},
        {"Zero Gravity v3", "https://raw.githubusercontent.com/Bac..."}
    }
}

-- 🔹 Función para crear botones
local function loadPage(pageName)
    buttonFrame:ClearAllChildren()
    local layout = UIGridLayout:Clone()
    layout.Parent = buttonFrame

    for name, btn in pairs(navButtons) do
        btn.BackgroundColor3 = (name == pageName) and Color3.fromRGB(40, 40, 120) or Color3.fromRGB(10, 10, 80)
    end

    for _, scriptData in ipairs(pages[pageName]) do
        local button = Instance.new("TextButton")
        button.Text = scriptData[1]
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.TextColor3 = Color3.new(1, 1, 1)
        button.BackgroundColor3 = Color3.fromRGB(10, 10, 80)
        button.BorderSizePixel = 0
        button.Parent = buttonFrame
        button.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet(scriptData[2], true))()
        end)
    end

    buttonFrame.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#pages[pageName] / 3) * (BUTTON_HEIGHT + BUTTON_PADDING))
end

-- 🔹 Crear botones de navegación
local navX = 0
for name, _ in pairs(pages) do
    createNavButton(name, navX, function()
        loadPage(name)
    end)
    navX = navX + 85
end

-- 🔹 Footer con texto y botón
local footer = Instance.new("Frame", mainFrame)
footer.Size = UDim2.new(1, 0, 0, FOOTER_HEIGHT)
footer.Position = UDim2.new(0, 0, 1, -FOOTER_HEIGHT)
footer.BackgroundTransparency = 1

local footerLabel = Instance.new("TextLabel", footer)
footerLabel.Size = UDim2.new(1, 0, 0.5, 0)
footerLabel.Position = UDim2.new(0, 0, 0, 0)
footerLabel.BackgroundTransparency = 1
footerLabel.Text = "Thanks for using bluuclan v1!"
footerLabel.Font = Enum.Font.SourceSansBold
footerLabel.TextSize = 14
footerLabel.TextColor3 = Color3.new(1, 1, 1)
footerLabel.TextStrokeTransparency = 0.8

local closeBtn = Instance.new("TextButton", footer)
closeBtn.Size = UDim2.new(1, 0, 0.5, 0)
closeBtn.Position = UDim2.new(0, 0, 0.5, 0)
closeBtn.Text = "Close"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 100)
closeBtn.BorderSizePixel = 0
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- 🔹 Dragging
local dragging, dragInput, dragStart, startPos = false
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
    end
end)

-- 🔹 Minimizar
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    local visible = not minimized
    buttonFrame.Visible = visible
    navBar.Visible = visible
    footer.Visible = visible
    logo.Visible = visible
    mainFrame.BackgroundTransparency = minimized and 1 or 0
    minBtn.Text = minimized and "◻" or "-"
end)

-- 📌 Cargar página inicial
loadPage("All")

