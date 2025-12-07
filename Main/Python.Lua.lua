local Url = "http://www.roblox.com/asset/?id=16132491657"
local SoundUrl = "rbxassetid://134479754550271"

local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://1840712882"
Sound.Looped = true
Sound.Parent = game.Workspace
Sound.Volume = 100
Sound.PlaybackSpeed = 0.95
Sound:Play()
Sound.Looped = true

local wow = Instance.new("DistortionSoundEffect")
if wow then
	wow.Enabled = true
	wow.Level = 0.8
	wow.Parent = Sound
end

local workspace = game.Workspace
local faces = {"Front", "Back", "Left", "Right", "Top", "Bottom"}

for i, instance in workspace:GetDescendants() do
	if instance:IsA("Part") then
		local mesh = instance:FindFirstChild("Mesh")
		if mesh then
			mesh.TextureId = Url
		end
		for j, face in faces do
			local decal = instance:FindFirstChild(face .. "Decal")
			if not decal then
				decal = Instance.new("Decal")
				decal.Name = face .. "Decal"
				decal.Face = Enum.NormalId[face]
				decal.Texture = Url
				decal.Parent = instance
			else
				decal.Texture = Url
			end
		end
	end
end

local sky = Instance.new("Sky")
sky.SkyboxBk = Url
sky.SkyboxLf = Url
sky.SkyboxRt = Url
sky.SkyboxUp = Url
sky.SkyboxDn = Url
sky.SkyboxFt = Url
sky.Parent = game.Lighting


for _, omg in pairs(workspace:GetDescendants()) do
	if omg:IsA("Part") then
		omg.Anchored = false
	end
end

local msg = Instance.new("Message", game.Workspace)
msg.Text = "Free Palastine!!!!!"
wait(10)
msg:Destroy()