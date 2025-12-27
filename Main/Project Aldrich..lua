local gui=Instance.new("ScreenGui")

gui.Name="Project Shen Aldrich."

gui.Parent=game:GetService("CoreGui")

local mainFrame=Instance.new("Frame")

mainFrame.Size=UDim2.new(0,520,0,340)

mainFrame.Position=UDim2.new(0.3,0,0.3,0)

mainFrame.BackgroundColor3=Color3.fromRGB(255,255,255)

mainFrame.BorderColor3=Color3.new(0,0,0)

mainFrame.Active=true

mainFrame.Draggable=true

mainFrame.Parent=gui

local titleBar=Instance.new("Frame")

titleBar.Size=UDim2.new(1,0,0,30)

titleBar.BackgroundColor3=Color3.new(0,0,0)

titleBar.Parent=mainFrame

local titleLabel=Instance.new("TextLabel")

titleLabel.Text="Project Shenn Aldrich."

titleLabel.Size=UDim2.new(1,-10,1,0)

titleLabel.Position=UDim2.new(0,5,0,0)

titleLabel.BackgroundTransparency=1

titleLabel.TextColor3=Color3.new(1,1,1)

titleLabel.TextSize=12

titleLabel.TextXAlignment=Enum.TextXAlignment.Left

titleLabel.Parent=titleBar

local buttonNames={"Executor","Setting","Script"}

local buttons={}

for i,name in ipairs(buttonNames)do

    local btn=Instance.new("TextButton")

    btn.Text=name

    btn.Size=UDim2.new(0,150,0,30)

    btn.Position=UDim2.new(0,15+((i-1)*170),0,40)

    btn.BackgroundColor3=Color3.fromRGB(120,120,120)

    btn.BorderColor3=Color3.new(0,0,0)

    btn.TextColor3=Color3.new(1,1,1)

    btn.TextSize=12

    btn.Parent=mainFrame

    buttons[name]=btn

end

local executorPage=Instance.new("Frame")

executorPage.Size=UDim2.new(1,-20,1,-90)

executorPage.Position=UDim2.new(0,10,0,75)

executorPage.BackgroundTransparency=1

executorPage.Parent=mainFrame

local scriptBox=Instance.new("TextBox")

scriptBox.Size=UDim2.new(0.75,0,1,-10)

scriptBox.Position=UDim2.new(0,0,0,5)

scriptBox.BackgroundColor3=Color3.new(1,1,1)

scriptBox.BorderColor3=Color3.new(0,0,0)

scriptBox.TextSize=12

scriptBox.TextColor3=Color3.new(0,0,0)

scriptBox.ClearTextOnFocus=false

scriptBox.MultiLine=true

scriptBox.TextWrapped=true

scriptBox.TextXAlignment=Enum.TextXAlignment.Left

scriptBox.TextYAlignment=Enum.TextYAlignment.Top

scriptBox.Text=""

scriptBox.Parent=executorPage

local paddingScript=Instance.new("UIPadding")

paddingScript.PaddingLeft=UDim.new(0,6)

paddingScript.PaddingRight=UDim.new(0,6)

paddingScript.PaddingTop=UDim.new(0,6)

paddingScript.PaddingBottom=UDim.new(0,6)

paddingScript.Parent=scriptBox

local exeButtons={"EXE","CLEAR","LOAD"}

local exeFuncs={}

for i,name in ipairs(exeButtons)do

    local b=Instance.new("TextButton")

    b.Text=name

    b.BackgroundColor3=Color3.fromRGB(120,120,120)

    b.BorderColor3=Color3.new(0,0,0)

    b.TextColor3=Color3.new(1,1,1)

    b.TextSize=14

    b.Parent=executorPage

    exeFuncs[name]=b

end

task.defer(function()

    local totalHeight=executorPage.AbsoluteSize.Y-10

    local buttonHeight=totalHeight/#exeButtons

    for i,name in ipairs(exeButtons)do

        local b=exeFuncs[name]

        b.Size=UDim2.new(0.23,0,0,buttonHeight)

        b.Position=UDim2.new(0.76,5,0,5+((i-1)*buttonHeight))

    end

end)

exeFuncs.EXE.MouseButton1Click:Connect(function()

    local code=scriptBox.Text

    if code~=""then

        local func,err=loadstring(code)

        if func then

            local ok,e=pcall(func)

            if not ok then warn(e)end

        else

            warn(err)

        end

    end

end)

