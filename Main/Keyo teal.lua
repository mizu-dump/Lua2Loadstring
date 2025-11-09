-- Main controller script

-- Define the first script's code as a function
local function Script1()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Silentaimsc.lua"))()
	for i = 1, 5 do
		print("Script 1 running:", i)
		task.wait(1)
	end
	print("Script 1 finished")
end

-- Define the second script's code as a function
local function Script2()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mizu-dump/Lua2Loadstring/main/Main/Lock.lua"))()
	for i = 1, 5 do
		print("Script 2 running:", i)
		task.wait(0.7)
	end
	print("Script 2 finished")
end

-- Run both scripts at the same time
task.spawn(Script1)
task.spawn(Script2)

print("Both scripts are running!")
