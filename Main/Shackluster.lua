--//====================================================\\--
--||			   CREATED BY SHACKLUSTER
--\\====================================================//--
 
wait(0.2)
 
Player = game:GetService("Players").LocalPlayer
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
local Speed = 20
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
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
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "PIXELGUI"
local Effects = IT("Folder", Character)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
local UNANCHOR = true
local SONG = 853518668
local DEAD = false
 
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
			MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)
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
 
--//=================================\\
--||	     WEAPON CREATION
--\\=================================//
 
local sick = CreateSound(853518668, Torso, 3, 0.9, true)
 
Head:ClearAllChildren()
 
local EYE = CreatePart(3, Character, "Neon", 0, 0, "Really red", "Eyeball", VT(0.15,0.15,0.15),false)
MakeForm(EYE,"Ball")
CreateWeldOrSnapOrMotor("Weld", Head, Head, EYE, CF(0.15,0.26,-0.55), CF(0, 0, 0))
local EYE2 = CreatePart(3, Character, "Neon", 0, 0, "Really red", "Eyeball", VT(0.15,0.15,0.15),false)
MakeForm(EYE2,"Ball")
CreateWeldOrSnapOrMotor("Weld", Head, Head, EYE2, CF(-0.15,0.26,-0.55), CF(0, 0, 0))
 
 
local HAT1 = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Really black", "Detail", VT(2,0.2,2),false)
HATWELD = CreateWeldOrSnapOrMotor("Weld", Head, Head, HAT1, CF(0,0.35,0), CF(0, 0, 0))
local BELT = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Really black", "Part", VT(1.35,0.4,1.35),false)
CreateWeldOrSnapOrMotor("Weld", HAT1, HAT1, BELT, CF(0,0.25,0), CF(0, 0, 0))
local HAT2 = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Really black", "Detail", VT(1.3,2.2,1.3),false)
CreateWeldOrSnapOrMotor("Weld", HAT1, HAT1, HAT2, CF(0,1.1,0), CF(0, 0, 0))
 
local TIE1 = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Really black", "Detail", VT(0.5,0.5,0),false)
CreateWeldOrSnapOrMotor("Weld", Torso, Torso, TIE1, CF(0,0.8,-0.5), CF(0, 0, 0))
local TIE2 = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Really black", "Detail", VT(0.2,0.5,0),false)
CreateWeldOrSnapOrMotor("Weld", TIE1, TIE1, TIE2, CF(0,-0.5,0), CF(0, 0, 0))
local TIE3 = CreatePart(3, Character, "SmoothPlastic", 0, 0, "Really black", "Detail", VT(0.5,1,0),false)
CreateWeldOrSnapOrMotor("Weld", TIE2, TIE2, TIE3, CF(0,-0.75,0), CF(0, 0, 0))
 
