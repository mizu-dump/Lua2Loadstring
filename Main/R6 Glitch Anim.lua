-- R6 GLITCH MOVEMENT FOR DELTA EXECUTOR
local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

if humanoid.RigType ~= Enum.HumanoidRigType.R6 then return end

-- Obtener juntas R6
local torso = char:WaitForChild("Torso")
local RS = torso:WaitForChild("Right Shoulder")
local LS = torso:WaitForChild("Left Shoulder")
local RH = torso:WaitForChild("Right Hip")
local LH = torso:WaitForChild("Left Hip")
local NK = torso:WaitForChild("Neck")

-- Guardar posiciones originales
local ORS, OLS = RS.C0, LS.C0
local ORH, OLH = RH.C0, LH.C0
local ONK = NK.C0

local rs = game:GetService("RunService")

rs.RenderStepped:Connect(function()
    local speed = humanoid.MoveDirection.Magnitude

    if speed > 0.1 then
        -- WALK GLITCH
        local glitch1 = math.random(-20,20)/100
        local glitch2 = math.random(-20,20)/100
        
        RS.C0 = ORS * CFrame.Angles(glitch1,0,glitch2)
        LS.C0 = OLS * CFrame.Angles(-glitch1,0,-glitch2)
        RH.C0 = ORH * CFrame.Angles(-glitch2,0,glitch1)
        LH.C0 = OLH * CFrame.Angles(glitch2,0,-glitch1)
        NK.C0 = ONK * CFrame.Angles(glitch1/3,0,0)

    else
        -- IDLE GLITCH SUAVE
        local g = math.random(-5,5)/200
        RS.C0 = ORS * CFrame.Angles(g,0,0)
        LS.C0 = OLS * CFrame.Angles(-g,0,0)
        NK.C0 = ONK * CFrame.Angles(g/2,0,0)
    end
end)