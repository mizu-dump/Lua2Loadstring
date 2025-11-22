--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--//====================================================\\--
--||			   CREATED BY SHACKLUSTER
--\\====================================================//--

-- Converted By: Midow

-- Music: It Was Us (Egg Hunt: The Great Yolktales)
-- Link With the music for the lazy people: https://www.youtube.com/watch?v=C3P0QcqO7Sw

-- Update Log - 10/08/25: FINALLY THIS SHIT ITS WORKS! now all attacks and the morph are working!

-- Enjoy!

writefile("ItWasUs.mp3", game:HttpGet("https://github.com/Lock1213/Scripts/raw/refs/heads/main/ItWasUs.mp3"))
local sound = Instance.new("Sound")
sound.SoundId = getcustomasset("ItWasUs.mp3")
sound.Volume = 1
sound.Looped = true
sound.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
sound:Play()

script = game:GetObjects("rbxassetid://6015747481")[1].Convert

wait(0.2)

Player = game:GetService("Players").LocalPlayer
script.Wand.Union.Anchored = false
script.Wand.Base.Anchored = false
script.Wand.Head.Anchored = false
Mouse = Player:GetMouse()
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
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

--//=================================\\
--|| 	      USEFUL VALUES
--\\=================================//

Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 35
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ATTACK = false
local PLAY = true
local HOLD = false
local COMBO = 1
local Rooted = false
local SINE = 0
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "Weapon GUI"
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
ANIMATOR:Destroy()
local UNANCHOR = true

--//=================================\\
--\\=================================//


--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
		lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

--//=================================\\
--\\=================================//

--//=================================\\
--|| 	      SOME FUNCTIONS
--\\=================================//

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
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


function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end
 
function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end
 
function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
	local frame = IT("Frame")
	frame.BackgroundTransparency = TRANSPARENCY
	frame.BorderSizePixel = BORDERSIZEPIXEL
	frame.Position = POSITION
	frame.Size = SIZE
	frame.BackgroundColor3 = COLOR
	frame.BorderColor3 = BORDERCOLOR
	frame.Name = NAME
	frame.Parent = PARENT
	return frame
end

function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
	local label = IT("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UD2(1, 0, 1, 0)
	label.Position = UD2(0, 0, 0, 0)
	label.TextColor3 = TEXTCOLOR
	label.TextStrokeTransparency = STROKETRANSPARENCY
	label.TextTransparency = TRANSPARENCY
	label.FontSize = TEXTFONTSIZE
	label.Font = TEXTFONT
	label.BorderSizePixel = BORDERSIZEPIXEL
	label.TextScaled = false
	label.Text = TEXT
	label.Name = NAME
	label.Parent = PARENT
	return label
end

function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end

function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end

local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
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

function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

--Lightning({Material = "Neon", FadeIn = false, Color = C3(1,1,1), Start = Torso.Position, End = Mouse.Hit.p, SegmentL = 2, Thickness = 0.1, DoesFade = false, Ignore = Character, MaxDist = 400, Branches = false, FadeTime = 15, Thicken = false})
function Lightning(Table)
	local Color = Table.Color or C3(1,1,1)
	local StartPos = Table.Start or Torso.Position
	local EndPos = Table.End or Mouse.Hit.p
	local SegmentLength = Table.SegmentL or 2
	local Thickness = Table.Thickness or 0.1
	local Dissapear = Table.DoesFade or false
	local Parent = Table.Ignore or Character
	local MaxDist = Table.MaxDist or 400
	local Branches = Table.Branches or false
	local Thicken = Table.Thicken or false
	local FadeTime = Table.FadeTime or 15
	local FadeIn = Table.FadeIn or false
	local Material = Table.Material or "Neon"
	local HIT,HITPOS = CastProperRay(StartPos, EndPos, MaxDist, Parent)
	local DISTANCE = math.ceil((StartPos - HITPOS).Magnitude/SegmentLength)
	local LIGHTNINGMODEL = IT("Model",Effects)
	LIGHTNINGMODEL.Name = "Lightning"
	local LastBolt = nil
	for E = 1, DISTANCE do
		local ExtraSize = 0
		if Thicken == true then
			ExtraSize = (DISTANCE-E)/15
		end
		local TRANSPARENCY = 0
		if FadeIn == true then
			TRANSPARENCY = 1-((DISTANCE-E)/DISTANCE)
			if TRANSPARENCY < 0 then
				TRANSPARENCY = 0
			end
		end
		local PART = CreatePart(3, LIGHTNINGMODEL, Material, 0, TRANSPARENCY, BRICKC("Pearl"), "LightningPart"..E, VT(Thickness+ExtraSize,SegmentLength,Thickness+ExtraSize))
		PART.Color = Color
		MakeForm(PART,"Cyl")
		if LastBolt == nil or E == DISTANCE then
			PART.CFrame = CF(StartPos,HITPOS)*ANGLES(RAD(90),RAD(0),RAD(0))*CF(0,-PART.Size.Y/2,0)
		else
			PART.CFrame = CF(LastBolt.CFrame*CF(0,-LastBolt.Size.Y/2,0).p,CF(HITPOS)*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,0,(DISTANCE-E)+(SegmentLength/5)).p)*ANGLES(RAD(90),RAD(0),RAD(0))*CF(0,-PART.Size.Y/2,0)
		end
		LastBolt = PART
		if Branches == true and E < (DISTANCE-5) then
			local CHOICE = MRANDOM(1,7+((DISTANCE-E)*2))
			if CHOICE == 1 then
				local LASTBRANCH = nil
				for i = 1, MRANDOM(2,5) do
					local ExtraSize2 = 0
					if Thicken == true then
						ExtraSize = ((DISTANCE-E)/25)/i
					end
					local PART = CreatePart(3, LIGHTNINGMODEL, Material, 0, TRANSPARENCY, BRICKC("Pearl"), "Branch"..E.."-"..i, VT(Thickness+ExtraSize2,SegmentLength,Thickness+ExtraSize2))
					PART.Color = Color
					MakeForm(PART,"Cyl")
					if LASTBRANCH == nil then
						PART.CFrame = CF(LastBolt.CFrame*CF(0,-LastBolt.Size.Y/2,0).p,LastBolt.CFrame*CF(0,-LastBolt.Size.Y/2,0)*ANGLES(RAD(0),RAD(0),RAD(MRANDOM(0,360)))*CF(0,Thickness*7,0)*CF(0,0,-1).p)*ANGLES(RAD(90),RAD(0),RAD(0))*CF(0,-PART.Size.Y/2,0)
					else
						PART.CFrame = CF(LASTBRANCH.CFrame*CF(0,-LASTBRANCH.Size.Y/2,0).p,LASTBRANCH.CFrame*CF(0,-LASTBRANCH.Size.Y/2,0)*ANGLES(RAD(0),RAD(0),RAD(MRANDOM(0,360)))*CF(0,Thickness*3,0)*CF(0,0,-1).p)*ANGLES(RAD(90),RAD(0),RAD(0))*CF(0,-PART.Size.Y/2,0)
					end
					LASTBRANCH = PART
				end
			end
		end
	end
	if Dissapear == true then
		coroutine.resume(coroutine.create(function()
			for i = 1, FadeTime do
				Swait()
				for _, c in pairs(LIGHTNINGMODEL:GetChildren()) do
					if c.ClassName == "Part" then
						c.Transparency = c.Transparency + (i/FadeTime)/10
					end
				end
			end
			LIGHTNINGMODEL:remove()
		end))
	elseif Dissapear == false then
		Debris:AddItem(LIGHTNINGMODEL,0.1)
	end
	return {Hit = HIT,Pos = HITPOS,End = LastBolt.CFrame*CF(0,0,-LastBolt.Size.Z).p,LastBolt = LastBolt,Model = LIGHTNINGMODEL}
