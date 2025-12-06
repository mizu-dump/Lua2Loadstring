--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 

designed using localmaze gui creator
]=]

-- Instances: 22 | Scripts: 10 | Modules: 0 | Tags: 0
local LMG2L = {};

-- Players.Dzetkidd_2.PlayerGui.ScreenGui
LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame
LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Frame_2"]["BorderSizePixel"] = 2;
LMG2L["Frame_2"]["AutoLocalize"] = false;
LMG2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["Frame_2"]["Size"] = UDim2.new(0, 394, 0, 220);
LMG2L["Frame_2"]["Position"] = UDim2.new(0, 58, 0, 22);
LMG2L["Frame_2"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextLabel
LMG2L["TextLabel_3"] = Instance.new("TextLabel", LMG2L["Frame_2"]);
LMG2L["TextLabel_3"]["BorderSizePixel"] = 2;
LMG2L["TextLabel_3"]["TextSize"] = 18;
LMG2L["TextLabel_3"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextLabel_3"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextLabel_3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextLabel_3"]["Size"] = UDim2.new(0, 394, 0, 36);
LMG2L["TextLabel_3"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextLabel_3"]["Text"] = [[Dzetkidd Op Gui v8.1]];


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_4"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_4"]["BorderSizePixel"] = 2;
LMG2L["TextButton_4"]["TextSize"] = 15;
LMG2L["TextButton_4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_4"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_4"]["Size"] = UDim2.new(0, 130, 0, 32);
LMG2L["TextButton_4"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextButton_4"]["Text"] = [[Give all gears]];
LMG2L["TextButton_4"]["Position"] = UDim2.new(0, 0, 0, 38);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
LMG2L["LocalScript_5"] = Instance.new("LocalScript", LMG2L["TextButton_4"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_6"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_6"]["BorderSizePixel"] = 2;
LMG2L["TextButton_6"]["TextSize"] = 14;
LMG2L["TextButton_6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_6"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_6"]["Size"] = UDim2.new(0, 130, 0, 32);
LMG2L["TextButton_6"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextButton_6"]["Text"] = [[Set Decal]];
LMG2L["TextButton_6"]["Position"] = UDim2.new(0, 132, 0, 38);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
LMG2L["LocalScript_7"] = Instance.new("LocalScript", LMG2L["TextButton_6"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_8"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_8"]["BorderSizePixel"] = 2;
LMG2L["TextButton_8"]["TextSize"] = 14;
LMG2L["TextButton_8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_8"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_8"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_8"]["Size"] = UDim2.new(0, 130, 0, 32);
LMG2L["TextButton_8"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextButton_8"]["Text"] = [[Set skybox]];
LMG2L["TextButton_8"]["Position"] = UDim2.new(0, 264, 0, 38);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
LMG2L["LocalScript_9"] = Instance.new("LocalScript", LMG2L["TextButton_8"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_a"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_a"]["BorderSizePixel"] = 2;
LMG2L["TextButton_a"]["TextSize"] = 14;
LMG2L["TextButton_a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_a"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_a"]["Size"] = UDim2.new(0, 130, 0, 32);
LMG2L["TextButton_a"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextButton_a"]["Text"] = [[fire all]];
LMG2L["TextButton_a"]["Position"] = UDim2.new(0, 0, 0, 72);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
LMG2L["LocalScript_b"] = Instance.new("LocalScript", LMG2L["TextButton_a"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_c"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_c"]["BorderSizePixel"] = 2;
LMG2L["TextButton_c"]["TextSize"] = 14;
LMG2L["TextButton_c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_c"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_c"]["Size"] = UDim2.new(0, 130, 0, 32);
LMG2L["TextButton_c"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextButton_c"]["Text"] = [[Unanchor all]];
LMG2L["TextButton_c"]["Position"] = UDim2.new(0, 132, 0, 72);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
LMG2L["LocalScript_d"] = Instance.new("LocalScript", LMG2L["TextButton_c"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_e"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_e"]["BorderSizePixel"] = 2;
LMG2L["TextButton_e"]["TextSize"] = 14;
LMG2L["TextButton_e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_e"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_e"]["Size"] = UDim2.new(0, 130, 0, 32);
LMG2L["TextButton_e"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextButton_e"]["Text"] = [[Play sound]];
LMG2L["TextButton_e"]["Position"] = UDim2.new(0, 264, 0, 72);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
LMG2L["LocalScript_f"] = Instance.new("LocalScript", LMG2L["TextButton_e"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_10"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_10"]["BorderSizePixel"] = 2;
LMG2L["TextButton_10"]["TextSize"] = 14;
LMG2L["TextButton_10"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_10"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_10"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_10"]["Size"] = UDim2.new(0, 130, 0, 32);
LMG2L["TextButton_10"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextButton_10"]["Text"] = [[Hint]];
LMG2L["TextButton_10"]["Position"] = UDim2.new(0, 0, 0, 106);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
LMG2L["LocalScript_11"] = Instance.new("LocalScript", LMG2L["TextButton_10"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_12"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_12"]["BorderSizePixel"] = 2;
LMG2L["TextButton_12"]["TextSize"] = 14;
LMG2L["TextButton_12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_12"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_12"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_12"]["Size"] = UDim2.new(0, 130, 0, 32);
LMG2L["TextButton_12"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextButton_12"]["Text"] = [[Message]];
LMG2L["TextButton_12"]["Position"] = UDim2.new(0, 132, 0, 106);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
LMG2L["LocalScript_13"] = Instance.new("LocalScript", LMG2L["TextButton_12"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton
LMG2L["TextButton_14"] = Instance.new("TextButton", LMG2L["Frame_2"]);
LMG2L["TextButton_14"]["BorderSizePixel"] = 2;
LMG2L["TextButton_14"]["TextSize"] = 14;
LMG2L["TextButton_14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextButton_14"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextButton_14"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextButton_14"]["Size"] = UDim2.new(0, 130, 0, 32);
LMG2L["TextButton_14"]["BorderColor3"] = Color3.fromRGB(255, 151, 0);
LMG2L["TextButton_14"]["Text"] = [[Particles]];
LMG2L["TextButton_14"]["Position"] = UDim2.new(0, 264, 0, 106);


-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
LMG2L["LocalScript_15"] = Instance.new("LocalScript", LMG2L["TextButton_14"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.LocalScript
LMG2L["LocalScript_16"] = Instance.new("LocalScript", LMG2L["Frame_2"]);



-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_5()
	local script = LMG2L["LocalScript_5"];
	-- LocalScript داخل الزر	
	local button = script.Parent	
	local player = game.Players.LocalPlayer	
	local backpack = player:WaitForChild("Backpack")	
	local workspace = game:GetService("Workspace")	
	
	button.MouseButton1Click:Connect(function()	
	    -- البحث داخل Workspace فقط عن الأدوات	
	    for _, obj in pairs(workspace:GetChildren()) do	
	        if obj:IsA("Tool") then	
	            local clone = obj:Clone()	
	            clone.Parent = backpack	
	        end	
	    end	
	end)	
end;
task.spawn(C_5);
-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_7()
	local script = LMG2L["LocalScript_7"];
	-- LocalScript داخل الزر	
	local button = script.Parent	
	local workspace = game:GetService("Workspace")	
	
	local decalId = "158118263" -- ID الـ Decal	
	local faces = {	
	    Enum.NormalId.Top,	
	    Enum.NormalId.Bottom,	
	    Enum.NormalId.Front,	
	    Enum.NormalId.Back,	
	    Enum.NormalId.Left,	
	    Enum.NormalId.Right	
	}	
	
	button.MouseButton1Click:Connect(function()	
	    for _, obj in pairs(workspace:GetDescendants()) do	
	        if obj:IsA("BasePart") then	
	            for _, face in pairs(faces) do	
	                local existing = obj:FindFirstChild(face.Name.."DecalSurface")	
	                if not existing then	
	                    -- إنشاء SurfaceGui لكل وجه	
	                    local surfaceGui = Instance.new("SurfaceGui")	
	                    surfaceGui.Name = face.Name.."DecalSurface"	
	                    surfaceGui.Face = face	
	                    surfaceGui.Adornee = obj	
	                    surfaceGui.AlwaysOnTop = true	
	                    surfaceGui.Parent = obj	
	
	                    -- إضافة إطار خلفية سوداء	
	                    local frame = Instance.new("Frame")	
	                    frame.Size = UDim2.new(1,0,1,0)	
	                    frame.BackgroundColor3 = Color3.fromRGB(0,0,0)	
	                    frame.BorderSizePixel = 0	
	                    frame.Parent = surfaceGui	
	
	                    -- إضافة صورة الـ Decal فوق الخلفية السوداء	
	                    local decal = Instance.new("ImageLabel")	
	                    decal.Size = UDim2.new(1,0,1,0)	
	                    decal.BackgroundTransparency = 1	
	                    decal.Image = "rbxassetid://"..decalId	
	                    decal.Parent = frame	
	                end	
	            end	
	        end	
	    end	
	end)	
end;
task.spawn(C_7);
-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_9()
	local script = LMG2L["LocalScript_9"];
	-- LocalScript داخل الزر	
	local button = script.Parent	
	local Lighting = game:GetService("Lighting")	
	
	button.MouseButton1Click:Connect(function()	
	    -- ابحث عن Sky موجود، أو أنشئ واحد جديد	
	    local sky = Lighting:FindFirstChildOfClass("Sky")	
	    if not sky then	
	        sky = Instance.new("Sky")	
	        sky.Parent = Lighting	
	    end	
	
	    -- ضع نفس الـ ID على كل وجه	
	    local decalId = "158118263"	
	    sky.SkyboxBk = "rbxassetid://"..decalId	
	    sky.SkyboxDn = "rbxassetid://"..decalId	
	    sky.SkyboxFt = "rbxassetid://"..decalId	
	    sky.SkyboxLf = "rbxassetid://"..decalId	
	    sky.SkyboxRt = "rbxassetid://"..decalId	
	    sky.SkyboxUp = "rbxassetid://"..decalId	
	end)	
end;
task.spawn(C_9);
-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_b()
	local script = LMG2L["LocalScript_b"];
	-- LocalScript داخل الزر	
	local button = script.Parent	
	local Players = game:GetService("Players")	
	local Workspace = game:GetService("Workspace")	
	
	button.MouseButton1Click:Connect(function()	
	    -- تابع يضيف Fire لأي BasePart	
	    local function addFireToPart(part)	
	        if part:IsA("BasePart") and not part:FindFirstChildOfClass("Fire") then	
	            local fire = Instance.new("Fire")	
	            fire.Size = 20      -- حجم النار	
	            fire.Heat = 100     -- حرارة النار	
	            fire.Parent = part	
	        end	
	    end	
	
	    -- أضف Fire لكل BasePart في Workspace	
	    for _, obj in pairs(Workspace:GetDescendants()) do	
	        addFireToPart(obj)	
	    end	
	
	    -- أضف Fire لكل BasePart في أجساد اللاعبين	
	    for _, player in pairs(Players:GetPlayers()) do	
	        if player.Character then	
	            for _, part in pairs(player.Character:GetDescendants()) do	
	                addFireToPart(part)	
	            end	
	        end	
	    end	
	end)	
end;
task.spawn(C_b);
-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_d()
	local script = LMG2L["LocalScript_d"];
	-- LocalScript داخل الزر	
	local button = script.Parent	
	local Players = game:GetService("Players")	
	local Workspace = game:GetService("Workspace")	
	
	button.MouseButton1Click:Connect(function()	
	    -- تابع يفك Anchor لأي BasePart	
	    local function unanchorPart(part)	
	        if part:IsA("BasePart") then	
	            part.Anchored = false	
	        end	
	    end	
	
	    -- فك Anchor لكل BasePart في Workspace	
	    for _, obj in pairs(Workspace:GetDescendants()) do	
	        unanchorPart(obj)	
	    end	
	
	    -- فك Anchor لكل BasePart في أجساد اللاعبين	
	    for _, player in pairs(Players:GetPlayers()) do	
	        if player.Character then	
	            for _, part in pairs(player.Character:GetDescendants()) do	
	                unanchorPart(part)	
	            end	
	        end	
	    end	
	end)	
end;
task.spawn(C_d);
-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_f()
	local script = LMG2L["LocalScript_f"];
	-- LocalScript داخل الزر	
	local button = script.Parent	
	local SoundId = "rbxassetid://1839246711"	
	
	button.MouseButton1Click:Connect(function()	
	    local sound = Instance.new("Sound")	
	    sound.SoundId = SoundId	
	    sound.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")  -- نضع الصوت في PlayerGui لتشغيله محليًا	
	    sound:Play()	
	
	    -- اختياري: إزالة الصوت بعد انتهاء التشغيل	
	    sound.Ended:Connect(function()	
	        sound:Destroy()	
	    end)	
	end)	
end;
task.spawn(C_f);
-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_11()
	local script = LMG2L["LocalScript_11"];
	-- LocalScript داخل الزر	
	local button = script.Parent	
	local Players = game:GetService("Players")	
	local player = Players.LocalPlayer	
	
	-- متغير لتخزين الـ Hint	
	local hint	
	
	button.MouseButton1Click:Connect(function()	
	    if hint and hint.Parent then	
	        -- لو الـ Hint موجود، نخفيه	
	        hint:Destroy()	
	        hint = nil	
	    else	
	        -- إنشاء الـ Hint جديد	
	        hint = Instance.new("Hint")	
	        hint.Text = "Dzetkidd Hacked this game!"	
	        hint.Parent = workspace  -- يظهر لكل اللاعبين	
	    end	
	end)	
end;
task.spawn(C_11);
-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_13()
	local script = LMG2L["LocalScript_13"];
	-- LocalScript داخل الزر	
	local button = script.Parent	
	local Players = game:GetService("Players")	
	local player = Players.LocalPlayer	
	
	-- متغير لتخزين الـ Message	
	local msg	
	
	button.MouseButton1Click:Connect(function()	
	    if msg and msg.Parent then	
	        -- لو الرسالة موجودة، نخفيها	
	        msg:Destroy()	
	        msg = nil	
	    else	
	        -- إنشاء الـ Message جديد	
	        msg = Instance.new("Message")	
	        msg.Text = "Dzetkidd Was here"	
	        msg.Parent = workspace  -- يظهر لكل اللاعبين	
	    end	
	end)	
end;
task.spawn(C_13);
-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.TextButton.LocalScript
local function C_15()
	local script = LMG2L["LocalScript_15"];
	-- LocalScript داخل الزر	
	local button = script.Parent	
	local workspace = game:GetService("Workspace")	
	
	button.MouseButton1Click:Connect(function()	
	    for _, obj in pairs(workspace:GetDescendants()) do	
	        if obj:IsA("BasePart") then	
	            -- إنشاء ParticleEmitter	
	            local particle = Instance.new("ParticleEmitter")	
	            particle.Texture = "rbxassetid://158118263" -- ID الصورة	
	            particle.Rate = 50	
	            particle.Lifetime = NumberRange.new(5)	
	            particle.Speed = NumberRange.new(0,1) -- ثابت	
	            particle.Size = NumberSequence.new(1)	
	            particle.Parent = obj	
	        end	
	    end	
	end)	
end;
task.spawn(C_15);
-- Players.Dzetkidd_2.PlayerGui.ScreenGui.Frame.LocalScript
local function C_16()
	local script = LMG2L["LocalScript_16"];
	-- LocalScript داخل الـ Frame	
	local frame = script.Parent	
	local UserInputService = game:GetService("UserInputService")	
	
	local dragging = false	
	local dragStart	
	local startPos	
	
	local function update(input)	
	    local delta = input.Position - dragStart	
	    frame.Position = UDim2.new(	
	        startPos.X.Scale,	
	        startPos.X.Offset + delta.X,	
	        startPos.Y.Scale,	
	        startPos.Y.Offset + delta.Y	
	    )	
	end	
	
	-- بداية السحب	
	frame.InputBegan:Connect(function(input)	
	    if input.UserInputType == Enum.UserInputType.Touch then	
	        dragging = true	
	        dragStart = input.Position	
	        startPos = frame.Position	
	
	        input.Changed:Connect(function()	
	            if input.UserInputState == Enum.UserInputState.End then	
	                dragging = false	
	            end	
	        end)	
	    end	
	end)	
	
	-- تحديث موقع الـ Frame أثناء السحب	
	frame.InputChanged:Connect(function(input)	
	    if input.UserInputType == Enum.UserInputType.Touch and dragging then	
	        update(input)	
	    end	
	end)	
	
	UserInputService.InputChanged:Connect(function(input)	
	    if input.UserInputType == Enum.UserInputType.Touch and dragging then	
	        update(input)	
	    end	
	end)	
end;
task.spawn(C_16);

return LMG2L["ScreenGui_1"], require;