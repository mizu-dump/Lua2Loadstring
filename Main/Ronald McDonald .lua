local FPS = 60

local TimeFrame = 0

local LastFrame = tick()
local Frame = 1/FPS

game:service'RunService'.Heartbeat:connect(function(s,p)
	TimeFrame = TimeFrame + s
	if(TimeFrame >= Frame)then
		LastFrame=tick()
		TimeFrame=TimeFrame-Frame*math.floor(TimeFrame/Frame)
	end
end)


function swait(dur)
	if(dur == 0 or typeof(dur) ~= 'number')then
		wait()
	else
		for i = 1, dur*FPS do
			wait()
		end
	end
end

-- converter by Drahazar

--created by helkern
--some things might be taken from other scripts

Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
local Character = Player.Character
Humanoid = Character.Humanoid
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
if not Character:FindFirstChild("Torso") then
	Player:Kick("\nR15 Not Supported !\n[Client Sided MCDonalds Script]")
end
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local sick = Instance.new("Sound",Torso)

if Character:FindFirstChildOfClass("ShirtGraphic") then
	Character:FindFirstChild("Shirt Graphic"):Destroy()
end

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 12
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local neck2 = CF(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local Rooted = false
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
--ROBLOXIDLEANIMATION.Parent = Humanoid
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
ANIMATOR:Destroy()
local UNANCHOR = true
local HITPLAYERSOUNDS = {--[["199149137", "199149186", "199149221", "199149235", "199149269", "199149297"--]]"263032172", "263032182", "263032200", "263032221", "263032252", "263033191"}	


frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)


function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		wait()		
	else
		for i = 1, NUMBER do
			wait()
		end
	end
end

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

local function weldBetween(a, b)
	local weldd = Instance.new("ManualWeld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C0 = CFrame.new()
	weldd.C1 = b.CFrame:inverse() * a.CFrame
	weldd.Parent = a
	return weldd
end


function Clerp(a, b, t)
	return a:lerp(b,t)
end



function weld(parent, part0, part1, c0, c1)
	local w = IT("Weld")
	w.Part0 = part0
	w.Part1 = part1
	w.C0 = c0
	w.C1 = c1
	w.Parent = parent
	return w
end

local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.EmitterSize = 5*VOLUME
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})

