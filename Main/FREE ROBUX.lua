--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 

designed using localmaze gui creator
]=]

-- Instances: 9 | Scripts: 1 | Modules: 0 | Tags: 0
local LMG2L = {};

-- Players.crazygray4.PlayerGui.ScreenGui
LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- Players.crazygray4.PlayerGui.ScreenGui.Frame
LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Frame_2"]["BorderSizePixel"] = 0;
LMG2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(164, 0, 0);
LMG2L["Frame_2"]["Size"] = UDim2.new(0, 482, 0, 270);
LMG2L["Frame_2"]["Position"] = UDim2.new(0, 294, 0, 212);


-- Players.crazygray4.PlayerGui.ScreenGui.Frame.UICorner
LMG2L["UICorner_3"] = Instance.new("UICorner", LMG2L["Frame_2"]);
LMG2L["UICorner_3"]["CornerRadius"] = UDim.new(0, 13);


-- Players.crazygray4.PlayerGui.ScreenGui.Frame.LocalScript
LMG2L["LocalScript_4"] = Instance.new("LocalScript", LMG2L["Frame_2"]);



-- Players.crazygray4.PlayerGui.ScreenGui.Frame.UIStroke
LMG2L["UIStroke_5"] = Instance.new("UIStroke", LMG2L["Frame_2"]);
LMG2L["UIStroke_5"]["Thickness"] = 3;
LMG2L["UIStroke_5"]["Color"] = Color3.fromRGB(195, 0, 0);


-- Players.crazygray4.PlayerGui.ScreenGui.Frame.UIGradient
LMG2L["UIGradient_6"] = Instance.new("UIGradient", LMG2L["Frame_2"]);



-- Players.crazygray4.PlayerGui.ScreenGui.Frame.TextLabel
LMG2L["TextLabel_7"] = Instance.new("TextLabel", LMG2L["Frame_2"]);
LMG2L["TextLabel_7"]["BorderSizePixel"] = 0;
LMG2L["TextLabel_7"]["TextSize"] = 30;
LMG2L["TextLabel_7"]["BackgroundColor3"] = Color3.fromRGB(164, 0, 0);
LMG2L["TextLabel_7"]["Size"] = UDim2.new(0, 20, 0, 82);
LMG2L["TextLabel_7"]["Text"] = [[MY GUI NIGGER]];
LMG2L["TextLabel_7"]["Position"] = UDim2.new(0, 236, 0, 2);


-- Players.crazygray4.PlayerGui.ScreenGui.Frame.TextLabel.TextLabel
LMG2L["TextLabel_8"] = Instance.new("TextLabel", LMG2L["TextLabel_7"]);
LMG2L["TextLabel_8"]["BorderSizePixel"] = 0;
LMG2L["TextLabel_8"]["TextSize"] = 20;
LMG2L["TextLabel_8"]["BackgroundColor3"] = Color3.fromRGB(164, 0, 0);
LMG2L["TextLabel_8"]["Size"] = UDim2.new(0, 26, 0, 70);
LMG2L["TextLabel_8"]["Text"] = [[Change this DAMN GUI NOW IF YOU DONT KNOW HOW TO SCRIPT GET OUTTTTTT]];
LMG2L["TextLabel_8"]["Position"] = UDim2.new(0, 6, 0, 132);


-- Players.crazygray4.PlayerGui.ScreenGui.Frame.UIDragDetector
LMG2L["UIDragDetector_9"] = Instance.new("UIDragDetector", LMG2L["Frame_2"]);



-- Players.crazygray4.PlayerGui.ScreenGui.Frame.LocalScript
local function C_4()
	local script = LMG2L["LocalScript_4"];
	print('Hello World')	
end;
task.spawn(C_4);

return LMG2L["ScreenGui_1"], require;