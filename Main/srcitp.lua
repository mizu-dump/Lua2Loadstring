-- JOHN_RIGHT – NPC Hacker Perseguidor
-- Coloque este script dentro do modelo do NPC!

local npc = script.Parent
local humanoid = npc:WaitForChild("Humanoid")
local root = npc:WaitForChild("HumanoidRootPart")
local Players = game:GetService("Players")

-- CONFIGURAÇÕES
local CHASE_RANGE = 40   -- distância para começar a perseguir
local DAMAGE = 10        -- dano por toque
local SPEED = 18         -- velocidade perseguindo

-- CRIAR A MÚSICA DE CHASE
local chaseMusic = Instance.new("Sound")
chaseMusic.Parent = root
chaseMusic.SoundId = "rbxassetid://00000000" -- coloque o id da música aqui
chaseMusic.Volume = 1
chaseMusic.Looped = true
chaseMusic.PlayOnRemove = false
chaseMusic:Play()

-- A música NÃO PARA NUNCA
task.spawn(function()
	while true do
		if not chaseMusic.IsPlaying then
			chaseMusic:Play()
		end
		task.wait(1)
	end
end)

-- PERSEGUIÇÃO
humanoid.WalkSpeed = 0
local chasing = false

local function ChasePlayer(char)
	if chasing then return end
	chasing = true
	humanoid.WalkSpeed = SPEED

	while chasing and char and char:FindFirstChild("HumanoidRootPart") do
		local targetHRP = char.HumanoidRootPart
		local dist = (root.Position - targetHRP.Position).Magnitude

		humanoid:MoveTo(targetHRP.Position)

		-- dá dano quando encosta
		if dist < 3 then
			local h = char:FindFirstChild("Humanoid")
			if h then h:TakeDamage(DAMAGE) end
		end

		task.wait(0.1)
	end
end

local function StopChase()
	chasing = false
	humanoid.WalkSpeed = 0
end

-- LOOP DE DETECÇÃO
while true do
	local nearestChar = nil
	local nearestDist = CHASE_RANGE

	for _, plr in pairs(Players:GetPlayers()) do
		if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local dist = (root.Position - plr.Character.HumanoidRootPart.Position).Magnitude
			if dist < nearestDist then
				nearestChar = plr.Character
				nearestDist = dist
			end
		end
	end

	if nearestChar then
		ChasePlayer(nearestChar)
	else
		StopChase()
	end

	task.wait(0.2)
end