function WACKYEFFECT2(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "168892432", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		elseif TYPE == "Burger" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "16646125", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - (VT((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1, TIME+1 do
					Swait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = VT(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:remove()
			end
		end
	end))
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

Debris = game:GetService("Debris")

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end


--weap
if getcustomasset then
	local SONG = writefile("mcdonald_theme.mp3", game:HttpGet("https://github.com/HappyCow91/RobloxScripts/blob/main/Audios/doodoocaca.mp3?raw=true"))
	doodoocaca = IT("Sound",Torso)
	doodoocaca.SoundId = getcustomasset("mcdonald_theme.mp3")
	doodoocaca:Play()
	doodoocaca.Looped = true
	doodoocaca.Volume = 1
else
	warn("EXECUTOR SHIT")
end
d = CF(0,0,0)
local la = IT("Weld")
local ra = IT("Weld")
RightShoulder.Parent = nil
LeftShoulder.Parent = nil
ra.Name = "ra"
ra.Part0 = Torso 
ra.C0 = CF(1.5, 0.5, 0)
ra.C1 = CF(0, 0.5, 0)
ra.Part1 = RightArm
ra.Parent = Torso  

la.Name = "la"
la.Part0 = Torso 
la.C0 = CF(-1.5, 0.5, 0)
la.C1 = CF(0, 0.5, 0) 
la.Part1 = LeftArm
la.Parent = Torso

local lh = weld(LeftLeg,Torso,LeftLeg,CF(-.5,-1,0),d)
lh.C1 = CF(0,1,0)
local rh = weld(RightLeg,Torso,RightLeg,CF(.5,-1,0),d)
rh.C1 = CF(0,1,0)

for i = 1, 10 do
	local FACE = CreatePart(3, Head, "Fabric", 0, 0+(i-1)/10.2, "Dark stone grey", "FaceGradient", VT(1.01,0.65,1.01),false)
	FACE.Color = C3(0,0,0)
	Head:FindFirstChildOfClass("SpecialMesh"):Clone().Parent = FACE
	weld(Head, Head, FACE, CF(0,0.25-(i-1)/40,0), CF(0, 0, 0))
end

local parts = game:GetObjects("rbxassetid://131418602349326")[1]
local raa = parts.ra
raa.Parent = Character
local kn = raa.kn
raa.Anchored = false kn.Anchored = false
local raw = weld(RightArm,raa,RightArm,d,d)
local headd = parts.he
headd.Parent = Character
local hw = weld(Head,headd,Head,d,d)
headd.Anchored = false headd.hair.Anchored = false
if Head:FindFirstChild("face") then
	Head:FindFirstChild("face").Texture = "rbxassetid://151280621"
end
Character:WaitForChild("Body Colors"):Destroy()
parts.bc:Clone().Parent = Character
Humanoid:RemoveAccessories()
if not Character:FindFirstChild("Shirt") then
	s = IT("Shirt",Character)
	s.ShirtTemplate = "rbxassetid://406229184"
else
	Character:FindFirstChild("Shirt").ShirtTemplate = "rbxassetid://406229184"
end
if not Character:FindFirstChild("Pants") then
	pa = IT("Pants",Character)
	pa.PantsTemplate = "rbxassetid://413101335"
else
	Character:FindFirstChild("Pants").PantsTemplate = "rbxassetid://413101335"
end
local kw = raa.kweld



--dmg
function brug(MODEL)
	MODEL:BreakJoints()
	for index, CHILD in pairs(MODEL:GetChildren()) do
		coroutine.resume(coroutine.create(function()
			swait(MRANDOM(8,12)/10)
			local va = MRANDOM(30,80)
			if CHILD:IsA("BasePart") and CHILD.Name ~= "HumanoidRootPart" then
				if CHILD.Name == "Head" then
					WACKYEFFECT2({Time = 120, EffectType = "Burger", Size = VT(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z), Size2 = (VT(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z)), Transparency = CHILD.Transparency, Transparency2 = 1, CFrame = CHILD.CFrame, MoveToPos = CHILD.Position+VT(0,MRANDOM(0,100)/10,0), RotationX = MRANDOM(-4,4), RotationY = MRANDOM(-4,4), RotationZ = MRANDOM(-4,4), Material = "Neon", Color = Color3.fromRGB(va, 0, 0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, SizeBoomerang = 0, Boomerang = 35})
				elseif CHILD.Name ~= "HumanoidRootPart" then
					WACKYEFFECT2({Time = 120, EffectType = "Box", Size = CHILD.Size, Size2 = CHILD.Size, Transparency = CHILD.Transparency, Transparency2 = 1, CFrame = CHILD.CFrame, MoveToPos = CHILD.Position+VT(0,MRANDOM(0,100)/10,0), RotationX = MRANDOM(-4,4), RotationY = MRANDOM(-4,4), RotationZ = MRANDOM(-4,4) ,Material = "Neon", Color = Color3.fromRGB(va, 0, 0), SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, SizeBoomerang = 0, Boomerang = 35})
				end
				CHILD:remove()
			end
		end))
	end
	Debris:AddItem(MODEL,6)
end



function ApplyDamage(Humanoid,Damage)
	Damage = Damage
	if Humanoid.Health < 2000 then
		if Humanoid.Health - Damage > 0 then
			Humanoid.Health = Humanoid.Health - Damage
		else
			brug(Humanoid.Parent)
		end
	else
		brug(Humanoid.Parent)
	end
end

function ApplyAoE(POSITION,RANGE,MINDMG,MAXDMG,FLING,INSTAKILL)
	for index, CHILD in pairs(workspace:GetDescendants()) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if INSTAKILL == true then
							brug(CHILD)
						else
							local DMG = MRANDOM(MINDMG,MAXDMG)
							ApplyDamage(HUM,DMG)
						end
						if FLING > 0 then
							for _, c in pairs(CHILD:GetChildren()) do
								if c:IsA("BasePart") then
									local bv = Instance.new("BodyVelocity") 
									bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
									bv.velocity = CF(POSITION,TORSO.Position).lookVector*FLING
									bv.Parent = c
									Debris:AddItem(bv,0.05)
								end
							end
						end
					end
				end
			end
		end
	end
end

function normal()
	headd.hair.Material = "SmoothPlastic"
	headd.hair.Color = Color3.fromRGB(165,0,0)
	kn.Color = Color3.fromRGB(165,0,0)
	if Head:FindFirstChild("face") then Head:FindFirstChild("face").Texture = "rbxassetid://151280621" end
	Character:FindFirstChildOfClass("Shirt").Color3 = Color3.fromRGB(255,255,255)
	Character:FindFirstChildOfClass("Pants").Color3 = Color3.fromRGB(255,255,255)
	for j,k in pairs(Head:GetChildren()) do if k.Name == "FaceGradient" then k.Color = C3(0,0,0) end end
	for n,b in pairs(Character:GetChildren()) do if b:IsA("BasePart") then  b.Color = C3(1,1,1) end end
end

--attacks
local allowglitching = true

function knife1()
	ATTACK = true
	allowglitching = false
	normal()
	if COMBO == 1 then
		COMBO = 2
		for i = 0,7 do
			Swait()
			local Alpha = .2
			RootJoint.C0 = RootJoint.C0:lerp(CF(-0.5,0.1,-0.5)*ANGLES(RAD(-34.9),RAD(-40.9),RAD(-24.6))*ROOTC0,Alpha)
			lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,-0.1)*ANGLES(RAD(26.6),RAD(23.3),RAD(-2.4)),Alpha)
			rh.C0 = rh.C0:lerp(CF(0.5,-1.1,-0.1)*ANGLES(RAD(28.1),RAD(-14.9),RAD(6.7)),Alpha)
			la.C0 = la.C0:lerp(CF(-1.5,0.2,-0.1)*ANGLES(RAD(22.3),RAD(0),RAD(0)),Alpha)
			ra.C0 = ra.C0:lerp(CF(1.5,0.3,-0.4)*ANGLES(RAD(153.5),RAD(0),RAD(0)),Alpha)
			Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,-0)*ANGLES(RAD(-9.3),RAD(0),RAD(40.9)),Alpha)
		end
		CreateSound(138097048,RightArm,2,MRANDOM(9,11)/10,false)
		for i = 0,9 do
			Swait()
			local Alpha = .2
			RootJoint.C0 = RootJoint.C0:lerp(CF(0.4,0.1,-0.3)*ANGLES(RAD(-37.6),RAD(44.9),RAD(28.6))*ROOTC0,Alpha)
			lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,-0.1)*ANGLES(RAD(25.8),RAD(3.1),RAD(-2.2)),Alpha)
			rh.C0 = rh.C0:lerp(CF(0.5,-1.1,-0.1)*ANGLES(RAD(30.7),RAD(-34),RAD(7.8)),Alpha)
			la.C0 = la.C0:lerp(CF(-1.5,0.2,-0.1)*ANGLES(RAD(22.3),RAD(0),RAD(0)),Alpha)
			ra.C0 = ra.C0:lerp(CF(0.8,0.6,-1.1)*ANGLES(RAD(22.7),RAD(-32.9),RAD(-72.8)),Alpha)
			Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(-0,0,-0)*ANGLES(RAD(-12),RAD(0),RAD(-44.9)),Alpha)
		end
		ApplyAoE(kn.Position,5,30,40,30,false)
	elseif COMBO == 2 then
		COMBO = 1
		for i = 0,2 do
			local Alpha = .2
			RootJoint.C0 = RootJoint.C0:lerp(CF(0.2,0.1,-0.5)*ANGLES(RAD(-29.4),RAD(28.4),RAD(15))*ROOTC0,Alpha)
			lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,-0.1)*ANGLES(RAD(25.8),RAD(3.1),RAD(-2.2)),Alpha)
			rh.C0 = rh.C0:lerp(CF(0.5,-1.1,-0.1)*ANGLES(RAD(30.7),RAD(-34),RAD(7.8)),Alpha)
			la.C0 = la.C0:lerp(CF(-1.5,0.2,-0.1)*ANGLES(RAD(22.3),RAD(0),RAD(0)),Alpha)
			ra.C0 = ra.C0:lerp(CF(1.4,0.4,-0.3)*ANGLES(RAD(85.2),RAD(-75.1),RAD(-17.5)),Alpha)
			Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,-0)*ANGLES(RAD(10.2),RAD(7),RAD(-28.4)),Alpha)
		end
		CreateSound(138097048,RightArm,2,MRANDOM(9,11)/10,false)
		for i = 0,12 do
			Swait()
			local Alpha = .2
			RootJoint.C0 = RootJoint.C0:lerp(CF(0.2,0.1,-0.5)*ANGLES(RAD(-29.4),RAD(28.4),RAD(15))*ROOTC0,Alpha)
			lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,-0.1)*ANGLES(RAD(25.8),RAD(3.1),RAD(-2.2)),Alpha)
			rh.C0 = rh.C0:lerp(CF(0.5,-1.1,-0.1)*ANGLES(RAD(30.7),RAD(-34),RAD(7.8)),Alpha)
			la.C0 = la.C0:lerp(CF(-1.5,0.2,-0.1)*ANGLES(RAD(22.3),RAD(0),RAD(0)),Alpha)
			ra.C0 = ra.C0:lerp(CF(1.4,0.5,0.3)*ANGLES(RAD(-157.8),RAD(31.4),RAD(74.5)),Alpha)
			Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,-0)*ANGLES(RAD(10.2),RAD(0),RAD(-28.4)),Alpha)
		end
		ApplyAoE(kn.Position,5,30,40,30,false)
	end
	allowglitching = true
	ATTACK = false
