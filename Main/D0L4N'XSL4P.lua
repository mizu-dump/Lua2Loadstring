-- Instances: 14 | Scripts: 1 | Modules: 0 | Tags: 0
local LMG2L = {};

-- Players.LocalPlayer.PlayerGui.ScreenGui
LMG2L["ScreenGui_1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LMG2L["ScreenGui_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
LMG2L["ScreenGui_1"].ResetOnSpawn = false 

-- Frame utama
LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"]);
LMG2L["Frame_2"]["BorderSizePixel"] = 0;
LMG2L["Frame_2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["Frame_2"]["Size"] = UDim2.new(0, 200, 0, 136);
LMG2L["Frame_2"]["Position"] = UDim2.new(0, 282, 0, 38);

Instance.new("UICorner", LMG2L["Frame_2"]);
local stroke = Instance.new("UIStroke", LMG2L["Frame_2"]);
stroke.Thickness = 2;

-- TextBox
LMG2L["TextBox_5"] = Instance.new("TextBox", LMG2L["Frame_2"]);
LMG2L["TextBox_5"]["BorderSizePixel"] = 0;
LMG2L["TextBox_5"]["TextWrapped"] = true;
LMG2L["TextBox_5"]["ShowNativeInput"] = false;
LMG2L["TextBox_5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LMG2L["TextBox_5"]["TextScaled"] = true;
LMG2L["TextBox_5"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
LMG2L["TextBox_5"]["FontFace"] = Font.new("rbxasset://fonts/families/AccanthisADFStd.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LMG2L["TextBox_5"]["PlaceholderText"] = "By D0l4N";
LMG2L["TextBox_5"]["Size"] = UDim2.new(0, 184, 0, 44);
LMG2L["TextBox_5"]["Position"] = UDim2.new(0, 6, 0, 44);
LMG2L["TextBox_5"]["Text"] = "EnT3R P0W3R SL4P";

-- Fungsi buat tombol
local function newButton(parent, name, posX, posY, sizeX, sizeY)
	local btn = Instance.new("TextButton", parent)
	btn.BorderSizePixel = 0
	btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	btn.Size = UDim2.new(0, sizeX, 0, sizeY)
	btn.Position = UDim2.new(0, posX, 0, posY)
	btn.Text = name
	local stroke = Instance.new("UIStroke", btn)
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	return btn
end

-- Tombol-tombol
LMG2L["TextButton_6"] = newButton(LMG2L["Frame_2"], "Minimize", 112, 2, 80, 22)
LMG2L["TextButton_8"] = newButton(LMG2L["Frame_2"], "Update Power", 6, 94, 96, 38)
LMG2L["TextButton_a"] = newButton(LMG2L["Frame_2"], "Reset Power", 108, 94, 90, 38)
LMG2L["TextButton_b"] = newButton(LMG2L["Frame_2"], "Anti Slap", 6, 2, 100, 22)

-- LocalScript
LMG2L["LocalScript_c"] = Instance.new("LocalScript", LMG2L["Frame_2"]);
Instance.new("UIDragDetector", LMG2L["Frame_2"]);

local function C_c()
	local script = LMG2L["LocalScript_c"];
	local StarterGui = game:GetService("StarterGui")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local frame = script.Parent
	local textbox = frame:FindFirstChildOfClass("TextBox")

	StarterGui:SetCore("SendNotification", {
		Title = "Friend Request";
		Text = "D0L4N send friend request";
		Icon = "rbxassetid://130835138658335";
		Duration = 5;
		Button1 = "Yeah!";
		Button2 = "Yeah!";
	})

	-- Fungsi power
	local function setPower(value)
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local tool = char:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		if tool and tool:FindFirstChild("Power") then
			local newPower = tonumber(value) or 20
			tool.Power.Value = newPower
			StarterGui:SetCore("SendNotification", {
				Title = "Power Updated!";
				Text = "Power (" .. newPower .. ")";
				Icon = "rbxassetid://7734068321";
				Duration = 4;
			})
		end
	end

	local function resetPower()
		local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local tool = char:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		if tool and tool:FindFirstChild("Power") then
			tool.Power.Value = 20
			StarterGui:SetCore("SendNotification", {
				Title = "Power Reset!";
				Text = "Reset to 20!";
				Icon = "rbxassetid://7734068321";
				Duration = 4;
			})
		end
	end

	-- === ANTI SLAP SCRIPT ===
	local ENABLED = false
	local function is_slapy_body(obj)
		if obj:IsA("BodyAngularVelocity") then return true end
		if obj:IsA("BodyVelocity") and obj.Velocity ~= Vector3.new(0,0,0) then return true end
		if obj:IsA("BodyGyro") then return true end
		return false
	end

	local function sanitize_descendant(desc, char)
		if not ENABLED then return end
		if is_slapy_body(desc) then
			local parent = desc.Parent
			if parent and (parent:IsA("BasePart") or parent:IsA("Accessory") or parent:IsA("Model")) then
				pcall(function() desc:Destroy() end)
				if char and char:FindFirstChild("Humanoid") then
					pcall(function()
						char.Humanoid.Sit = false
						char.Humanoid.PlatformStand = false
					end)
				end
			end
			return
		end
		if desc:IsA("BasePart") then
			desc.ChildAdded:Connect(function(child)
				if ENABLED then sanitize_descendant(child, char) end
			end)
		end
	end

	local function protect_character(char)
		if not char then return end
		for _, d in pairs(char:GetDescendants()) do
			sanitize_descendant(d, char)
		end
		char.DescendantAdded:Connect(function(d)
			if ENABLED then sanitize_descendant(d, char) end
		end)
	end

	if LocalPlayer.Character then protect_character(LocalPlayer.Character) end
	LocalPlayer.CharacterAdded:Connect(function(char)
		task.wait(0.1)
		if ENABLED then protect_character(char) end
	end)

	_G.ToggleAntiSlap = function(state)
		if type(state) == "nil" then
			ENABLED = not ENABLED
		else
			ENABLED = not not state
		end
		if ENABLED and LocalPlayer.Character then protect_character(LocalPlayer.Character) end
		return ENABLED
	end

	-- === TOMBOL GUI ===
	for _, btn in pairs(frame:GetChildren()) do
		if btn:IsA("TextButton") then
			if btn.Text:lower():find("update") then
				btn.MouseButton1Click:Connect(function() setPower(textbox.Text) end)
			elseif btn.Text:lower():find("reset") then
				btn.MouseButton1Click:Connect(function() resetPower() end)
			elseif btn.Text:lower():find("minimize") then
				btn.MouseButton1Click:Connect(function() frame.Visible = not frame.Visible end)
			elseif btn.Text:lower():find("anti slap") then
				btn.MouseButton1Click:Connect(function()
					local state = _G.ToggleAntiSlap()
					btn.Text = state and "Anti Slap: ON" or "Anti Slap: OFF"
					StarterGui:SetCore("SendNotification", {
						Title = "Anti Slap";
						Text = state and "Activated!" or "Deactivated!";
						Icon = "rbxassetid://7734068321";
						Duration = 3;
					})
				end)
			end
		end
	end
end
task.spawn(C_c);

return LMG2L["ScreenGui_1"], require