end

--WACKYEFFECT({EffectType = "", Size = VT(1,1,1), Size2 = VT(0,0,0), Transparency = 0, Transparency2 = 1, CFrame = CF(), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
function WACKYEFFECT(Table)
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
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		elseif TYPE == "Duck" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "FileMesh", "9419831", "9419827", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			for LOOP = 1, TIME+1 do
				Swait()
				MSH.Scale = MSH.Scale - GROWTH/TIME
				if TYPE == "Wave" then
					MSH.Offset = VT(0,0,-MSH.Scale.X/8)
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
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until SOUND.Playing == false
				EFFECT:remove()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat Swait() until SOUND.Playing == false
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

function turnto(position)
	RootPart.CFrame=CFrame.new(RootPart.CFrame.p,VT(position.X,RootPart.Position.Y,position.Z)) * CFrame.new(0, 0, 0)
end

function SHAKECAM(POSITION,RANGE,INTENSITY,TIME)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						local CAMSHAKER = script.CamShake:Clone()
						CAMSHAKER.Shake.Value = INTENSITY
						CAMSHAKER.Timer.Value = TIME
						CAMSHAKER.Parent = CHILD
						CAMSHAKER.Disabled = false
					end
				end
			end
		end
	end
end

--//=================================\\
--||	     WEAPON CREATION
--\\=================================//

for _, c in pairs(Character:GetChildren()) do
	if script:FindFirstChild(c.Name) then
		local Part = script[c.Name]:Clone()
		Part.Parent = Character
		Part:SetPrimaryPartCFrame(c.CFrame)
		weldBetween(c,Part.Base)
		for _, e in pairs(Part:GetChildren()) do
			if e:IsA("BasePart") and e.Name ~= "Base" then
				e.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
				e.Anchored = false
				weldBetween(e,c)
				e.Locked = true
				e.CanCollide = false
			end
		end
		Part.Base:remove()
	end
end

--[[local GUI = game.ReplicatedStorage:WaitForChild("Assets").BrickHamman.NameGui:Clone()
GUI.Parent = Head
GUI.PlayerToHideFrom = Player
Humanoid.DisplayDistanceType = "None"
GUI.Enabled = true--

]]

local HAT = script.Hat:Clone()
weldBetween(HAT.Base,HAT.MeshPart)
HAT.Base.Anchored = false
HAT.MeshPart.Anchored = false
local HATWELD = CreateWeldOrSnapOrMotor("Weld", RootPart, Head, HAT.Base, CF(0,0.9,0), CF(0,0,0))
HAT.Parent = Character
local WAND = script.Wand:Clone()
WAND.Parent = nil
local LARGESPARKS = script.LargeSparks:Clone()
LARGESPARKS.Parent = Torso

function SpawnWand(ARM)
	local STAFF = WAND:Clone()
	STAFF.Parent = Character
	local WELD = CreateWeldOrSnapOrMotor("Weld", ARM, ARM, STAFF.Base, CF(0,-1.2,0), CF(0,0,0))
	return STAFF,WELD,STAFF.Head.Sparkles
end

local SKILLTEXTCOLOR = BRICKC"Maroon".Color
local SKILLFONT = "Fantasy"
local SKILLTEXTSIZE = 5

RightLeg:remove()
LeftLeg:remove()

local ATTACKS = {"Mouse-Twister","Q-Dissapearing Act","Z-Draw Cards","C-Bonus Duck","X-The Audience Dissapears","M-Audience play"}
--local ATTACKSFRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.8, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill Frame")
--local TEXT = CreateLabel(ATTACKSFRAME, "[ATTACKS]", SKILLTEXTCOLOR, SKILLTEXTSIZE+1, SKILLFONT, 0, 2, 0.5, "Skill text")

local GUIS = {}
for i = 1, #ATTACKS do
	local SKILLFRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.05, 0, 0.90-(0.02*i), 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill Frame")
	local SKILLTEXT = CreateLabel(SKILLFRAME, "["..ATTACKS[i].."]", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0.8, "Skill text")
	SKILLTEXT.TextStrokeColor3 = BRICKC"Royal purple".Color
	SKILLTEXT.TextXAlignment = "Left"
	table.insert(GUIS,SKILLTEXT)
end

script.Hat:Destroy()
script.Head:Destroy()
script["Left Arm"]:Destroy()
script["Right Arm"]:Destroy()
script.Torso:Destroy()
script.Wand:Destroy()

--//=================================\\
--||			DAMAGING
--\\=================================//

function ApplyDamage(Humanoid,Damage)
	if Damage > 0 then
		Damage = Damage * DAMAGEMULTIPLIER
		if Humanoid.Health < 2000 then
			if Humanoid.Health - Damage > 0 then
				Humanoid.Health = Humanoid.Health - Damage
			else
				Humanoid.Parent:BreakJoints()
			end
		else
			Humanoid.Parent:BreakJoints()
		end
	end
end

function ONESHOT(MODEL)
	MODEL:BreakJoints()
	for index, CHILD in pairs(MODEL:GetChildren()) do
		if CHILD:IsA("BasePart") and CHILD.Name ~= "HumanoidRootPart" then
			if CHILD.Name == "Head" then
				WACKYEFFECT({Time = MRANDOM(10,30)*5, EffectType = "Skull", Size = VT(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z)*3, Size2 = (VT(CHILD.Size.Z,CHILD.Size.Y,CHILD.Size.Z)*3)*MRANDOM(7,14)/10, Transparency = CHILD.Transparency, Transparency2 = 1, CFrame = CHILD.CFrame, MoveToPos = CHILD.Position+VT(0,MRANDOM(5,8)/1.5,0), RotationX = MRANDOM(-25,25)/35, RotationY = MRANDOM(-25,25)/35, RotationZ = MRANDOM(-25,25)/35, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			else
				WACKYEFFECT({Time = MRANDOM(10,30)*5, EffectType = "Box", Size = CHILD.Size, Size2 = CHILD.Size*MRANDOM(7,14)/10, Transparency = CHILD.Transparency, Transparency2 = 1, CFrame = CHILD.CFrame, MoveToPos = CHILD.Position+VT(0,MRANDOM(5,8)/1.5,0), MRANDOM(-25,25)/35, RotationY = MRANDOM(-25,25)/35, RotationZ = MRANDOM(-25,25)/35, Material = "Neon", Color = C3(0,0,0), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			end
			CHILD:remove()
		end
	end
end

function ApplyAoE(POSITION,RANGE,MINDMG,MAXDMG,FLING,FLINGTO,INSTAKILL)
	for index, CHILD in pairs(workspace:GetDescendants()) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("HumanoidRootPart") or CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if INSTAKILL == true then
							CHILD:BreakJoints()
						else
							local DMG = MRANDOM(MINDMG,MAXDMG)
							ApplyDamage(HUM,DMG)
						end
						if FLING ~= "Twist" then
							for _, c in pairs(CHILD:GetChildren()) do
								if c:IsA("BasePart") then
									local bv = Instance.new("BodyVelocity",c) 
									bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
									if FLINGTO == nil then
										bv.velocity = CF(POSITION,TORSO.Position).lookVector*FLING
									else
										bv.velocity = CF(TORSO.Position,TORSO.Position + FLINGTO).lookVector*FLING
									end
									Debris:AddItem(bv,0.01)
								end
							end
						else
							TORSO.CFrame = TORSO.CFrame * ANGLES(RAD(0),RAD(10),RAD(0))
							local bv = Instance.new("BodyVelocity",TORSO) 
							bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
							bv.velocity = VT(0,0,0)
							Debris:AddItem(bv,0.01)
						end
					end
				end
			end
		end
	end
end

--//=================================\\
--||	ATTACK FUNCTIONS AND STUFF
--\\=================================//

function Twister()
	local DIST = (RootPart.Position - Mouse.Hit.p).Magnitude
	if DIST > 25 then
		DIST = 25
	end
	local HIT,POS = Raycast(RootPart.Position, (CF(RootPart.Position, Mouse.Hit.p)).lookVector, DIST, workspace)
	ATTACK = true
	Rooted = true
	local WAND,WELD,SPARKS = SpawnWand(LeftArm)
	CreateSound(769380905, WAND.Base, 2, 1.5, false)
	for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(40), RAD(40), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	end
	SPARKS.Enabled = true
	local SPIN = 0
	for i = 1, 25 do
		Swait()
		SPIN = SPIN + 1
		ApplyAoE(POS,7,1,1,"Twist",nil,false)
		WACKYEFFECT({Time = 10, EffectType = "Swirl", Size = VT(10,10,10), Size2 = VT(11,11,11), Transparency = 0.8, Transparency2 = 1, CFrame = CF(POS)*ANGLES(RAD(0),RAD(MRANDOM(0,360)),RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 6, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(90+15*SIN(SPIN/4)), RAD(0), RAD(-15*COS(SPIN/4))) * LEFTSHOULDERC0, 2 / Animation_Speed)
	end
	local FINISHER = false
	M = Mouse.Button1Down:connect(function(NEWKEY)
		M:Disconnect()
		FINISHER = true
	end)
	for i = 1, 50 do
		Swait()
		if FINISHER == true then
			break
		end
		SPIN = SPIN + 1
		ApplyAoE(POS,7,1,1,"Twist",nil,false)
		WACKYEFFECT({Time = 10, EffectType = "Swirl", Size = VT(10,10,10), Size2 = VT(11,11,11), Transparency = 0.8, Transparency2 = 1, CFrame = CF(POS)*ANGLES(RAD(0),RAD(MRANDOM(0,360)),RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 6, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(90+15*SIN(SPIN/4)), RAD(0), RAD(-15*COS(SPIN/4))) * LEFTSHOULDERC0, 2 / Animation_Speed)
	end
	if FINISHER == true then
		coroutine.resume(coroutine.create(function()
			ApplyAoE(POS,10,15,25,170,VT(0,15,0),false)
			WACKYEFFECT({EffectType = "Wave", Size = VT(10,2,10), Size2 = VT(22,4,22), Transparency = 0, Transparency2 = 1, CFrame = CF(POS)*ANGLES(RAD(0),RAD(MRANDOM(0,360)),RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 6, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(1,1,1), Size2 = VT(15,15,15), Transparency = 0, Transparency2 = 1, CFrame = CF(POS), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = 174580476, SoundPitch = 1, SoundVolume = 6})
			for i = 1, 15 do
				Swait()
				WACKYEFFECT({Time = 35-(i*2), EffectType = "Sphere", Size = VT(1,1,1), Size2 = VT(8,8,8), Transparency = 0, Transparency2 = 1, CFrame = CF(POS), MoveToPos = POS+VT(0,15,0), RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
			end
		end))
		for i = 1, 35 do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0.12 + (i/30)) * ANGLES(RAD(-25), RAD(0), RAD(45)), 0.6 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(140), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
		end
	end
	WAND:remove()
	ATTACK = false
	Rooted = false
end
function DissapearingAct()
	ATTACK = true
	Rooted = true
	local WAND,WELD,SPARKS = SpawnWand(LeftArm)
	CreateSound(769380905, WAND.Base, 2, 1.5, false)
	for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(40), RAD(40), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	end
	SPARKS.Enabled = true
	local SPIN = 0
	for i = 1, 35 do
		Swait()
		SPIN = SPIN + 1
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(-35), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(90+15*SIN(SPIN/4)), RAD(0), RAD(-15*COS(SPIN/4))) * LEFTSHOULDERC0, 2 / Animation_Speed)
	end
	local POS = Mouse.Hit.p+VT(0,4.5,0)
	SHAKECAM(POS,25,3,7)
	SHAKECAM(RootPart.Position,25,3,7)
	local ORI = RootPart.Orientation
	for i = 1, 5 do
		local ANGLE = CF(Torso.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))
		WACKYEFFECT({Time = 30, EffectType = "Sphere", Size = VT(4,4,4), Size2 = VT(0,15,0), Transparency = 0, Transparency2 = 1, CFrame = ANGLE, MoveToPos = ANGLE*CF(0,30,0).p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	end
	LARGESPARKS:Emit(250)
	Swait()
	WACKYEFFECT({Time = 35, EffectType = "Sphere", Size = VT(10,10,10), Size2 = VT(25,25,25), Transparency = 0, Transparency2 = 1, CFrame = CF(Torso.Position), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = 174580476, SoundPitch = 1, SoundVolume = 6})
	RootPart.CFrame = CF(POS)
	RootPart.Orientation = ORI
	RootJoint.Parent = RootPart
	LARGESPARKS:Emit(250)
	WAND:remove()
	ATTACK = false
	Rooted = false
end
function DrawCards()
	ATTACK = true
	Rooted = true
	HATWELD.Part0 = RightArm
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		HATWELD.C0 = Clerp(HATWELD.C0,CF(-0.4,-1.25,0) * ANGLES(RAD(90), RAD(0), RAD(0)) * CF(0,-0.7,0), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(35)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-35)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.8, 0.5, -0.2) * ANGLES(RAD(110), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.8, 0.5, -0.2) * ANGLES(RAD(90), RAD(0), RAD(15)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	end
	local ORI = RootPart.Orientation
	for E = 1, 3 do
		local CARD = CreatePart(3, Effects, "Neon", 0, 0, BRICKC("Pearl"), "Card", VT(0.3,0,0.7), true)
		local COLORS = {"New Yeller","Really red","Dark indigo","Really black"}
		local COLOR = COLORS[MRANDOM(1,#COLORS)]
		CARD.Color = BRICKC(COLOR).Color
		CARD.CFrame = HAT.Base.CFrame*CF(-0.1,0,0)
		CARD.Orientation = ORI
		CARD.Position = VT(CARD.Position.X,RootPart.Position.Y+0.7,CARD.Position.Z)
		local POS = Mouse.Hit.p
		WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = CARD.Size, Size2 = VT(1.3,1.3,1.3), Transparency = 0, Transparency2 = 1, CFrame = CARD.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CARD.Color, SoundID = 1177785010, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
		for i= 1, 25 do
			Swait()
			HATWELD.C0 = Clerp(HATWELD.C0,CF(-0.4,-1.25,0) * ANGLES(RAD(90), RAD(0), RAD(0)) * CF(0,-0.7,0), 1 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(35)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-35)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.8, 0.5, -0.2) * ANGLES(RAD(110), RAD(0), RAD(35*E)) * ANGLES(RAD(0), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 0.3 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.8, 0.5, -0.2) * ANGLES(RAD(90), RAD(0), RAD(-25)) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end
		coroutine.resume(coroutine.create(function()
			wait(0.5)
			for i = 1, 150 do
				Swait()
				if COLOR ~= "Really red" then
					CARD.CFrame = Clerp(CARD.CFrame, CF(CARD.Position,POS), 0.2) * CF(0,0,-1)
				else
					CARD.CFrame = Clerp(CARD.CFrame, CF(CARD.Position,POS), 0.2) * CF(0,0,-0.6)
				end
				if (CARD.Position - POS).Magnitude < 2 then
					break
				end
			end
			local LOC = CARD.Position
			CARD:remove()
			if COLOR == "New Yeller" then
				SHAKECAM(LOC,35,1,35)
				WACKYEFFECT({Time = 35, EffectType = "Sphere", Size = VT(10,10,10), Size2 = VT(0,0,0), Transparency = 1, Transparency2 = 0.9, CFrame = CF(LOC), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CARD.Color, SoundID = 304999618, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
				for i = 1, 5 do
					Lightning({Material = "Neon", FadeIn = false, Color = CARD.Color, Start = LOC, End = LOC+VT(MRANDOM(-70,70),MRANDOM(-70,70),MRANDOM(-70,70)), SegmentL = 2, Thickness = 0.1, DoesFade = true, Ignore = workspace, MaxDist = MRANDOM(18,25), Branches = false, FadeTime = 25, Thicken = false})
				end
				local EN = {true,false}
				for index, CHILD in pairs(workspace:GetDescendants()) do
					if CHILD.ClassName == "Model" and CHILD ~= Character then
						local HUM = CHILD:FindFirstChildOfClass("Humanoid")
						if HUM then
							local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
							if TORSO and HUM.Health > 0 then
								if (TORSO.Position - LOC).Magnitude <= 20 then
									coroutine.resume(coroutine.create(function()
										for i = 1, 250 do
											Swait()
											if HUM.Health > 0 then
												HUM.PlatformStand = EN[MRANDOM(1,2)]
												HUM.Sit = EN[MRANDOM(1,2)]
												TORSO.RotVelocity = VT(MRANDOM(-1,1),MRANDOM(-1,1),MRANDOM(-1,1))*15
												if MRANDOM(1,50) == 1 then
													CreateSound(168586586, TORSO, 4, MRANDOM(12,17)/10, false)
													ApplyDamage(HUM,MRANDOM(3,7))
													for i = 1, MRANDOM(1,3) do
														Lightning({Material = "Neon", FadeIn = false, Color = CARD.Color, Start = TORSO.Position, End = TORSO.Position+VT(MRANDOM(-70,70),MRANDOM(-70,70),MRANDOM(-70,70)), SegmentL = 2, Thickness = 0, DoesFade = false, Ignore = workspace, MaxDist = MRANDOM(5,8), Branches = false, FadeTime = 25, Thicken = false})
													end
												end
											else
												break
											end
										end
										HUM.PlatformStand = false
									end))
								end
							end
						end
					end
				end
			elseif COLOR == "Really red" then
				ApplyAoE(LOC,35,0,0,0,nil,true)
				SHAKECAM(LOC,55,10,25)
				WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(25,25,25), Size2 = VT(0,0,0), Transparency = 1, Transparency2 = 0, CFrame = CF(LOC), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CARD.Color, SoundID = 288641686, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
				for i = 1, 35 do
					local ANGLE = CF(LOC) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))
					WACKYEFFECT({Time = 30, EffectType = "Sphere", Size = VT(4,4,4), Size2 = VT(0,15,0), Transparency = 0, Transparency2 = 1, CFrame = ANGLE, MoveToPos = ANGLE*CF(0,30,0).p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CARD.Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
				end
			elseif COLOR == "Dark indigo" then
				SHAKECAM(LOC,35,2,25)
				WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(25,25,25), Size2 = VT(0,0,0), Transparency = 1, Transparency2 = 0, CFrame = CF(LOC), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CARD.Color, SoundID = 178452217, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
				WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(15,15,15), Size2 = VT(0,0,0), Transparency = 1, Transparency2 = 0, CFrame = CF(LOC), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CARD.Color, SoundID = nil, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
				for index, CHILD in pairs(workspace:GetDescendants()) do
					if CHILD.ClassName == "Model" and CHILD ~= Character then
						local HUM = CHILD:FindFirstChildOfClass("Humanoid")
						if HUM then
							local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
							if TORSO and HUM.Health > 0 then
								if (TORSO.Position - LOC).Magnitude <= 20 then
									coroutine.resume(coroutine.create(function()
										for i = 1, 450 do
											Swait()
											if HUM.Health > 0 then
												HUM.Health = HUM.Health - 0.1
												HUM:MoveTo(TORSO.Position+VT(MRANDOM(-1,1),MRANDOM(-1,1),MRANDOM(-1,1))*45)
												if MRANDOM(1,15) == 1 then
													HUM.Jump = true
													TORSO.CFrame = TORSO.CFrame * CF(MRANDOM(-2,2),MRANDOM(-2,2),MRANDOM(-2,2))
												end
											else
												break
											end
										end
										HUM:MoveTo(TORSO.Position)
									end))
								end
							end
						end
					end
				end
			elseif COLOR == "Really black" then
				WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(25,25,25), Size2 = VT(0,0,0), Transparency = 1, Transparency2 = 0, CFrame = CF(LOC), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CARD.Color, SoundID = 592877506, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
				WACKYEFFECT({Time = 25, EffectType = "Sphere", Size = VT(15,15,15), Size2 = VT(35,35,35), Transparency = 0.8, Transparency2 = 1, CFrame = CF(LOC), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = CARD.Color, SoundID = nil, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
				for index, CHILD in pairs(workspace:GetDescendants()) do
					if CHILD.ClassName == "Model" and CHILD ~= Character then
						local HUM = CHILD:FindFirstChildOfClass("Humanoid")
						if HUM then
							local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
							if TORSO and HUM.Health > 0 then
								if (TORSO.Position - LOC).Magnitude <= 30 and TORSO:FindFirstChild("LowGrav") == nil then
									local b = IT("BodyForce",TORSO)
									b.Name = "LowGrav"
									b.force = Vector3.new(0,3500,0)
									Debris:AddITem(b,5)
									local bv = Instance.new("BodyVelocity",TORSO) 
									bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
									bv.velocity = CF(TORSO.Position,TORSO.Position + VT(MRANDOM(-1,1),MRANDOM(-1,1),MRANDOM(-1,1))*45).lookVector*35
									HUM.PlatformStand = true
									TORSO.RotVelocity = VT(MRANDOM(-1,1),MRANDOM(-1,1),MRANDOM(-1,1))*15
									Debris:AddItem(bv,0.01)
								end
							end
						end
					end
				end
			end
		end))
	end
	HATWELD.Part0 = Head
	ATTACK = false
	Rooted = false
end
function BonusDuck()
	ATTACK = true
	Rooted = true
	local WAND,WELD,SPARKS = SpawnWand(LeftArm)
	CreateSound(769380905, WAND.Base, 2, 1.5, false)
	for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(40), RAD(40), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	end
	CreateSound(199607491, Head, 5, 1, false)
	SPARKS.Enabled = true
	local SPIN = 0
	local DUCKIES = false
	local GYRO = IT("BodyGyro",RootPart)
	GYRO.D = 20
	GYRO.P = 4000
	GYRO.MaxTorque = VT(0,40000,0)
	coroutine.resume(coroutine.create(function()
		repeat
			GYRO.CFrame = CF(RootPart.Position,Mouse.Hit.p)
			Swait()
			SPIN = SPIN + 1
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(-35), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.45, 0.5, 0) * ANGLES(RAD(150+15*SIN(SPIN/4)), RAD(0), RAD(-15*COS(SPIN/4))) * CF(0,-0.5,0) * LEFTSHOULDERC0, 2 / Animation_Speed)
		until DUCKIES == true
	end))
	local DUCK = CreatePart(3, Effects, "Neon", 0, 1, BRICKC("Pearl"), "DUCK", VT(5,5,5), true)
	DUCK.CFrame = RootPart.CFrame*CF(0,6,0)
	CreateMesh("SpecialMesh", DUCK, "FileMesh", "9419831", "9419827", VT(4,4,4), VT(0,0,0))
	for i = 1, 200 do
		Swait()
		DUCK.Transparency = DUCK.Transparency - 1/200
		DUCK.CFrame = RootPart.CFrame*CF(0,6,0)
		local ANGLE = CF(DUCK.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))) * CF(0,25,0) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))
		WACKYEFFECT({Time = 30, EffectType = "Duck", Size = VT(4,4,4)/3, Size2 = VT(3,3,3)/3, Transparency = 1, Transparency2 = 0, CFrame = ANGLE, MoveToPos = DUCK.Position, RotationX = MRANDOM(-1,1), RotationY = MRANDOM(-1,1), RotationZ = MRANDOM(-1,1), Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = 198462271, SoundPitch = MRANDOM(7,14)/10, SoundVolume = 1})
		local ANGLE = CF(DUCK.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))
		WACKYEFFECT({Time = 30, EffectType = "Sphere", Size = VT(1,1,1), Size2 = VT(0,15,0), Transparency = 0, Transparency2 = 1, CFrame = ANGLE, MoveToPos = ANGLE*CF(0,30,0).p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	end
	wait(0.5)
	DUCKIES = true
	for i = 1, 35 do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0.12 + (i/30)) * ANGLES(RAD(-25), RAD(0), RAD(45)), 0.6 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-45)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(140), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.4 / Animation_Speed)
	end
	coroutine.resume(coroutine.create(function()
		CreateSound(198462271, DUCK, 5, 0.4, false)
		DUCK.CFrame = CF(DUCK.Position,Mouse.Hit.p+VT(0,3,0))
		for i = 1, 150 do
			Swait()
			DUCK.CFrame = DUCK.CFrame * CF(0,0,-1.6)
			local HIT,HITPOS = Raycast(DUCK.Position, DUCK.CFrame.lookVector, 2.5, Character)
			ApplyAoE(DUCK.Position,15,0,0,15,DUCK.CFrame.lookVector,false)
			WACKYEFFECT({Time = 15, EffectType = "Wave", Size = VT(4,1,4), Size2 = VT(15,2,15), Transparency = 0, Transparency2 = 1, CFrame = DUCK.CFrame*CF(0,0,-2.5) * ANGLES(RAD(-90), RAD(0), RAD(0)), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
			if HIT then
				break
			end
		end
		ApplyAoE(DUCK.Position,45,45,70,150,nil,false)
		DUCK:remove()
		for i = 1, 35 do
			local ANGLE = CF(DUCK.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))
			WACKYEFFECT({Time = 30, EffectType = "Sphere", Size = VT(4,4,4), Size2 = VT(0,15,0), Transparency = 0, Transparency2 = 1, CFrame = ANGLE, MoveToPos = ANGLE*CF(0,30,0).p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		end
		SHAKECAM(DUCK.Position,60,3,7)
		WACKYEFFECT({Time = 35, EffectType = "Sphere", Size = VT(4,4,4), Size2 = VT(60,60,60), Transparency = 0, Transparency2 = 1, CFrame = DUCK.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = 168513088, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
		WACKYEFFECT({Time = 70, EffectType = "Duck", Size = VT(4,4,4), Size2 = VT(35,35,35), Transparency = 0, Transparency2 = 1, CFrame = DUCK.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
	end))
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		WELD.C1 = Clerp(WELD.C1,CF(0, 0, 0) * ANGLES(RAD(40), RAD(0), RAD(0)), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(25), RAD(0), RAD(25)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-25)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(70), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	end
	WAND:remove()
	GYRO:remove()
	ATTACK = false
	Rooted = false
end
function TheAudienceDissapears()
	ATTACK = true
	Rooted = true
	local GOODBYE = CreateSound(135824631, Head, 8, 1, false)
	repeat
		Swait()
		GOODBYE.Parent = Head
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(45), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, -1) * ANGLES(RAD(0), RAD(0), RAD(-90)) * ANGLES(RAD(0), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	until GOODBYE.TimePosition >= 1.3
	repeat
		Swait()
		GOODBYE.Parent = Head
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(45), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-45), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, -1) * ANGLES(RAD(0), RAD(0), RAD(-90)) * ANGLES(RAD(0), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 0.6 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	until GOODBYE.Playing == false
	HAT.Parent = nil
	local FAKEHAT = HAT:Clone()
	local SIZE = function(S)
		FAKEHAT.Base.Size = VT(1.757, 1.309, 1.749)*S
		FAKEHAT.MeshPart.Size = VT(1.957, 1.509, 1.949)*S
		FAKEHAT.MeshPart.CFrame = FAKEHAT.Base.CFrame*CF(0,S/10,0)
	end
	FAKEHAT.Parent = Character
	FAKEHAT.Base.Anchored = true
	FAKEHAT.MeshPart.Anchored = true
	local INSIZE = false
	local VACUUM = false
	coroutine.resume(coroutine.create(function()
		--[[for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(-10), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-45), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(170), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 0.6 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(170), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end]]
		repeat
			Swait()
			FAKEHAT:SetPrimaryPartCFrame(RootPart.CFrame*CF(0,3+FAKEHAT.Base.Size.Y/2,0))
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(-10), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-45), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(170), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 0.6 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(170), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		until INSIZE == true
		local GYRO = IT("BodyGyro",RootPart)
		GYRO.D = 20
		GYRO.P = 4000
		GYRO.MaxTorque = VT(0,40000,0)
		repeat
			GYRO.CFrame = CF(RootPart.Position,Mouse.Hit.p)
			Swait()
			FAKEHAT:SetPrimaryPartCFrame(Clerp(FAKEHAT.Base.CFrame,RootPart.CFrame*CF(0,0,-5) * ANGLES(RAD(90), RAD(0), RAD(0)),0.2))
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(85), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.6 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(85), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		until VACUUM == true
		GYRO:remove()
	end))
	for i = 1, 80 do
		Swait()
		SIZE(1+(i/40))
	end
	INSIZE = true
	local EYE = CreatePart(3, FAKEHAT, "Neon", 0, 0, BRICKC("Pearl"), "Eyeball", VT(2,2,2), true)
	CreateSound(429459101, EYE, 8, 1, false)
	EYE.CFrame = FAKEHAT.Base.CFrame * CF(0,-FAKEHAT.Base.Size.Y/2.3,0) * ANGLES(RAD(-90), RAD(0), RAD(0))
	local MESH = CreateMesh("SpecialMesh", EYE, "FileMesh", "1185246", "1193831", VT(3,0,0.2), VT(0,0,0))
	for i = 1, 45 do
		Swait()
		MESH.Scale = MESH.Scale + VT(0,3/45,0)
	end
	Rooted = false
	Speed = 10
	for i = 1, 400 do
		Swait()
		SHAKECAM(FAKEHAT.Base.CFrame*CF(0,-40,0).p,60,3,2)
		for index, CHILD in pairs(workspace:GetDescendants()) do
			if CHILD.ClassName == "Model" and CHILD ~= Character then
				local HUM = CHILD:FindFirstChildOfClass("Humanoid")
				if HUM then
					local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
					if TORSO and HUM.Health > 0 then
						if (TORSO.Position - EYE.Position).Magnitude <= 6 then
							ONESHOT(CHILD)
							CreateSound(1177785010, FAKEHAT.Base, 4, 0.5, false)
						elseif (FAKEHAT.Base.CFrame*CF(0,-40,0).p - TORSO.Position).Magnitude <= 40 then
							local bv = Instance.new("BodyVelocity",TORSO) 
							bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
							bv.velocity = CF(TORSO.Position,FAKEHAT.Base.Position).lookVector*60
							Debris:AddItem(bv,0.2)
						end
					end
				end
			end
		end
		local ANGLE = FAKEHAT.Base.CFrame*CF(0,-40,0) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360))) * CF(0,0,MRANDOM(2,20))
		WACKYEFFECT({Time = 10, EffectType = "Sphere", Size = VT(2,2,2), Size2 = VT(0,0,5), Transparency = 0, Transparency2 = 1, CFrame = CF(ANGLE.p,FAKEHAT.Base.Position), MoveToPos = FAKEHAT.Base.Position, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"Mulberry".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
	end
	for i = 1, 45 do
		Swait()
		MESH.Scale = MESH.Scale - VT(0,3/45,0)
	end
	EYE:remove()
	for i = 1, 80 do
		Swait()
		SIZE(3-(i/40))
	end
	VACUUM = true
	Rooted = true
	Speed = 35
	for i=0, 1.5, 0.1 / Animation_Speed do
		Swait()
		FAKEHAT:SetPrimaryPartCFrame(Clerp(FAKEHAT.Base.CFrame,Head.CFrame * CF(0,0.9,0),0.2))
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(4 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(5 + 2.5 * SIN(SINE / 12))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-5)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(0), RAD(0 - 2.5 * SIN(SINE / 12)), RAD(20 + 7.5 * SIN(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.55, 0.25, 0) * ANGLES(RAD(0), RAD(0 + 2.5 * SIN(SINE / 12)), RAD(-20 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
	end
	FAKEHAT:remove()
	HAT.Parent = Character
	HATWELD.Parent = Head
	for i=0, 3, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(45), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, -1) * ANGLES(RAD(0), RAD(0), RAD(-90)) * ANGLES(RAD(0), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end
function AudiencePlay()
	ATTACK = true
	Rooted = true
	PLAY = false
	local PLAYING = true
	local SONG = CreateSound(322621962, RootPart, 10, 1, true)
	for i=0, 2, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(45), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, -1) * ANGLES(RAD(0), RAD(0), RAD(-90)) * ANGLES(RAD(0), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	end
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			local ANGLE = CF(RootPart.Position-VT(0,10,0)) * ANGLES(RAD(0), RAD(MRANDOM(0,360)), RAD(0))*CF(0,0,MRANDOM(5,25))
			local COLORS = {"New Yeller","Deep blue","Lime green","Really red","Royal purple","Pearl"}
			WACKYEFFECT({Time = 35, EffectType = "Sphere", Size = VT(2,2,2), Size2 = VT(0,60,0), Transparency = 0, Transparency2 = 1, CFrame = ANGLE, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC(COLORS[MRANDOM(1,#COLORS)]).Color, SoundID = nil, SoundPitch = MRANDOM(8,12)/10, SoundVolume = 6})
		until PLAYING == false
	end))
	local WAND,WELD,SPARKS = SpawnWand(RightArm)
	KEY = Mouse.KeyDown:connect(function(NEWKEY)
		if NEWKEY == "m" then
			KEY:Disconnect()
			PLAYING = false
		end
	end)
	repeat
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			if PLAYING == false then
				break
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(-25), RAD(0), RAD(35)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(170), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(140), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end
		for i=0, 0.13, 0.1 / Animation_Speed do
			Swait()
			if PLAYING == false then
				break
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(25), RAD(0), RAD(35)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(40), RAD(0), RAD(12)) * CF(0,-1,0) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(40), RAD(0), RAD(-12)) * CF(0,-1,0) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end
		SPARKS:Emit(15)
		for i = 1, 5 do
			local ANGLE = CF(WAND.Head.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))
			WACKYEFFECT({Time = MRANDOM(10,50), EffectType = "Duck", Size = VT(1,1,1), Size2 = VT(1,1,1), Transparency = 0, Transparency2 = 1, CFrame = ANGLE, MoveToPos = ANGLE*CF(0,30,0).p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		end
		for i=0, 0.13, 0.1 / Animation_Speed do
			Swait()
			if PLAYING == false then
				break
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(25), RAD(0), RAD(35)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(40), RAD(0), RAD(12)) * CF(0,-1,0) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(40), RAD(0), RAD(-12)) * CF(0,-1,0) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			if PLAYING == false then
				break
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(-25), RAD(0), RAD(-35)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(170), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(140), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end
		for i=0, 0.13, 0.1 / Animation_Speed do
			Swait()
			if PLAYING == false then
				break
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(25), RAD(0), RAD(-35)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(40), RAD(0), RAD(12)) * CF(0,-1,0) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(40), RAD(0), RAD(-12)) * CF(0,-1,0) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end
		SPARKS:Emit(15)
		for i = 1, 5 do
			local ANGLE = CF(WAND.Head.Position) * ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))
			WACKYEFFECT({Time = MRANDOM(10,50), EffectType = "Duck", Size = VT(1,1,1), Size2 = VT(1,1,1), Transparency = 0, Transparency2 = 1, CFrame = ANGLE, MoveToPos = ANGLE*CF(0,30,0).p, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = BRICKC"New Yeller".Color, SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		end
		for i=0, 0.13, 0.1 / Animation_Speed do
			Swait()
			if PLAYING == false then
				break
			end
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(25), RAD(0), RAD(-35)), 0.5 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(40), RAD(0), RAD(12)) * CF(0,-1,0) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(40), RAD(0), RAD(-12)) * CF(0,-1,0) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end
	until PLAYING == false or SONG.Parent ~= RootPart
	SONG:remove()
	CreateSound(1869741275, RootPart, 5, 1.3, false)
	WAND:remove()
	for i=0, 6, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(45), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.35, -1) * ANGLES(RAD(0), RAD(0), RAD(-90)) * ANGLES(RAD(0), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 1 / Animation_Speed)
	end
	PLAY = true
	ATTACK = false
	Rooted = false
end

--//=================================\\
--||	  ASSIGN THINGS TO KEYS
--\\=================================//

function MouseDown(Mouse)
	if ATTACK == false then
		Twister()
	end
end

function MouseUp(Mouse)
HOLD = false
end

function KeyDown(Key)
	KEYHOLD = true
	if Key == "q" and ATTACK == false then
		DissapearingAct()
	end

	if Key == "z" and ATTACK == false then
		DrawCards()
	end

	if Key == "c" and ATTACK == false then
		BonusDuck()
	end

	if Key == "x" and ATTACK == false then
		TheAudienceDissapears()
	end

	if Key == "m" and ATTACK == false then
		AudiencePlay()
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

--//=================================\\
--\\=================================//

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

--//=================================\\
--||	WRAP THE WHOLE SCRIPT UP
--\\=================================//

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end)

while true do
	Swait()
	--script.Parent = WEAPONGUI
	ANIMATE.Parent = nil
	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
	    v:Stop();
	end
	Humanoid.HipHeight = 3.3
	SINE = SINE + CHANGE
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
	if ATTACK == false then
		HATWELD.C0 = Clerp(HATWELD.C0,CF(0,0.9,0), 1 / Animation_Speed)
		if TORSOVELOCITY < 1 then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 12)) * ANGLES(RAD(4 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(5 + 2.5 * SIN(SINE / 12))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(-5)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.55, 0.25, 0) * ANGLES(RAD(0), RAD(0 + 2.5 * SIN(SINE / 12)), RAD(-20 - 7.5 * SIN(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		elseif TORSOVELOCITY > 1 then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.25 * COS(SINE / 3)) * ANGLES(RAD(14 + 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.55, 0.75, 0) * ANGLES(RAD(170), RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-35)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.65, 0.2, 0) * ANGLES(RAD(60 * COS(SINE / 6)), RAD(0 + 2.5 * SIN(SINE / 12)), RAD(-20 - 7.5 * SIN(SINE / 12))) * CF(0, -0.2, 0) * LEFTSHOULDERC0, 1 / Animation_Speed)
		end
	end
	unanchor()
	Humanoid.MaxHealth = 3e3
	Humanoid.Health = 3e3
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	for _, c in pairs(Character:GetChildren()) do
		if c.ClassName == "Part" and c.Name ~= "Eye" then
			c.Material = "Neon"
			c.Color = C3(0,0,0)
			c.Transparency = 1
			if c == Head then
				if c:FindFirstChild("face") then
					c.face:remove()
				end
			end
		elseif c.ClassName == "CharacterMesh" or c.ClassName == "Accessory" or c.Name == "Body Colors" then
			c:remove()
		elseif (c.ClassName == "Shirt" or c.ClassName == "Pants") and c.Name ~= "Cloth" then
			c:remove()
		end
	end
	sick.SoundId = "rbxassetid://1583302174"
	sick.Looped = true
	sick.Pitch = 1
	sick.Volume = 4
	sick.Parent = Torso
	sick.Playing = PLAY
	local PITCH = sick.Pitch
	local SONGID = 1583302174
	local VOLUME = 3
	local TIMESTAMP = sick.TimePosition
	if sick.Parent ~= Torso then
		sick = IT("Sound", Torso)
		sick.SoundId = "rbxassetid://" .. SONGID
		sick.Looped = true
		sick.Pitch = PITCH
		sick.Volume = VOLUME
		sick.Playing = true
		sick.EmitterSize = 50
		sick.TimePosition = TIMESTAMP
		FIXING = true
	elseif FIXING == false then
		TIMESTAMP = sick.TimePosition
	else
		FIXING = false
	end
end

--//=================================\\
--\\=================================//





--//====================================================\\--
--||			  		 END OF SCRIPT
--\\====================================================//--