end

function burgerthrow()
	ATTACK = true
	allowglitching = false
	normal()
	for i = 0,20 do
		Swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(CF(0,0.1,-0.4)*ANGLES(RAD(-25.6),RAD(0),RAD(0))*ROOTC0,Alpha)
		lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,-0.1)*ANGLES(RAD(25.6),RAD(0),RAD(-2.2)),Alpha)
		rh.C0 = rh.C0:lerp(CF(0.5,-1.1,-0.1)*ANGLES(RAD(28.1),RAD(-14.9),RAD(6.7)),Alpha)
		la.C0 = la.C0:lerp(CF(-1.5,0.3,-0.4)*ANGLES(RAD(104.2),RAD(14.2),RAD(0)),Alpha)
		ra.C0 = ra.C0:lerp(CF(1.5,0.2,-0.1)*ANGLES(RAD(22.3),RAD(0),RAD(0)),Alpha)
		Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0)),Alpha)
	end
	local burg = CreatePart(3,Effects,"Plastic",0,0,"White","hamburger",VT(1,1,1),false)
	burg.CanCollide = false
	burg.Massless = true
	local burgm = CreateMesh("SpecialMesh",burg,"FileMesh","16646125","16432575",VT(0,0,0))
	burgm.Scale = VT(1,1,1)
	burgm.VertexColor = VT(1,0,0)
	local burgw = weld(burg,burg,LeftArm,CF(0,1,0)*ANGLES(RAD(10),RAD(40),RAD(0)),d)
	WACKYEFFECT2({Time = 60, EffectType = "Burger", Size = VT(.3,.3,.3), Size2 = VT(2,2,2), Transparency = 0, Transparency2 = 1, CFrame = burg.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(165,0,0),SoundID = 301928691, SoundPitch = 2, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 23})
	for i = 0,20 do
		Swait()
		local Alpha = .13
		RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,0.4)*ANGLES(RAD(22.3),RAD(0),RAD(0))*ROOTC0,Alpha)
		lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,0)*ANGLES(RAD(-22.3),RAD(0),RAD(-2.2)),Alpha)
		rh.C0 = rh.C0:lerp(CF(0.5,-1.1,0)*ANGLES(RAD(-19.9),RAD(-14.9),RAD(6.7)),Alpha)
		la.C0 = la.C0:lerp(CF(-1.6,0.6,0)*ANGLES(RAD(-146.9),RAD(-4.7),RAD(-13.4)),Alpha)
		ra.C0 = ra.C0:lerp(CF(1.5,0.5,0.1)*ANGLES(RAD(-21.3),RAD(0),RAD(0)),Alpha)
		Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(-15),RAD(0),RAD(0)),Alpha)
	end
	local burg2 = burg:Clone()
	burg2.Weld:Destroy()
	burg2.Anchored = true
	burg2.Parent = nil
	burg:Destroy()
	burg2.Parent = Effects
	local burgfly = false
	coroutine.resume(coroutine.create(function()
		repeat Swait() 
			WACKYEFFECT2({Time = 60, EffectType = "Round Slash", Size = VT(.01,.01,.01), Size2 = VT(.03,.01,.03), Transparency = 0, Transparency2 = 1, CFrame = burg2.CFrame*ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360))), MoveToPos = burg.Position+VT(0,2,0), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(MRANDOM(0,255),0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 1, SizeBoomerang = 50})

		until burgfly == true
	end))
	coroutine.resume(coroutine.create(function()
		burg2.CFrame = CF(burg2.Position,Mouse.Hit.p)
		for i = 1,250 do
			Swait()
			burg2.CFrame = burg2.CFrame*CF(0,0,-2.3)
			local hit,pos = Raycast(burg2.Position,burg2.CFrame.lookVector,5,Character)
			if hit then break end
		end
		ApplyAoE(burg2.Position,25,0,0,60,true)
		for i = 1,7 do
			WACKYEFFECT2({Time = 150, EffectType = "Sphere", Size = VT(1.2,1,1.2), Size2 = VT(1.5,50,1.5), Transparency = 0, Transparency2 = 1, CFrame = burg2.CFrame*ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360))), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(200,0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 50})
		end
		WACKYEFFECT2({Time = 90, EffectType = "Sphere", Size = VT(5,5,5), Size2 = VT(40,40,40), Transparency = 0, Transparency2 = 1, CFrame = burg2.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(165,0,0),SoundID = 191395725, SoundPitch = 1, SoundVolume = 6, UseBoomerangMath = true, Boomerang = 0, SizeBoomerang = 25})
		for i = 1,9 do
			WACKYEFFECT2({Time = 100, EffectType = "Round Slash", Size = VT(.01,.01,.01), Size2 = VT(.2,.04,.2), Transparency = 0, Transparency2 = 1, CFrame = burg2.CFrame*ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360))), MoveToPos = burg2.Position+VT(0,3,0), RotationX = MRANDOM(-1,1), RotationY = MRANDOM(-1,1), RotationZ = MRANDOM(-1,1), Material = "Neon", Color = Color3.fromRGB(MRANDOM(0,255),0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = true, Boomerang = 15, SizeBoomerang = 15})
		end
		burgfly = true
		burg2:Destroy()
	end))
	for i = 0,5 do
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(CF(0,0.1,-0.3)*ANGLES(RAD(-32.8),RAD(0),RAD(0))*ROOTC0,Alpha)
		lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,-0.3)*ANGLES(RAD(32.8),RAD(0),RAD(-2.2)),Alpha)
		rh.C0 = rh.C0:lerp(CF(0.5,-1.1,-0.3)*ANGLES(RAD(35.2),RAD(-14.9),RAD(6.7)),Alpha)
		la.C0 = la.C0:lerp(CF(-1.4,0.5,-0.1)*ANGLES(RAD(150.9),RAD(43.7),RAD(-38)),Alpha)
		ra.C0 = ra.C0:lerp(CF(1.3,0.4,0.2)*ANGLES(RAD(-21.3),RAD(0),RAD(28.5)),Alpha)
		Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,-0)*ANGLES(RAD(24.3),RAD(0),RAD(0)),Alpha)
	end
	for i = 0,15 do
		Swait()
		local Alpha = .2
		RootJoint.C0 = RootJoint.C0:lerp(CF(0,0.1,-0.3)*ANGLES(RAD(-32.8),RAD(0),RAD(0))*ROOTC0,Alpha)
		lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,-0.3)*ANGLES(RAD(32.8),RAD(0),RAD(-2.2)),Alpha)
		rh.C0 = rh.C0:lerp(CF(0.5,-1.1,-0.3)*ANGLES(RAD(35.2),RAD(-14.9),RAD(6.7)),Alpha)
		la.C0 = la.C0:lerp(CF(-0.5,0.1,-1.1)*ANGLES(RAD(11.9),RAD(-0.6),RAD(60)),Alpha)
		ra.C0 = ra.C0:lerp(CF(1.3,0.4,0.2)*ANGLES(RAD(-21.3),RAD(0),RAD(28.5)),Alpha)
		Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(-24.3),RAD(0),RAD(0)),Alpha)
	end
	allowglitching = true
	ATTACK = false
