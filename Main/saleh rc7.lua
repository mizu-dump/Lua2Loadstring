-- Made by Saleh_RC7
	
	local skyIDs = {
	
	    100444347510003,
	
	    128594278832768,
	
	    129216548949894,
	
	    95685792170648,
	
	    87689901970593,
	
	    108241733999667,
	
	    99206280063557,
	
	    74594506095477,
	
	    131553273037320,
	
	    117092151324069,
	
	    128768056719467,
	
	    102536457846367,
	
	    126906250414866,
	
	    137593485659228,
	
	    119194229566628,
	
	    117195000333274,
	
	    75630607322806,
	
	    115965171362642,
	
	    136968212064229,
	
	}
	
	
	
	local changeInterval = 0.1
	
	
	
	local sky = game.Lighting:FindFirstChildOfClass("Sky")
	
	if not sky then
	
	    sky = Instance.new("Sky")
	
	    sky.Parent = game.Lighting
	
	end
	
	
	
	local sound = Instance.new("Sound")
	
	sound.SoundId = "rbxassetid://136968212064229"
	
	sound.Volume = 5
	
	sound.PlaybackSpeed = 0.20
	
	sound.Looped = true
	
	sound.Parent = game.Lighting
	
	sound:Play()
	
	
	
	local index = 1
	
	while true do
	
	    sky.SkyboxBk = "rbxassetid://"..skyIDs[index]
	
	    sky.SkyboxDn = "rbxassetid://"..skyIDs[index]
	
	    sky.SkyboxFt = "rbxassetid://"..skyIDs[index]
	
	    sky.SkyboxLf = "rbxassetid://"..skyIDs[index]
	
	    sky.SkyboxRt = "rbxassetid://"..skyIDs[index]
	
	    sky.SkyboxUp = "rbxassetid://"..skyIDs[index]
	
	
	
	    index = index + 1
	
	    if index > #skyIDs then
	
	        index = 1
	
	    end
	
	
	
	    wait(changeInterval)
	
	end