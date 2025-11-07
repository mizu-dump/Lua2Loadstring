-- Skybox Setup
local s = Instance.new("Sky")
s.Name = "Sky"
s.Parent = game.Lighting

local skyboxID = 115128574905696
s.SkyboxBk = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxDn = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxFt = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxLf = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxRt = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxUp = "http://www.roblox.com/asset/?id="..skyboxID

game.Lighting.TimeOfDay = 12

-- Decal Explosion Function
local decalID = 115128574905696
function exPro(root)
    for _, v in pairs(root:GetChildren()) do
        if v:IsA("Decal") and v.Texture ~= "http://www.roblox.com/asset/?id="..decalID then
            v:Destroy()
        elseif v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.Transparency = 0

            local faces = {"Front", "Back", "Right", "Left", "Top", "Bottom"}
            for _, face in pairs(faces) do
                local dec = Instance.new("Decal", v)
                dec.Face = Enum.NormalId[face]
                dec.Texture = "http://www.roblox.com/asset/?id="..decalID
            end
        end
        exPro(v)
    end
end

exPro(game.Workspace)

-- Particle Emitters on Players
for _, player in pairs(game.Players:GetPlayers()) do
    local torso = player.Character and (player.Character:FindFirstChild("Torso") or player.Character:FindFirstChild("UpperTorso"))
    if torso then
        for i = 1, 3 do
            local pe = Instance.new("ParticleEmitter", torso)
            pe.Texture = "http://www.roblox.com/asset/?id="..decalID
            pe.VelocitySpread = 50
        end
    end
end

-- Remove existing sounds in Workspace
for _, v in pairs(game.Workspace:GetChildren()) do
    if v:IsA("Sound") then
        v:Stop()
        v:Destroy()
    end
end

-- Play new sound
local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://5228173823"
sound.Volume = 10
sound.Looped = true
sound.Pitch = 0.5
sound:Play()

-- Display hint message
local hint = Instance.new("Hint", workspace)
hint.Text = "team8x8x8x8x8 join today!"