local images = {
"rbxassetid://114128626690223",
"rbxassetid://121121601582400",
"rbxassetid://103772438482613",
"rbxassetid://132406330493067",
"rbxassetid://132406330493067",
"rbxassetid://103772438482613",
"rbxassetid://121121601582400",
"rbxassetid://114128626690223"
}
local Spooky = Instance.new("Sound", workspace)
Spooky.Name = "Spooky"
Spooky.SoundId = "rbxassetid://95156028272944"
Spooky.Volume = 10
Spooky.PlaybackSpeed = 0.14
Spooky.Looped = true
Spooky:Play()
local Sky = Instance.new("Sky", game.Lighting)
local function setSky(imageId)
Sky.SkyboxBk = imageId
Sky.SkyboxDn = imageId
Sky.SkyboxFt = imageId
Sky.SkyboxLf = imageId
Sky.SkyboxRt = imageId
Sky.SkyboxUp = imageId
end
setSky(images[1])
while task.wait(0.25) do
for _,img in ipairs(images) do
setSky(img)
task.wait(0.25)
end
end