-- Auto Insert Model 12229824847 with SCRIPTS FULLY ENABLED
-- Made by crazygray4, cleaned & auto-run by me

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local character = player.Character or player.CharacterAdded:Wait()

local enableScripts = true  -- Scripts are now ENABLED

local function smartParent(model)
    	if model:IsA("Tool") then
        		model.Parent = backpack
        		return
    	end
    
    	if model:IsA("ScreenGui") then
        		model.Parent = player:WaitForChild("PlayerGui")
        		return
    	end
    
    	if model:IsA("Accessory") or model:FindFirstChildWhichIsA("Accessory") then
        		model.Parent = character
        		return
    	end
    
    	model:PivotTo(character:GetPivot() * CFrame.new(0, 5, 0))
    	model.Parent = workspace
end

local function safeInsertAndRun(assetId)
    	local success, objects = pcall(game.GetObjects, game, "rbxassetid://" .. assetId)
    	if not success or #objects == 0 then
        		warn("Failed to load model:", assetId)
        		return
    	end
    
    	local original = objects[1]
    	local model = original:Clone()
    	smartParent(model)
    
    	if not enableScripts then
        		for _, obj in model:GetDescendants() do
            			if obj:IsA("LocalScript") or obj:IsA("Script") then
                				obj:Destroy()
            			end
        		end
        		print("Model inserted (scripts disabled):", assetId)
        		return
    	end
    
    	-- === FULL SCRIPT RE-ENABLE SYSTEM (exactly like the original GUI version) ===
    	local cloneMap = {}
    	local function mapChildren(o, c)
        		cloneMap[o] = c
        		for _, child in o:GetChildren() do
            			local cc = c:FindFirstChild(child.Name)
            			if cc then mapChildren(child, cc) end
        		end
    	end
    	mapChildren(original, model)
    
    	local scripts = {}
    	for _, obj in model:GetDescendants() do
        		if obj:IsA("LocalScript") or obj:IsA("Script") then
            			table.insert(scripts, {
                				Class = obj.ClassName,
                				Name = obj.Name,
                				Source = obj.Source,
                				Parent = cloneMap[obj.Parent] or model,
            			})
            			obj:Destroy()
        		end
    	end
    
    	for _, info in scripts do
        		local src = info.Source
        		if not src or #src < 10 then continue end
        
        		local fake = Instance.new(info.Class)
        		fake.Name = info.Name
        		fake.Parent = info.Parent
        		fake.Disabled = true
        
        		local wrapper = [[
        			local script = _G.__FAKE_SCRIPT
        			local Script = script
    		]] .. src

		local loader, err = loadstring(wrapper)
		if not loader then
    			warn("Compile error in", info.Name, ":", err)
    			fake:Destroy()
    			continue
		end

		task.spawn(function()
    			if info.Name:lower():match("regen|respawn|health|heal|init|load") then
        				task.wait(1)
    			end
    
    			local function run()
        				_G.__FAKE_SCRIPT = fake
        				local ok, runErr = pcall(loader)
        				_G.__FAKE_SCRIPT = nil
        				return ok, runErr
    			end
    
    			local ok, runErr = run()
    			if ok then
        				fake.Disabled = false
        				return
    			end
    
    			-- Retry once if it failed because of missing Humanoid/HRP/etc.
    			if tostring(runErr):find("Humanoid") or tostring(runErr):find("HumanoidRootPart") then
        				task.wait(1)
        				ok, runErr = run()
        				if ok then fake.Disabled = false end
    			end
    
    			if not ok then
        				warn("Script failed:", fake.Name, runErr)
    			end
		end)
	end

	print("Model 12229824847 inserted with scripts ENABLED!")
end

-- AUTO INSERT THE MODEL
safeInsertAndRun(12229824847)