Humanoid.DisplayDistanceType = "None"
local naeeym2 = IT("BillboardGui",Character)
naeeym2.AlwaysOnTop = true
naeeym2.Size = UDim2.new(5,35,2,15)
naeeym2.StudsOffset = Vector3.new(0,6,0)
naeeym2.MaxDistance = 75
naeeym2.Adornee = RootPart
naeeym2.Name = "Name"
naeeym2.PlayerToHideFrom = Player
local tecks2 = IT("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.TextScaled = true
tecks2.BorderSizePixel = 0
tecks2.Text = "Dark Pixels"
tecks2.Font = "Arcade"
tecks2.TextSize = 20
tecks2.TextStrokeTransparency = 1
tecks2.TextColor3 = BRICKC"Really black".Color
tecks2.TextStrokeColor3 = BRICKC"Really black".Color
tecks2.Size = UDim2.new(1,0,0.5,0)
tecks2.Parent = naeeym2
 
local MESH = IT("BlockMesh",Head)
MESH.Scale = VT(0.5,1,1)
 
local SKILLTEXTCOLOR = BRICKC"Really black".Color
local SKILLFONT = "Arcade"
local SKILLTEXTSIZE = 7
 
Humanoid.Died:connect(function()
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA("BasePart") then
			c.Anchored = true
		end
	end
	naeeym2:remove()
	ATTACK = true
	DEAD = true
	UNANCHOR = false
	Character.PrimaryPart = RootPart
	CreateSound(580288658, Effects, 3, 1, false)
	Humanoid:remove()
	for i = 1, 50 do
		wait()
		Character:SetPrimaryPartCFrame(RootPart.CFrame *CF(0,0,0) * ANGLES(RAD(0), RAD(0), RAD(90)))
	end
	UNANCHOR = true
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA("BasePart") then
			c.CanCollide = true
			c.Velocity = VT(MRANDOM(-45,45),MRANDOM(45,85),MRANDOM(-45,45))
		end
	end
end)
 
local SKILL1FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.8, 0, 0.90, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 1 Frame")
local SKILL2FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.8, 0, 0.84, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 2 Frame")
local SKILL3FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.8, 0, 0.78, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 3 Frame")
local SKILL4FRAME = CreateFrame(WEAPONGUI, 1, 2, UD2(0.8, 0, 0.72, 0), UD2(0.26, 0, 0.07, 0), C3(0,0,0), C3(0, 0, 0), "Skill 4 Frame")
 
local SKILL1TEXT = CreateLabel(SKILL1FRAME, "[Z]", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0, "Text 1")
local SKILL2TEXT = CreateLabel(SKILL2FRAME, "[B]", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0, "Text 2")
local SKILL3TEXT = CreateLabel(SKILL3FRAME, "[C]", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0, "Text 3")
local SKILL4TEXT = CreateLabel(SKILL4FRAME, "[V]", SKILLTEXTCOLOR, SKILLTEXTSIZE, SKILLFONT, 0, 2, 0, "Text 4")
 
--//=================================\\
--||			DAMAGING
--\\=================================//
 
function ApplyDamage(Humanoid,Damage)
	Damage = Damage * DAMAGEMULTIPLIER
	if Humanoid.Health ~= 0 then
		Humanoid.Health = Humanoid.Health - Damage
	end
end
 
function ApplyAoE(POSITION,RANGE,MINDMG,MAXDMG,FLING,INSTAKILL)
	local CHILDREN = workspace:GetDescendants()
	for index, CHILD in pairs(CHILDREN) do
		if CHILD.ClassName == "Model" and CHILD ~= Character then
			local HUM = CHILD:FindFirstChildOfClass("Humanoid")
			if HUM then
				local TORSO = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if TORSO then
					if (TORSO.Position - POSITION).Magnitude <= RANGE then
						if INSTAKILL == true then
							CHILD:BreakJoints()
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
 
function APPLYMELEE(PART,MINDMG,MAXDMG)
	local ONESHOT = false
	if MINDMG == "inf" then
		ONESHOT = true
	end
	local HITS = {}
	local TOUCH = PART.Touched:Connect(function(hit)
		if hit.Parent:FindFirstChildOfClass("Humanoid") and hit.Parent ~= Character then
			local HUM = hit.Parent:FindFirstChildOfClass("Humanoid")
			local TORSO = hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso")
			if TORSO and HUM.Health > 0 then
				local PASS = true
				for i = 1, #HITS do
					if HITS[i] == hit.Parent then
						PASS = false
					end
				end
				table.insert(HITS,hit.Parent)
				if PASS == true then
					if ONESHOT == false then
						ApplyDamage(HUM,MRANDOM(MINDMG,MAXDMG))
					else
						CreateSound(1538571923, TORSO, 10, 1, false)
						HUM.Parent:BreakJoints()
						HUM:remove()
						for _, c in pairs(TORSO.Parent:GetChildren()) do
							if c:IsA("BasePart") then
								c.CanCollide = true
								c.Velocity = VT(MRANDOM(-45,45),MRANDOM(45,85),MRANDOM(-45,45))
								Debris:AddItem(c,MRANDOM(5,20)/10)
							end
						end
					end
				end
			end
		end
	end)
	return TOUCH
end
 
function GoombaStomp(OBJECT)
	for _, c in pairs(OBJECT:GetChildren()) do
		if c:IsA("BasePart") then
			c.Size = VT(c.Size.X,0,c.Size.Z)
		end
	end
end
 
--//=================================\\
--||	ATTACK FUNCTIONS AND STUFF
--\\=================================//
 
function MushroomAi(Mushroom)
	coroutine.resume(coroutine.create(function()
		for i = 1, 500 do
			wait()
			local DISTANCE = 500
			local TARGET = nil
			local HUMAN = nil
			for _, c in pairs(workspace:GetChildren()) do
				if c.ClassName == "Model" and c:FindFirstChildOfClass("Humanoid") and c ~= Character then
					local HUM = c:FindFirstChildOfClass("Humanoid")
					local TORSO = c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
					if TORSO and HUM.Health > 0 then
						if (TORSO.Position - Mushroom.PrimaryPart.Position).Magnitude < DISTANCE then
							DISTANCE = (TORSO.Position - Mushroom.PrimaryPart.Position).Magnitude
							TARGET = TORSO
							HUMAN = HUM
						end
					end
				end
			end
			if TARGET then
				local HITFLOOR,HITPOS = Raycast(Mushroom.PrimaryPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 1, Mushroom)
				if HITFLOOR then
					local CFRAME = CF(Mushroom.PrimaryPart.Position,VT(TARGET.Position.X,Mushroom.PrimaryPart.Position.Y,TARGET.Position.Z))*CF(0,0,-0.3).p
					Mushroom:SetPrimaryPartCFrame(CF(CFRAME))
					local DIST = (TARGET.Position - Mushroom.PrimaryPart.Position).Magnitude
					if DIST < 4*(TARGET.Size.Y/2) then
						HUMAN.Health = HUMAN.Health - (HUMAN.MaxHealth-1)
						break
					end
				else
					Mushroom:SetPrimaryPartCFrame(CF(HITPOS))
				end
			end
		end
		Mushroom:remove()
	end))
end
 
function QuestionMarkBlock()
	ATTACK = true
	Rooted = true
	local BLOCKMODEL = IT("Model",Effects)
	local LOAD = false
	local BLOCK = CreatePart(3, BLOCKMODEL, "Neon", 0, 0, "New Yeller", "Base", VT(2,2,2))
	BLOCK.CFrame = CF(RootPart.CFrame*CF(0,15,0).p)
	BLOCKMODEL.PrimaryPart = BLOCK
	for i = 1, 4 do
		local BASE = CreatePart(3, BLOCKMODEL, "Neon", 0, 1, "New Yeller", "Blocc", VT(1.3,1.3,2)*1.001)
		BASE.CFrame = BLOCK.CFrame * ANGLES(RAD(0), RAD((360/4)*i), RAD(0))
		local DECAL = IT("Decal",BASE)
		DECAL.Texture = "http://www.roblox.com/asset/?id=1019185679"
		local PART = CreatePart(3, BLOCKMODEL, "Neon", 0, 0, "Pearl", "Blocc", VT(0.2,0.2,2.1))
		PART.CFrame = BASE.CFrame*CF(0.75,0.75,0)
		local PART = CreatePart(3, BLOCKMODEL, "Neon", 0, 0, "Pearl", "Blocc", VT(0.2,0.2,2.1))
		PART.CFrame = BASE.CFrame*CF(0.75,-0.75,0)
	end
	local LANDED = false
	local HIT = false
	local LOOP = 0
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(0), RAD(7.5-30*SIN(sick.PlaybackLoudness/300)), RAD(0 - 25 * SIN(SINE / 15))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(0), RAD(-15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		until LOAD == true
		repeat
			Swait()
			if HIT == false then
				local HITFLOOR = Raycast(BLOCK.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 1.2, BLOCKMODEL)
				if HITFLOOR then
					HIT = true
					coroutine.resume(coroutine.create(function()
						local CFRAME = BLOCK.CFrame
						RootPart.Velocity = VT(0,0,0)
						RootPart.RotVelocity = VT(0,0,0)
						for i = 1, 5 do
							wait()
							RootPart.Velocity = VT(0,-i*4,0)
							RootPart.RotVelocity = VT(0,0,0)
							BLOCKMODEL:SetPrimaryPartCFrame(Clerp(CFRAME, CFRAME*CF(0,(5-i),0), 1 / Animation_Speed))
						end
						BLOCK.BrickColor = BRICKC"Dirt brown"
						for _, c in pairs(BLOCKMODEL:GetChildren()) do
							if c:IsA("BasePart") and c.Name ~= "Base" then
								c:remove()
							end
						end
						CreateSound(1246464612, BLOCK, 10, 1, false)
						local SIZE = 2.25
						local MUSHROOM = IT("Model",Effects)
						local BASE = CreatePart(3, MUSHROOM, "Neon", 0, 0, "Fawn brown", "Shroom", VT(0.5,0.5,0.5)*SIZE)
						MUSHROOM.PrimaryPart = BASE
						local HEAD = CreatePart(3, MUSHROOM, "Neon", 0, 0, "Mulberry", "Shroom", VT(0.75,0.45,0.75)*SIZE)
						HEAD.CFrame = BASE.CFrame*CF(0,0.35*SIZE,0)
						for i = 1, 2 do
							local DOT = CreatePart(3, MUSHROOM, "Neon", 0, 0, "Lime green", "Shroom", VT(0.35,0.35,0.8)*SIZE)
							DOT.CFrame = HEAD.CFrame * ANGLES(RAD(0), RAD((180/2)*i), RAD(0))
						end
						local HEAD = CreatePart(3, MUSHROOM, "Neon", 0, 0, "Mulberry", "Shroom", VT(0.55,0.45,0.55)*SIZE)
						HEAD.CFrame = BASE.CFrame*CF(0,0.55*SIZE,0)
						MUSHROOM:SetPrimaryPartCFrame(BLOCK.CFrame)
						for i = 1, 30 do
							wait()
							MUSHROOM:SetPrimaryPartCFrame(BLOCK.CFrame*CF(0,-0.35+(i/18),0))
						end
						MushroomAi(MUSHROOM)
						Debris:AddItem(BLOCKMODEL,5)			
					end))
				end
			else
				local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
				if HITFLOOR then
					LANDED = true
				end
			end
			LOOP = LOOP + 1
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.75, -0.2) * ANGLES(RAD(150), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(-15)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.4-sick.PlaybackLoudness/800, -0.7) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.3) * ANGLES(RAD(-25), RAD(-80), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 2 / Animation_Speed)
		until LANDED == true or ATTACK == false
	end))
	wait(1)
	LOAD = true
	CreateSound(158309736, Torso, 10, 1, false)
	local bv = Instance.new("BodyVelocity",RootPart) 
	bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
	bv.velocity = CF(RootPart.Position,BLOCK.Position).lookVector*150
	Debris:AddItem(bv,0.05)
	repeat wait() until LANDED == true or LOOP > 45
	Debris:AddItem(BLOCKMODEL,5)	
	ATTACK = false
	Rooted = false