exeFuncs.CLEAR.MouseButton1Click:Connect(function()

    scriptBox.Text=""

end)

exeFuncs.LOAD.MouseButton1Click:Connect(function()

    scriptBox.Text="print('We are Deadass💔')"

end)

local settingPage=Instance.new("Frame")

settingPage.Size=executorPage.Size

settingPage.Position=executorPage.Position

settingPage.BackgroundTransparency=1

settingPage.Visible=false

settingPage.Parent=mainFrame

local scriptPage=Instance.new("ScrollingFrame")

scriptPage.Size=executorPage.Size

scriptPage.Position=executorPage.Position

scriptPage.BackgroundTransparency=1

scriptPage.Visible=false

scriptPage.ScrollBarThickness=0

scriptPage.CanvasSize=UDim2.new(0,0,0,0)

scriptPage.AutomaticCanvasSize=Enum.AutomaticSize.Y

scriptPage.Parent=mainFrame

buttons.Executor.MouseButton1Click:Connect(function()

    executorPage.Visible=true

    settingPage.Visible=false

    scriptPage.Visible=false

end)

buttons.Setting.MouseButton1Click:Connect(function()

    executorPage.Visible=false

    settingPage.Visible=true

    scriptPage.Visible=false

end)

buttons.Script.MouseButton1Click:Connect(function()

    executorPage.Visible=false

    settingPage.Visible=false

    scriptPage.Visible=true

end)

local scripts={

{"Guts","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/GUTS"},

{"Devoyance","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Devoyance"},

{"All Seeing Hand","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/hand"},

{"Omni God","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Omni%20God"},

{"Sutart","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Sutart"},

{"Star Glitcher","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Spectrum%20Glitcher"},

{"Majora's Mask","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Mask"},

{"Rainbow King","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Rainbow%20Banisher"},

{"Determination","https://pastebin.com/raw/SMrFaqxL"},

{"God Slayer","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/God%20Eater"},

{"Grab Gun","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/grab"},

{"Primadon","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Primadon"},

{"Poly Goner","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Polygoner"},

{"Xester V2","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/XESTER%20V2"},

{"Blind Reaper","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/BLINDREAPER"},

{"Black Figure","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Figure"},

{"Goner","https://pastebin.com/raw/i0U0XQqK"},

{"Mr ByeBye","https://pastefy.app/z0i6VxsQ/raw"},

{"Soul Reaper","https://pastebin.com/raw/tcL2Ks37"},

{"Mr Pixels","https://pastefy.app/kXtSd8D7/raw"},

{"Sin Dragon","https://pastebin.com/raw/2cFsE7Bb"},

{"Lost Hope Scythe","https://pastebin.com/raw/VH3PgimJ"},

{"Server Admin","https://pastebin.com/raw/7ussdD59"},

{"Chara","https://pastefy.app/tM9cF893/raw"},

{"KillBot","https://pastebin.com/raw/yraarJ7m"},

{"The Sun Is A Deadly Laser","https://pastebin.com/raw/y073ged5"},

{"Internal War","https://pastebin.com/raw/u7DbahA4"},

{"Sledge Hammer","https://pastefy.app/7GOfHGXD/raw"},

{"R6","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/R6"},

{"Comedic Chaos","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Comedy"},

{"Chrono Sentinel","https://raw.githubusercontent.com/Lock1213/Scripts/refs/heads/main/Chrono%20Sentinel%20(Converted%20With%20Music)"}

}

local btnWidth,btnHeight=480,30

local padding=5

for i,data in ipairs(scripts)do

    local name,url=data[1],data[2]

    local btn=Instance.new("TextButton")

    btn.Text=name

    btn.Size=UDim2.new(0,btnWidth,0,btnHeight)

    btn.Position=UDim2.new(0,10,0,(i-1)*(btnHeight+padding))

    btn.BackgroundColor3=Color3.fromRGB(120,120,120)

    btn.BorderColor3=Color3.new(0,0,0)

    btn.TextColor3=Color3.new(1,1,1)

    btn.TextSize=14

    btn.Parent=scriptPage

    btn.MouseButton1Click:Connect(function()

        loadstring(game:HttpGet(url))()

    end)

end