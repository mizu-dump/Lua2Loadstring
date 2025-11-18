loadstring(gamelocal Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "ADZ Hub",
    LoadingTitle = "ADZ Hub Loading",
    LoadingSubtitle = "by @Adzz",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = Soupy Hub Folder1, -- Create a custom folder for your hub/game
       FileName = "ADZ hub"
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "ADZ Hub Key",
       Subtitle = "ADZ key loading",
       Note = "K",
       FileName = "ADZ key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"121212"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local MainTab = Window:CreateTab("Universal", nil) -- Title, Image
 local MainSection = MainTab:CreateSection("Universal")

 Rayfield:Notify({
    Title = "Welcome To ADZ Hub",
    Content = "good",
    Duration = 6.5,
    Image = nil,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("The user")
       end
    },
 },
 })


 local Button = MainTab:CreateButton({
   Name = "Infinite Jump","Fly gui" "spam text" "kill all" "troll all" "map hacked" "copy avatars"
   Callback = function()
           --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="ADZ Hub"; Text="bapak mu dpr actived"; Duration=5;})

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

   end,
})


 local Input = MainTab:CreateInput({
   Name = "Speed ðŸƒâ€â™‚ï¸",
   PlaceholderText = "Put Speed Value Here",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text)
   end,
})

 local Input = MainTab:CreateInput({
   Name = "Jump Height ðŸ¦˜",
   PlaceholderText = "Put JumpPower Value Here",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Text)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Destroy The Gui(âš Warningâš )",
    Callback = function()
    Rayfield:Destroy()
   end,
})

local CreditsTab = Window:CreateTab("Credits", nil) -- Title, Image
local CreditsSection = CreditsTab:CreateSection("This Gui Is Made By @Adzz And It Is Still In Beta Development!")
local CreditsSection = CreditsTab:CreateSection("And Check Out This Channel (@1 F0)")

