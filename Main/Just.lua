-- Combined Spread Modifier + Weapon FOV Config (Da Hood / Hood Modded)
-- Works on most Da Hood forks that use the same gun system

getgenv().LPH_NO_VIRTUALIZE = function(f) return f end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- =============================================
-- 1. SPREAD MODIFIER SETTINGS
-- =============================================
getgenv().SpreadConfig = {
    Enabled = true,
    ["Double-Barrel SG"]   = { Multiplier = 0.77 },
    ["TacticalShotgun"]    = { Multiplier = 0.77 },
    ["Shotgun"]            = { Multiplier = 0.90 },
    ["DrumShotgun"]        = { Multiplier = 0.80 },
}

-- =============================================
-- 2. WEAPON-SPECIFIC FOV SETTINGS (for Silent Aim / Triggerbot)
-- =============================================
getgenv().FOVConfig = {
    SilentAim = {
        Default = Vector3.new(301, 301, 301),
        Shotguns = Vector3.new(30, 30, 30),
        Pistols  = Vector3.new(50, 50, 50),
        Others   = Vector3.new(50, 50, 50),
    },
    Triggerbot = {
        Default = Vector3.new(30, 30, 30),
        Shotguns = Vector3.new(5.6, 5.4, 5.2),
        Pistols  = Vector3.new(1.5, 1.8, 1.2),
        Others   = Vector3.new(5, 5, 5),
    }
}

-- Helper: Clean tool name
local function cleanName(name)
    return name:gsub("[%[%]]", ""):gsub("^%s*(.-)%s*$", "%1")
end

-- =============================================
-- SPREAD PATCHER
-- =============================================
local patchedTools = {}

local function applySpreadPatch(tool)
    if not getgenv().SpreadConfig.Enabled then return end
    if patchedTools[tool] then return end

    local clean = cleanName(tool.Name)
    local cfg = getgenv().SpreadConfig[clean]
    if not cfg then return end

    local gunScript = tool:FindFirstChild("GunClientShotgun") or tool:FindFirstChildWhichIsA("LocalScript")
    if not gunScript then return end

    LPH_NO_VIRTUALIZE(function()
        for _, func in ipairs(getgc(true)) do
            if typeof(func) == "function" and islclosure(func) then
                local env = getfenv(func)
                if env and env.script == gunScript then
                    local consts = getconstants(func)
                    for i, v in ipairs(consts) do
                        if typeof(v) == "number" and (v == 0.05 or v == 0.1 or v == 0.15) then
                            setconstant(func, i, v * cfg.Multiplier)
                        end
                    end
                end
            end
        end
    end)()

    patchedTools[tool] = true
end

-- Monitor equipped tools
LocalPlayer.CharacterAdded:Connect(function(char)
    patchedTools = {}
    char:WaitForChild("Humanoid")
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            applySpreadPatch(child)
        end
    end)
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") then applySpreadPatch(tool) end
    end
end)

if LocalPlayer.Character then
    for _, tool in ipairs(LocalPlayer.Character:GetChildren()) do
        if tool:IsA("Tool") then applySpreadPatch(tool) end
    end
end

-- =============================================
-- WEAPON FOV GETTER (use this anywhere in your aimbot)
-- =============================================
local function getCurrentToolName()
    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if not tool then return "None" end
    return cleanName(tool.Name)
end

local function getFOV(forWhat) -- "SilentAim" or "Triggerbot"
    local cfg = getgenv().FOVConfig[forWhat]
    if not cfg then return Vector3.new(50,50,50) end

    local name = getCurrentToolName()
    local isShotgun = name:find("Shotgun") or name:find("Double-Barrel") or name:find("Drum")
    local isPistol  = name:find("Revolver") or name:find("Glock") or name:find("Silencer")

    if isShotgun then
        return cfg.Shotguns
    elseif isPistol then
        return cfg.Pistols
    elseif name ~= "None" then
        return cfg.Others
    else
        return cfg.Default
    end
end

-- Example usage in RenderStepped (you can delete if you already have your own loop)
RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
    local silentFOV = getFOV("SilentAim")
    local triggerFOV = getFOV("Triggerbot")
    -- Use silentFOV / triggerFOV for your hitbox size, FOV circle, etc.
end))
