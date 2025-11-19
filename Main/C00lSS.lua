local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local var2_upvw
if LocalPlayer_upvr.Name ~= "system_master404" then
else
	local function _(arg1, arg2) -- Line 17, Named "addCorner"
		local UICorner_4 = Instance.new("UICorner")
		UICorner_4.CornerRadius = UDim.new(0, arg2)
		UICorner_4.Parent = arg1
	end
	local function styleButton_upvr(arg1, arg2) -- Line 22, Named "styleButton"
		if not arg2 or not Color3.fromRGB(150, 0, 0) then
		end
		arg1.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
		if arg2 then
		else
		end
		arg1.BackgroundTransparency = 0.2
		arg1.BorderSizePixel = 0
		arg1.TextColor3 = Color3.fromRGB(255, 255, 255)
		arg1.Font = Enum.Font.SourceSansBold
		arg1.TextScaled = true
		local UICorner_7 = Instance.new("UICorner")
		UICorner_7.CornerRadius = UDim.new(0, 8)
		UICorner_7.Parent = arg1
		local UIStroke = Instance.new("UIStroke")
		if arg2 then
		else
		end
		UIStroke.Thickness = 1.5
		UIStroke.Color = Color3.fromRGB(255, 50, 50)
		UIStroke.Parent = arg1
	end
	var2_upvw = workspace.CurrentCamera
	local ViewportSize_2 = var2_upvw.ViewportSize
	if ViewportSize_2.X < 900 then
		var2_upvw = "Mobile"
		-- KONSTANTWARNING: GOTO [71] #49
	end
	-- KONSTANTERROR: [0] 1. Error Block 16 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [63] 43. Error Block 17 start (CF ANALYSIS FAILED)
	if ViewportSize_2.X < 1400 then
		var2_upvw = "Tablet"
	else
		var2_upvw = "PC"
	end
	local tbl_upvr = {
		PC = UDim2.new(0, 600, 0, 400);
		Tablet = UDim2.new(0, 520, 0, 340);
		Mobile = UDim2.new(0, 420, 0, 320);
	}
	local PlayerGui_upvr = LocalPlayer_upvr:WaitForChild("PlayerGui")
	local TweenService_upvr = game:GetService("TweenService")
	local UserInputService_upvr = game:GetService("UserInputService")
	local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
	local LogService_upvr = game:GetService("LogService")
	local Chat_upvr = game:GetService("Chat")
	;(function() -- Line 40, Named "createGUI"
		--[[ Upvalues[10]:
			[1]: PlayerGui_upvr (readonly)
			[2]: var2_upvw (read and write)
			[3]: TweenService_upvr (readonly)
			[4]: tbl_upvr (readonly)
			[5]: UserInputService_upvr (readonly)
			[6]: styleButton_upvr (readonly)
			[7]: ReplicatedStorage_upvr (readonly)
			[8]: LocalPlayer_upvr (readonly)
			[9]: LogService_upvr (readonly)
			[10]: Chat_upvr (readonly)
		]]
		local c00lssExecutor = PlayerGui_upvr:FindFirstChild("c00lssExecutor")
		if c00lssExecutor then
			c00lssExecutor.Enabled = true
		else
			local ScreenGui_2 = Instance.new("ScreenGui")
			ScreenGui_2.Name = "c00lssToggle"
			ScreenGui_2.Parent = PlayerGui_upvr
			local var24_upvw = false
			ScreenGui_2.ResetOnSpawn = var24_upvw
			if var2_upvw == "Mobile" then
				var24_upvw = 100
			else
				var24_upvw = 200
			end
			local ImageButton_upvr = Instance.new("ImageButton")
			ImageButton_upvr.Size = UDim2.new(0, var24_upvw, 0, var24_upvw)
			ImageButton_upvr.Position = UDim2.new(0.5, -var24_upvw / 2, 0.5, -var24_upvw / 2)
			ImageButton_upvr.BackgroundTransparency = 1
			ImageButton_upvr.Image = "rbxassetid://127013890150341"
			ImageButton_upvr.ImageTransparency = 1
			ImageButton_upvr.Parent = ScreenGui_2
			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0, var24_upvw / 2)
			UICorner.Parent = ImageButton_upvr
			local Frame_upvr_3 = Instance.new("Frame")
			Frame_upvr_3.Size = UDim2.new(0, 300, 0, 100)
			Frame_upvr_3.Position = UDim2.new(0, var24_upvw + 10, 0.5, -50)
			Frame_upvr_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame_upvr_3.BackgroundTransparency = 1
			Frame_upvr_3.BorderSizePixel = 0
			Frame_upvr_3.Visible = false
			Frame_upvr_3.Parent = ScreenGui_2
			local UIStroke_2 = Instance.new("UIStroke")
			UIStroke_2.Thickness = 2
			UIStroke_2.Color = Color3.fromRGB(0, 0, 0)
			UIStroke_2.Parent = Frame_upvr_3
			local TextLabel_2 = Instance.new("TextLabel")
			TextLabel_2.Size = UDim2.new(1, -10, 1, -10)
			TextLabel_2.Position = UDim2.new(0, 5, 0, 5)
			TextLabel_2.BackgroundTransparency = 1
			TextLabel_2.Text = "FE BYPASS!!!😱"
			TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_2.Font = Enum.Font.SourceSansBold
			TextLabel_2.TextScaled = true
			TextLabel_2.TextWrapped = true
			TextLabel_2.Parent = Frame_upvr_3
			local UICorner_5 = Instance.new("UICorner")
			UICorner_5.CornerRadius = UDim.new(0, 8)
			UICorner_5.Parent = Frame_upvr_3
			local TweenInfo_new_result1 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			local any_Create_result1_2 = TweenService_upvr:Create(ImageButton_upvr, TweenInfo_new_result1, {
				ImageTransparency = 0;
			})
			local any_Create_result1 = TweenService_upvr:Create(ImageButton_upvr, TweenInfo_new_result1, {
				Position = UDim2.new(0, 20, 1, -var24_upvw - 20);
			})
			any_Create_result1_2:Play()
			any_Create_result1_2.Completed:Wait()
			wait(1)
			any_Create_result1:Play()
			any_Create_result1.Completed:Wait()
			TweenService_upvr:Create(ImageButton_upvr, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
				Rotation = 360;
			}):Play()
			ImageButton_upvr.MouseEnter:Connect(function() -- Line 101
				--[[ Upvalues[2]:
					[1]: Frame_upvr_3 (readonly)
					[2]: TweenService_upvr (copied, readonly)
				]]
				Frame_upvr_3.Visible = true
				TweenService_upvr:Create(Frame_upvr_3, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					BackgroundTransparency = 0;
				}):Play()
			end)
			ImageButton_upvr.MouseLeave:Connect(function() -- Line 106
				--[[ Upvalues[2]:
					[1]: TweenService_upvr (copied, readonly)
					[2]: Frame_upvr_3 (readonly)
				]]
				TweenService_upvr:Create(Frame_upvr_3, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					BackgroundTransparency = 1;
				}):Play()
				Frame_upvr_3.Visible = false
			end)
			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.Name = "c00lssExecutor"
			ScreenGui.Parent = PlayerGui_upvr
			ScreenGui.ResetOnSpawn = false
			local Frame_upvr = Instance.new("Frame")
			Frame_upvr.Name = "MainFrame"
			Frame_upvr.Size = tbl_upvr[var2_upvw]
			Frame_upvr.Position = UDim2.new(0.5, -tbl_upvr[var2_upvw].X.Offset / 2, 1, tbl_upvr[var2_upvw].Y.Offset)
			Frame_upvr.BackgroundColor3 = Color3.fromRGB(90, 0, 0)
			Frame_upvr.BackgroundTransparency = 0.15
			Frame_upvr.BorderSizePixel = 0
			local UICorner_2 = Instance.new("UICorner")
			UICorner_2.CornerRadius = UDim.new(0, 10)
			UICorner_2.Parent = Frame_upvr
			Frame_upvr.Parent = ScreenGui
			TweenService_upvr:Create(Frame_upvr, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				Position = UDim2.new(0.5, -tbl_upvr[var2_upvw].X.Offset / 2, 0.5, -tbl_upvr[var2_upvw].Y.Offset / 2);
			}):Play()
			local var45_upvw = false
			local var46_upvw
			local var47_upvw
			local var48_upvw
			local function update_upvr(arg1) -- Line 131, Named "update"
				--[[ Upvalues[4]:
					[1]: var48_upvw (read and write)
					[2]: var47_upvw (read and write)
					[3]: TweenService_upvr (copied, readonly)
					[4]: Frame_upvr (readonly)
				]]
				local var49 = arg1.Position - var48_upvw
				TweenService_upvr:Create(Frame_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Position = var47_upvw + UDim2.new(0, var49.X, 0, var49.Y);
				}):Play()
			end
			Frame_upvr.InputBegan:Connect(function(arg1) -- Line 136
				--[[ Upvalues[4]:
					[1]: var45_upvw (read and write)
					[2]: var47_upvw (read and write)
					[3]: Frame_upvr (readonly)
					[4]: var48_upvw (read and write)
				]]
				if arg1.UserInputType == Enum.UserInputType.MouseButton1 or arg1.UserInputType == Enum.UserInputType.Touch then
					var45_upvw = true
					var47_upvw = Frame_upvr.Position
					var48_upvw = arg1.Position
					arg1.Changed:Connect(function() -- Line 141
						--[[ Upvalues[2]:
							[1]: arg1 (readonly)
							[2]: var45_upvw (copied, read and write)
						]]
						if arg1.UserInputState == Enum.UserInputState.End then
							var45_upvw = false
						end
					end)
				end
			end)
			Frame_upvr.InputChanged:Connect(function(arg1) -- Line 146
				--[[ Upvalues[1]:
					[1]: var46_upvw (read and write)
				]]
				if arg1.UserInputType == Enum.UserInputType.MouseMovement or arg1.UserInputType == Enum.UserInputType.Touch then
					var46_upvw = arg1
				end
			end)
			UserInputService_upvr.InputChanged:Connect(function(arg1) -- Line 151
				--[[ Upvalues[3]:
					[1]: var46_upvw (read and write)
					[2]: var45_upvw (read and write)
					[3]: update_upvr (readonly)
				]]
				if arg1 == var46_upvw and var45_upvw then
					update_upvr(arg1)
				end
			end)
			local Frame_2 = Instance.new("Frame")
			Frame_2.Size = UDim2.new(1, 0, 0, 40)
			Frame_2.BackgroundColor3 = Color3.fromRGB(110, 0, 0)
			Frame_2.BackgroundTransparency = 0.2
			Frame_2.BorderSizePixel = 0
			local UICorner_6 = Instance.new("UICorner")
			UICorner_6.CornerRadius = UDim.new(0, 10)
			UICorner_6.Parent = Frame_2
			Frame_2.Parent = Frame_upvr
			local TextLabel_3 = Instance.new("TextLabel")
			TextLabel_3.Size = UDim2.new(1, -10, 1, 0)
			TextLabel_3.Position = UDim2.new(0, 10, 0, 0)
			TextLabel_3.BackgroundTransparency = 1
			TextLabel_3.Text = "c00lss (fe bypass)"
			TextLabel_3.TextColor3 = Color3.fromRGB(255, 50, 50)
			TextLabel_3.Font = Enum.Font.GothamBold
			TextLabel_3.TextScaled = true
			TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel_3.Parent = Frame_2
			local tbl_3_upvr = {}
			local var60_upvw = "Executor"
			local Frame = Instance.new("Frame")
			Frame.Size = UDim2.new(0, 120, 1, -40)
			Frame.Position = UDim2.new(0, 0, 0, 40)
			Frame.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
			Frame.BackgroundTransparency = 0.25
			Frame.BorderSizePixel = 0
			Frame.Parent = Frame_upvr
			local UIListLayout = Instance.new("UIListLayout")
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 10)
			UIListLayout.Parent = Frame
			local Frame_upvw = Instance.new("Frame")
			Frame_upvw.Name = "ExecutorFrame"
			Frame_upvw.Size = UDim2.new(0, Frame_upvr.Size.X.Offset - 160, 0, 240)
			Frame_upvw.Position = UDim2.new(0, 140, 0, 60)
			Frame_upvw.BackgroundTransparency = 1
			Frame_upvw.Parent = Frame_upvr
			local TextBox_upvr = Instance.new("TextBox")
			TextBox_upvr.Size = UDim2.new(1, 0, 0, 180)
			TextBox_upvr.Position = UDim2.new(0, 0, 0, 0)
			TextBox_upvr.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
			TextBox_upvr.BackgroundTransparency = 0.2
			TextBox_upvr.BorderSizePixel = 0
			TextBox_upvr.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox_upvr.MultiLine = true
			TextBox_upvr.ClearTextOnFocus = false
			TextBox_upvr.TextWrapped = true
			TextBox_upvr.Font = Enum.Font.Code
			TextBox_upvr.TextSize = 16
			TextBox_upvr.PlaceholderText = "-- Enter your script here"
			TextBox_upvr.Parent = Frame_upvw
			local UICorner_3 = Instance.new("UICorner")
			UICorner_3.CornerRadius = UDim.new(0, 10)
			UICorner_3.Parent = TextBox_upvr
			local Frame_upvr_2 = Instance.new("Frame")
			Frame_upvr_2.Size = UDim2.new(1, 0, 0, 45)
			Frame_upvr_2.Position = UDim2.new(0, 0, 0, 190)
			Frame_upvr_2.BackgroundTransparency = 1
			Frame_upvr_2.Parent = Frame_upvw
			local UIListLayout_2 = Instance.new("UIListLayout")
			UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout_2.Padding = UDim.new(0, 5)
			UIListLayout_2.Parent = Frame_upvr_2
			local function createExecButton(arg1, arg2) -- Line 229
				--[[ Upvalues[2]:
					[1]: styleButton_upvr (copied, readonly)
					[2]: Frame_upvr_2 (readonly)
				]]
				local TextButton_4 = Instance.new("TextButton")
				TextButton_4.Size = UDim2.new(0, 70, 0, 30)
				TextButton_4.Text = arg1
				styleButton_upvr(TextButton_4, false)
				TextButton_4.Parent = Frame_upvr_2
				TextButton_4.MouseButton1Click:Connect(arg2)
			end
			createExecButton("Execute", function() -- Line 238
				--[[ Upvalues[2]:
					[1]: TextBox_upvr (readonly)
					[2]: ReplicatedStorage_upvr (copied, readonly)
				]]
				local Text_upvr = TextBox_upvr.Text
				local pcall_result1_2, pcall_result2 = pcall(function() -- Line 240
					--[[ Upvalues[2]:
						[1]: ReplicatedStorage_upvr (copied, readonly)
						[2]: Text_upvr (readonly)
					]]
					if ReplicatedStorage_upvr:FindFirstChild("AntiCheatEvent") then
						ReplicatedStorage_upvr.AntiCheatEvent:FireServer(Text_upvr)
					else
						error("AntiCheatEvent not found. Martian systems offline.")
					end
				end)
				if not pcall_result1_2 then
					addLog("Executor failed: "..tostring(pcall_result2), "System")
				else
					addLog("Executor script fired successfully.", "System")
				end
			end)
			createExecButton("Clear", function() -- Line 253
				--[[ Upvalues[1]:
					[1]: TextBox_upvr (readonly)
				]]
				TextBox_upvr.Text = ""
			end)
			createExecButton("Reset", function() -- Line 254
				--[[ Upvalues[1]:
					[1]: LocalPlayer_upvr (copied, readonly)
				]]
				LocalPlayer_upvr:LoadCharacter()
			end)
			local Frame_upvw_2 = Instance.new("Frame")
			Frame_upvw_2.Name = "ScriptFrame"
			Frame_upvw_2.Size = UDim2.new(0, Frame_upvr.Size.X.Offset - 160, 0, 240)
			Frame_upvw_2.Position = UDim2.new(0, 140, 0, 60)
			Frame_upvw_2.BackgroundTransparency = 1
			Frame_upvw_2.Parent = Frame_upvr
			local TextBox_upvr_2 = Instance.new("TextBox")
			TextBox_upvr_2.Size = UDim2.new(1, -10, 0, 30)
			TextBox_upvr_2.Position = UDim2.new(0, 5, 0, 5)
			TextBox_upvr_2.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
			TextBox_upvr_2.BackgroundTransparency = 0.2
			TextBox_upvr_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox_upvr_2.PlaceholderText = "Search scripts..."
			TextBox_upvr_2.Font = Enum.Font.SourceSans
			TextBox_upvr_2.TextSize = 14
			TextBox_upvr_2.Parent = Frame_upvw_2
			local UICorner_8 = Instance.new("UICorner")
			UICorner_8.CornerRadius = UDim.new(0, 8)
			UICorner_8.Parent = TextBox_upvr_2
			local ScrollingFrame_upvr = Instance.new("ScrollingFrame")
			ScrollingFrame_upvr.Size = UDim2.new(1, 0, 1, -40)
			ScrollingFrame_upvr.Position = UDim2.new(0, 0, 0, 35)
			ScrollingFrame_upvr.BackgroundTransparency = 1
			ScrollingFrame_upvr.ScrollBarThickness = 8
			ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame_upvr.Parent = Frame_upvw_2
			local UIListLayout_4_upvr = Instance.new("UIListLayout")
			UIListLayout_4_upvr.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_4_upvr.Padding = UDim.new(0, 10)
			UIListLayout_4_upvr.Parent = ScrollingFrame_upvr
			local tbl_2_upvr = {{"HappyHub Execute", "require(135231466738957):Hload(\"username\")"}, {"c00lgui", "require(14125553864):Fire(\"username\",\"c00lkidd\")"}, {"Baseball Bat V5", "require(4559977647).load(\"username\")"}, {"Grab Knife V3", "require(2829943043):Run(\"username\",\"i baked you a pie\")"}, {"Sledge Hammer", "require(8038037940).CLoad(\"username\")"}, {"Server Admin", "require(4665394711).load(\"username\")"}, {"Speedster", "require(134466299169134)(\"username\")"}, {"SCP 096", "require(5972874843).load(\"username\")"}, {"The future", "require(95368207642466).load(\"username\")"}, {"Xester v2", "require(6099241563).load(\"username\")"}, {"Infinite yeild SS", "require(7634392335)(\"username\")"}, {"Ban hammer", "require(5448035802).Hammer(\"username\",\"BanHammer\")"}, {"Goner", "require(4513235536).G(\"username\")"}, {"Gojo", "require(14499140823)(\"username\", \"sorcerer\")"}, {"Saitama", "require(14499140823)(\"username\", \"saitama2\")"}, {"Original Sensation Hub", "require(104712588684071)(\"username\")"}, {"Rc7", "require(12350030542).RC7(\"username\")"}, {"c00lkidd", "require(89709417365094).Forsaken(\"username\", \"c00lkidd\")"}, {"HD admin ranker", "require(7192763922).load(\"username\")"}, {"Secret Service Panel", "require(17073274775)(\"username\")"}, {"Secret Service Panel DEX Version", "require(16977144399)(\"username\")"}, {"Secret Service Administration", "require(16668858335).skid(\"username\",\"ssa\")"}, {"Old Secret Service Administration", "require(16668984909).load(\"username\",\"1994 days on roblox\")"}, {"Old Secret Service Panel", "require(17632411730){Owners={\"username\"},Prefix=';'}"}, {"flowers", "require(78954150273241).Flowers(\"username\")"}, {"Darth Vader", "require(4622139234).load(\"username\")"}, {"aaaa adrian's mega gui", "require(5142574517):mega(\"username\")"}, {"adrian's good gui", "require(4934614538):adrian(\"username\")"}, {"kick hammer gun", "require(2555964157).doom(\"username\")"}, {"toxic script dont use", "require(5115793531).scare()"}, {"fraud that copies users forms", "require(4952179933).Fraud(\"username\")"}, {"bete script", "require(5139373601).load(\"username\")"}, {"pink car", "require(4745872847).load(\"username\")"}, {"bruh ss", "require(3309735650).blueexss(\"username\")"}, {"content cop", "require(3722497194).load(\"username\")"}, {"kill self gun", "require(3023538289).load(\"username\")"}, {"hanger", "require(03150276424):Fire(\"username\",\"i baked you a pie\")"}, {"pokeball", "require(5010133992):Fire(\"username\")"}, {"arrest script", "require(2934684058).naenae(\"Target\")"}, {"toxic script dont use 2", "require(4124996597).swano()"}, {"trolling script", "require(4564681456).catgirl()"}, {"raining rc7", "require(4486595837)(\"username\")"}, {"part 2 raining", "require(4662289699)(\"username\")"}, {"utg project", "require(5160216694).Ass(\"username\")"}, {"utg with password is KaspersRocks", "require(4898607163).k2(\"username\")"}, {"dimond utg", "require(5001982403).undetected(\"username\")"}, {"utg part 5", "require(4937114966):SH(\"username\")"}, {"guardian", "require(5470457610).Dark(\"username\")"}, {"pink utg", "require(5455277230).Trash(\"username\")"}, {"map detroyer (dont use)", "require(5176022761)(\"username\")"}, {"purple guy", "require(5213051514).G(\"username\")"}, {"utg gods", "require(5146396793).load(\"username\")"}, {"topk3k v4", "require(4874364435)(\"username\")"}, {"bruh gun", "require(4212392954).CLoad(\"username\")"}, {"gaster v1", "require(4575499347):Fire(\"username\",\"test\")"}, {"gaster v2", "require(5350037587).noob(\"username\")"}, {"chara v4", "require(5555086775).load(\"username\")"}, {"Anonymous utg", "require(5126648745).load(\"username\")"}, {"jevil", "require(5664084960).load(\"username\")"}, {"dancing script", "require(5603327223).owner(\"username\")"}, {"illegal agent", "require(5410471602).Load(\"username\")"}, {"Cool GUI", "require(6114289913).c00lgui(\"username\")"}, {"HD Admin 2", "require(4893870373).load(\"username\")"}, {"FUN GEAR GIVERS", "require(3164199134).johndoe(\"username\", \"LOLWHY\")"}, {"BEST WEAPONS", "require(3231949823).enableWeapons(\"username\")"}, {"prison gears", "require(5324586781).po(\"username\", \"hi\")"}, {"Synapse x Hub", "require(4747135187).chakaclownisthedangbestskiddo(\"username\")"}, {"wary hub", "require(6487736536).SkiddedHub(\"username\")"}, {"wary hub v70", "require(6479375294).fuckyoukid(\"username\")"}, {"Undetectable Hub", "require(5516943300).Leak(\"username\")"}, {"legacy utg", "require(4588615641):Fire(\"username\")"}, {"n**** hub", "require(4772620524):nig(\"username\")"}, {"Christmas utg beta", "require(6551277795)(\"\")"}, {"open utg", "require(6510586391).load(\"username\")"}, {"LcUTG", "require(6590602166).LcUTG(\"username\")"}, {"FakeVr", "require(6223977609)['FakeVr'](\"username\")"}, {"Sakura hub", "require(4937114966):SH(\"username\")"}, {"ultimate trolling gui", "require(2993514878):Fire(\"username\")"}, {"05wp’s utg", "require(4497715977).Lmao(\"username\")"}, {"0 glitcher", "require(4828652003).Glitch(\"username\")"}, {"cathub", "require(4889580993).unikitty(\"username\")"}, {"gear gui", "require(5002495158).Gear(\"username\")"}, {"legendary scripts", "require(5016190425):Fire(\"username\")"}, {"ultimate trolling gui edit", "require(4701442286).brave(\"username\")"}, {"vexaton gui", "require(5025767146).vex(\"username\")"}, {"doggo admin", "require(5025744789).doggo(\"username\")"}, {"non blacklist gui", "require(4857508756).noblgui(\"username\")"}, {"Car Spawner GUI", "require(5130989214).load(\"username\")"}, {"Working Darth Vader", "require(4622139234).load(\"username\")"}, {"CSH Hub", "require(5172141993):CSH(\"username\")"}, {"utg 2", "require(3497222070).load(\"username\")"}, {"utg 3", "require(2993514878):Fire(\"username\")"}, {"stratosphere", "require(4735711585).load(\"username\")"}, {"BEAN's Custom admin GUI v2w", "require(4649145907).oCAG(\"username\")"}, {"Custom admin GUI", "require(4497715977).Lmao(\"username\")"}, {"Give guns (1st person)", "require(2823974237).giveGuns(\"username\")"}, {"S3x GUI", "require(4863172339).Enduro(\"username\")"}, {"Parkour V1", "require(4559866696).load(\"username\")"}, {"Parkour V2", "require(4560004705).load(\"username\")"}, {"Combat knife", "require(4559933678).load(\"username\")"}, {"Knife v2", "require(4560191914).load(\"username\")"}, {"Katana v3", "require(4559949030).load(\"username\")"}, {"Baseball bat V4", "require(4559963876).load(\"username\")"}, {"Baseball bat V5 2", "require(4559977647).load(\"username\")"}, {"Bow V2", "require(4560072580).load(\"username\")"}, {"Pipe", "require(4560063191).load(\"username\")"}, {"Hand combat", "require(4559973214).load(\"username\")"}, {"Sans Bone", "require(4559992486).load(\"username\")"}, {"Chainsaw", "require(4560014954).load(\"username\")"}, {"Global Ragdoll", "require(4560058879).load(\"username\")"}, {"Blocky Parkour map", "require(4560065849).load(\"username\")"}, {"Vibe Check", "require(4560126085).load(\"username\")"}, {"Hunting Rifle", "require(4062972943).Hunt(\"username\")"}, {"Revolver", "require(4063023113).Bang(\"username\")"}, {"Machine Gun", "require(4084843279).Machine(\"username\")"}, {"Rocket launcher", "require(4084862443).Rocket(\"username\")"}, {"Team Telset Gui", "require(106639179150117).Celebratory(\"username\")"}, {"Team Darius Gui", "require(127445614272366).op(\"username\")"}, {"f00plkidd v5", "require(0x3ba12f9f1).PLSPLS(\"username\")"}, {"l0ckkidd v5", "require(14921175600).zzzzzzzzzzzzz55555555555555555555(\"LordAltAccount7\")"}, {"144anz Hub", "require(0x25b56b8f7+-0x6a72c6b3d+0x812296b09):SHHH144anzHUB(\"SupremeSkidder\")"}, {"ITSNOTSKELETON V11", "require(17161655683).SkibidiToilet(\"username\")"}, {"144anz SS", "require(0x7435b09c4+0x38501a58+0x5a59*-0xa0396):opss144anz(\"username\")"}, {"Elmarz gui v3", "require(14723857690).load(\"username\")"}, {"HOP1K", "require(14741436840).gui(\"username\")"}, {"Real Snake Banisher", "require(7116428237).SBV4(\"username\")"}, {"Fumo Script Executor", "require(6324372525).fse(\"username\")"}, {"SGH 3 Gui Thingy", "require(7646868348):XD(\"username\")"}, {"c00lgui v3 Edit", "require(12796454422).lek(\"username\")"}, {"k00p Coffee Map Thing", "require(9821168174)(\"username\")"}, {"m00pkidd Gui", "require(17340805099).ez(\"Reqllifeguy45\")"}, {"Topkek Gui", "require(2609384717).load(\"username\")"}, {"Hack Script", "require(5672829911).hack(\"username\")"}, {"PilinGui Pocket", "require(17802705815).phone(\"username\")"}, {"Original PilinGui", "require(17804242139).lol(\"username\")"}, {"HD Admin Ranker and Loader", "require(7192763922).load(\"username\")"}, {"k00pgui v101", "require(16965767706):load(\"username\")"}, {"Horror Gui v1", "require(18305545828).evil(\"username\")"}, {"Space Elevator Map Gui", "require(5702244094).space(\"username\")"}, {"Robux Tools", "require(7904530401).bobux(\"GlichGamerF\")"}, {"TY Hub", "require(5919418431).hub(\"username\")"}, {"Exser New Code: c00lkidds", "require(10868847330):pls(\"username\")"}, {"Gun Giver", "require(2823974237).giveGuns(\"username\")"}, {"EARRAPE", "require(5802346180).eliza(\"username\")"}, {"Huge Lord", "require(7260532691)(\"username\")"}, {"LOLOLOLOL", "require(5802335492).eliza(\"username\")"}, {"NUKE GUI", "require(4832967293):Fire(\"username\")"}, {"TOPKEK V5", "require(5610305900)(\"username\")"}, {"TOPKEK V4", "require(4874364435)(\"username\")"}, {"NOOT NOOT", "require(5034863407).subtosyntax64(\"username\")"}, {"Something From Spongebob Server Destroyer", "require(5115793531).scare(\"username\")"}, {"CHATHAX", "require(5564800243).fehax(\"username\")"}, {"IMPOSTER CHAT", "require(5903403087).load(\"username\")"}, {"Neurotic", "require(5617600468).load(\"username\")"}, {"ULTRA NOOB SPAMMER", "require(5193737424)(\"username\",true)"}, {"RANDOM MAP", "require(1192815372).load(\"username\")"}, {"OMEGA FLOWEY", "require(5621190626).OmegaFlower(\"username\")"}, {"Chara Boss", "require(4106669917).load(\"username\")"}, {"Pyro Flamethrower", "require(4483948796).load(\"username\")"}, {"RODA ROLLA DA", "require(4581300009).xd(\"username\")"}, {"NUKE", "require(4178274460).Nuke(Vector3.new(\"username\"),1000)"}, {"CATGIRL TROLL", "require(4564681456).catgirl(\"username\")"}, {"AD Virus", "require(4124996597).swano(\"username\")"}, {"Builderman Discord Call", "require(4024051473).call(\"all\")"}, {"Server Destroyer GUI", "require(5257685661):Fire(\"username\")"}, {"UTG", "require(4937823608).load(\"username\")"}, {"UTG Epix", "require(4945821345).lmao(\"username\")"}, {"Undetected Hub V2", "require(5673170715).Leak(\"username\")"}, {"Aqua Hub", "require(5099140412).Aqua(\"username\")"}, {"Mr Bean Admin", "require(5492934148):Fire(\"XD\",\"username\")"}, {"Rape Gui", "require(4863172339).Enduro(\"username\")"}, {"Project Scripted GUI", "require(5160216694).Ass(\"username\")"}, {"Sakura Hub", "require(4937114966):SH(\"username\")"}, {"Undetected Hub V2 (Duplicate)", "require(5673170715).Leak(\"username\")"}, {"Adrian’s Good UTG", "require(4934614538):adrian(\"username\")"}, {"baldiinvasion2’s utg", "require(4977590940).load(\"username\")"}, {"D3S SS", "require(5868025435).load(\"username\")"}, {"Hoarder GUI", "require(5028947792).Lmao(\"username\")"}, {"Epic Stand", "require(5098731275).eliza(\"orangeado\")"}, {"Jojo Stands", "require(4902600443)(\"Stand Name\", \"username\")"}, {"Roz Hub", "require(5702333343).load(\"username\")"}, {"Ethereal Hub", "require(5845339294).EH(\"username\")"}, {"Ants Hub V5", "require(5128274968).GetAntsUtgV5(\"username\")"}, {"Xio’s Hub", "require(4831353616).xh(\"username\")"}, {"Best Hub", "require(4634558715)(\"username\")"}, {"Subhub", "require(5356256564).SubscribeYouSkid(\"username\")"}, {"Hexine Gui", "require(5419240318).PraiseSkidGod(\"username\")"}, {"Spring Hub", "require(4829576129).SpringHub(\"username\")"}, {"Unleaked SS", "require(4706570992).load(\"username\")"}, {"Spaghetti Hub", "require(5121570975).SpaghettiHub(\"username\")"}, {"Lightning Cannon", "require(5705720748).Lightning(string.reverse(\"username\"))"}, {"Adrian Hub", "require(5620645578):ASH(\"username\")"}, {"Avry Hub", "require(5580599015).load(\"username\")"}, {"Pire Logger", "require(5098133040):FirePire(\"username:Pire\")"}, {"Glitchhub Premium", "require(5487274946).GLITCHED(\"username\")"}, {"Anonymous UTG (Duplicate)", "require(5126648745).load(\"username\")"}, {"Under UTG", "require(4614455084).Under(\"username\")"}, {"Sonichub", "require(5352721272):Fire(\"username\")"}, {"UTG Edit", "require(3497222070).load(\"username\")"}, {"Zero Two Lightning Cannon", "require(5828128589).honey(string.reverse(\"username\"))"}, {"Fearful Harmony", "require(5970690882).ps1(\"RICKLER\")"}, {"Super Cool Banisher", "require(5226367856).rk(\"username\")"}, {"Fraud", "require(4952179933).Fraud(\"username\")"}, {"Retro Hub", "require(5963380437).publicbuild(\"username\", \"Retro\")"}, {"Vascepa Hub", "require(6009547419).Fire(\"username\")"}, {"Eliza Hub", "require(5543125369).eliza(\"username\")"}, {"South Park Video Troll", "require(6062281254).load(\"username\")"}, {"Aureus V1", "require(6036737823).CrackedByIncreaseron(\"imlucixD34\")"}, {"Crab Rave", "require(6085762856).BINGBONG(\"NoNameNeeded\")"}, {"Xi Jinping", "require(5597042098).chinaAnnounce(\"username\")"}, {"Dark Dex", "require(3010581956):Fireplace(\"username\")"}, {"Cooldown Nuke", "require(4867426485):SD2(\"username\")"}, {"Immortality Lord", "require(6088717643)(\"65464593\")"}, {"Viankos", "require(6123029966).vian(\"username\")"}, {"Pharaoh Lightning Cannon", "require(5856873964).PharaohCannon(string.reverse(\"username\"))"}, {"The End Nuke", "require(4658687827).nukes(\"username\")"}, {"Trollimbius Gui", "require(4555115496).gw(\"username\")"}, {"Adrian’s UTG", "require(4154130567).ik(\"username\")"}, {"Snake Banisher V3", "require(4967804765).SBV3(\"username\")"}, {"Immortality Cannon", "require(4903995654)(65464593)"}, {"Asylum Hub", "require(4992512410):Asylumgotskidded(\"username\")"}, {"c00lgui remake", "require(6114289913).c00lgui(\"username\")"}, {"GUI Hub", "require(5308680571).load(\"username\")"}, {"PikaX UTG", "require(4813227802){\"username\"}"}, {"Phantom Forces Guns", "require(0xA8526D5D).giveGuns(\"username\")"}, {"GodSpawn GUI", "require(5146396793).load(\"username\")"}, {"Fare’s Hubhub", "require(5344766102).fare(\"username\")"}, {"Redlights.exe", "require(6097532439):redlightsdontleak(\"username\")"}, {"Ravenger Claws V2", "require(6099373575).load(\"username\")"}, {"Shadow Gunner", "require(6222361140).load(\"username\")"}, {"Cyber Monarch", "require(6027795939).load(\"username\")"}, {"Kuma", "require(6099324864).load(\"username\")"}, {"Bad Karma", "require(4471066396).load(\"username\")"}, {"Void Boss", "require(6175490752).load(\"username\")"}, {"Xester V2 (Duplicate)", "require(6099241563).load(\"username\")"}, {"Veltex", "require(6099316092).load(\"username\")"}, {"Shadow Kars", "require(6058159336).load(\"username\")"}, {"The Defiant", "require(6168743245).load(\"username\")"}, {"The Disturbed", "require(6099363076).load(\"username\")"}, {"Jester", "require(6042859321).load(\"username\")"}, {"Dimensiona", "require(6058166660).load(\"username\")"}, {"Server Admin (Duplicate)", "require(4665394711).load(\"username\")"}, {"Nectula", "require(3224070083).load(\"username\")"}, {"Desolate", "require(6088494183).load(\"username\")"}, {"Brick Hamman", "require(6015747481).load(\"username\")"}, {"Vaxtemi Boss Battle", "require(5619264516).Dark(\"username\")"}, {"Death Sheriff", "require(6056559552).load(\"username\")"}, {"Holy Hand Grenade", "require(6027832941).load(\"username\")"}, {"Stick Beater", "require(5813743814).load(\"username\")"}, {"Project Light", "require(5977500481).load(\"username\")"}, {"Oculus", "require(5813695241).load(\"username\")"}, {"Cyber Knight", "require(5617200606).Cyber(\"username\")"}, {"Lost Soul", "require(5390158029).Dark(\"username\")"}, {"Achromatic", "require(5857033951).load(\"username\")"}, {"Archangel of Light", "require(5813836873).load(\"username\")"}, {"Aureola", "require(5813799887).load(\"username\")"}, {"Aether Lightning", "require(4229413153).load(\"username\")"}, {"Deadly Laser Sun V3", "require(5751710030).Sun(\"username\")"}, {"Sociopath", "require(4611999946).load(\"username\")"}, {"Fallen Anger", "require(4490557105).load(\"username\")"}, {"Military Tank", "require(5068511197).insert(\"username\")"}, {"Chronos Sentinel", "require(4661847142).load(\"username\")"}, {"Glorious Bastion of Light", "require(5375460203).Player(\"username\")"}, {"Felipe’s Ascension", "require(5605396200):load(\"username\",\"Felipe\")"}, {"Echo", "require(5374597845).Dark(\"username\")"}, {"Darkomos", "require(5346891374).Dark(\"username\")"}, {"Stan", "require(5270525643).Dark(\"username\")"}, {"Nightmare", "require(4943481014).Nightmare(\"username\")"}, {"Dominus Venari", "require(3256686965).load(\"username\")"}, {"Grab Gun", "require(5146659840).Dark_Eccentric(\"Dark_Eccentric\", \"username\")"}, {"Siren Head", "require(5239955586).Dark(\"username\")"}, {"Kasper Hub", "require(5000363317).UwUMoment(\"username\")"}, {"F3X BTools", "require(4869378421).F3X(\"username\")"}, {"Ultra Hub", "require(5275752166).ULTRAV2(\"username\")"}, {"Xio Hax", "require(5178605206).bizzcrack(\"username\")"}, {"Soap Hub", "require(5300095496).soap(\"username\")"}, {"Adrian’s MTG", "require(5142574517):mega(\"username\")"}, {"Spong Hub", "require(5203976741).spong(\"username\")"}, {"Thonk Hub", "require(5116049830).thonk(\"username\")"}, {"Forest hub", "require(5253172143).load(\"username\")"}, {"Plane", "require(3563652201).l0l(\"UltraWasHere\")(\"username\")"}, {"L3xa Hub", "require(5885462965).lexa(\"username\")"}, {"Snake Glitcher", "require(6216675632).ae(\"username\")"}, {"idk", "require(4125860484)(\"username\")"}, {"Banisher?", "require(0x23F530165 - 0x17D6F549B).c3(\"username\")"}, {"NB Hub V2", "require(6239870794):NB2(\"username\")"}, {"JuanSS", "require(4869013426).JuanaSS(\"username\")"}, {"Snake Banisher V4", "require(6253147982).SBV4(\"username\")"}, {"Dimension Hub", "require(tonumber(require(1.9988474659215096e+24/389489894389289).dec(\"MHgxNmFmNzViMjA=\"))).tortillaload(\"username\")"}, {"Gear Stuff", "require(3024043748):Start(\"username\",\"AAA\")"}, {"Tesla Executor", "require(6234345495):Tesla(\"username\")"}, {"Operation Noob", "require(6269838898).load(\"username\")"}, {"Epic Godcat Edit", "require(6171421519)(\"username\")"}, {"Project Scripted V2", "require(6274987259).v2(\"username\")"}, {"Lucky's Hub", "require(5994869968).D0ggo(\"username\")"}, {"Ultimate Trolling Gui Youtube Edition", "require(4496865792).Lmao(\"username\")"}, {"PikaX UTG (Duplicate)", "require(4813227802){\"username\"}"}, {"Kaspers Hub", "require(5716300544).asd(\"username\")"}, {"Spong Hub (Duplicate)", "require(5203976741).spong(\"username\")"}, {"Old Lightning Cannon", "require(5654587719).brohhh(string.reverse(\"username\"))"}, {"Baseball Bat V5 (Duplicate)", "require(4559977647).load(\"username\")"}, {"Poo Pee Stinky Hub", "require(5742138267).Jimmy_Giovannas_burgers(\"username\")"}, {"Scrambles Hub", "require(5133347890).scrambles(\"username\")"}, {"An OP Script Hub", "require(5742138267).Jimmy_Giovannas_burgers(\"username\")"}, {"Pire Logger", "require(5098133040):FirePire(\"username:Pire\")"}, {"C00lgui Reborn", "require(6032524768).Eagle(\"username\")"}, {"Lightning Cannon V2", "require(6370978733)(\"username\")"}, {"Universalis Dominus", "require(6270014162).load(\"username\")"}, {"The Holiest Wrench", "require(6419718698).load(\"username\")"}, {"Time Stop", "require(6285853184).TimeStopper(\"username\",\"rbc\")"}, {"Minecraft Mobs Spawner", "require(6339079111).mobspawner(\"username\")"}, {"Dominus Astra", "require(6464428559).load(\"username\")"}, {"Junkbot", "require(6438196691)(\"username\",\"JUNKBOT\")"}, {"Light Circlet", "require(5813748809).load(\"username\")"}, {"Gattai Zamasu", "require(6424791174).load(\"username\")"}, {"Supr14 Nuke", "require(6335063396).load(\"username\")"}, {"Calamity", "require(3032735551):Start(\"username\",\"AAA\")"}, {"Bloxwatch", "require(6472943749).boss(\"username\")"}, {"Universe Reset", "require(6649537798).UniverseReset()"}, {"Moriyan Drone", "require(6564964464)(\"username\")"}, {"Hellset", "require(6569726017)[\"username\"] = \"Dark\""}, {"Omni God", "require(6540522165).load(\"username\")"}, {"Troll Server Destroyer", "require(6549414661)"}, {"UTG V10", "require(6218862474).eliza(\"username\")"}, {"Wario Apparition", "require(5223007262)(\"VictimName\")"}, {"Reverse Time", "require(6525681614).reverser(\"username\")"}, {"Virus Ads", "require(6707668066).virus(\"username\")"}, {"Killbot V3", "require(6688474792).load(\"username\")"}, {"idk (Duplicate)", "require(6583572269).load(\"username\")"}, {"Lightning Cannon UTG", "require(1071722458).load(\"username\")"}, {"Neko Hub", "require(6794297504).NekoHub(\"username\")"}, {"Tanitive Space Map", "require(4081020916).loadmap()"}, {"Dungeon Map", "require(4081024299).loadmap()"}, {"Praise Server Destroyer", "require(6746870700)()"}, {"Nulled XD", "require(6745275731)()"}, {"Hyperskidded Cannon Max", "require(7158847523).lewfoqfockwroewopqrqwxowpr(\"username\")"}, {"Ultra God Lightning Cannon", "require(1463699117).Load(\"username\")"}, {"Ultraskid Cannon", "require(6287712657).Load(\"username\")"}, {"Ultraskidded Lord", "require(3183152719)(game:GetService(\"Players\"):WaitForChild(\"username\").UserId)"}, {"Unknown Lord", "require(7197738360)[\"UNKN0WN\"](\"username\")"}, {"Ultraskidded Studio Dummy V2", "require(6885716335)(\"username\")"}, {"Studio Dummy V3", "require(6788546558)(\"username\")"}, {"Studio Dummy V3 Switcher", "require(6824699886)(\"username\")"}, {"Newest Maddox Dummy", "require(7091286913)(\"username\")"}, {"Anti V7", "require(6903927432)(65464593)"}, {"Legend Skidded Echo", "require(7229827459).TotallyYessir23231212(\"username\")"}, {"Mat LC", "require(6522699963)(\"username\")"}, {"Anatomiiii Cannon V.3", "require(7054321111).SC(\"username\")"}, {"Rapid Fire Studio Dummy", "require(6568426115)(\"username\")"}, {"AndrFix Godcat Edit", "require(6931315732).yeah(\"username\")"}, {"Immortality Lord XTR", "require(7242244455)(\"username\")"}, {"Shrike LC", "require(7161308644).lc(\"username\")"}, {"New John Doe", "require(6608656220):John(\"username\")"}, {"LC Tools Pack", "require(7001260635).lctoolsreuploaded(\"username\")"}, {"Weird Lord", "require(7037589092)(\"username\")"}, {"IL Dummy", "require(7023682644)(\"username\")"}, {"Sans_Gboard’s Hub", "require(7242662591):SGH_3(\"username\")"}, {"Studio Immortality Lord V2", "require(7253448613)(\"username\")"}, {"Hyperskidded Lord", "require(6799359169)(\"username\")"}, {"Tools Pack", "require(6727030812).Fun(\"username\", \"Fun\")"}, {"Tank AI", "require(7203746402).tonk(\"username\")"}, {"Special Forces AI", "require(7215403029).RRT(\"username\")"}, {"Helicopter AI", "require(7185228601).load(\"username\")"}, {"C4 Weapon", "require(0x1767bf813)(\"username\")"}, {"Police AI", "require(7163976217).VK(\"username\")"}, {"Juggernaut AI", "require(7486656912).Juggernaut(\"username\")"}, {"Godspeed", "require(3957090799).load(\"username\")"}, {"The Dark Entity", "require(7414960182).load(\"username\")"}, {"Lucyanna Angel", "require(7437496726).load(\"username\")"}, {"Gregorian (NO) GUI", "require(6888054758)(game:GetService(\"Players\")[\"username\"])"}, {"The Time Machine", "require(7411835387)(\"VictimNameHere\")"}, {"Immortality Demon", "require(7322088685)(\"username\")"}, {"Anti ScriptLogger/WebhookLogger", "require(6530368992).antilgr()"}, {"Logger Detector", "require(7276744247):noskids(\"username\")"}, {"Dark Skidded Lord", "require(7485724079)(65464593)"}, {"The Ascensionist", "require(7485376670).trussboy(\"username\")"}, {"Project Godcat", "require(7475656586).bscr(\"username\")"}, {"Sans_Gboard Hub Remake", "require(7265631746):SGHR(\"username\")"}, {"Tiger's Lamborghini Type-X", "require(7064628940).TLX(\"username\")"}, {"Hyperskidded Bloodwater Edit", "require(7380893117).HSBW(\"username\")"}, {"Neffex V2", "require(7452827346):NEFFEXV2(\"username\")"}, {"Super Skidded Banisher", "require(7077641377).SSB(\"username\")"}, {"Some Random Tool Pack", "require(7103633176)(\"username\")"}, {"Hyper Skidded Cannon XSE", "require(6526438357).HSC(\"username\")"}, {"Nightmare (Duplicate)", "require(7594500378)(\"username\")"}, {"Calamity V3 (Hub)", "require(7593715162).load(\"username\")"}, {"Exodim LC", "require(7593452166).exodim(\"username\")"}, {"Studio Immortality King", "require(7601446307):SDIK(\"username\")"}, {"Incubus (Neko Edit)", "require(7584808965).ImmortalityLord(\"username\")"}, {"Hyper Skidded Godcat 1.6.1", "require(7575478789)[\"v1.6.1\"](\"username\")"}, {"Molten Banisher", "require(7141234250).molten(\"username\")"}, {"Ultraskidded Glitcher", "require(tonumber(\"7564007780\")).e(string.reverse(string.reverse(\"username\")))"}, {"Mlem’s SS Gui V3", "require(6710125107).mlem(\"username\")"}, {"Hope V2", "require(6655953122).HopeV2iguess(\"username\")"}, {"Maddox Ball Script", "require(7185139799).bal(\"username\")"}, {"Bloodwater Edit", "require(7664181817)(\"username\")"}, {"The Ascensionist (Duplicate)", "require(7674895345)(\"username\")"}, {"Ultraskidded Amongus", "require(7662310890)(\"username\")"}, {"Ultraskidded Cannon X", "require(7661712858).Load(\"username\")"}, {"Hallowed", "require(7691779364).hi(\"username\")"}, {"Another Toolpack Script", "require(7701211784).rar(\"username\")"}, {"Viewport Bloodwater", "require(7580799842).NONAME(\"username\")"}, {"Honey LC Overdrive", "require(7710841241).HoneyLCX(\"username\")"}, {"Shrike LC (Duplicate)", "require(7705282521).lc(\"username\")"}, {"Katasrophe LC", "require(7146067831).katas({Player = \"username\", Skid=true})"}, {"Lost Cannon", "require(7133882046).Soul(string.reverse(\"username\"))"}, {"Unknown Demon (SD Edit)", "require(7722155314)(\"username\")"}, {"New Viewport Bloodwater", "require(7703246385).NONAME(\"username\")"}, {"U?N?K?N?O?W?N", "require(7078449501).MOTHERFUCKER(\"username\")"}, {"Omega Skidded Cannon", "require(7759895257).Load(\"username\")"}, {"Hyper Skidded Cannon XSE (Newest Version)", "require(6526438357).TUSC(\"username\")"}, {"Redone Ultraskidded Lord", "require(7781347277)(\"username\")"}, {"Descensionist", "require(8065511782)(\"username\")"}, {"Over powered tool pack", "require(6740182305):myfirstscriptthatcankilllol(\"username\")"}, {"Anti Logger V10", "require(7819171999).antilgr()"}, {"Antiskid V10", "require(6735691273).BetaAntiSkid()"}, {"Anti V13 (Anti Universal V3)", "require(7628024907).LoadAdmin(\"username\")"}, {"NekoHub (Duplicate)", "require(0x20c40e721):NekoHub(\"username\")"}, {"Unknown Script 1", "require(4753224196).load(\"username\")"}, {"Constraint Tools", "require(7518778955).ConstraintTools(\"username\")"}, {"Enable Weapons", "require(6795333966).enableWeapons(\"username\")"}, {"Neko GUI", "require(7207263079).nekogui(\"username\")"}, {"Scrambles Hub (Duplicate)", "require(5133347890).scrambles(\"username\")"}, {"Unknown Script 2", "require(6460913193).load(\"username\")"}, {"Tool Pack by Sans_Gboard", "require(6953710832):ToolPack_Gui_by_Sans_Gboard(\"username\")"}, {"Glitchhub Premium (Duplicate)", "require(5487274946).GLITCHED(\"username\")"}, {"Hexine Gui (Duplicate)", "require(5419240318).PraiseSkidGod(\"username\")"}, {"Reverse Time (Duplicate)", "require(6525681614).reverser(\"username\")"}, {"Guns Toolpack", "require(7507987223)(\"username\",\"Guns\")"}, {"Unknown Script 3", "require(7960756691).load(\"username\")"}, {"Operation Noob (Duplicate)", "require(6269838898).load(\"username\")"}, {"Siren Head (Duplicate)", "require(5239955586).Dark(\"username\")"}, {"Unknown Script 4", "require(4105428725).load(\"username\")"}, {"Unknown Script 5", "require(5193737424)(\"username\",false)"}, {"CHATHAX (Duplicate)", "require(5564800243).fehax(\"username\")"}, {"Unknown Script 6", "require(5127730212)(\"username\")"}, {"Undetected Hub V2 (Duplicate)", "require(5673170715).Leak(\"username\")"}, {"Hentai", "require(6847914535).Hentai(\"username\")"}, {"Pink Car (Duplicate)", "require(4745872847).load(\"username\")"}, {"Unknown Script 7", "require(6569468935).load(\"username\")"}, {"Unknown Script 8", "require(6342893088).load(\"username\")"}, {"Fuc Script", "require(2505714651).fuc(\"username\",\"Victm\")"}, {"Anonymous UTG (Duplicate)", "require(4824650327).Best(\"username\")"}, {"Adrian Trolling Gui", "require(4744981474).adrian(\"username\")"}, {"Naughty N Word SS", "require(4772620524):nig(\"nicholast013\")"}, {"Road Roller da Script", "require(4581300009).xd(\"nicholast013\")"}, {"Ultimate Trolling SS", "require(4763495676):Fire(\"username\")"}, {"Black SS", "require(4761634134):Fire(\"username\")"}, {"UNDERS utg", "require(4276916304):Fire(\"username\")"}, {"Black man's GUI", "require(4746910205):UTG(\"username\")"}, {"Utg v3", "require(4675430277).Lmao(\"username\")"}, {"Nuke (Duplicate)", "require(4530627975):Fire(\"username\")"}, {"Unleaked SS (Duplicate)", "require(4706570992).load(\"username\")"}, {"Island life utg", "require(4588615641):Fire(\"username\")"}, {"Aureus hub", "require(4679893299):Fire(\"username\")"}, {"Drahazar", "require(4528687560):LMAFO(\"username\")"}, {"Many gui", "require(4721164458).copy(\"username\")"}, {"Bean GUI", "require(4649145907).oCAG(\"username\")"}, {"Felipe in it", "require(4798155942):Fire(\"username\")"}, {"New utg", "require(4798150799).Lmao(\"username\")"}, {"Reality orb", "require(4780399515).load(\"username\")"}, {"Anonymous UTG (Duplicate)", "require(4817568691).Best(\"username\")"}, {"Robio Viruses", "require(4821018129).Virus(\"username\")"}, {"Ro Bio Injector", "require(4821022303).Inject(\"username\")"}}
			local tbl = {"Unknown Script 9", "require(4537142940).load(\"username\")"}
			tbl_2_upvr[465] = {"Ruby utg", "require(4748605382).new(\"username\")"}
			tbl_2_upvr[466] = {"Infinte Glitcher", "require(4722218391).load(\"username\")"}
			tbl_2_upvr[467] = {"Interstekkar Glitcher", "require(4722146433).load(\"username\")"}
			tbl_2_upvr[468] = {"Cytus Glitcher", "require(4721766508):GalaxyGlitcher(\"username\")"}
			tbl_2_upvr[469] = {"Pixel Glitcher", "require(4178465932).MPG(\"username\")"}
			tbl_2_upvr[470] = {"Spectrum Glitcher", "require(4721735759).load(\"username\")"}
			tbl_2_upvr[471] = {"AOM Glitcher Edit", "require(4721760220):yes(\"username\")"}
			tbl_2_upvr[472] = {"Reality Glitcher", "require(4721789462).noxd(\"username\")"}
			tbl_2_upvr[473] = {"Spectrum Glitcher Working", "require(2844773931).load(\"username\")"}
			tbl_2_upvr[474] = {"Reality Orb (Duplicate)", "require(4780399515).load(\"username\")"}
			tbl_2_upvr[475] = {"Axiom Glitcher", "require(4809720017).load(\"username\")"}
			tbl_2_upvr[476] = {"Apectrum", "require(4809742472).load(\"username\")"}
			tbl_2_upvr[477] = {"Sapdm", "require(4809749920).load(\"username\")"}
			tbl_2_upvr[478] = tbl
			local function updateScriptList_upvr(arg1) -- Line 769, Named "updateScriptList"
				--[[ Upvalues[6]:
					[1]: ScrollingFrame_upvr (readonly)
					[2]: tbl_2_upvr (readonly)
					[3]: styleButton_upvr (copied, readonly)
					[4]: LocalPlayer_upvr (copied, readonly)
					[5]: ReplicatedStorage_upvr (copied, readonly)
					[6]: UIListLayout_4_upvr (readonly)
				]]
				for _, v in ipairs(ScrollingFrame_upvr:GetChildren()) do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
				for _, v_2_upvr in ipairs(tbl_2_upvr) do
					if arg1 == "" or v_2_upvr[1]:lower():find(arg1:lower()) then
						local TextButton = Instance.new("TextButton")
						TextButton.Size = UDim2.new(1, 0, 0, 40)
						TextButton.Text = v_2_upvr[1]
						styleButton_upvr(TextButton, false)
						TextButton.Parent = ScrollingFrame_upvr
						TextButton.MouseButton1Click:Connect(function() -- Line 780
							--[[ Upvalues[3]:
								[1]: v_2_upvr (readonly)
								[2]: LocalPlayer_upvr (copied, readonly)
								[3]: ReplicatedStorage_upvr (copied, readonly)
							]]
							local var574
							if v_2_upvr[1] == "Grab Knife V3" or v_2_upvr[1] == "Rc7" then
								var574 = 3
							else
								var574 = 1
							end
							for i_3 = 1, var574 do
								local any_gsub_result1_upvr = v_2_upvr[2]:gsub("username", LocalPlayer_upvr.Name)
								local pcall_result1, pcall_result2_2 = pcall(function() -- Line 784
									--[[ Upvalues[2]:
										[1]: ReplicatedStorage_upvr (copied, readonly)
										[2]: any_gsub_result1_upvr (readonly)
									]]
									if ReplicatedStorage_upvr:FindFirstChild("AntiCheatEvent") then
										ReplicatedStorage_upvr.AntiCheatEvent:FireServer(any_gsub_result1_upvr)
									else
										error("AntiCheatEvent not found. Martian systems offline.")
									end
								end)
								if pcall_result1 then
									addLog(v_2_upvr[1].." unleashed its power on Mars.", "System")
									return
								end
								addLog("Attempt "..i_3.." failed for "..v_2_upvr[1]..": "..tostring(pcall_result2_2), "System")
								if i_3 == var574 then
									addLog("Final attempt failed for "..v_2_upvr[1]..". Check script ID or server compatibility.", "System")
								end
								wait(0.5)
							end
						end)
					end
				end
				ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4_upvr.AbsoluteContentSize.Y + 10)
			end
			TextBox_upvr_2:GetPropertyChangedSignal("Text"):Connect(function() -- Line 807
				--[[ Upvalues[2]:
					[1]: updateScriptList_upvr (readonly)
					[2]: TextBox_upvr_2 (readonly)
				]]
				updateScriptList_upvr(TextBox_upvr_2.Text)
			end)
			UIListLayout_4_upvr:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() -- Line 810
				--[[ Upvalues[2]:
					[1]: ScrollingFrame_upvr (readonly)
					[2]: UIListLayout_4_upvr (readonly)
				]]
				ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4_upvr.AbsoluteContentSize.Y + 10)
			end)
			updateScriptList_upvr("")
			local ScrollingFrame_upvw = Instance.new("ScrollingFrame")
			ScrollingFrame_upvw.Name = "LogsScroll"
			ScrollingFrame_upvw.Size = UDim2.new(0, Frame_upvr.Size.X.Offset - 160, 0, 240)
			ScrollingFrame_upvw.Position = UDim2.new(0, 140, 0, 60)
			ScrollingFrame_upvw.BackgroundTransparency = 1
			ScrollingFrame_upvw.ScrollBarThickness = 8
			ScrollingFrame_upvw.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame_upvw.Parent = Frame_upvr
			local UIListLayout_3_upvr = Instance.new("UIListLayout")
			UIListLayout_3_upvr.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3_upvr.Padding = UDim.new(0, 5)
			UIListLayout_3_upvr.Parent = ScrollingFrame_upvw
			local function addLog_upvr(arg1, arg2) -- Line 829, Named "addLog"
				--[[ Upvalues[2]:
					[1]: ScrollingFrame_upvw (read and write)
					[2]: UIListLayout_3_upvr (readonly)
				]]
				local TextLabel = Instance.new("TextLabel")
				TextLabel.Size = UDim2.new(1, -10, 0, 30)
				TextLabel.BackgroundTransparency = 1
				TextLabel.Text = string.format("[%s] %s: %s", os.date("%H:%M:%S"), arg2, arg1)
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.Font = Enum.Font.SourceSans
				TextLabel.TextSize = 14
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.Parent = ScrollingFrame_upvw
				ScrollingFrame_upvw.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_3_upvr.AbsoluteContentSize.Y + 10)
			end
			LogService_upvr.MessageOut:Connect(function(arg1, arg2) -- Line 842
				--[[ Upvalues[1]:
					[1]: addLog_upvr (readonly)
				]]
				if arg2 == Enum.MessageType.MessageOutput then
					addLog_upvr(arg1, "Server")
				end
			end)
			local ChatEvents = Chat_upvr:FindFirstChild("ChatEvents")
			if ChatEvents then
				ChatEvents.OnMessageDoneFiltering:Connect(function(arg1) -- Line 847
					--[[ Upvalues[1]:
						[1]: addLog_upvr (readonly)
					]]
					addLog_upvr(string.format("%s: %s", arg1.FromSpeaker, arg1.Message), "Chat")
				end)
			end
			local function showTab_upvr(arg1) -- Line 852, Named "showTab"
				--[[ Upvalues[6]:
					[1]: Frame_upvw (read and write)
					[2]: Frame_upvw_2 (read and write)
					[3]: ScrollingFrame_upvw (read and write)
					[4]: var60_upvw (read and write)
					[5]: tbl_3_upvr (readonly)
					[6]: styleButton_upvr (copied, readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
				local var591
				if arg1 ~= "Executor" then
					var591 = false
				else
					var591 = true
				end
				Frame_upvw.Visible = var591
				if arg1 ~= "Script Library" then
					var591 = false
					-- KONSTANTWARNING: GOTO [12] #10
				end
				-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [11] 9. Error Block 31 start (CF ANALYSIS FAILED)
				var591 = true
				Frame_upvw_2.Visible = var591
				if arg1 ~= "Logs" then
					var591 = false
				else
					var591 = true
				end
				ScrollingFrame_upvw.Visible = var591
				var60_upvw = arg1
				var591 = tbl_3_upvr
				for i_4, v_3 in pairs(var591) do
					local var595
					if i_4 ~= var60_upvw then
						var595 = false
					else
						var595 = true
					end
					styleButton_upvr(v_3, var595)
				end
				-- KONSTANTERROR: [11] 9. Error Block 31 end (CF ANALYSIS FAILED)
			end
			for _, v_4_upvr in ipairs({"Executor", "Script Library", "Logs"}) do
				local TextButton_3 = Instance.new("TextButton")
				tbl = -10
				local var600 = tbl
				TextButton_3.Size = UDim2.new(1, var600, 0, 40)
				TextButton_3.Text = v_4_upvr
				if v_4_upvr ~= var60_upvw then
					var600 = false
				else
					var600 = true
				end
				styleButton_upvr(TextButton_3, var600)
				TextButton_3.Parent = Frame
				tbl_3_upvr[v_4_upvr] = TextButton_3
				TextButton_3.MouseButton1Click:Connect(function() -- Line 869
					--[[ Upvalues[2]:
						[1]: showTab_upvr (readonly)
						[2]: v_4_upvr (readonly)
					]]
					showTab_upvr(v_4_upvr)
				end)
			end
			local TextButton_2 = Instance.new("TextButton")
			TextButton_2.Size = UDim2.new(0, 28, 0, 28)
			TextButton_2.Position = UDim2.new(1, -38, 0, 7)
			TextButton_2.Text = 'X'
			styleButton_upvr(TextButton_2, false)
			TextButton_2.TextSize = 18
			TextButton_2.Parent = Frame_upvr
			TextButton_2.MouseButton1Click:Connect(function() -- Line 879
				--[[ Upvalues[2]:
					[1]: Frame_upvr (readonly)
					[2]: addLog_upvr (readonly)
				]]
				Frame_upvr.Visible = false
				addLog_upvr("GUI closed", "System")
			end)
			Frame_upvw.Visible = true
			Frame_upvw_2.Visible = false
			ScrollingFrame_upvw.Visible = false
			var60_upvw = "Executor"
			for i_6, v_5 in pairs(tbl_3_upvr) do
				local var607
				if i_6 ~= var60_upvw then
					var607 = false
				else
					var607 = true
				end
				styleButton_upvr(v_5, var607)
			end
			workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line 886
				--[[ Upvalues[5]:
					[1]: var2_upvw (copied, read and write)
					[2]: Frame_upvr (readonly)
					[3]: tbl_upvr (copied, readonly)
					[4]: var24_upvw (read and write)
					[5]: ImageButton_upvr (readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 18 start (CF ANALYSIS FAILED)
				local ViewportSize = workspace.CurrentCamera.ViewportSize
				if ViewportSize.X < 900 then
					-- KONSTANTWARNING: GOTO [21] #15
				end
				-- KONSTANTERROR: [0] 1. Error Block 18 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [13] 9. Error Block 16 start (CF ANALYSIS FAILED)
				if ViewportSize.X < 1400 then
					-- KONSTANTWARNING: GOTO [21] #15
				end
				-- KONSTANTERROR: [13] 9. Error Block 16 end (CF ANALYSIS FAILED)
			end)
			ImageButton_upvr.MouseButton1Click:Connect(function() -- Line 897
				--[[ Upvalues[2]:
					[1]: Frame_upvr (readonly)
					[2]: addLog_upvr (readonly)
				]]
				local var611 = not Frame_upvr.Visible
				Frame_upvr.Visible = var611
				if Frame_upvr.Visible then
					var611 = "GUI opened"
				else
					var611 = "GUI closed"
				end
				addLog_upvr(var611, "System")
			end)
		end
	end)()
	-- KONSTANTERROR: [63] 43. Error Block 17 end (CF ANALYSIS FAILED)
end
-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-11-02 08:22:20
-- Luau version 6, Types version 3
-- Time taken: 0.036957 seconds

-- KONSTANTERROR: [0] 1. Error Block 16 start (CF ANALYSIS FAILED)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local var2_upvw
if LocalPlayer_upvr.Name ~= "temc00lkidisklngnow" then
else
	local function _(arg1, arg2) -- Line 17, Named "addCorner"
		local UICorner_4 = Instance.new("UICorner")
		UICorner_4.CornerRadius = UDim.new(0, arg2)
		UICorner_4.Parent = arg1
	end
	local function styleButton_upvr(arg1, arg2) -- Line 22, Named "styleButton"
		if not arg2 or not Color3.fromRGB(150, 0, 0) then
		end
		arg1.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
		if arg2 then
		else
		end
		arg1.BackgroundTransparency = 0.2
		arg1.BorderSizePixel = 0
		arg1.TextColor3 = Color3.fromRGB(255, 255, 255)
		arg1.Font = Enum.Font.SourceSansBold
		arg1.TextScaled = true
		local UICorner_7 = Instance.new("UICorner")
		UICorner_7.CornerRadius = UDim.new(0, 8)
		UICorner_7.Parent = arg1
		local UIStroke = Instance.new("UIStroke")
		if arg2 then
		else
		end
		UIStroke.Thickness = 1.5
		UIStroke.Color = Color3.fromRGB(255, 50, 50)
		UIStroke.Parent = arg1
	end
	var2_upvw = workspace.CurrentCamera
	local ViewportSize_2 = var2_upvw.ViewportSize
	if ViewportSize_2.X < 900 then
		var2_upvw = "Mobile"
		-- KONSTANTWARNING: GOTO [71] #49
	end
	-- KONSTANTERROR: [0] 1. Error Block 16 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [63] 43. Error Block 17 start (CF ANALYSIS FAILED)
	if ViewportSize_2.X < 1400 then
		var2_upvw = "Tablet"
	else
		var2_upvw = "PC"
	end
	local tbl_upvr = {
		PC = UDim2.new(0, 600, 0, 400);
		Tablet = UDim2.new(0, 520, 0, 340);
		Mobile = UDim2.new(0, 420, 0, 320);
	}
	local PlayerGui_upvr = LocalPlayer_upvr:WaitForChild("PlayerGui")
	local TweenService_upvr = game:GetService("TweenService")
	local UserInputService_upvr = game:GetService("UserInputService")
	local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
	local LogService_upvr = game:GetService("LogService")
	local Chat_upvr = game:GetService("Chat")
	;(function() -- Line 40, Named "createGUI"
		--[[ Upvalues[10]:
			[1]: PlayerGui_upvr (readonly)
			[2]: var2_upvw (read and write)
			[3]: TweenService_upvr (readonly)
			[4]: tbl_upvr (readonly)
			[5]: UserInputService_upvr (readonly)
			[6]: styleButton_upvr (readonly)
			[7]: ReplicatedStorage_upvr (readonly)
			[8]: LocalPlayer_upvr (readonly)
			[9]: LogService_upvr (readonly)
			[10]: Chat_upvr (readonly)
		]]
		local c00lssExecutor = PlayerGui_upvr:FindFirstChild("c00lssExecutor")
		if c00lssExecutor then
			c00lssExecutor.Enabled = true
		else
			local ScreenGui_2 = Instance.new("ScreenGui")
			ScreenGui_2.Name = "c00lssToggle"
			ScreenGui_2.Parent = PlayerGui_upvr
			local var24_upvw = false
			ScreenGui_2.ResetOnSpawn = var24_upvw
			if var2_upvw == "Mobile" then
				var24_upvw = 100
			else
				var24_upvw = 200
			end
			local ImageButton_upvr = Instance.new("ImageButton")
			ImageButton_upvr.Size = UDim2.new(0, var24_upvw, 0, var24_upvw)
			ImageButton_upvr.Position = UDim2.new(0.5, -var24_upvw / 2, 0.5, -var24_upvw / 2)
			ImageButton_upvr.BackgroundTransparency = 1
			ImageButton_upvr.Image = "rbxassetid://127013890150341"
			ImageButton_upvr.ImageTransparency = 1
			ImageButton_upvr.Parent = ScreenGui_2
			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0, var24_upvw / 2)
			UICorner.Parent = ImageButton_upvr
			local Frame_upvr_3 = Instance.new("Frame")
			Frame_upvr_3.Size = UDim2.new(0, 300, 0, 100)
			Frame_upvr_3.Position = UDim2.new(0, var24_upvw + 10, 0.5, -50)
			Frame_upvr_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame_upvr_3.BackgroundTransparency = 1
			Frame_upvr_3.BorderSizePixel = 0
			Frame_upvr_3.Visible = false
			Frame_upvr_3.Parent = ScreenGui_2
			local UIStroke_2 = Instance.new("UIStroke")
			UIStroke_2.Thickness = 2
			UIStroke_2.Color = Color3.fromRGB(0, 0, 0)
			UIStroke_2.Parent = Frame_upvr_3
			local TextLabel_2 = Instance.new("TextLabel")
			TextLabel_2.Size = UDim2.new(1, -10, 1, -10)
			TextLabel_2.Position = UDim2.new(0, 5, 0, 5)
			TextLabel_2.BackgroundTransparency = 1
			TextLabel_2.Text = "FE BYPASS!!!😱"
			TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_2.Font = Enum.Font.SourceSansBold
			TextLabel_2.TextScaled = true
			TextLabel_2.TextWrapped = true
			TextLabel_2.Parent = Frame_upvr_3
			local UICorner_5 = Instance.new("UICorner")
			UICorner_5.CornerRadius = UDim.new(0, 8)
			UICorner_5.Parent = Frame_upvr_3
			local TweenInfo_new_result1 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			local any_Create_result1_2 = TweenService_upvr:Create(ImageButton_upvr, TweenInfo_new_result1, {
				ImageTransparency = 0;
			})
			local any_Create_result1 = TweenService_upvr:Create(ImageButton_upvr, TweenInfo_new_result1, {
				Position = UDim2.new(0, 20, 1, -var24_upvw - 20);
			})
			any_Create_result1_2:Play()
			any_Create_result1_2.Completed:Wait()
			wait(1)
			any_Create_result1:Play()
			any_Create_result1.Completed:Wait()
			TweenService_upvr:Create(ImageButton_upvr, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
				Rotation = 360;
			}):Play()
			ImageButton_upvr.MouseEnter:Connect(function() -- Line 101
				--[[ Upvalues[2]:
					[1]: Frame_upvr_3 (readonly)
					[2]: TweenService_upvr (copied, readonly)
				]]
				Frame_upvr_3.Visible = true
				TweenService_upvr:Create(Frame_upvr_3, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					BackgroundTransparency = 0;
				}):Play()
			end)
			ImageButton_upvr.MouseLeave:Connect(function() -- Line 106
				--[[ Upvalues[2]:
					[1]: TweenService_upvr (copied, readonly)
					[2]: Frame_upvr_3 (readonly)
				]]
				TweenService_upvr:Create(Frame_upvr_3, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
					BackgroundTransparency = 1;
				}):Play()
				Frame_upvr_3.Visible = false
			end)
			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.Name = "c00lssExecutor"
			ScreenGui.Parent = PlayerGui_upvr
			ScreenGui.ResetOnSpawn = false
			local Frame_upvr = Instance.new("Frame")
			Frame_upvr.Name = "MainFrame"
			Frame_upvr.Size = tbl_upvr[var2_upvw]
			Frame_upvr.Position = UDim2.new(0.5, -tbl_upvr[var2_upvw].X.Offset / 2, 1, tbl_upvr[var2_upvw].Y.Offset)
			Frame_upvr.BackgroundColor3 = Color3.fromRGB(90, 0, 0)
			Frame_upvr.BackgroundTransparency = 0.15
			Frame_upvr.BorderSizePixel = 0
			local UICorner_2 = Instance.new("UICorner")
			UICorner_2.CornerRadius = UDim.new(0, 10)
			UICorner_2.Parent = Frame_upvr
			Frame_upvr.Parent = ScreenGui
			TweenService_upvr:Create(Frame_upvr, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
				Position = UDim2.new(0.5, -tbl_upvr[var2_upvw].X.Offset / 2, 0.5, -tbl_upvr[var2_upvw].Y.Offset / 2);
			}):Play()
			local var45_upvw = false
			local var46_upvw
			local var47_upvw
			local var48_upvw
			local function update_upvr(arg1) -- Line 131, Named "update"
				--[[ Upvalues[4]:
					[1]: var48_upvw (read and write)
					[2]: var47_upvw (read and write)
					[3]: TweenService_upvr (copied, readonly)
					[4]: Frame_upvr (readonly)
				]]
				local var49 = arg1.Position - var48_upvw
				TweenService_upvr:Create(Frame_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Position = var47_upvw + UDim2.new(0, var49.X, 0, var49.Y);
				}):Play()
			end
			Frame_upvr.InputBegan:Connect(function(arg1) -- Line 136
				--[[ Upvalues[4]:
					[1]: var45_upvw (read and write)
					[2]: var47_upvw (read and write)
					[3]: Frame_upvr (readonly)
					[4]: var48_upvw (read and write)
				]]
				if arg1.UserInputType == Enum.UserInputType.MouseButton1 or arg1.UserInputType == Enum.UserInputType.Touch then
					var45_upvw = true
					var47_upvw = Frame_upvr.Position
					var48_upvw = arg1.Position
					arg1.Changed:Connect(function() -- Line 141
						--[[ Upvalues[2]:
							[1]: arg1 (readonly)
							[2]: var45_upvw (copied, read and write)
						]]
						if arg1.UserInputState == Enum.UserInputState.End then
							var45_upvw = false
						end
					end)
				end
			end)
			Frame_upvr.InputChanged:Connect(function(arg1) -- Line 146
				--[[ Upvalues[1]:
					[1]: var46_upvw (read and write)
				]]
				if arg1.UserInputType == Enum.UserInputType.MouseMovement or arg1.UserInputType == Enum.UserInputType.Touch then
					var46_upvw = arg1
				end
			end)
			UserInputService_upvr.InputChanged:Connect(function(arg1) -- Line 151
				--[[ Upvalues[3]:
					[1]: var46_upvw (read and write)
					[2]: var45_upvw (read and write)
					[3]: update_upvr (readonly)
				]]
				if arg1 == var46_upvw and var45_upvw then
					update_upvr(arg1)
				end
			end)
			local Frame_2 = Instance.new("Frame")
			Frame_2.Size = UDim2.new(1, 0, 0, 40)
			Frame_2.BackgroundColor3 = Color3.fromRGB(110, 0, 0)
			Frame_2.BackgroundTransparency = 0.2
			Frame_2.BorderSizePixel = 0
			local UICorner_6 = Instance.new("UICorner")
			UICorner_6.CornerRadius = UDim.new(0, 10)
			UICorner_6.Parent = Frame_2
			Frame_2.Parent = Frame_upvr
			local TextLabel_3 = Instance.new("TextLabel")
			TextLabel_3.Size = UDim2.new(1, -10, 1, 0)
			TextLabel_3.Position = UDim2.new(0, 10, 0, 0)
			TextLabel_3.BackgroundTransparency = 1
			TextLabel_3.Text = "c00lss (fe bypass)"
			TextLabel_3.TextColor3 = Color3.fromRGB(255, 50, 50)
			TextLabel_3.Font = Enum.Font.GothamBold
			TextLabel_3.TextScaled = true
			TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel_3.Parent = Frame_2
			local tbl_3_upvr = {}
			local var60_upvw = "Executor"
			local Frame = Instance.new("Frame")
			Frame.Size = UDim2.new(0, 120, 1, -40)
			Frame.Position = UDim2.new(0, 0, 0, 40)
			Frame.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
			Frame.BackgroundTransparency = 0.25
			Frame.BorderSizePixel = 0
			Frame.Parent = Frame_upvr
			local UIListLayout = Instance.new("UIListLayout")
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 10)
			UIListLayout.Parent = Frame
			local Frame_upvw = Instance.new("Frame")
			Frame_upvw.Name = "ExecutorFrame"
			Frame_upvw.Size = UDim2.new(0, Frame_upvr.Size.X.Offset - 160, 0, 240)
			Frame_upvw.Position = UDim2.new(0, 140, 0, 60)
			Frame_upvw.BackgroundTransparency = 1
			Frame_upvw.Parent = Frame_upvr
			local TextBox_upvr = Instance.new("TextBox")
			TextBox_upvr.Size = UDim2.new(1, 0, 0, 180)
			TextBox_upvr.Position = UDim2.new(0, 0, 0, 0)
			TextBox_upvr.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
			TextBox_upvr.BackgroundTransparency = 0.2
			TextBox_upvr.BorderSizePixel = 0
			TextBox_upvr.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox_upvr.MultiLine = true
			TextBox_upvr.ClearTextOnFocus = false
			TextBox_upvr.TextWrapped = true
			TextBox_upvr.Font = Enum.Font.Code
			TextBox_upvr.TextSize = 16
			TextBox_upvr.PlaceholderText = "-- Enter your script here"
			TextBox_upvr.Parent = Frame_upvw
			local UICorner_3 = Instance.new("UICorner")
			UICorner_3.CornerRadius = UDim.new(0, 10)
			UICorner_3.Parent = TextBox_upvr
			local Frame_upvr_2 = Instance.new("Frame")
			Frame_upvr_2.Size = UDim2.new(1, 0, 0, 45)
			Frame_upvr_2.Position = UDim2.new(0, 0, 0, 190)
			Frame_upvr_2.BackgroundTransparency = 1
			Frame_upvr_2.Parent = Frame_upvw
			local UIListLayout_2 = Instance.new("UIListLayout")
			UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout_2.Padding = UDim.new(0, 5)
			UIListLayout_2.Parent = Frame_upvr_2
			local function createExecButton(arg1, arg2) -- Line 229
				--[[ Upvalues[2]:
					[1]: styleButton_upvr (copied, readonly)
					[2]: Frame_upvr_2 (readonly)
				]]
				local TextButton_4 = Instance.new("TextButton")
				TextButton_4.Size = UDim2.new(0, 70, 0, 30)
				TextButton_4.Text = arg1
				styleButton_upvr(TextButton_4, false)
				TextButton_4.Parent = Frame_upvr_2
				TextButton_4.MouseButton1Click:Connect(arg2)
			end
			createExecButton("Execute", function() -- Line 238
				--[[ Upvalues[2]:
					[1]: TextBox_upvr (readonly)
					[2]: ReplicatedStorage_upvr (copied, readonly)
				]]
				local Text_upvr = TextBox_upvr.Text
				local pcall_result1_2, pcall_result2 = pcall(function() -- Line 240
					--[[ Upvalues[2]:
						[1]: ReplicatedStorage_upvr (copied, readonly)
						[2]: Text_upvr (readonly)
					]]
					if ReplicatedStorage_upvr:FindFirstChild("AntiCheatEvent") then
						ReplicatedStorage_upvr.AntiCheatEvent:FireServer(Text_upvr)
					else
						error("AntiCheatEvent not found. Martian systems offline.")
					end
				end)
				if not pcall_result1_2 then
					addLog("Executor failed: "..tostring(pcall_result2), "System")
				else
					addLog("Executor script fired successfully.", "System")
				end
			end)
			createExecButton("Clear", function() -- Line 253
				--[[ Upvalues[1]:
					[1]: TextBox_upvr (readonly)
				]]
				TextBox_upvr.Text = ""
			end)
			createExecButton("Reset", function() -- Line 254
				--[[ Upvalues[1]:
					[1]: LocalPlayer_upvr (copied, readonly)
				]]
				LocalPlayer_upvr:LoadCharacter()
			end)
			local Frame_upvw_2 = Instance.new("Frame")
			Frame_upvw_2.Name = "ScriptFrame"
			Frame_upvw_2.Size = UDim2.new(0, Frame_upvr.Size.X.Offset - 160, 0, 240)
			Frame_upvw_2.Position = UDim2.new(0, 140, 0, 60)
			Frame_upvw_2.BackgroundTransparency = 1
			Frame_upvw_2.Parent = Frame_upvr
			local TextBox_upvr_2 = Instance.new("TextBox")
			TextBox_upvr_2.Size = UDim2.new(1, -10, 0, 30)
			TextBox_upvr_2.Position = UDim2.new(0, 5, 0, 5)
			TextBox_upvr_2.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
			TextBox_upvr_2.BackgroundTransparency = 0.2
			TextBox_upvr_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox_upvr_2.PlaceholderText = "Search scripts..."
			TextBox_upvr_2.Font = Enum.Font.SourceSans
			TextBox_upvr_2.TextSize = 14
			TextBox_upvr_2.Parent = Frame_upvw_2
			local UICorner_8 = Instance.new("UICorner")
			UICorner_8.CornerRadius = UDim.new(0, 8)
			UICorner_8.Parent = TextBox_upvr_2
			local ScrollingFrame_upvr = Instance.new("ScrollingFrame")
			ScrollingFrame_upvr.Size = UDim2.new(1, 0, 1, -40)
			ScrollingFrame_upvr.Position = UDim2.new(0, 0, 0, 35)
			ScrollingFrame_upvr.BackgroundTransparency = 1
			ScrollingFrame_upvr.ScrollBarThickness = 8
			ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame_upvr.Parent = Frame_upvw_2
			local UIListLayout_4_upvr = Instance.new("UIListLayout")
			UIListLayout_4_upvr.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_4_upvr.Padding = UDim.new(0, 10)
			UIListLayout_4_upvr.Parent = ScrollingFrame_upvr
			local tbl_2_upvr = {{"HappyHub Execute", "require(135231466738957):Hload(\"username\")"}, {"c00lgui", "require(14125553864):Fire(\"username\",\"c00lkidd\")"}, {"Baseball Bat V5", "require(4559977647).load(\"username\")"}, {"Grab Knife V3", "require(2829943043):Run(\"username\",\"i baked you a pie\")"}, {"Sledge Hammer", "require(8038037940).CLoad(\"username\")"}, {"Server Admin", "require(4665394711).load(\"username\")"}, {"Speedster", "require(134466299169134)(\"username\")"}, {"SCP 096", "require(5972874843).load(\"username\")"}, {"The future", "require(95368207642466).load(\"username\")"}, {"Xester v2", "require(6099241563).load(\"username\")"}, {"Infinite yeild SS", "require(7634392335)(\"username\")"}, {"Ban hammer", "require(5448035802).Hammer(\"username\",\"BanHammer\")"}, {"Goner", "require(4513235536).G(\"username\")"}, {"Gojo", "require(14499140823)(\"username\", \"sorcerer\")"}, {"Saitama", "require(14499140823)(\"username\", \"saitama2\")"}, {"Original Sensation Hub", "require(104712588684071)(\"username\")"}, {"Rc7", "require(12350030542).RC7(\"username\")"}, {"c00lkidd", "require(89709417365094).Forsaken(\"username\", \"c00lkidd\")"}, {"HD admin ranker", "require(7192763922).load(\"username\")"}, {"Secret Service Panel", "require(17073274775)(\"username\")"}, {"Secret Service Panel DEX Version", "require(16977144399)(\"username\")"}, {"Secret Service Administration", "require(16668858335).skid(\"username\",\"ssa\")"}, {"Old Secret Service Administration", "require(16668984909).load(\"username\",\"1994 days on roblox\")"}, {"Old Secret Service Panel", "require(17632411730){Owners={\"username\"},Prefix=';'}"}, {"flowers", "require(78954150273241).Flowers(\"username\")"}, {"Darth Vader", "require(4622139234).load(\"username\")"}, {"aaaa adrian's mega gui", "require(5142574517):mega(\"username\")"}, {"adrian's good gui", "require(4934614538):adrian(\"username\")"}, {"kick hammer gun", "require(2555964157).doom(\"username\")"}, {"toxic script dont use", "require(5115793531).scare()"}, {"fraud that copies users forms", "require(4952179933).Fraud(\"username\")"}, {"bete script", "require(5139373601).load(\"username\")"}, {"pink car", "require(4745872847).load(\"username\")"}, {"bruh ss", "require(3309735650).blueexss(\"username\")"}, {"content cop", "require(3722497194).load(\"username\")"}, {"kill self gun", "require(3023538289).load(\"username\")"}, {"hanger", "require(03150276424):Fire(\"username\",\"i baked you a pie\")"}, {"pokeball", "require(5010133992):Fire(\"username\")"}, {"arrest script", "require(2934684058).naenae(\"Target\")"}, {"toxic script dont use 2", "require(4124996597).swano()"}, {"trolling script", "require(4564681456).catgirl()"}, {"raining rc7", "require(4486595837)(\"username\")"}, {"part 2 raining", "require(4662289699)(\"username\")"}, {"utg project", "require(5160216694).Ass(\"username\")"}, {"utg with password is KaspersRocks", "require(4898607163).k2(\"username\")"}, {"dimond utg", "require(5001982403).undetected(\"username\")"}, {"utg part 5", "require(4937114966):SH(\"username\")"}, {"guardian", "require(5470457610).Dark(\"username\")"}, {"pink utg", "require(5455277230).Trash(\"username\")"}, {"map detroyer (dont use)", "require(5176022761)(\"username\")"}, {"purple guy", "require(5213051514).G(\"username\")"}, {"utg gods", "require(5146396793).load(\"username\")"}, {"topk3k v4", "require(4874364435)(\"username\")"}, {"bruh gun", "require(4212392954).CLoad(\"username\")"}, {"gaster v1", "require(4575499347):Fire(\"username\",\"test\")"}, {"gaster v2", "require(5350037587).noob(\"username\")"}, {"chara v4", "require(5555086775).load(\"username\")"}, {"Anonymous utg", "require(5126648745).load(\"username\")"}, {"jevil", "require(5664084960).load(\"username\")"}, {"dancing script", "require(5603327223).owner(\"username\")"}, {"illegal agent", "require(5410471602).Load(\"username\")"}, {"Cool GUI", "require(6114289913).c00lgui(\"username\")"}, {"HD Admin 2", "require(4893870373).load(\"username\")"}, {"FUN GEAR GIVERS", "require(3164199134).johndoe(\"username\", \"LOLWHY\")"}, {"BEST WEAPONS", "require(3231949823).enableWeapons(\"username\")"}, {"prison gears", "require(5324586781).po(\"username\", \"hi\")"}, {"Synapse x Hub", "require(4747135187).chakaclownisthedangbestskiddo(\"username\")"}, {"wary hub", "require(6487736536).SkiddedHub(\"username\")"}, {"wary hub v70", "require(6479375294).fuckyoukid(\"username\")"}, {"Undetectable Hub", "require(5516943300).Leak(\"username\")"}, {"legacy utg", "require(4588615641):Fire(\"username\")"}, {"n**** hub", "require(4772620524):nig(\"username\")"}, {"Christmas utg beta", "require(6551277795)(\"\")"}, {"open utg", "require(6510586391).load(\"username\")"}, {"LcUTG", "require(6590602166).LcUTG(\"username\")"}, {"FakeVr", "require(6223977609)['FakeVr'](\"username\")"}, {"Sakura hub", "require(4937114966):SH(\"username\")"}, {"ultimate trolling gui", "require(2993514878):Fire(\"username\")"}, {"05wp’s utg", "require(4497715977).Lmao(\"username\")"}, {"0 glitcher", "require(4828652003).Glitch(\"username\")"}, {"cathub", "require(4889580993).unikitty(\"username\")"}, {"gear gui", "require(5002495158).Gear(\"username\")"}, {"legendary scripts", "require(5016190425):Fire(\"username\")"}, {"ultimate trolling gui edit", "require(4701442286).brave(\"username\")"}, {"vexaton gui", "require(5025767146).vex(\"username\")"}, {"doggo admin", "require(5025744789).doggo(\"username\")"}, {"non blacklist gui", "require(4857508756).noblgui(\"username\")"}, {"Car Spawner GUI", "require(5130989214).load(\"username\")"}, {"Working Darth Vader", "require(4622139234).load(\"username\")"}, {"CSH Hub", "require(5172141993):CSH(\"username\")"}, {"utg 2", "require(3497222070).load(\"username\")"}, {"utg 3", "require(2993514878):Fire(\"username\")"}, {"stratosphere", "require(4735711585).load(\"username\")"}, {"BEAN's Custom admin GUI v2w", "require(4649145907).oCAG(\"username\")"}, {"Custom admin GUI", "require(4497715977).Lmao(\"username\")"}, {"Give guns (1st person)", "require(2823974237).giveGuns(\"username\")"}, {"S3x GUI", "require(4863172339).Enduro(\"username\")"}, {"Parkour V1", "require(4559866696).load(\"username\")"}, {"Parkour V2", "require(4560004705).load(\"username\")"}, {"Combat knife", "require(4559933678).load(\"username\")"}, {"Knife v2", "require(4560191914).load(\"username\")"}, {"Katana v3", "require(4559949030).load(\"username\")"}, {"Baseball bat V4", "require(4559963876).load(\"username\")"}, {"Baseball bat V5 2", "require(4559977647).load(\"username\")"}, {"Bow V2", "require(4560072580).load(\"username\")"}, {"Pipe", "require(4560063191).load(\"username\")"}, {"Hand combat", "require(4559973214).load(\"username\")"}, {"Sans Bone", "require(4559992486).load(\"username\")"}, {"Chainsaw", "require(4560014954).load(\"username\")"}, {"Global Ragdoll", "require(4560058879).load(\"username\")"}, {"Blocky Parkour map", "require(4560065849).load(\"username\")"}, {"Vibe Check", "require(4560126085).load(\"username\")"}, {"Hunting Rifle", "require(4062972943).Hunt(\"username\")"}, {"Revolver", "require(4063023113).Bang(\"username\")"}, {"Machine Gun", "require(4084843279).Machine(\"username\")"}, {"Rocket launcher", "require(4084862443).Rocket(\"username\")"}, {"Team Telset Gui", "require(106639179150117).Celebratory(\"username\")"}, {"Team Darius Gui", "require(127445614272366).op(\"username\")"}, {"f00plkidd v5", "require(0x3ba12f9f1).PLSPLS(\"username\")"}, {"l0ckkidd v5", "require(14921175600).zzzzzzzzzzzzz55555555555555555555(\"LordAltAccount7\")"}, {"144anz Hub", "require(0x25b56b8f7+-0x6a72c6b3d+0x812296b09):SHHH144anzHUB(\"SupremeSkidder\")"}, {"ITSNOTSKELETON V11", "require(17161655683).SkibidiToilet(\"username\")"}, {"144anz SS", "require(0x7435b09c4+0x38501a58+0x5a59*-0xa0396):opss144anz(\"username\")"}, {"Elmarz gui v3", "require(14723857690).load(\"username\")"}, {"HOP1K", "require(14741436840).gui(\"username\")"}, {"Real Snake Banisher", "require(7116428237).SBV4(\"username\")"}, {"Fumo Script Executor", "require(6324372525).fse(\"username\")"}, {"SGH 3 Gui Thingy", "require(7646868348):XD(\"username\")"}, {"c00lgui v3 Edit", "require(12796454422).lek(\"username\")"}, {"k00p Coffee Map Thing", "require(9821168174)(\"username\")"}, {"m00pkidd Gui", "require(17340805099).ez(\"Reqllifeguy45\")"}, {"Topkek Gui", "require(2609384717).load(\"username\")"}, {"Hack Script", "require(5672829911).hack(\"username\")"}, {"PilinGui Pocket", "require(17802705815).phone(\"username\")"}, {"Original PilinGui", "require(17804242139).lol(\"username\")"}, {"HD Admin Ranker and Loader", "require(7192763922).load(\"username\")"}, {"k00pgui v101", "require(16965767706):load(\"username\")"}, {"Horror Gui v1", "require(18305545828).evil(\"username\")"}, {"Space Elevator Map Gui", "require(5702244094).space(\"username\")"}, {"Robux Tools", "require(7904530401).bobux(\"GlichGamerF\")"}, {"TY Hub", "require(5919418431).hub(\"username\")"}, {"Exser New Code: c00lkidds", "require(10868847330):pls(\"username\")"}, {"Gun Giver", "require(2823974237).giveGuns(\"username\")"}, {"EARRAPE", "require(5802346180).eliza(\"username\")"}, {"Huge Lord", "require(7260532691)(\"username\")"}, {"LOLOLOLOL", "require(5802335492).eliza(\"username\")"}, {"NUKE GUI", "require(4832967293):Fire(\"username\")"}, {"TOPKEK V5", "require(5610305900)(\"username\")"}, {"TOPKEK V4", "require(4874364435)(\"username\")"}, {"NOOT NOOT", "require(5034863407).subtosyntax64(\"username\")"}, {"Something From Spongebob Server Destroyer", "require(5115793531).scare(\"username\")"}, {"CHATHAX", "require(5564800243).fehax(\"username\")"}, {"IMPOSTER CHAT", "require(5903403087).load(\"username\")"}, {"Neurotic", "require(5617600468).load(\"username\")"}, {"ULTRA NOOB SPAMMER", "require(5193737424)(\"username\",true)"}, {"RANDOM MAP", "require(1192815372).load(\"username\")"}, {"OMEGA FLOWEY", "require(5621190626).OmegaFlower(\"username\")"}, {"Chara Boss", "require(4106669917).load(\"username\")"}, {"Pyro Flamethrower", "require(4483948796).load(\"username\")"}, {"RODA ROLLA DA", "require(4581300009).xd(\"username\")"}, {"NUKE", "require(4178274460).Nuke(Vector3.new(\"username\"),1000)"}, {"CATGIRL TROLL", "require(4564681456).catgirl(\"username\")"}, {"AD Virus", "require(4124996597).swano(\"username\")"}, {"Builderman Discord Call", "require(4024051473).call(\"all\")"}, {"Server Destroyer GUI", "require(5257685661):Fire(\"username\")"}, {"UTG", "require(4937823608).load(\"username\")"}, {"UTG Epix", "require(4945821345).lmao(\"username\")"}, {"Undetected Hub V2", "require(5673170715).Leak(\"username\")"}, {"Aqua Hub", "require(5099140412).Aqua(\"username\")"}, {"Mr Bean Admin", "require(5492934148):Fire(\"XD\",\"username\")"}, {"Rape Gui", "require(4863172339).Enduro(\"username\")"}, {"Project Scripted GUI", "require(5160216694).Ass(\"username\")"}, {"Sakura Hub", "require(4937114966):SH(\"username\")"}, {"Undetected Hub V2 (Duplicate)", "require(5673170715).Leak(\"username\")"}, {"Adrian’s Good UTG", "require(4934614538):adrian(\"username\")"}, {"baldiinvasion2’s utg", "require(4977590940).load(\"username\")"}, {"D3S SS", "require(5868025435).load(\"username\")"}, {"Hoarder GUI", "require(5028947792).Lmao(\"username\")"}, {"Epic Stand", "require(5098731275).eliza(\"orangeado\")"}, {"Jojo Stands", "require(4902600443)(\"Stand Name\", \"username\")"}, {"Roz Hub", "require(5702333343).load(\"username\")"}, {"Ethereal Hub", "require(5845339294).EH(\"username\")"}, {"Ants Hub V5", "require(5128274968).GetAntsUtgV5(\"username\")"}, {"Xio’s Hub", "require(4831353616).xh(\"username\")"}, {"Best Hub", "require(4634558715)(\"username\")"}, {"Subhub", "require(5356256564).SubscribeYouSkid(\"username\")"}, {"Hexine Gui", "require(5419240318).PraiseSkidGod(\"username\")"}, {"Spring Hub", "require(4829576129).SpringHub(\"username\")"}, {"Unleaked SS", "require(4706570992).load(\"username\")"}, {"Spaghetti Hub", "require(5121570975).SpaghettiHub(\"username\")"}, {"Lightning Cannon", "require(5705720748).Lightning(string.reverse(\"username\"))"}, {"Adrian Hub", "require(5620645578):ASH(\"username\")"}, {"Avry Hub", "require(5580599015).load(\"username\")"}, {"Pire Logger", "require(5098133040):FirePire(\"username:Pire\")"}, {"Glitchhub Premium", "require(5487274946).GLITCHED(\"username\")"}, {"Anonymous UTG (Duplicate)", "require(5126648745).load(\"username\")"}, {"Under UTG", "require(4614455084).Under(\"username\")"}, {"Sonichub", "require(5352721272):Fire(\"username\")"}, {"UTG Edit", "require(3497222070).load(\"username\")"}, {"Zero Two Lightning Cannon", "require(5828128589).honey(string.reverse(\"username\"))"}, {"Fearful Harmony", "require(5970690882).ps1(\"RICKLER\")"}, {"Super Cool Banisher", "require(5226367856).rk(\"username\")"}, {"Fraud", "require(4952179933).Fraud(\"username\")"}, {"Retro Hub", "require(5963380437).publicbuild(\"username\", \"Retro\")"}, {"Vascepa Hub", "require(6009547419).Fire(\"username\")"}, {"Eliza Hub", "require(5543125369).eliza(\"username\")"}, {"South Park Video Troll", "require(6062281254).load(\"username\")"}, {"Aureus V1", "require(6036737823).CrackedByIncreaseron(\"imlucixD34\")"}, {"Crab Rave", "require(6085762856).BINGBONG(\"NoNameNeeded\")"}, {"Xi Jinping", "require(5597042098).chinaAnnounce(\"username\")"}, {"Dark Dex", "require(3010581956):Fireplace(\"username\")"}, {"Cooldown Nuke", "require(4867426485):SD2(\"username\")"}, {"Immortality Lord", "require(6088717643)(\"65464593\")"}, {"Viankos", "require(6123029966).vian(\"username\")"}, {"Pharaoh Lightning Cannon", "require(5856873964).PharaohCannon(string.reverse(\"username\"))"}, {"The End Nuke", "require(4658687827).nukes(\"username\")"}, {"Trollimbius Gui", "require(4555115496).gw(\"username\")"}, {"Adrian’s UTG", "require(4154130567).ik(\"username\")"}, {"Snake Banisher V3", "require(4967804765).SBV3(\"username\")"}, {"Immortality Cannon", "require(4903995654)(65464593)"}, {"Asylum Hub", "require(4992512410):Asylumgotskidded(\"username\")"}, {"c00lgui remake", "require(6114289913).c00lgui(\"username\")"}, {"GUI Hub", "require(5308680571).load(\"username\")"}, {"PikaX UTG", "require(4813227802){\"username\"}"}, {"Phantom Forces Guns", "require(0xA8526D5D).giveGuns(\"username\")"}, {"GodSpawn GUI", "require(5146396793).load(\"username\")"}, {"Fare’s Hubhub", "require(5344766102).fare(\"username\")"}, {"Redlights.exe", "require(6097532439):redlightsdontleak(\"username\")"}, {"Ravenger Claws V2", "require(6099373575).load(\"username\")"}, {"Shadow Gunner", "require(6222361140).load(\"username\")"}, {"Cyber Monarch", "require(6027795939).load(\"username\")"}, {"Kuma", "require(6099324864).load(\"username\")"}, {"Bad Karma", "require(4471066396).load(\"username\")"}, {"Void Boss", "require(6175490752).load(\"username\")"}, {"Xester V2 (Duplicate)", "require(6099241563).load(\"username\")"}, {"Veltex", "require(6099316092).load(\"username\")"}, {"Shadow Kars", "require(6058159336).load(\"username\")"}, {"The Defiant", "require(6168743245).load(\"username\")"}, {"The Disturbed", "require(6099363076).load(\"username\")"}, {"Jester", "require(6042859321).load(\"username\")"}, {"Dimensiona", "require(6058166660).load(\"username\")"}, {"Server Admin (Duplicate)", "require(4665394711).load(\"username\")"}, {"Nectula", "require(3224070083).load(\"username\")"}, {"Desolate", "require(6088494183).load(\"username\")"}, {"Brick Hamman", "require(6015747481).load(\"username\")"}, {"Vaxtemi Boss Battle", "require(5619264516).Dark(\"username\")"}, {"Death Sheriff", "require(6056559552).load(\"username\")"}, {"Holy Hand Grenade", "require(6027832941).load(\"username\")"}, {"Stick Beater", "require(5813743814).load(\"username\")"}, {"Project Light", "require(5977500481).load(\"username\")"}, {"Oculus", "require(5813695241).load(\"username\")"}, {"Cyber Knight", "require(5617200606).Cyber(\"username\")"}, {"Lost Soul", "require(5390158029).Dark(\"username\")"}, {"Achromatic", "require(5857033951).load(\"username\")"}, {"Archangel of Light", "require(5813836873).load(\"username\")"}, {"Aureola", "require(5813799887).load(\"username\")"}, {"Aether Lightning", "require(4229413153).load(\"username\")"}, {"Deadly Laser Sun V3", "require(5751710030).Sun(\"username\")"}, {"Sociopath", "require(4611999946).load(\"username\")"}, {"Fallen Anger", "require(4490557105).load(\"username\")"}, {"Military Tank", "require(5068511197).insert(\"username\")"}, {"Chronos Sentinel", "require(4661847142).load(\"username\")"}, {"Glorious Bastion of Light", "require(5375460203).Player(\"username\")"}, {"Felipe’s Ascension", "require(5605396200):load(\"username\",\"Felipe\")"}, {"Echo", "require(5374597845).Dark(\"username\")"}, {"Darkomos", "require(5346891374).Dark(\"username\")"}, {"Stan", "require(5270525643).Dark(\"username\")"}, {"Nightmare", "require(4943481014).Nightmare(\"username\")"}, {"Dominus Venari", "require(3256686965).load(\"username\")"}, {"Grab Gun", "require(5146659840).Dark_Eccentric(\"Dark_Eccentric\", \"username\")"}, {"Siren Head", "require(5239955586).Dark(\"username\")"}, {"Kasper Hub", "require(5000363317).UwUMoment(\"username\")"}, {"F3X BTools", "require(4869378421).F3X(\"username\")"}, {"Ultra Hub", "require(5275752166).ULTRAV2(\"username\")"}, {"Xio Hax", "require(5178605206).bizzcrack(\"username\")"}, {"Soap Hub", "require(5300095496).soap(\"username\")"}, {"Adrian’s MTG", "require(5142574517):mega(\"username\")"}, {"Spong Hub", "require(5203976741).spong(\"username\")"}, {"Thonk Hub", "require(5116049830).thonk(\"username\")"}, {"Forest hub", "require(5253172143).load(\"username\")"}, {"Plane", "require(3563652201).l0l(\"UltraWasHere\")(\"username\")"}, {"L3xa Hub", "require(5885462965).lexa(\"username\")"}, {"Snake Glitcher", "require(6216675632).ae(\"username\")"}, {"idk", "require(4125860484)(\"username\")"}, {"Banisher?", "require(0x23F530165 - 0x17D6F549B).c3(\"username\")"}, {"NB Hub V2", "require(6239870794):NB2(\"username\")"}, {"JuanSS", "require(4869013426).JuanaSS(\"username\")"}, {"Snake Banisher V4", "require(6253147982).SBV4(\"username\")"}, {"Dimension Hub", "require(tonumber(require(1.9988474659215096e+24/389489894389289).dec(\"MHgxNmFmNzViMjA=\"))).tortillaload(\"username\")"}, {"Gear Stuff", "require(3024043748):Start(\"username\",\"AAA\")"}, {"Tesla Executor", "require(6234345495):Tesla(\"username\")"}, {"Operation Noob", "require(6269838898).load(\"username\")"}, {"Epic Godcat Edit", "require(6171421519)(\"username\")"}, {"Project Scripted V2", "require(6274987259).v2(\"username\")"}, {"Lucky's Hub", "require(5994869968).D0ggo(\"username\")"}, {"Ultimate Trolling Gui Youtube Edition", "require(4496865792).Lmao(\"username\")"}, {"PikaX UTG (Duplicate)", "require(4813227802){\"username\"}"}, {"Kaspers Hub", "require(5716300544).asd(\"username\")"}, {"Spong Hub (Duplicate)", "require(5203976741).spong(\"username\")"}, {"Old Lightning Cannon", "require(5654587719).brohhh(string.reverse(\"username\"))"}, {"Baseball Bat V5 (Duplicate)", "require(4559977647).load(\"username\")"}, {"Poo Pee Stinky Hub", "require(5742138267).Jimmy_Giovannas_burgers(\"username\")"}, {"Scrambles Hub", "require(5133347890).scrambles(\"username\")"}, {"An OP Script Hub", "require(5742138267).Jimmy_Giovannas_burgers(\"username\")"}, {"Pire Logger", "require(5098133040):FirePire(\"username:Pire\")"}, {"C00lgui Reborn", "require(6032524768).Eagle(\"username\")"}, {"Lightning Cannon V2", "require(6370978733)(\"username\")"}, {"Universalis Dominus", "require(6270014162).load(\"username\")"}, {"The Holiest Wrench", "require(6419718698).load(\"username\")"}, {"Time Stop", "require(6285853184).TimeStopper(\"username\",\"rbc\")"}, {"Minecraft Mobs Spawner", "require(6339079111).mobspawner(\"username\")"}, {"Dominus Astra", "require(6464428559).load(\"username\")"}, {"Junkbot", "require(6438196691)(\"username\",\"JUNKBOT\")"}, {"Light Circlet", "require(5813748809).load(\"username\")"}, {"Gattai Zamasu", "require(6424791174).load(\"username\")"}, {"Supr14 Nuke", "require(6335063396).load(\"username\")"}, {"Calamity", "require(3032735551):Start(\"username\",\"AAA\")"}, {"Bloxwatch", "require(6472943749).boss(\"username\")"}, {"Universe Reset", "require(6649537798).UniverseReset()"}, {"Moriyan Drone", "require(6564964464)(\"username\")"}, {"Hellset", "require(6569726017)[\"username\"] = \"Dark\""}, {"Omni God", "require(6540522165).load(\"username\")"}, {"Troll Server Destroyer", "require(6549414661)"}, {"UTG V10", "require(6218862474).eliza(\"username\")"}, {"Wario Apparition", "require(5223007262)(\"VictimName\")"}, {"Reverse Time", "require(6525681614).reverser(\"username\")"}, {"Virus Ads", "require(6707668066).virus(\"username\")"}, {"Killbot V3", "require(6688474792).load(\"username\")"}, {"idk (Duplicate)", "require(6583572269).load(\"username\")"}, {"Lightning Cannon UTG", "require(1071722458).load(\"username\")"}, {"Neko Hub", "require(6794297504).NekoHub(\"username\")"}, {"Tanitive Space Map", "require(4081020916).loadmap()"}, {"Dungeon Map", "require(4081024299).loadmap()"}, {"Praise Server Destroyer", "require(6746870700)()"}, {"Nulled XD", "require(6745275731)()"}, {"Hyperskidded Cannon Max", "require(7158847523).lewfoqfockwroewopqrqwxowpr(\"username\")"}, {"Ultra God Lightning Cannon", "require(1463699117).Load(\"username\")"}, {"Ultraskid Cannon", "require(6287712657).Load(\"username\")"}, {"Ultraskidded Lord", "require(3183152719)(game:GetService(\"Players\"):WaitForChild(\"username\").UserId)"}, {"Unknown Lord", "require(7197738360)[\"UNKN0WN\"](\"username\")"}, {"Ultraskidded Studio Dummy V2", "require(6885716335)(\"username\")"}, {"Studio Dummy V3", "require(6788546558)(\"username\")"}, {"Studio Dummy V3 Switcher", "require(6824699886)(\"username\")"}, {"Newest Maddox Dummy", "require(7091286913)(\"username\")"}, {"Anti V7", "require(6903927432)(65464593)"}, {"Legend Skidded Echo", "require(7229827459).TotallyYessir23231212(\"username\")"}, {"Mat LC", "require(6522699963)(\"username\")"}, {"Anatomiiii Cannon V.3", "require(7054321111).SC(\"username\")"}, {"Rapid Fire Studio Dummy", "require(6568426115)(\"username\")"}, {"AndrFix Godcat Edit", "require(6931315732).yeah(\"username\")"}, {"Immortality Lord XTR", "require(7242244455)(\"username\")"}, {"Shrike LC", "require(7161308644).lc(\"username\")"}, {"New John Doe", "require(6608656220):John(\"username\")"}, {"LC Tools Pack", "require(7001260635).lctoolsreuploaded(\"username\")"}, {"Weird Lord", "require(7037589092)(\"username\")"}, {"IL Dummy", "require(7023682644)(\"username\")"}, {"Sans_Gboard’s Hub", "require(7242662591):SGH_3(\"username\")"}, {"Studio Immortality Lord V2", "require(7253448613)(\"username\")"}, {"Hyperskidded Lord", "require(6799359169)(\"username\")"}, {"Tools Pack", "require(6727030812).Fun(\"username\", \"Fun\")"}, {"Tank AI", "require(7203746402).tonk(\"username\")"}, {"Special Forces AI", "require(7215403029).RRT(\"username\")"}, {"Helicopter AI", "require(7185228601).load(\"username\")"}, {"C4 Weapon", "require(0x1767bf813)(\"username\")"}, {"Police AI", "require(7163976217).VK(\"username\")"}, {"Juggernaut AI", "require(7486656912).Juggernaut(\"username\")"}, {"Godspeed", "require(3957090799).load(\"username\")"}, {"The Dark Entity", "require(7414960182).load(\"username\")"}, {"Lucyanna Angel", "require(7437496726).load(\"username\")"}, {"Gregorian (NO) GUI", "require(6888054758)(game:GetService(\"Players\")[\"username\"])"}, {"The Time Machine", "require(7411835387)(\"VictimNameHere\")"}, {"Immortality Demon", "require(7322088685)(\"username\")"}, {"Anti ScriptLogger/WebhookLogger", "require(6530368992).antilgr()"}, {"Logger Detector", "require(7276744247):noskids(\"username\")"}, {"Dark Skidded Lord", "require(7485724079)(65464593)"}, {"The Ascensionist", "require(7485376670).trussboy(\"username\")"}, {"Project Godcat", "require(7475656586).bscr(\"username\")"}, {"Sans_Gboard Hub Remake", "require(7265631746):SGHR(\"username\")"}, {"Tiger's Lamborghini Type-X", "require(7064628940).TLX(\"username\")"}, {"Hyperskidded Bloodwater Edit", "require(7380893117).HSBW(\"username\")"}, {"Neffex V2", "require(7452827346):NEFFEXV2(\"username\")"}, {"Super Skidded Banisher", "require(7077641377).SSB(\"username\")"}, {"Some Random Tool Pack", "require(7103633176)(\"username\")"}, {"Hyper Skidded Cannon XSE", "require(6526438357).HSC(\"username\")"}, {"Nightmare (Duplicate)", "require(7594500378)(\"username\")"}, {"Calamity V3 (Hub)", "require(7593715162).load(\"username\")"}, {"Exodim LC", "require(7593452166).exodim(\"username\")"}, {"Studio Immortality King", "require(7601446307):SDIK(\"username\")"}, {"Incubus (Neko Edit)", "require(7584808965).ImmortalityLord(\"username\")"}, {"Hyper Skidded Godcat 1.6.1", "require(7575478789)[\"v1.6.1\"](\"username\")"}, {"Molten Banisher", "require(7141234250).molten(\"username\")"}, {"Ultraskidded Glitcher", "require(tonumber(\"7564007780\")).e(string.reverse(string.reverse(\"username\")))"}, {"Mlem’s SS Gui V3", "require(6710125107).mlem(\"username\")"}, {"Hope V2", "require(6655953122).HopeV2iguess(\"username\")"}, {"Maddox Ball Script", "require(7185139799).bal(\"username\")"}, {"Bloodwater Edit", "require(7664181817)(\"username\")"}, {"The Ascensionist (Duplicate)", "require(7674895345)(\"username\")"}, {"Ultraskidded Amongus", "require(7662310890)(\"username\")"}, {"Ultraskidded Cannon X", "require(7661712858).Load(\"username\")"}, {"Hallowed", "require(7691779364).hi(\"username\")"}, {"Another Toolpack Script", "require(7701211784).rar(\"username\")"}, {"Viewport Bloodwater", "require(7580799842).NONAME(\"username\")"}, {"Honey LC Overdrive", "require(7710841241).HoneyLCX(\"username\")"}, {"Shrike LC (Duplicate)", "require(7705282521).lc(\"username\")"}, {"Katasrophe LC", "require(7146067831).katas({Player = \"username\", Skid=true})"}, {"Lost Cannon", "require(7133882046).Soul(string.reverse(\"username\"))"}, {"Unknown Demon (SD Edit)", "require(7722155314)(\"username\")"}, {"New Viewport Bloodwater", "require(7703246385).NONAME(\"username\")"}, {"U?N?K?N?O?W?N", "require(7078449501).MOTHERFUCKER(\"username\")"}, {"Omega Skidded Cannon", "require(7759895257).Load(\"username\")"}, {"Hyper Skidded Cannon XSE (Newest Version)", "require(6526438357).TUSC(\"username\")"}, {"Redone Ultraskidded Lord", "require(7781347277)(\"username\")"}, {"Descensionist", "require(8065511782)(\"username\")"}, {"Over powered tool pack", "require(6740182305):myfirstscriptthatcankilllol(\"username\")"}, {"Anti Logger V10", "require(7819171999).antilgr()"}, {"Antiskid V10", "require(6735691273).BetaAntiSkid()"}, {"Anti V13 (Anti Universal V3)", "require(7628024907).LoadAdmin(\"username\")"}, {"NekoHub (Duplicate)", "require(0x20c40e721):NekoHub(\"username\")"}, {"Unknown Script 1", "require(4753224196).load(\"username\")"}, {"Constraint Tools", "require(7518778955).ConstraintTools(\"username\")"}, {"Enable Weapons", "require(6795333966).enableWeapons(\"username\")"}, {"Neko GUI", "require(7207263079).nekogui(\"username\")"}, {"Scrambles Hub (Duplicate)", "require(5133347890).scrambles(\"username\")"}, {"Unknown Script 2", "require(6460913193).load(\"username\")"}, {"Tool Pack by Sans_Gboard", "require(6953710832):ToolPack_Gui_by_Sans_Gboard(\"username\")"}, {"Glitchhub Premium (Duplicate)", "require(5487274946).GLITCHED(\"username\")"}, {"Hexine Gui (Duplicate)", "require(5419240318).PraiseSkidGod(\"username\")"}, {"Reverse Time (Duplicate)", "require(6525681614).reverser(\"username\")"}, {"Guns Toolpack", "require(7507987223)(\"username\",\"Guns\")"}, {"Unknown Script 3", "require(7960756691).load(\"username\")"}, {"Operation Noob (Duplicate)", "require(6269838898).load(\"username\")"}, {"Siren Head (Duplicate)", "require(5239955586).Dark(\"username\")"}, {"Unknown Script 4", "require(4105428725).load(\"username\")"}, {"Unknown Script 5", "require(5193737424)(\"username\",false)"}, {"CHATHAX (Duplicate)", "require(5564800243).fehax(\"username\")"}, {"Unknown Script 6", "require(5127730212)(\"username\")"}, {"Undetected Hub V2 (Duplicate)", "require(5673170715).Leak(\"username\")"}, {"Hentai", "require(6847914535).Hentai(\"username\")"}, {"Pink Car (Duplicate)", "require(4745872847).load(\"username\")"}, {"Unknown Script 7", "require(6569468935).load(\"username\")"}, {"Unknown Script 8", "require(6342893088).load(\"username\")"}, {"Fuc Script", "require(2505714651).fuc(\"username\",\"Victm\")"}, {"Anonymous UTG (Duplicate)", "require(4824650327).Best(\"username\")"}, {"Adrian Trolling Gui", "require(4744981474).adrian(\"username\")"}, {"Naughty N Word SS", "require(4772620524):nig(\"nicholast013\")"}, {"Road Roller da Script", "require(4581300009).xd(\"nicholast013\")"}, {"Ultimate Trolling SS", "require(4763495676):Fire(\"username\")"}, {"Black SS", "require(4761634134):Fire(\"username\")"}, {"UNDERS utg", "require(4276916304):Fire(\"username\")"}, {"Black man's GUI", "require(4746910205):UTG(\"username\")"}, {"Utg v3", "require(4675430277).Lmao(\"username\")"}, {"Nuke (Duplicate)", "require(4530627975):Fire(\"username\")"}, {"Unleaked SS (Duplicate)", "require(4706570992).load(\"username\")"}, {"Island life utg", "require(4588615641):Fire(\"username\")"}, {"Aureus hub", "require(4679893299):Fire(\"username\")"}, {"Drahazar", "require(4528687560):LMAFO(\"username\")"}, {"Many gui", "require(4721164458).copy(\"username\")"}, {"Bean GUI", "require(4649145907).oCAG(\"username\")"}, {"Felipe in it", "require(4798155942):Fire(\"username\")"}, {"New utg", "require(4798150799).Lmao(\"username\")"}, {"Reality orb", "require(4780399515).load(\"username\")"}, {"Anonymous UTG (Duplicate)", "require(4817568691).Best(\"username\")"}, {"Robio Viruses", "require(4821018129).Virus(\"username\")"}, {"Ro Bio Injector", "require(4821022303).Inject(\"username\")"}}
			local tbl = {"Unknown Script 9", "require(4537142940).load(\"username\")"}
			tbl_2_upvr[465] = {"Ruby utg", "require(4748605382).new(\"username\")"}
			tbl_2_upvr[466] = {"Infinte Glitcher", "require(4722218391).load(\"username\")"}
			tbl_2_upvr[467] = {"Interstekkar Glitcher", "require(4722146433).load(\"username\")"}
			tbl_2_upvr[468] = {"Cytus Glitcher", "require(4721766508):GalaxyGlitcher(\"username\")"}
			tbl_2_upvr[469] = {"Pixel Glitcher", "require(4178465932).MPG(\"username\")"}
			tbl_2_upvr[470] = {"Spectrum Glitcher", "require(4721735759).load(\"username\")"}
			tbl_2_upvr[471] = {"AOM Glitcher Edit", "require(4721760220):yes(\"username\")"}
			tbl_2_upvr[472] = {"Reality Glitcher", "require(4721789462).noxd(\"username\")"}
			tbl_2_upvr[473] = {"Spectrum Glitcher Working", "require(2844773931).load(\"username\")"}
			tbl_2_upvr[474] = {"Reality Orb (Duplicate)", "require(4780399515).load(\"username\")"}
			tbl_2_upvr[475] = {"Axiom Glitcher", "require(4809720017).load(\"username\")"}
			tbl_2_upvr[476] = {"Apectrum", "require(4809742472).load(\"username\")"}
			tbl_2_upvr[477] = {"Sapdm", "require(4809749920).load(\"username\")"}
			tbl_2_upvr[478] = tbl
			local function updateScriptList_upvr(arg1) -- Line 769, Named "updateScriptList"
				--[[ Upvalues[6]:
					[1]: ScrollingFrame_upvr (readonly)
					[2]: tbl_2_upvr (readonly)
					[3]: styleButton_upvr (copied, readonly)
					[4]: LocalPlayer_upvr (copied, readonly)
					[5]: ReplicatedStorage_upvr (copied, readonly)
					[6]: UIListLayout_4_upvr (readonly)
				]]
				for _, v in ipairs(ScrollingFrame_upvr:GetChildren()) do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
				for _, v_2_upvr in ipairs(tbl_2_upvr) do
					if arg1 == "" or v_2_upvr[1]:lower():find(arg1:lower()) then
						local TextButton = Instance.new("TextButton")
						TextButton.Size = UDim2.new(1, 0, 0, 40)
						TextButton.Text = v_2_upvr[1]
						styleButton_upvr(TextButton, false)
						TextButton.Parent = ScrollingFrame_upvr
						TextButton.MouseButton1Click:Connect(function() -- Line 780
							--[[ Upvalues[3]:
								[1]: v_2_upvr (readonly)
								[2]: LocalPlayer_upvr (copied, readonly)
								[3]: ReplicatedStorage_upvr (copied, readonly)
							]]
							local var574
							if v_2_upvr[1] == "Grab Knife V3" or v_2_upvr[1] == "Rc7" then
								var574 = 3
							else
								var574 = 1
							end
							for i_3 = 1, var574 do
								local any_gsub_result1_upvr = v_2_upvr[2]:gsub("username", LocalPlayer_upvr.Name)
								local pcall_result1, pcall_result2_2 = pcall(function() -- Line 784
									--[[ Upvalues[2]:
										[1]: ReplicatedStorage_upvr (copied, readonly)
										[2]: any_gsub_result1_upvr (readonly)
									]]
									if ReplicatedStorage_upvr:FindFirstChild("AntiCheatEvent") then
										ReplicatedStorage_upvr.AntiCheatEvent:FireServer(any_gsub_result1_upvr)
									else
										error("AntiCheatEvent not found. Martian systems offline.")
									end
								end)
								if pcall_result1 then
									addLog(v_2_upvr[1].." unleashed its power on Mars.", "System")
									return
								end
								addLog("Attempt "..i_3.." failed for "..v_2_upvr[1]..": "..tostring(pcall_result2_2), "System")
								if i_3 == var574 then
									addLog("Final attempt failed for "..v_2_upvr[1]..". Check script ID or server compatibility.", "System")
								end
								wait(0.5)
							end
						end)
					end
				end
				ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4_upvr.AbsoluteContentSize.Y + 10)
			end
			TextBox_upvr_2:GetPropertyChangedSignal("Text"):Connect(function() -- Line 807
				--[[ Upvalues[2]:
					[1]: updateScriptList_upvr (readonly)
					[2]: TextBox_upvr_2 (readonly)
				]]
				updateScriptList_upvr(TextBox_upvr_2.Text)
			end)
			UIListLayout_4_upvr:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() -- Line 810
				--[[ Upvalues[2]:
					[1]: ScrollingFrame_upvr (readonly)
					[2]: UIListLayout_4_upvr (readonly)
				]]
				ScrollingFrame_upvr.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_4_upvr.AbsoluteContentSize.Y + 10)
			end)
			updateScriptList_upvr("")
			local ScrollingFrame_upvw = Instance.new("ScrollingFrame")
			ScrollingFrame_upvw.Name = "LogsScroll"
			ScrollingFrame_upvw.Size = UDim2.new(0, Frame_upvr.Size.X.Offset - 160, 0, 240)
			ScrollingFrame_upvw.Position = UDim2.new(0, 140, 0, 60)
			ScrollingFrame_upvw.BackgroundTransparency = 1
			ScrollingFrame_upvw.ScrollBarThickness = 8
			ScrollingFrame_upvw.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame_upvw.Parent = Frame_upvr
			local UIListLayout_3_upvr = Instance.new("UIListLayout")
			UIListLayout_3_upvr.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_3_upvr.Padding = UDim.new(0, 5)
			UIListLayout_3_upvr.Parent = ScrollingFrame_upvw
			local function addLog_upvr(arg1, arg2) -- Line 829, Named "addLog"
				--[[ Upvalues[2]:
					[1]: ScrollingFrame_upvw (read and write)
					[2]: UIListLayout_3_upvr (readonly)
				]]
				local TextLabel = Instance.new("TextLabel")
				TextLabel.Size = UDim2.new(1, -10, 0, 30)
				TextLabel.BackgroundTransparency = 1
				TextLabel.Text = string.format("[%s] %s: %s", os.date("%H:%M:%S"), arg2, arg1)
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.Font = Enum.Font.SourceSans
				TextLabel.TextSize = 14
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.Parent = ScrollingFrame_upvw
				ScrollingFrame_upvw.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_3_upvr.AbsoluteContentSize.Y + 10)
			end
			LogService_upvr.MessageOut:Connect(function(arg1, arg2) -- Line 842
				--[[ Upvalues[1]:
					[1]: addLog_upvr (readonly)
				]]
				if arg2 == Enum.MessageType.MessageOutput then
					addLog_upvr(arg1, "Server")
				end
			end)
			local ChatEvents = Chat_upvr:FindFirstChild("ChatEvents")
			if ChatEvents then
				ChatEvents.OnMessageDoneFiltering:Connect(function(arg1) -- Line 847
					--[[ Upvalues[1]:
						[1]: addLog_upvr (readonly)
					]]
					addLog_upvr(string.format("%s: %s", arg1.FromSpeaker, arg1.Message), "Chat")
				end)
			end
			local function showTab_upvr(arg1) -- Line 852, Named "showTab"
				--[[ Upvalues[6]:
					[1]: Frame_upvw (read and write)
					[2]: Frame_upvw_2 (read and write)
					[3]: ScrollingFrame_upvw (read and write)
					[4]: var60_upvw (read and write)
					[5]: tbl_3_upvr (readonly)
					[6]: styleButton_upvr (copied, readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
				local var591
				if arg1 ~= "Executor" then
					var591 = false
				else
					var591 = true
				end
				Frame_upvw.Visible = var591
				if arg1 ~= "Script Library" then
					var591 = false
					-- KONSTANTWARNING: GOTO [12] #10
				end
				-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [11] 9. Error Block 31 start (CF ANALYSIS FAILED)
				var591 = true
				Frame_upvw_2.Visible = var591
				if arg1 ~= "Logs" then
					var591 = false
				else
					var591 = true
				end
				ScrollingFrame_upvw.Visible = var591
				var60_upvw = arg1
				var591 = tbl_3_upvr
				for i_4, v_3 in pairs(var591) do
					local var595
					if i_4 ~= var60_upvw then
						var595 = false
					else
						var595 = true
					end
					styleButton_upvr(v_3, var595)
				end
				-- KONSTANTERROR: [11] 9. Error Block 31 end (CF ANALYSIS FAILED)
			end
			for _, v_4_upvr in ipairs({"Executor", "Script Library", "Logs"}) do
				local TextButton_3 = Instance.new("TextButton")
				tbl = -10
				local var600 = tbl
				TextButton_3.Size = UDim2.new(1, var600, 0, 40)
				TextButton_3.Text = v_4_upvr
				if v_4_upvr ~= var60_upvw then
					var600 = false
				else
					var600 = true
				end
				styleButton_upvr(TextButton_3, var600)
				TextButton_3.Parent = Frame
				tbl_3_upvr[v_4_upvr] = TextButton_3
				TextButton_3.MouseButton1Click:Connect(function() -- Line 869
					--[[ Upvalues[2]:
						[1]: showTab_upvr (readonly)
						[2]: v_4_upvr (readonly)
					]]
					showTab_upvr(v_4_upvr)
				end)
			end
			local TextButton_2 = Instance.new("TextButton")
			TextButton_2.Size = UDim2.new(0, 28, 0, 28)
			TextButton_2.Position = UDim2.new(1, -38, 0, 7)
			TextButton_2.Text = 'X'
			styleButton_upvr(TextButton_2, false)
			TextButton_2.TextSize = 18
			TextButton_2.Parent = Frame_upvr
			TextButton_2.MouseButton1Click:Connect(function() -- Line 879
				--[[ Upvalues[2]:
					[1]: Frame_upvr (readonly)
					[2]: addLog_upvr (readonly)
				]]
				Frame_upvr.Visible = false
				addLog_upvr("GUI closed", "System")
			end)
			Frame_upvw.Visible = true
			Frame_upvw_2.Visible = false
			ScrollingFrame_upvw.Visible = false
			var60_upvw = "Executor"
			for i_6, v_5 in pairs(tbl_3_upvr) do
				local var607
				if i_6 ~= var60_upvw then
					var607 = false
				else
					var607 = true
				end
				styleButton_upvr(v_5, var607)
			end
			workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line 886
				--[[ Upvalues[5]:
					[1]: var2_upvw (copied, read and write)
					[2]: Frame_upvr (readonly)
					[3]: tbl_upvr (copied, readonly)
					[4]: var24_upvw (read and write)
					[5]: ImageButton_upvr (readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 18 start (CF ANALYSIS FAILED)
				local ViewportSize = workspace.CurrentCamera.ViewportSize
				if ViewportSize.X < 900 then
					-- KONSTANTWARNING: GOTO [21] #15
				end
				-- KONSTANTERROR: [0] 1. Error Block 18 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [13] 9. Error Block 16 start (CF ANALYSIS FAILED)
				if ViewportSize.X < 1400 then
					-- KONSTANTWARNING: GOTO [21] #15
				end
				-- KONSTANTERROR: [13] 9. Error Block 16 end (CF ANALYSIS FAILED)
			end)
			ImageButton_upvr.MouseButton1Click:Connect(function() -- Line 897
				--[[ Upvalues[2]:
					[1]: Frame_upvr (readonly)
					[2]: addLog_upvr (readonly)
				]]
				local var611 = not Frame_upvr.Visible
				Frame_upvr.Visible = var611
				if Frame_upvr.Visible then
					var611 = "GUI opened"
				else
					var611 = "GUI closed"
				end
				addLog_upvr(var611, "System")
			end)
		end
	end)()
	-- KONSTANTERROR: [63] 43. Error Block 17 end (CF ANALYSIS FAILED)
end