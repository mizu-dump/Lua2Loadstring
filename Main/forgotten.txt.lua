--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 

designed using localmaze gui creator
]=]

-- Instances: 8 | Scripts: 1 | Modules: 0 | Tags: 1
local CollectionService = game:GetService("CollectionService");
local G2L = {};

-- Players.Gabrieltestudo.PlayerGui.ScreenGui
G2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- Tags
CollectionService:AddTag(G2L["ScreenGui_1"], [[main]]);

-- Players.Gabrieltestudo.PlayerGui.ScreenGui.Frame
G2L["Frame_2"] = Instance.new("Frame", G2L["ScreenGui_1"]);
G2L["Frame_2"]["BorderSizePixel"] = 0;
G2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["Frame_2"]["Size"] = UDim2.new(0, 320, 0, 266);
G2L["Frame_2"]["Position"] = UDim2.new(0, 368, 0, 117);


-- Players.Gabrieltestudo.PlayerGui.ScreenGui.Frame.UICorner
G2L["UICorner_3"] = Instance.new("UICorner", G2L["Frame_2"]);



-- Players.Gabrieltestudo.PlayerGui.ScreenGui.Frame.TextButton
G2L["TextButton_4"] = Instance.new("TextButton", G2L["Frame_2"]);
G2L["TextButton_4"]["TextWrapped"] = true;
G2L["TextButton_4"]["BorderSizePixel"] = 0;
G2L["TextButton_4"]["TextScaled"] = true;
G2L["TextButton_4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["TextButton_4"]["Size"] = UDim2.new(0, 318, 0, 66);
G2L["TextButton_4"]["Text"] = [[Execute]];
G2L["TextButton_4"]["Position"] = UDim2.new(0, 0, 0, 188);


-- Players.Gabrieltestudo.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
G2L["LocalScript_5"] = Instance.new("LocalScript", G2L["TextButton_4"]);



-- Players.Gabrieltestudo.PlayerGui.ScreenGui.Frame.TextLabel
G2L["TextLabel_6"] = Instance.new("TextLabel", G2L["Frame_2"]);
G2L["TextLabel_6"]["BorderSizePixel"] = 0;
G2L["TextLabel_6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["TextLabel_6"]["Size"] = UDim2.new(0, 306, 0, 30);
G2L["TextLabel_6"]["Text"] = [[Forgotten Executor]];
G2L["TextLabel_6"]["Position"] = UDim2.new(0, 6, 0, 6);


-- Players.Gabrieltestudo.PlayerGui.ScreenGui.Frame.TextBox
G2L["TextBox_7"] = Instance.new("TextBox", G2L["Frame_2"]);
G2L["TextBox_7"]["CursorPosition"] = -1;
G2L["TextBox_7"]["BorderSizePixel"] = 0;
G2L["TextBox_7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["TextBox_7"]["Size"] = UDim2.new(0, 308, 0, 156);
G2L["TextBox_7"]["Position"] = UDim2.new(0, 2, 0, 36);
G2L["TextBox_7"]["Text"] = [[]];


-- Players.Gabrieltestudo.PlayerGui.ScreenGui.Frame.UIDragDetector
G2L["UIDragDetector_8"] = Instance.new("UIDragDetector", G2L["Frame_2"]);
G2L["UIDragDetector_8"]["MaxDragAngle"] = 9;
G2L["UIDragDetector_8"]["DragUDim2"] = UDim2.new(0, -74, 0, 1);


-- Players.Gabrieltestudo.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_5()
	local script = G2L["LocalScript_5"];
	-- Criando ScreenGui	
	
	local ScreenGui = Instance.new("ScreenGui")	
	
	ScreenGui.Parent = game.CoreGui	
	
	ScreenGui.Name = "StigmaUltimate"	
	
	-- =========================	
	
	-- GUI PRINCIPAL (sem senha)	
	
	-- =========================	
	
	local BorderFrame = Instance.new("Frame")	
	
	BorderFrame.Size = UDim2.new(0, 650, 0, 310)	
	
	BorderFrame.Position = UDim2.new(0.25, -5, 0.25, -5)	
	
	BorderFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)	
	
	BorderFrame.BorderSizePixel = 0	
	
	BorderFrame.Parent = ScreenGui	
	
	BorderFrame.Visible = true  -- agora jÃ¡ fica visÃ­vel sem senha	
	
	local UICornerBorder = Instance.new("UICorner")	
	
	UICornerBorder.CornerRadius = UDim.new(0,6)	
	
	UICornerBorder.Parent = BorderFrame	
	
	local UIStrokeBorder = Instance.new("UIStroke")	
	
	UIStrokeBorder.Thickness = 4	
	
	UIStrokeBorder.Color = Color3.fromRGB(0,0,0)	
	
	UIStrokeBorder.Parent = BorderFrame	
	
	local MainFrame = Instance.new("Frame")	
	
	MainFrame.Size = UDim2.new(0,640,0,300)	
	
	MainFrame.Position = UDim2.new(0,5,0,5)	
	
	MainFrame.BackgroundColor3 = Color3.fromRGB(240,240,240)	
	
	MainFrame.BorderSizePixel = 0	
	
	MainFrame.Parent = BorderFrame	
	
	local Title = Instance.new("TextLabel")	
	
	Title.Size = UDim2.new(1,0,0,25)	
	
	Title.BackgroundColor3 = Color3.fromRGB(200,200,200)	
	
	Title.Text = "project forgoten_rc7" -- tÃ­tulo alterado	
	
	Title.TextColor3 = Color3.fromRGB(0,0,0)	
	
	Title.Font = Enum.Font.SourceSansBold	
	
	Title.TextSize = 16	
	
	Title.Parent = MainFrame	
	
	-- Painel lateral de scripts (direita)	
	
	local ScriptList = Instance.new("ScrollingFrame")	
	
	ScriptList.Size = UDim2.new(0,120,1,-30)	
	
	ScriptList.Position = UDim2.new(1, -125, 0, 30) -- direita	
	
	ScriptList.BackgroundColor3 = Color3.fromRGB(220,220,220)	
	
	ScriptList.BorderSizePixel = 0	
	
	ScriptList.ScrollBarThickness = 6	
	
	ScriptList.CanvasSize = UDim2.new(0,0,0,0)	
	
	ScriptList.Parent = MainFrame	
	
	-- Lista de scripts	
	
	local scriptButtons = {	
	
	    { name = "polaria.txt",   code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Polaria-script-41955"))()]] },	
	
	    { name = "goner.txt",     code = [[loadstring(game:HttpGet("https://pastebin.com/raw/XfdV4CCN"))()]] },	
	
	    { name = "hammer.txt",    code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Lua-Hammer-Script-44008"))()]] },	
	
	    { name = "chaisaw.txt",   code = [[loadstring(game:HttpGet("https://pastebin.com/raw/WMNtRTNY"))()]] },	
	
	    { name = "suicide.txt",   code = [[loadstring(game:HttpGet("https://pastebin.com/raw/TQGaAivj"))()]] },	
	
	    { name = "robot.txt",     code = [[loadstring(game:HttpGet('https://pastefy.app/ur8n4dc6/raw'))()]] },	
	
	    -- PRIMADON ATUALIZADO	
	
	    { name = "primadon.txt",  code = [[loadstring(game:HttpGet("https://pastebin.com/raw/37iQzQp3"))()]] },	
	
	    { name = "grandsola.txt", code = [[loadstring(game:HttpGet('https://pastefy.app/Kql9VClT/raw'))()]] },	
	
	    { name = "boss.txt",      code = [[loadstring(game:HttpGet("https://pastebin.com/raw/SNCF1CTb"))()]] },	
	
	    { name = "titan.txt",     code = [[loadstring(game:HttpGet("https://pastebin.com/raw/vQnEfN7K"))()]] },	
	
	    { name = "gun.txt",       code = [[loadstring(game:HttpGet("https://gist.githubusercontent.com/zupersponge/8c39ed77f2817679294d70aff18d479d/raw/ed5e04b72c4fa77b8bf522d7275abf64ae585416/MLG%2520Gun%2520Script%2520ROBLOX"))()]] },	
	
	    { name = "atlas.txt",     code = [[loadstring(game:HttpGet("https://pastebin.com/raw/Hh1ghmb9"))()]] },	
	
	    { name = "dual.txt",      code = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/Dual%20Ultima%20RB%20Swords"))()]] },	
	
	    { name = "c4.txt",        code = [[	
	
	loadstring(game:HttpGet("https://pastefy.app/M0r9UCNQ/raw", true))()	
	
	local function soltarParedes(posicao)	
	
	    for _, parte in pairs(workspace:GetDescendants()) do	
	
	        if parte:IsA("Part") or parte:IsA("MeshPart") then	
	
	            if parte.Anchored and (parte.Position - posicao).Magnitude < 60 then	
	
	                parte.Anchored = false	
	
	            end	
	
	        end	
	
	    end	
	
	end	
	
	workspace.ChildAdded:Connect(function(child)	
	
	    if child:IsA("Explosion") then	
	
	        soltarParedes(child.Position)	
	
	    end	
	
	end)	
	
	]] },	
	
	    { name = "triden.txt",    code = [[-- CÃ³digo do triden]] },	
	
	    { name = "MCdon.txt",     code = [[loadstring(game:HttpGet(('https://raw.githubusercontent.com/HappyCow91/RobloxScripts/refs/heads/main/ClientSided/clown.lua'),true))()]] },	
	
	    { name = "xest.txt",      code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Prison-Life-Xester-18937"))()]] },	
	
	    { name = "vereu.txt",     code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Roblox-VEREUS-monster-script-3746"))()]] },	
	
	    { name = "john.txt",      code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-John-doe-script-by-g00byd0lan-working-sound-43283"))()]] },	
	
	    { name = "devuzi.txt",    code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TXT-DEV-UZI-43276"))()]] },	
	
	    { name = "grab knife.txt", code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Grab-knife-53687"))()]] },	
	
	    { name = "shedletsky.txt", code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Shedletsky-skybox-decal-spam-and-particles-39207"))()]] },	
	
	    { name = "c00lgui.txt",   code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-48261"))()]] },	
	
	    { name = "ak-47.txt", code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-EPIC-FE-AK47-5040"))()]] },	
	
	    { name = "hax gui.txt", code = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Hax-Gui-46008"))()]] },	
	
	    { name = "lighsaber.txt", code = [[loadstring(game:HttpGet("https://pastebin.com/raw/KdVq9EHW", true))()]] },	
	
	}	
	
	-- CriaÃ§Ã£o dos botÃµes	
	
	for i,btnData in ipairs(scriptButtons) do	
	
	    local btn = Instance.new("TextButton")	
	
	    btn.Size = UDim2.new(1,-10,0,25)	
	
	    btn.Position = UDim2.new(0,5,0,(i-1)*30)	
	
	    btn.Text = btnData.name	
	
	    btn.BackgroundColor3 = Color3.fromRGB(255,255,255)	
	
	    btn.TextColor3 = Color3.fromRGB(0,0,0)	
	
	    btn.Parent = ScriptList	
	
	    btn.MouseButton1Click:Connect(function()	
	
	        local success, err = pcall(function()	
	
	            local func, loadErr = loadstring(btnData.code)	
	
	            if func then	
	
	                func()	
	
	            else	
	
	                error("loadstring error: "..tostring(loadErr))	
	
	            end	
	
	        end)	
	
	        if not success then	
	
	            warn("Erro ao executar script '"..tostring(btnData.name).."': "..tostring(err))	
	
	        end	
	
	    end)	
	
	end	
	
	ScriptList.CanvasSize = UDim2.new(0,0,0,#scriptButtons*30)	
	
	-- Caixa de texto editÃ¡vel	
	
	local ScrollingFrame = Instance.new("ScrollingFrame")	
	
	ScrollingFrame.Size = UDim2.new(1,-140,1,-60)	
	
	ScrollingFrame.Position = UDim2.new(0,10,0,30)	
	
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)	
	
	ScrollingFrame.ScrollBarThickness = 8	
	
	ScrollingFrame.CanvasSize = UDim2.new(0,0,0,0)	
	
	ScrollingFrame.Parent = MainFrame	
	
	local TextBox = Instance.new("TextBox")	
	
	TextBox.Size = UDim2.new(1, -5, 0, 500)	
	
	TextBox.BackgroundTransparency = 1	
	
	TextBox.TextColor3 = Color3.fromRGB(0,0,0)	
	
	TextBox.ClearTextOnFocus = false	
	
	TextBox.MultiLine = true	
	
	TextBox.TextXAlignment = Enum.TextXAlignment.Left	
	
	TextBox.TextYAlignment = Enum.TextYAlignment.Top	
	
	TextBox.TextSize = 14	
	
	TextBox.Font = Enum.Font.Code	
	
	TextBox.Text = "-- Digite seu script aqui"	
	
	TextBox.Parent = ScrollingFrame	
	
	TextBox:GetPropertyChangedSignal("Text"):Connect(function()	
	
	    local lines = #TextBox.Text:split("\n")	
	
	    TextBox.Size = UDim2.new(1,-5,0,math.max(500, lines*18))	
	
	    ScrollingFrame.CanvasSize = UDim2.new(0,0,0,TextBox.AbsoluteSize.Y)	
	
	end)	
	
	-- FunÃ§Ãµes	
	
	local function executarScript()	
	
	    local func, err = loadstring(TextBox.Text)	
	
	    if func then func() else warn("Erro: "..err) end	
	
	end	
	
	local function limparTexto()	
	
	    TextBox.Text = ""	
	
	end	
	
	local function resetarPlayer()	
	
	    local player = game.Players.LocalPlayer	
	
	    if player and player.Character and player.Character:FindFirstChild("Humanoid") then	
	
	        player.Character.Humanoid.Health = 0	
	
	    end	
	
	end	
	
	local function executarR6()	
	
	    loadstring(game:HttpGet("https://pastebin.com/raw/9wJepMwY",true))()	
	
	end	
	
	local function executarLoad()	
	
	    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-LOGO-epic-face-Zombie-43383"))()	
	
	end	
	
	-- BotÃµes principais	
	
	local buttons = {"CLEAR","RE","EXE","R6","LOAD"}	
	
	local actions = {	
	
	    CLEAR = limparTexto,	
	
	    RE = resetarPlayer,	
	
	    EXE = executarScript,	
	
	    R6 = executarR6,	
	
	    LOAD = executarLoad	
	
	}	
	
	local x = 50	
	
	for i,name in ipairs(buttons) do	
	
	    local btn = Instance.new("TextButton")	
	
	    if name == "LOAD" then	
	
	        btn.Size = UDim2.new(0, 70, 0, 25)	
	
	    else	
	
	        btn.Size = UDim2.new(0, 80, 0, 25)	
	
	    end	
	
	    btn.Position = UDim2.new(0,x,1,-30)	
	
	    btn.Text = name	
	
	    btn.BackgroundColor3 = Color3.fromRGB(220,220,220)	
	
	    btn.TextColor3 = Color3.fromRGB(0,0,0)	
	
	    btn.Parent = MainFrame	
	
	    btn.MouseButton1Click:Connect(function()	
	
	        actions[name]()	
	
	    end)	
	
	    if name == "LOAD" then	
	
	        x = x + 75	
	
	    else	
	
	        x = x + 85	
	
	    end	
	
	end	
	
	-- Arrastar GUI	
	
	local UserInputService = game:GetService("UserInputService")	
	
	local dragging, dragInput, dragStart, startPos	
	
	local function update(input)	
	
	    local delta = input.Position - dragStart	
	
	    BorderFrame.Position = UDim2.new(	
	
	        startPos.X.Scale,	
	
	        startPos.X.Offset + delta.X,	
	
	        startPos.Y.Scale,	
	
	        startPos.Y.Offset + delta.Y	
	
	    )	
	
	end	
	
	BorderFrame.InputBegan:Connect(function(input)	
	
	    if input.UserInputType == Enum.UserInputType.MouseButton1 	
	
	    or input.UserInputType == Enum.UserInputType.Touch then	
	
	        dragging = true	
	
	        dragStart = input.Position	
	
	        startPos = BorderFrame.Position	
	
	        input.Changed:Connect(function()	
	
	            if input.UserInputState == Enum.UserInputState.End then	
	
	                dragging = false	
	
	            end	
	
	        end)	
	
	    end	
	
	end)	
	
	BorderFrame.InputChanged:Connect(function(input)	
	
	    if input.UserInputType == Enum.UserInputType.MouseMovement 	
	
	    or input.UserInputType == Enum.UserInputType.Touch then	
	
	        dragInput = input	
	
	    end	
	
	end)	
	
	UserInputService.InputChanged:Connect(function(input)	
	
	    if input == dragInput and dragging then	
	
	        update(input)	
	
	    end	
	
	end)	
end;
task.spawn(C_5);

return G2L["ScreenGui_1"], require;