end

function knifu()
	ATTACK = true
	allowglitching = false
	normal()
	local origin = RootPart.CFrame
	pcall(function()
		if Mouse.Target.Parent ~= Character and Mouse.Target.Parent.Parent ~= Character and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil and Mouse.Target.Parent ~= nil then
			local h = Mouse.Target.Parent:FindFirstChildOfClass("Humanoid")
			local t = h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")
			RootPart.CFrame = t.CFrame + t.CFrame.lookVector * -3
			CreateSound(301928691,RootPart,5,2,false)
			for r,d in pairs(Character:GetChildren()) do 
				if d == LeftArm or d == RightArm or d == Torso or d == RightLeg or d == LeftLeg then
					WACKYEFFECT2({Time = 30, EffectType = "Box", Size = d.Size, Size2 = d.Size*1.01, Transparency = 0, Transparency2 = 1, CFrame = d.CFrame, MoveToPos = d.Position+VT(MRANDOM(-1,1),0,MRANDOM(-1,1)), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(MRANDOM(60,165),0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
				elseif d == Head then
					WACKYEFFECT2({Time = 30, EffectType = "Box", Size = VT(d.Size.Z,d.Size.Y,d.Size.Z), Size2 = VT(d.Size.Z,d.Size.Y,d.Size.Z)*1.01, Transparency = 0, Transparency2 = 1, CFrame = d.CFrame, MoveToPos = d.Position+VT(MRANDOM(-1,1),0,MRANDOM(-1,1)), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(MRANDOM(60,165),0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
				end
			end
			for i = 0,28 do
				Swait()
				local Alpha = .1
				kw.C0 = kw.C0:lerp(CF(0,-.5,-1)*ANGLES(RAD(-90),RAD(180),RAD(0)),Alpha)
				RootJoint.C0 = RootJoint.C0:lerp(CF(0,0,0.1)*ANGLES(RAD(-8.1),RAD(-56.7),RAD(-6.8))*ROOTC0,Alpha)
				lh.C0 = lh.C0:lerp(CF(-0.5,-1,-0.2)*ANGLES(RAD(6.3),RAD(40.9),RAD(-3)),Alpha)
				rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(6.8),RAD(-14.9),RAD(6.7)),Alpha)
				la.C0 = la.C0:lerp(CF(-1.4,0.4,0.2)*ANGLES(RAD(6.1),RAD(11.9),RAD(-10.3)),Alpha)
				ra.C0 = ra.C0:lerp(CF(2,0.3,-0.3)*ANGLES(RAD(86.6),RAD(0),RAD(-52.9)),Alpha)
				Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(-3.6),RAD(0),RAD(56.7)),Alpha)
			end
			if t.Parent:FindFirstChild("HumanoidRootPart") then
				t.Parent:FindFirstChild("HumanoidRootPart").Anchored = true
				t.Parent:FindFirstChild("HumanoidRootPart").CanCollide = false
			else
				t.Anchored = true
				t.CanCollide = true
			end
			CreateSound(444667859,RightArm,5,1,false)
			if not t.Parent:FindFirstChild("Head") then
				return 
			else
				headc = t.Parent:FindFirstChild("Head"):Clone()
				local oldhead = t.Parent:FindFirstChild("Head")
				headc.Parent = workspace
				headc.Anchored = false
				headc.Massless = true
				local wd = weld(headc,headc,kn,CF(0,-.5,0),d)
				--for a,g in pairs(t.Parent:GetDescendants()) do if g:IsA("Weld") and g.Name == "AccessoryWeld" then g.Parent = headc end end
				--for f,e in pairs(t.Parent:GetDescendants()) do if e:IsA("Accessory") then e.Parent = headc end end
				coroutine.resume(coroutine.create(function()
					for f,e in pairs(t.Parent:GetDescendants()) do if e:IsA("Motor6D") and e.Parent.Name == "Torso" then e:Destroy() end end
					oldhead:Destroy()
					swait(.5)
					brug(h.Parent)
				end))
			end
			for i = 0,17 do
				Swait()
				local Alpha = .2
				RootJoint.C0 = RootJoint.C0:lerp(CF(0.1,0,0.1)*ANGLES(RAD(-5.4),RAD(34.6),RAD(3.1))*ROOTC0,Alpha)
				lh.C0 = lh.C0:lerp(CF(-0.5,-1,-0.2)*ANGLES(RAD(4.9),RAD(12.3),RAD(-2.3)),Alpha)
				rh.C0 = rh.C0:lerp(CF(0.5,-1,-0.1)*ANGLES(RAD(7.9),RAD(-22.9),RAD(7)),Alpha)
				la.C0 = la.C0:lerp(CF(-1.4,0.4,0.2)*ANGLES(RAD(6.1),RAD(11.9),RAD(-10.3)),Alpha)
				ra.C0 = ra.C0:lerp(CF(1.2,0.7,-0.4)*ANGLES(RAD(118.9),RAD(16.4),RAD(11.3)),Alpha)
				Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(-1),RAD(0),RAD(-34.6)),Alpha)
			end
			coroutine.resume(coroutine.create(function()
				swait(1.2)
				WACKYEFFECT2({Time = 90, EffectType = "Box", Size = VT(headc.Size.Z,headc.Size.Y,headc.Size.Z), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 0, CFrame = headc.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = Color3.fromRGB(165,0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
				for i = 1,8 do
					WACKYEFFECT2({Time = 90, EffectType = "Box", Size = VT(.5,.5,.5), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 0, CFrame = headc.CFrame*ANGLES(RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360)),RAD(MRANDOM(-360,360))), MoveToPos = headc.Position + VT(MRANDOM(-1,1),MRANDOM(-1,1),MRANDOM(-1,1)), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Glass", Color = Color3.fromRGB(165,0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
				end
				headc:Destroy()
			end))
			--dont skip
		end
	end)
	ATTACK = false
	allowglitching = true
end
--649634100 laugh

--keys
function MouseDown(Mouse)
	HOLD = true
	if ATTACK == false then
		knife1()
	end
end

function MouseUp(Mouse)
	HOLD = false
end

function KeyDown(Key)
	KEYHOLD = true
	if Key == "z" and ATTACK == false then
		burgerthrow()
	end
	if Key == "x" and ATTACK == false then
		knifu()
	end
end

function KeyUp(Key)
	KEYHOLD = false
end

Mouse.Button1Down:connect(function(NEWKEY)
	MouseDown(NEWKEY)
end)
Mouse.Button1Up:connect(function(NEWKEY)
	MouseUp(NEWKEY)
end)
Mouse.KeyDown:connect(function(NEWKEY)
	KeyDown(NEWKEY)
end)
Mouse.KeyUp:connect(function(NEWKEY)
	KeyUp(NEWKEY)
end)

function unanchor()
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA("BasePart") and c ~= RootPart then
			c.Anchored = false
		end
	end
	if UNANCHOR == true then
		RootPart.Anchored = false
	else
		RootPart.Anchored = true
	end
end

--loop stuff
local snap = false
Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end)

while true do
	Swait()
	ANIMATE.Parent = nil
	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
		v:Stop();
	end
	SINE = SINE + CHANGE*2
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4+Humanoid.HipHeight, Character)
	local TiltVelocity = CF(RootPart.CFrame:vectorToObjectSpace(RootPart.Velocity/1.6))
	local WALKSPEEDVALUE = 13 / (Humanoid.WalkSpeed / 16)
	if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
		ANIM = "Jump"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(-25), RAD(0), RAD(0)), 1 / Animation_Speed)
			ra.C0 = Clerp(ra.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-35), RAD(0), RAD(25 + 10 * COS(SINE / 12))), 1 / Animation_Speed)
			la.C0 = Clerp(la.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-35), RAD(0), RAD(-25 - 10 * COS(SINE / 12))), 1 / Animation_Speed)
			rh.C0 = Clerp(rh.C0, CF(.5, -0.4, -0.6) * ANGLES(RAD(1), RAD(0), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			lh.C0 = Clerp(lh.C0, CF(-.5, -1, 0) * ANGLES(RAD(0), RAD(5), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
		ANIM = "Fall"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(0)), 1 / Animation_Speed)
			ra.C0 = Clerp(ra.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(35 - 4 * COS(SINE / 6)), RAD(0), RAD(45 + 10 * COS(SINE / 12))), 1 / Animation_Speed)
			la.C0 = Clerp(la.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(35 - 4 * COS(SINE / 6)), RAD(0), RAD(-45 - 10 * COS(SINE / 12))), 1 / Animation_Speed)
			rh.C0 = Clerp(rh.C0, CF(.5, -0.3, -0.7) * ANGLES(RAD(-25 + 5 * SIN(SINE / 12)), RAD(0), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
			lh.C0 = Clerp(lh.C0, CF(-.5, -0.8, -0.3) * ANGLES(RAD(-10), RAD(10), RAD(0)) * ANGLES(RAD(-1 * SIN(SINE / 6)), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		local Alpha = .1
		ANIM = "Idle"
		if ATTACK == false then
			local Alpha = .1
			RootJoint.C0 = RootJoint.C0:lerp(CF(0,0 + 0.1 * COS(SINE/40),-0.4)*ANGLES(RAD(-25.6+3.6*COS(SINE/40)),RAD(0),RAD(0))*ROOTC0,Alpha)
			lh.C0 = lh.C0:lerp(CF(-0.5,-1.1- 0.1 * COS(SINE/40),-0.1)*ANGLES(RAD(25.6-3.6*COS(SINE/40)),RAD(0),RAD(-2.2)),Alpha)
			rh.C0 = rh.C0:lerp(CF(0.5,-1.1- 0.1 * COS(SINE/40),-0.1)*ANGLES(RAD(28.1-3.6*COS(SINE/40)),RAD(-14.9),RAD(6.7)),Alpha)
			la.C0 = la.C0:lerp(CF(-1.5,0.2 + 0.07 * COS(SINE/40),-0.1)*ANGLES(RAD(22.3+MRANDOM(-4,4)),RAD(0+MRANDOM(-4,4)),RAD(0+MRANDOM(-4,4))),Alpha)
			ra.C0 = ra.C0:lerp(CF(1.5,0.2+ 0.07 * COS(SINE/40),-0.1)*ANGLES(RAD(22.3+MRANDOM(-4,4)),RAD(0+MRANDOM(-4,4)),RAD(0+MRANDOM(-4,4))),Alpha)
			Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(0+2*SIN(SINE/40)+MRANDOM(-8,8)),RAD(0+MRANDOM(-8,8)),RAD(0+MRANDOM(-8,8))),Alpha)
		end
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		if ATTACK == false then
			local Alpha = .1
			RootJoint.C0 = RootJoint.C0:lerp(CF(0,0+0.08*SIN(SINE/WALKSPEEDVALUE*2),0-.10*COS(SINE/(WALKSPEEDVALUE/2)))*ANGLES(RAD(-17.6+3*SIN(SINE/(WALKSPEEDVALUE/2)))+RAD(TiltVelocity.Z)*1,RAD(10*COS(SINE/WALKSPEEDVALUE)),RAD(0))*ROOTC0,Alpha)
			lh.C0 = lh.C0:lerp(CF(-0.5,-.9+0.55*COS(SINE/WALKSPEEDVALUE)/2,-.1-.5*COS(SINE/WALKSPEEDVALUE)/2)*ANGLES(RAD(10.6+15*COS(SINE/WALKSPEEDVALUE))+RootPart.RotVelocity.Y/-75+SIN(SINE/WALKSPEEDVALUE)/2.5*-RAD(TiltVelocity.Z)*10,RAD(0-5*COS(SINE/WALKSPEEDVALUE)),RAD(0))*ANGLES(RAD(0-2*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0+25*SIN(SINE/WALKSPEEDVALUE)*RAD(TiltVelocity.X)*5.5)),Alpha)
			rh.C0 = rh.C0:lerp(CF(0.5,-.9-0.55*COS(SINE/WALKSPEEDVALUE)/2,-.1+.5*COS(SINE/WALKSPEEDVALUE)/2)*ANGLES(RAD(12.8-15*COS(SINE/WALKSPEEDVALUE))-RootPart.RotVelocity.Y/75+-SIN(SINE/WALKSPEEDVALUE)/2.5*-RAD(TiltVelocity.Z)*10,RAD(0-5*COS(SINE/WALKSPEEDVALUE)),RAD(0))*ANGLES(RAD(0+2*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0+25*SIN(SINE/WALKSPEEDVALUE)*-RAD(TiltVelocity.X)*5.5)),Alpha)
			la.C0 = la.C0:lerp(CF(-1.5,0.5,0)*ANGLES(RAD(22.3-28*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0)),Alpha)
			ra.C0 = ra.C0:lerp(CF(1.5,0.5,0)*ANGLES(RAD(22.3+28*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0)),Alpha)
			Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0)*ANGLES(RAD(0+3.5*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(-10*COS(SINE/WALKSPEEDVALUE))-RAD(TiltVelocity.X)*3),Alpha)
		end
	end
	if ATTACK == false then
		kw.C0 = kw.C0:lerp(d,.1)
	end
	coroutine.resume(coroutine.create(function()
		if allowglitching == true then
			if MRANDOM(1,100) == 1 then
				CreateSound(155194054,RootPart,.5,MRANDOM(7,13)/10,false)
				for i = 1,MRANDOM(4,60) do
					Swait()
					if allowglitching == false then break end
					snap = true
					local Alpha = .3
					local var = MRANDOM(-17,17)
					RootJoint.C0 = RootJoint.C0:lerp(CF(0,-.3,-0)*ANGLES(RAD(-55.6),RAD(0+var),RAD(0+var))*ROOTC0,Alpha)
					if ANIM == "Idle" then
						lh.C0 = lh.C0:lerp(CF(-0.5,-1.1,-0.1)*ANGLES(RAD(55.6),RAD(0-var),RAD(-2.2-var)),Alpha)
						rh.C0 = rh.C0:lerp(CF(0.5,-1.1,-0.1)*ANGLES(RAD(58.1),RAD(-14.9-var),RAD(6.7-var)),Alpha)
					elseif ANIM == "Walk" then
						lh.C0 = lh.C0:lerp(CF(-0.5,-.9+0.55*COS(SINE/WALKSPEEDVALUE)/2,-.1-.5*COS(SINE/WALKSPEEDVALUE)/2)*ANGLES(RAD(40.6+15*COS(SINE/WALKSPEEDVALUE))+RootPart.RotVelocity.Y/-75+SIN(SINE/WALKSPEEDVALUE)/2.5*-RAD(TiltVelocity.Z)*10,RAD(0-var-5*COS(SINE/WALKSPEEDVALUE)),RAD(0-var))*ANGLES(RAD(0-2*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0+25*SIN(SINE/WALKSPEEDVALUE)*RAD(TiltVelocity.X)*5.5)),Alpha)
						rh.C0 = rh.C0:lerp(CF(0.5,-.9-0.55*COS(SINE/WALKSPEEDVALUE)/2,-.1+.5*COS(SINE/WALKSPEEDVALUE)/2)*ANGLES(RAD(42.8-15*COS(SINE/WALKSPEEDVALUE))-RootPart.RotVelocity.Y/75+-SIN(SINE/WALKSPEEDVALUE)/2.5*-RAD(TiltVelocity.Z)*10,RAD(0-var-5*COS(SINE/WALKSPEEDVALUE)),RAD(0-var))*ANGLES(RAD(0+2*COS(SINE/WALKSPEEDVALUE)),RAD(0),RAD(0+25*SIN(SINE/WALKSPEEDVALUE)*-RAD(TiltVelocity.X)*5.5)),Alpha)
					end
					la.C0 = la.C0:lerp(CF(-1.4,0.9,0)*ANGLES(RAD(177.9 + MRANDOM(-20,20)),RAD(0+ MRANDOM(-20,20)),RAD(33.4+ MRANDOM(-20,20))),Alpha)
					ra.C0 = ra.C0:lerp(CF(1.5,0.9,0.1)*ANGLES(RAD(175.9),RAD(0),RAD(-32.4)),Alpha)
					Neck.C0 = Neck.C0:lerp(NECKC0*CF(0,0,0+ ((1) - 1))*CF(0,0,0)*ANGLES(RAD(0+ MRANDOM(-45,45)),RAD(0+ MRANDOM(-45,45)),RAD(0+ MRANDOM(-45,45))),Alpha)
				end
				snap = false
			end
		end
	end))
	if allowglitching == true then
		if snap == true then
			local faces = {151280621,704234434,4324928592,136016913}
			headd.hair.Material = "Neon"
			if Head:FindFirstChild("face") then Head:FindFirstChild("face").Texture = "rbxassetid://"..faces[MRANDOM(1,#faces)] end
			kn.Color = Color3.fromRGB(MRANDOM(0,255),0,0)
			Character:FindFirstChildOfClass("Shirt").Color3 = Color3.fromRGB(MRANDOM(0,255),0,0)
			Character:FindFirstChildOfClass("Pants").Color3 = Color3.fromRGB(MRANDOM(0,255),0,0)
			for s,k in pairs(Character:GetDescendants()) do if k:IsA("BasePart") and k.Parent ~= Effects then k.Color = Color3.fromRGB(MRANDOM(0,255),0,0) end end
			for r,d in pairs(Character:GetChildren()) do if d == LeftArm or d == RightArm or d == Torso or d == RightLeg or d == LeftLeg then
					if MRANDOM(1,2) == 1 then
						WACKYEFFECT2({Time = MRANDOM(5,10), EffectType = "Box", Size = d.Size, Size2 = d.Size, Transparency = 0.65, Transparency2 = 1, CFrame = d.CFrame*ANGLES(0,RAD(MRANDOM(-2,2)),0), MoveToPos = d.Position+VT(.1,0,0), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = Color3.fromRGB(MRANDOM(0,255),0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
					end
				end
			end
		else
			headd.hair.Material = "SmoothPlastic"
			headd.hair.Color = Color3.fromRGB(165,0,0)
			kn.Color = Color3.fromRGB(165,0,0)
			if Head:FindFirstChild("face") then Head:FindFirstChild("face").Texture = "rbxassetid://151280621" end
			Character:FindFirstChildOfClass("Shirt").Color3 = Color3.fromRGB(255,255,255)
			Character:FindFirstChildOfClass("Pants").Color3 = Color3.fromRGB(255,255,255)
			for j,k in pairs(Head:GetChildren()) do if k.Name == "FaceGradient" then k.Color = C3(0,0,0) end end
			for n,b in pairs(Character:GetChildren()) do if b:IsA("BasePart") then  b.Color = C3(1,1,1) end end
			local types = {"Skull","Burger"}
			if MRANDOM(1,6) == 1 then
				WACKYEFFECT2({Time = MRANDOM(40,70), EffectType = types[MRANDOM(1,2)], Size = VT(1.3,1.3,1.3), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = RootPart.CFrame*CF(MRANDOM(-3,3),MRANDOM(-3,3),MRANDOM(-3,3)), MoveToPos = nil, RotationX = MRANDOM(-6,6), RotationY = MRANDOM(-6,6), RotationZ = MRANDOM(-6,6), Material = "Neon", Color = Color3.fromRGB(MRANDOM(100,165),0,0),SoundID = nil, SoundPitch = nil, SoundVolume = nil, UseBoomerangMath = false, Boomerang = 0, SizeBoomerang = 0})
			end
		end
	end
	unanchor()
	Humanoid.MaxHealth = 1e4
	Humanoid.Health = 1e4
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
end