end
 
function SwordBeam()
	ATTACK = true
	Rooted = false
	local SWORDMODEL = IT("Model",Effects)
	local HANDLE = CreatePart(3, SWORDMODEL, "Neon", 0, 0, "Shamrock", "Stic", VT(0.2,2,0.2),false)
	local GRIP = CreateWeldOrSnapOrMotor("Weld", RightArm, RightArm, HANDLE, CF(0,-1,0)* ANGLES(RAD(-90), RAD(90), RAD(0)), CF(0, -0.3, 0))
	local PART = CreatePart(3, SWORDMODEL, "Neon", 0, 0, "Shamrock", "Stic", VT(1,0.2,0.2),false)
	CreateWeldOrSnapOrMotor("Weld", HANDLE, HANDLE, PART, CF(0,1,0), CF(0, 0, 0))
	local PART = CreatePart(3, SWORDMODEL, "Neon", 0, 0, "Pearl", "Stic", VT(0.5,2,0.1),false)
	CreateWeldOrSnapOrMotor("Weld", HANDLE, HANDLE, PART, CF(0,2,0), CF(0, 0, 0))
	local PART = CreatePart(3, SWORDMODEL, "Neon", 0, 0, "Pearl", "Stic", VT(0.25,2,0.1),false)
	CreateWeldOrSnapOrMotor("Weld", HANDLE, HANDLE, PART, CF(0,2.25,0), CF(0, 0, 0))
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(160), RAD(15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	coroutine.resume(coroutine.create(function()
		local BEAM = IT("Model",Effects)
		local BASE = CreatePart(3, BEAM, "Neon", 0, 0, "Really red", "Stic", VT(0.1,0.5,2))
		BASE.CFrame = RootPart.CFrame*CF(1.5,-0.4,0)
		local PART = CreatePart(3, BEAM, "Neon", 0, 0, "Really red", "Stic", VT(0.1,0.25,2))
		PART.CFrame = BASE.CFrame*CF(0,0,-0.2)
		for i = 1, 4 do
			local PART = CreatePart(3, BEAM, "Neon", 0, 0, "Really red", "Stic", VT(0.1,0.75,0.1))
			PART.CFrame = BASE.CFrame*CF(0,0,-0.8+(i/2.5))
		end
		BEAM.PrimaryPart = BASE
		for i = 1, 75 do
			wait()
			BEAM:SetPrimaryPartCFrame(BASE.CFrame*CF(0,0,-2))
			local HITFLOOR = Raycast(BASE.Position, BASE.CFrame.lookVector, 2.1, Character)
			if HITFLOOR then
				if HITFLOOR.Parent:FindFirstChildOfClass("Humanoid") then
					local HUM = HITFLOOR.Parent:FindFirstChildOfClass("Humanoid")
					ApplyDamage(HUM,15)
				end
				break
			end
		end
		BEAM:remove()
	end))
	for i=0, 0.05, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(25), RAD(15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	for i=0, 0.5, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(-25), RAD(15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	SWORDMODEL:remove()
	ATTACK = false
	Rooted = false
end
 
function Candy()
	ATTACK = true
	Rooted = true
	local CANDYMODEL = IT("Model",Effects)
	local HANDLE = CreatePart(3, CANDYMODEL, "Neon", 0, 0, "Dirt brown", "Stic", VT(0.2,1,0.2),false)
	local GRIP = CreateWeldOrSnapOrMotor("Weld", RightArm, RightArm, HANDLE, CF(0,-1,0)* ANGLES(RAD(-90), RAD(90), RAD(0)), CF(0, -0.3, 0))
	local HEAD1 = CreatePart(3, CANDYMODEL, "Neon", 0, 0, "Pearl", "Stic", VT(1,1,0.21),false)
	CreateWeldOrSnapOrMotor("Weld", HANDLE, HANDLE, HEAD1, CF(0,1,0)* ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
	local HEAD2 = CreatePart(3, CANDYMODEL, "Neon", 0, 0, "Really red", "Stic", VT(0.85,0.85,0.22),false)
	CreateWeldOrSnapOrMotor("Weld", HEAD1, HEAD1, HEAD2, CF(0,0,0)* ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
	local HEAD3 = CreatePart(3, CANDYMODEL, "Neon", 0, 0, "Pearl", "Stic", VT(0.55,0.55,0.23),false)
	CreateWeldOrSnapOrMotor("Weld", HEAD2, HEAD2, HEAD3, CF(0,0,0)* ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
	local HEAD4 = CreatePart(3, CANDYMODEL, "Neon", 0, 0, "Really red", "Stic", VT(0.25,0.25,0.24),false)
	CreateWeldOrSnapOrMotor("Weld", HEAD3, HEAD3, HEAD4, CF(0,0,0)* ANGLES(RAD(0), RAD(0), RAD(0)), CF(0, 0, 0))
	local THROWN = false
	local THROW = Mouse.Button1Down:connect(function(NEWKEY)
		THROWN = true
	end)
	for i=0, 2, 0.1 / Animation_Speed do
		Swait()
		if THROWN == true then
			break
		end
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(120), RAD(15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	THROW:disconnect()
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		if THROWN == true then
			break
		end
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(25), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.25, 0.15+sick.PlaybackLoudness/1200, 0.3) * ANGLES(RAD(100), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	if THROWN == false then
		CANDYMODEL:remove()
		coroutine.resume(coroutine.create(function()
			SONG = 554418756
			Speed = 35
			sick:Play()
			for i = 1, 150 do
				local MELEES = {}
				for _, c in pairs(Character:GetChildren()) do
					if c:IsA("BasePart") then
						local MELEE = APPLYMELEE(c,"inf","inf")
						table.insert(MELEES,MELEE)
						WACKYEFFECT({Time = 25, EffectType = "Block", Size = VT(1,1,1)/2, Size2 = VT(1,1,1)/2, Transparency = .7, Transparency2 = 1, CFrame = c.CFrame*ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))*CF(0,0,2), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
					end
				end
				wait(0.1)
				for e = 1, #MELEES do
					MELEES[e]:disconnect()
				end
			end
			sick:Play()
			Speed = 20
			SONG = 853518668
		end))
	else
		local GIVEINV = function(OBJECT,HUMAN)
			local TORSO = OBJECT:FindFirstChild("Torso") or OBJECT:FindFirstChild("UpperTorso")
			if TORSO then
				if TORSO:FindFirstChild("YAY") == nil then
					local MUSIC = CreateSound(554418756, TORSO, 3, 1, true)
					MUSIC.Name = "YAY"
					HUMAN.WalkSpeed = 35
					local HEALTH = HUMAN.MaxHealth
					for i = 1, 150 do
						HUMAN.MaxHealth = 999999999999999999*999999999999999999*999999999999999999*999999999999999999
						HUMAN.Health = HUMAN.MaxHealth
						MUSIC.Parent = TORSO
						local MELEES = {}
						for _, c in pairs(OBJECT:GetChildren()) do
							if c:IsA("BasePart") then
								local MELEE = APPLYMELEE(c,"inf","inf")
								table.insert(MELEES,MELEE)
								WACKYEFFECT({Time = 25, EffectType = "Block", Size = VT(1,1,1)/2, Size2 = VT(1,1,1)/2, Transparency = .7, Transparency2 = 1, CFrame = c.CFrame*ANGLES(RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)), RAD(MRANDOM(0,360)))*CF(0,0,2), MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
							end
						end
						wait(0.1)
						for e = 1, #MELEES do
							MELEES[e]:disconnect()
						end
					end
					HUMAN.MaxHealth = HEALTH
					HUMAN.Health = HUMAN.MaxHealth
					MUSIC:remove()
					HUMAN.WalkSpeed = 16
				end
			end
		end
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(160), RAD(15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for i=0, 0.05, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(25), RAD(15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		for _, c in pairs(CANDYMODEL:GetChildren()) do
			if c:IsA("BasePart") then
				c.CanCollide = true
				c.Touched:Connect(function(hit)
					if hit.Parent ~= Character then
						if hit.Parent:FindFirstChildOfClass("Humanoid") then
							CANDYMODEL:remove()
							GIVEINV(hit.Parent,hit.Parent:FindFirstChildOfClass("Humanoid"))
						end
					end
				end)
			end
		end
		GRIP:remove()
		HANDLE.Velocity = CF(HANDLE.Position,Torso.CFrame*CF(0,7,-15).p).lookVector*MRANDOM(45,80)
		Debris:AddItem(CANDYMODEL,10)
		for i=0, 0.4, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(25), RAD(15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	end
	ATTACK = false
	Rooted = false
end
 
function Peashooter()
	ATTACK = true
	Rooted = true
	local LOADED = false
	local BLASTER = IT("Model",Effects)	
	local HANDLE = CreatePart(3, BLASTER, "Neon", 0, 1, "Cyan", "Shooter", VT(1.3,1.4,1.3),false)
	CreateWeldOrSnapOrMotor("Weld", RightArm, RightArm, HANDLE, CF(0,-0.5,0), CF(0, 0, 0))
	local HANDLE = CreatePart(3, BLASTER, "Neon", 0, 1, "Cyan", "Shooter", VT(1.1,1.4,1.1),false)
	CreateWeldOrSnapOrMotor("Weld", RightArm, RightArm, HANDLE, CF(0,-0.75,0), CF(0, 0, 0))
	local SHOT = false
	local FINISHED = false
	coroutine.resume(coroutine.create(function()
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(160), RAD(15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		LOADED = true
		WACKYEFFECT({Time = 25, EffectType = "Block", Size = VT(1,1,1)*3, Size2 = VT(1,1,1), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		for _, c in pairs(BLASTER:GetChildren()) do
			if c:IsA("BasePart") then
				c.Transparency = 0
			end
		end
		repeat
			Swait()
			turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(-45)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(80), RAD(15), RAD(45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		until SHOT == true
		repeat
			turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(-45)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(80), RAD(15), RAD(45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			coroutine.resume(coroutine.create(function()
				local BULLET = IT("Model",Effects)
				local MAIN = CreatePart(3, BULLET, "Neon", 0, 0, "Cork", "Bullet", VT(1,1,1.5))
				CreateSound(635556833, RightArm, 3, 1, false)
				BULLET.PrimaryPart = MAIN
				local PART = CreatePart(3, BULLET, "Neon", 0, 0, "Cork", "Bullet", VT(0.8,0.8,2))
				MAIN.CFrame = CF(RightArm.CFrame*CF(0,-2,0).p,Mouse.Hit.p)
				PART.CFrame = MAIN.CFrame
				for i = 1, 75 do
					wait()
					BULLET:SetPrimaryPartCFrame(MAIN.CFrame*CF(0,0,-2))
					local HITFLOOR = Raycast(MAIN.Position, MAIN.CFrame.lookVector, 2.1, Character)
					if HITFLOOR then
						if HITFLOOR.Parent:FindFirstChildOfClass("Humanoid") then
							local HUM = HITFLOOR.Parent:FindFirstChildOfClass("Humanoid")
							ApplyDamage(HUM,10)
						end
						break
					end
				end
				BULLET:remove()
			end))
			for i = 1, 25 do
				Swait()
				turnto(Mouse.Hit.p)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(-45)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(80), RAD(15), RAD(45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			end
		until HOLD == false
		for i=0, 0.2, 0.1 / Animation_Speed do
			Swait()
			turnto(Mouse.Hit.p)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(45)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-5), RAD(0), RAD(-45)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(80), RAD(15), RAD(45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
		WACKYEFFECT({Time = 25, EffectType = "Block", Size = VT(1,1,1)*3, Size2 = VT(1,1,1), Transparency = 0, Transparency2 = 1, CFrame = RightArm.CFrame, MoveToPos = nil, RotationX = 0, RotationY = 0, RotationZ = 0, Material = "Neon", Color = C3(1,1,1), SoundID = nil, SoundPitch = nil, SoundVolume = nil})
		BLASTER:remove()
		FINISHED = true
	end))
	repeat wait() until LOADED == true
	wait(0.5)
	local FIRE = Mouse.Button1Down:connect(function(NEWKEY)
		SHOT = true
	end)
	repeat wait() until SHOT == true
	FIRE:disconnect()
	repeat wait() until FINISHED == true
	ATTACK = false
	Rooted = false
end
 
function QuestionMarkBlock2()
	ATTACK = true
	Rooted = true
	local BLOCKMODEL = IT("Model",Effects)
	local LOAD = false
	local BLOCK = CreatePart(3, BLOCKMODEL, "Neon", 0, 0, "New Yeller", "Base", VT(2,2,2))
	BLOCK.CFrame = CF(RootPart.CFrame*CF(0,15,0).p)
	BLOCKMODEL.PrimaryPart = BLOCK
	local FRAME = RootPart.CFrame*CF(0,15,0)
	for i = 1, 4 do
		local BASE = CreatePart(3, BLOCKMODEL, "Neon", 0, 1, "New Yeller", "Blocc", VT(1.3,1.3,2)*1.001)
		BASE.CFrame = BLOCK.CFrame * ANGLES(RAD(0), RAD((360/4)*i), RAD(0))
		local DECAL = IT("Decal",BASE)
		DECAL.Texture = "http://www.roblox.com/asset/?id=1019185679"
		local PART = CreatePart(3, BLOCKMODEL, "Neon", 0, 0, "Pearl", "Blocc", VT(0.2,0.2,2.1))
		PART.CFrame = BASE.CFrame*CF(0.75,0.75,0)
		local PART = CreatePart(3, BLOCKMODEL, "Neon", 0, 0, "Pearl", "Blocc", VT(0.2,0.2,2.1))
		PART.CFrame = BASE.CFrame*CF(0.75,-0.75,0)
	end
	local LANDED = false
	local HIT = false
	local LOOP = 0
	coroutine.resume(coroutine.create(function()
		repeat
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(0), RAD(7.5-30*SIN(sick.PlaybackLoudness/300)), RAD(0 - 25 * SIN(SINE / 15))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(0), RAD(-15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		until LOAD == true
		repeat
			Swait()
			if HIT == false then
				local HITFLOOR = Raycast(BLOCK.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 1.2, BLOCKMODEL)
				if HITFLOOR then
					HIT = true
					coroutine.resume(coroutine.create(function()
						local CFRAME = BLOCK.CFrame
						RootPart.Velocity = VT(0,0,0)
						RootPart.RotVelocity = VT(0,0,0)
						coroutine.resume(coroutine.create(function()
							CreateSound(138702491, BLOCK, 10, 1, false)
							local COIN = CreatePart(3, BLOCKMODEL, "Neon", 0, 1, "New Yeller", "Coin", VT(1.8,1.8,0))
							COIN.CFrame = BLOCK.CFrame
							local DECAL = IT("Decal",COIN)
							DECAL.Texture = "http://www.roblox.com/asset/?id=1512322302"
							local DECAL = IT("Decal",COIN)
							DECAL.Texture = "http://www.roblox.com/asset/?id=1512322302"
							DECAL.Face = "Back"
							for i = 1, 15 do
								wait()
								COIN.CFrame = Clerp(FRAME, FRAME*CF(0,(15-(i/10)),0), 1 / Animation_Speed)
							end
							COIN:remove()
						end))
						for i = 1, 5 do
							wait()
							RootPart.Velocity = VT(0,-i*4,0)
							RootPart.RotVelocity = VT(0,0,0)
							BLOCKMODEL:SetPrimaryPartCFrame(Clerp(CFRAME, CFRAME*CF(0,(5-i),0), 1 / Animation_Speed))
						end
						BLOCK.BrickColor = BRICKC"Dirt brown"
						for _, c in pairs(BLOCKMODEL:GetChildren()) do
							if c:IsA("BasePart") and c.Name ~= "Base" then
								c:remove()
							end
						end
						Debris:AddItem(BLOCKMODEL,5)			
					end))
				end
			else
				local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
				if HITFLOOR then
					LANDED = true
				end
			end
			LOOP = LOOP + 1
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.75, -0.2) * ANGLES(RAD(150), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(-15)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.4-sick.PlaybackLoudness/800, -0.7) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.3) * ANGLES(RAD(-25), RAD(-80), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 2 / Animation_Speed)
		until LANDED == true or ATTACK == false
	end))
	wait(0.3)
	LOAD = true
	CreateSound(158309736, Torso, 10, 1, false)
	local bv = Instance.new("BodyVelocity",RootPart) 
	bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
	bv.velocity = CF(RootPart.Position,BLOCK.Position).lookVector*150
	Debris:AddItem(bv,0.05)
	repeat wait() until LANDED == true or LOOP > 45
	Debris:AddItem(BLOCKMODEL,5)	
	ATTACK = false
	Rooted = false
end
 
--//=================================\\
--||	  ASSIGN THINGS TO KEYS
--\\=================================//
 
function MouseDown(Mouse)
	HOLD = true
	if ATTACK == false then
	end
end
 
function MouseUp(Mouse)
HOLD = false
end
 
function KeyDown(Key)
	KEYHOLD = true
	if Key == "z" and ATTACK == false then
		QuestionMarkBlock()
	end
 
	if Key == "b" and ATTACK == false then
		SwordBeam()
	end
 
	if Key == "c" and ATTACK == false and SONG == 853518668 then
		Candy()
	end
 
	if Key == "v" and ATTACK == false then
		Peashooter()
	end
 
	if Key == "t" and ATTACK == false then
		QuestionMarkBlock2()
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
	if UNANCHOR == true then
		for _, c in pairs(Character:GetChildren()) do
			if c:IsA("BasePart") then
				c.Anchored = false
			end
		end
	else
		for _, c in pairs(Character:GetChildren()) do
			if c:IsA("BasePart") then
				c.Anchored = true
			end
		end
	end
end
 
--//=================================\\
--||	WRAP THE WHOLE SCRIPT UP
--\\=================================//
 
local JUMPED = false
 
Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	elseif Jump == "Jump" and Disable_Jump == false and JUMPED == false then
		JUMPED = true
		CreateSound(158309736, Torso, 10, 1, false)
	end
end)
 
while true do
	Swait()
	script.Parent = WEAPONGUI
	ANIMATE.Parent = nil
	for _,v in next, Humanoid:GetPlayingAnimationTracks() do
	    v:Stop();
	end
	Humanoid.JumpPower = 75
	SINE = SINE + CHANGE
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4, Character)
	local WALKSPEEDVALUE = 4 / (Humanoid.WalkSpeed / 16)
	if ANIM == "Walk" and TORSOVELOCITY > 1 then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, -0.15 * COS(SINE / (WALKSPEEDVALUE / 2))) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0)), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 0.825 - 0.175 * SIN(SINE / WALKSPEEDVALUE) - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.125 * COS(SINE / WALKSPEEDVALUE) +0.1- 0.5 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(76 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 0.825 + 0.175 * SIN(SINE / WALKSPEEDVALUE) - 0.15 * COS(SINE / WALKSPEEDVALUE*2), 0.125 * COS(SINE / WALKSPEEDVALUE) +0.1+ 0.5 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(76 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
	elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	if HITFLOOR == nil then
		ANIM = "Midair"
		local JUMPHIT = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 5, Character)
		if JUMPHIT ~= nil and TORSOVERTICALVELOCITY < 0 then
			if JUMPHIT.Name == "Head" and JUMPHIT:FindFirstChild("Stomped") == nil then
				local HIT = IT("Folder",JUMPHIT)
				HIT.Name = "Stomped"
				CreateSound(165013277, JUMPHIT, 10, 1, false)
				RootPart.Velocity = VT(0,80,0)
				GoombaStomp(JUMPHIT.Parent)
			elseif JUMPHIT.Parent.ClassName == "Accessory" then
				local HEAD = JUMPHIT.Parent.Parent:FindFirstChild("Head")
				if HEAD then
					if HEAD:FindFirstChild("Stomped") == nil then
						local HIT = IT("Folder",HEAD)
						HIT.Name = "Stomped"
						CreateSound(165013277, HEAD, 10, 1, false)
						RootPart.Velocity = VT(0,80,0)
						GoombaStomp(HEAD.Parent)
					end
				end
			end
		end
		local JUMPHIT = Raycast(RootPart.CFrame*CF(1,0,0).p, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 5, Character)
		if JUMPHIT ~= nil and TORSOVERTICALVELOCITY < 0 then
			if JUMPHIT.Name == "Head" and JUMPHIT:FindFirstChild("Stomped") == nil then
				local HIT = IT("Folder",JUMPHIT)
				HIT.Name = "Stomped"
				CreateSound(165013277, JUMPHIT, 10, 1, false)
				RootPart.Velocity = VT(0,80,0)
				GoombaStomp(JUMPHIT.Parent)
			elseif JUMPHIT.Parent.ClassName == "Accessory" then
				local HEAD = JUMPHIT.Parent.Parent:FindFirstChild("Head")
				if HEAD then
					if HEAD:FindFirstChild("Stomped") == nil then
						local HIT = IT("Folder",HEAD)
						HIT.Name = "Stomped"
						CreateSound(165013277, HEAD, 10, 1, false)
						RootPart.Velocity = VT(0,80,0)
						GoombaStomp(HEAD.Parent)
					end
				end
			end
		end
		local JUMPHIT = Raycast(RootPart.CFrame*CF(-1,0,0).p, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 5, Character)
		if JUMPHIT ~= nil and TORSOVERTICALVELOCITY < 0 then
			if JUMPHIT.Name == "Head" and JUMPHIT:FindFirstChild("Stomped") == nil then
				local HIT = IT("Folder",JUMPHIT)
				HIT.Name = "Stomped"
				CreateSound(165013277, JUMPHIT, 10, 1, false)
				RootPart.Velocity = VT(0,80,0)
				GoombaStomp(JUMPHIT.Parent)
			elseif JUMPHIT.Parent.ClassName == "Accessory" then
				local HEAD = JUMPHIT.Parent.Parent:FindFirstChild("Head")
				if HEAD then
					if HEAD:FindFirstChild("Stomped") == nil then
						local HIT = IT("Folder",HEAD)
						HIT.Name = "Stomped"
						CreateSound(165013277, HEAD, 10, 1, false)
						RootPart.Velocity = VT(0,80,0)
						GoombaStomp(HEAD.Parent)
					end
				end
			end
		end
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.75, -0.2) * ANGLES(RAD(150), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(-15)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.4-sick.PlaybackLoudness/800, -0.7) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.3) * ANGLES(RAD(-25), RAD(-80), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 2 / Animation_Speed)
	    end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		ANIM = "Idle"
		JUMPED = false
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0+sick.PlaybackLoudness/800) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(0), RAD(7.5-30*SIN(sick.PlaybackLoudness/300)), RAD(0 - 25 * SIN(SINE / 15))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(0), RAD(-15), RAD(-2+sick.PlaybackLoudness/45)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, -0.01) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		end
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		JUMPED = false
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.1+sick.PlaybackLoudness/800) * ANGLES(RAD(5), RAD(0), RAD(0)), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1+sick.PlaybackLoudness/800) - 1)) * ANGLES(RAD(5 - 2 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(7.5-30*SIN(sick.PlaybackLoudness/300)), RAD(0)), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5+sick.PlaybackLoudness/1200, 0) * ANGLES(RAD(60 * COS(SINE / WALKSPEEDVALUE)), RAD(0), RAD(-5)) * RIGHTSHOULDERC0, 0.35 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, 0.3) * ANGLES(RAD(0), RAD(55), RAD(-12)) * ANGLES(RAD(-45), RAD(0), RAD(0)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1-sick.PlaybackLoudness/800, 0) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-3)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1-sick.PlaybackLoudness/800, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(3)), 2 / Animation_Speed)
		end
	end
	unanchor()
	Humanoid.MaxHealth = 999999999999999999*999999999999999999*999999999999999999*999999999999999999
	Humanoid.Health = Humanoid.MaxHealth
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	local COLOR = C3((0+sick.PlaybackLoudness/200)/510,(115+sick.PlaybackLoudness/25)/510,(150+sick.PlaybackLoudness*1.5)/610)
	for _, c in pairs(Character:GetChildren()) do
		if c:IsA("BasePart") and c.Name ~= "Detail" then
			c.Material = "Neon"
			if c:FindFirstChildOfClass("ParticleEmitter") then
				c:FindFirstChildOfClass("ParticleEmitter"):remove()
			end
			c.Color = BRICKC"Really black".Color
			if c == Head then
				if c:FindFirstChild("face") then
					c.face:remove()
				end
			end
		elseif c.ClassName == "CharacterMesh" or c.ClassName == "Accessory" or c.Name == "Body Colors" then
			c:remove()
		elseif (c.ClassName == "Shirt" or c.ClassName == "Pants") and c.Name ~= "Cloth" then
			c:remove()
		elseif c.Name == "Detail" then
			c.Material = "Neon"
			c.Color = COLOR
		end
	end
	if DEAD == false then
		sick.SoundId = "rbxassetid://"..SONG
		sick.Looped = true
		sick.Pitch = 1
		sick.Volume = 2
		sick.Playing = true
		sick.Parent = Torso
	else
		sick:remove()
	end
	Humanoid.Name = "Mr Pixels"
end
 
--//=================================\\
--\\=================================//
 
 
 
 
 
--//====================================================\\--
--||			  		 END OF SCRIPT
--\\====================================================//--