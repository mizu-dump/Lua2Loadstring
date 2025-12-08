_G.isTrollingAllLoop = false
_G.isSlappingAllLoop = false
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
	Name = "⚠️ SS CHAOS ⚠️",
	Icon = "gamepad-2",
	LoadingTitle = "Loading script…",
	LoadingSubtitle = "Ralye Dev Team modified by c00lsc1pter",
	ShowText = "c00lsc1pter",
	Theme = "red ",
	ToggleUIKeybind = "K",
	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
	ConfigurationSaving = { Enabled = false },
	Discord = { Enabled = false },
	KeySystem = false,
})
local Tab = Window:CreateTab("Troll", "gamepad-2")
Tab:CreateButton({
	Name = "Touch All Dissapearing Pads",
	Callback = function()
		for _, v in ipairs(game:GetDescendants()) do
			pcall(function()
				if v.Name == "ì‚¬ë¼ì§€ëŠ” íŒŒíŠ¸" or v.Name == "Gudock" or v.Name == "Gudock2" then
					firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
					firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
				end
			end)
		end
	end,
})
Tab:CreateToggle({
	Name = "SS BREAK PADS",
	CurrentValue = false,
	Callback = function(Value)
		_G.isTrollingAllLoop = Value
	end,
})
Tab:CreateButton({
	Name = "Slap All Players",
	Callback = function()
		for _, obj in ipairs(game:GetDescendants()) do
			if string.find(string.lower(tostring(obj.Name)), "glove") and obj:FindFirstChild("Event") then
				for _, player in ipairs(game.Players:GetPlayers()) do
					if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
						local args = {
							[1] = "slash",
							[2] = player.Character,
							[3] = player.Character.HumanoidRootPart.Position
						}
						pcall(function()
							obj.Event:FireServer(unpack(args))
						end)
					end
				end
			end
		end
	end,
})
Tab:CreateToggle({
	Name = "NUKE SERVER ☢️",
	CurrentValue = false,
	Callback = function(Value)
		_G.isSlappingAllLoop = Value
	end,
})
task.spawn(function()
	while task.wait(0.1) do
		if _G.isTrollingAllLoop then
			for _, v in ipairs(game:GetDescendants()) do
				pcall(function()
					if v.Name == "ì‚¬ë¼ì§€ëŠ” íŒŒíŠ¸" or v.Name == "Gudock" or v.Name == "Gudock2" then
						firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
						firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
					end
				end)
			end
		end

		if _G.isSlappingAllLoop then
			pcall(function()
				for _, obj in ipairs(game:GetDescendants()) do
					if string.find(string.lower(tostring(obj.Name)), "glove") and obj:FindFirstChild("Event") then
						for _, player in ipairs(game.Players:GetPlayers()) do
							if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local args = {
									[1] = "slash",
									[2] = player.Character,
									[3] = player.Character.HumanoidRootPart.Position
								}
								obj.Event:FireServer(unpack(args))
							end
						end
					end
				end
			end)
		end
	end
end)