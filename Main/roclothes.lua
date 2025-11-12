--[[	
	














	
	/ ＲＯＣＬＯＴＨＥＳ
	Version - 0.7.3:lerp()
	Link - discord.gg/HBzvWE6Rp3
	
	| RoClothes Is Exploiting Script, Allowing Player To Have Nude BodyParts/Clothes
	Can Be Use On Any Executor
	
	| This Script Will Cause FPS Drop
	Because Of BodyParts/Clothes Mesh Inside Player Model
	
	| 𝐔𝐒𝐄 𝐀𝐓 𝐘𝐎𝐔𝐑 𝐎𝐖𝐍 𝐑𝐈𝐒𝐊
	| 𝐖𝐎𝐑𝐊 𝐈𝐍 𝐏𝐑𝐎𝐆𝐑𝐄𝐒𝐒
	
	The original developer of RoClothes is no longer working on this script.
	This is a MODDED version of this script that might or might not be updated.
	If you know who the creator of this mod is, feel free to request or suggest some things.
	
	
	
	original version 0.7
	local version 0.7.3:lerp()
	
	














]]



























local RS = game:GetService("RunService")

function RoClothes(Player)
	warn("RoClothes Connected")

	--[[
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------

                                      ██╗░░░░░░█████╗░░█████╗░░█████╗░██╗░░░░░
                                      ██║░░░░░██╔══██╗██╔══██╗██╔══██╗██║░░░░░
                                      ██║░░░░░██║░░██║██║░░╚═╝███████║██║░░░░░
                                      ██║░░░░░██║░░██║██║░░██╗██╔══██║██║░░░░░
                                      ███████╗╚█████╔╝╚█████╔╝██║░░██║███████╗
                                      ╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚══════╝
                                  
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	]]

	local GUIObject = {}

	GUIObject.Screen = Instance.new("ScreenGui")
	GUIObject.MainFrame = Instance.new("TextButton")
	GUIObject.Dragger = Instance.new("UIDragDetector")
	GUIObject.PageFrame = Instance.new("Frame")
	GUIObject.UIGradient = Instance.new("UIGradient")
	GUIObject.UICorner = Instance.new("UICorner")
	GUIObject.Clothes_3 = Instance.new("Frame")
	GUIObject.ClothesSearch = Instance.new("TextBox")
	GUIObject.UIGradient_34 = Instance.new("UIGradient")
	GUIObject.UICorner_35 = Instance.new("UICorner")
	GUIObject.ClothesButtonFrame = Instance.new("ScrollingFrame")
	GUIObject.UIGridLayout = Instance.new("UIGridLayout")
	GUIObject.Menu = Instance.new("Frame")
	GUIObject.DestroyFrame = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UIGradient_3 = Instance.new("UIGradient")
	GUIObject.UICorner_3 = Instance.new("UICorner")
	GUIObject.DestroyButton = Instance.new("TextButton")
	GUIObject.PlayerFrame = Instance.new("Frame")
	GUIObject.UIGradient_4 = Instance.new("UIGradient")
	GUIObject.UICorner_4 = Instance.new("UICorner")
	GUIObject.PlayerExecute = Instance.new("TextBox")
	GUIObject.BreastsTypeFrame = Instance.new("Frame")
	GUIObject.UIGradient_5 = Instance.new("UIGradient")
	GUIObject.UICorner_5 = Instance.new("UICorner")
	GUIObject.BreastsTypeButton = Instance.new("TextButton")
	GUIObject.BundleFrame = Instance.new("Frame")
	GUIObject.UIGradient_6 = Instance.new("UIGradient")
	GUIObject.UICorner_6 = Instance.new("UICorner")
	GUIObject.BundleText = Instance.new("TextLabel")
	GUIObject.DelayFrame = Instance.new("Frame")
	GUIObject.UIGradient_7 = Instance.new("UIGradient")
	GUIObject.UICorner_7 = Instance.new("UICorner")
	GUIObject.DelayTimeText = Instance.new("TextBox")
	GUIObject.AutoExecuteFrame = Instance.new("Frame")
	GUIObject.UICorner_8 = Instance.new("UICorner")
	GUIObject.UIGradient_8 = Instance.new("UIGradient")
	GUIObject.AutoExecuteButton = Instance.new("TextButton")
	GUIObject.BundleBodyColorFrame = Instance.new("Frame")
	GUIObject.UIGradient_15 = Instance.new("UIGradient")
	GUIObject.UICorner_15 = Instance.new("UICorner")
	GUIObject.BundleBodyColorButton = Instance.new("TextButton")
	GUIObject.ResetFrame = Instance.new("Frame")
	GUIObject.UICorner_9 = Instance.new("UICorner")
	GUIObject.UIGradient_9 = Instance.new("UIGradient")
	GUIObject.ResetButton = Instance.new("TextButton")
	GUIObject.ExecuteFrame = Instance.new("Frame")
	GUIObject.UICorner_10 = Instance.new("UICorner")
	GUIObject.UIGradient_10 = Instance.new("UIGradient")
	GUIObject.ExecuteButton = Instance.new("TextButton")
	GUIObject.ToneFrame = Instance.new("Frame")
	GUIObject.UIGradient_11 = Instance.new("UIGradient")
	GUIObject.UICorner_11 = Instance.new("UICorner")
	GUIObject.ToneButton = Instance.new("TextButton")
	GUIObject.Bundles = Instance.new("Frame")
	GUIObject.BundlesButtonFrame = Instance.new("ScrollingFrame")
	GUIObject.UIGridLayout_2 = Instance.new("UIGridLayout")
	GUIObject.ButtonFrame = Instance.new("Frame")
	GUIObject.UIListLayout = Instance.new("UIListLayout")
	GUIObject.FaceFrame = Instance.new("Frame")
	GUIObject.UIGradient_17 = Instance.new("UIGradient")
	GUIObject.UICorner_17 = Instance.new("UICorner")
	GUIObject.FaceButton = Instance.new("TextButton")
	GUIObject.Menu_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_12 = Instance.new("UICorner")
	GUIObject.MenuButton = Instance.new("TextButton")
	GUIObject.UIGradient_12 = Instance.new("UIGradient")
	GUIObject.Clothes_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_13 = Instance.new("UICorner")
	GUIObject.ClothesButton = Instance.new("TextButton")
	GUIObject.UIGradient_13 = Instance.new("UIGradient")
	GUIObject.Bundles_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_14 = Instance.new("UICorner")
	GUIObject.BundlesButton = Instance.new("TextButton")
	GUIObject.UIGradient_14 = Instance.new("UIGradient")
	GUIObject.NameFrame = Instance.new("Frame")
	GUIObject.NameText = Instance.new("TextLabel")
	GUIObject.VersionText = Instance.new("TextLabel")
	GUIObject.KeybindFrame = Instance.new("Frame")
	GUIObject.UIGradient_16 = Instance.new("UIGradient")
	GUIObject.UICorner_16 = Instance.new("UICorner")
	GUIObject.KeybindButton = Instance.new("TextButton")
	GUIObject.RoClothes = Instance.new("ScreenGui")
	GUIObject.Menu2 = Instance.new("Frame")
	GUIObject.LocalTransparencyFrame = Instance.new("Frame")
	GUIObject.UIGradient_18 = Instance.new("UIGradient")
	GUIObject.UICorner_18 = Instance.new("UICorner")
	GUIObject.LocalTransparencyButton = Instance.new("TextBox")
	GUIObject.CharacterFrame = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
	GUIObject.LeftArmButton = Instance.new("ImageButton")
	GUIObject.TorsoButton = Instance.new("ImageButton")
	GUIObject.RightArmButton = Instance.new("ImageButton")
	GUIObject.RightLegButton = Instance.new("ImageButton")
	GUIObject.LeftLegButton = Instance.new("ImageButton")
	GUIObject.HeadButton = Instance.new("ImageButton")
	GUIObject.UICorner_19 = Instance.new("UICorner")
	GUIObject.Menu2_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_20 = Instance.new("UICorner")
	GUIObject.Menu2Button = Instance.new("TextButton")
	GUIObject.UIGradient_19 = Instance.new("UIGradient")
	GUIObject.MeshSizeLockFrame = Instance.new("Frame")
	GUIObject.UIGradient_20 = Instance.new("UIGradient")
	GUIObject.UICorner_21 = Instance.new("UICorner")
	GUIObject.MeshSizeLockButton = Instance.new("TextButton")
	GUIObject.AccessorySizeLockFrame = Instance.new("Frame")
	GUIObject.UIGradient_21 = Instance.new("UIGradient")
	GUIObject.UICorner_22 = Instance.new("UICorner")
	GUIObject.AccessorySizeLockButton = Instance.new("TextButton")
	GUIObject.MeshBasePartInvisibleFrame = Instance.new("Frame")
	GUIObject.UIGradient_22 = Instance.new("UIGradient")
	GUIObject.UICorner_23 = Instance.new("UICorner")
	GUIObject.MeshBasePartInvisibleButton = Instance.new("TextButton")
	GUIObject.BodyPartPhysicsFrame = Instance.new("Frame")
	GUIObject.UIGradient_23 = Instance.new("UIGradient")
	GUIObject.UICorner_24 = Instance.new("UICorner")
	GUIObject.BodyPartPhysicsButton = Instance.new("TextButton")
	GUIObject.MethodFrame = Instance.new("Frame")
	GUIObject.UIGradient_24 = Instance.new("UIGradient")
	GUIObject.UICorner_25 = Instance.new("UICorner")
	GUIObject.MethodButton = Instance.new("TextButton")
	GUIObject.Edit_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_33 = Instance.new("UICorner")
	GUIObject.EditButton = Instance.new("TextButton")
	GUIObject.UIGradient_32 = Instance.new("UIGradient")
	GUIObject.Catalog_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_34 = Instance.new("UICorner")
	GUIObject.CatalogButton = Instance.new("TextButton")
	GUIObject.UIGradient_33 = Instance.new("UIGradient")
	GUIObject.Catalog_3 = Instance.new("Frame")
	GUIObject.UsernameFrame = Instance.new("Frame")
	GUIObject.UICorner_27 = Instance.new("UICorner")
	GUIObject.UsernameTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_26 = Instance.new("UIGradient")
	GUIObject.AccessoryFrame = Instance.new("Frame")
	GUIObject.UICorner_28 = Instance.new("UICorner")
	GUIObject.AccessoryTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_27 = Instance.new("UIGradient")
	GUIObject.ShirtFrame = Instance.new("Frame")
	GUIObject.UICorner_29 = Instance.new("UICorner")
	GUIObject.ShirtTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_28 = Instance.new("UIGradient")
	GUIObject.PantsFrame = Instance.new("Frame")
	GUIObject.UICorner_30 = Instance.new("UICorner")
	GUIObject.PantsTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_29 = Instance.new("UIGradient")
	GUIObject.ShirtGraphicFrame = Instance.new("Frame")
	GUIObject.UICorner_31 = Instance.new("UICorner")
	GUIObject.ShirtGraphicTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_30 = Instance.new("UIGradient")
	GUIObject.Edit = Instance.new("Frame")
	GUIObject.MeshNameFrame = Instance.new("Frame")
	GUIObject.UICorner_32 = Instance.new("UICorner")
	GUIObject.MeshNameTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_31 = Instance.new("UIGradient")
	GUIObject.PropertyListFrame = Instance.new("ScrollingFrame")
	GUIObject.UIGridLayout_4 = Instance.new("UIGridLayout")
	GUIObject.EditNote = Instance.new("TextLabel")
	GUIObject.CharacterPreviewFrame = Instance.new("Frame")
	GUIObject.ViewportFrame = Instance.new("ViewportFrame")
	GUIObject.ViewportCamera = Instance.new("Camera")
	GUIObject.PreviewUIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	GUIObject.PreviewButton = Instance.new("TextButton")
	GUIObject.ClickExecuteFrame = Instance.new("Frame")
	GUIObject.UIGradientCE = Instance.new("UIGradient")
	GUIObject.UICornerCE = Instance.new("UICorner")
	GUIObject.ClickExecuteButton = Instance.new("TextButton")
	GUIObject.PositionPhysicsMultiplyFrame = Instance.new("Frame")
	GUIObject.UICornerPPM = Instance.new("UICorner")
	GUIObject.PositionPhysicsMultiplyText = Instance.new("TextBox")
	GUIObject.UIGradientPPM = Instance.new("UIGradient")
	GUIObject.RotationPhysicsMultiplyFrame = Instance.new("Frame")
	GUIObject.UICornerRPM = Instance.new("UICorner")
	GUIObject.RotationPhysicsMultiplyText = Instance.new("TextBox")
	GUIObject.UIGradientRPM = Instance.new("UIGradient")
	GUIObject.MobileCloseButtonScreen = Instance.new("ScreenGui")
	GUIObject.MobileCloseButton = Instance.new("ImageButton")
	GUIObject.MCBUIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	GUIObject.SkinToneFrame = Instance.new("Frame")
	GUIObject.STUICorner = Instance.new("UICorner")
	GUIObject.SkinToneText = Instance.new("TextBox")
	GUIObject.STUIGradient = Instance.new("UIGradient")

	GUIObject.Menu3_3 = Instance.new("Frame")
	GUIObject.M3UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	GUIObject.M3UICorner = Instance.new("UICorner")
	GUIObject.M3UIGradient = Instance.new("UIGradient")
	GUIObject.Menu3Button = Instance.new("TextButton")

	GUIObject.Menu3 = Instance.new("Frame")
	GUIObject.BreastsScaleFrame = Instance.new("Frame")
	GUIObject.BS1UICorner = Instance.new("UICorner")
	GUIObject.BreastsScaleText = Instance.new("TextBox")
	GUIObject.BS1UIGradient = Instance.new("UIGradient")
	GUIObject.ButtsScaleFrame = Instance.new("Frame")
	GUIObject.BS2UICorner = Instance.new("UICorner")
	GUIObject.BS2UIGradient = Instance.new("UIGradient")
	GUIObject.ButtsScaleText = Instance.new("TextBox")

	GUIObject.OutfitIdFrame = Instance.new("Frame")
	GUIObject.UICornerUI = Instance.new("UICorner")
	GUIObject.OutfitIdTextbox = Instance.new("TextBox")
	GUIObject.UIGradientUI = Instance.new("UIGradient")

	GUIObject.TorsoTypeFrame = Instance.new("Frame")
	GUIObject.UIGradient_A1 = Instance.new("UIGradient")
	GUIObject.UICorner_A1 = Instance.new("UICorner")
	GUIObject.TorsoTypeButton = Instance.new("TextButton")
	GUIObject.ArmTypeFrame = Instance.new("Frame")
	GUIObject.UIGradient_A11 = Instance.new("UIGradient")
	GUIObject.UICorner_A11 = Instance.new("UICorner")
	GUIObject.ArmTypeButton = Instance.new("TextButton")
	GUIObject.LegsTypeFrame = Instance.new("Frame")
	GUIObject.UIGradient_A2 = Instance.new("UIGradient")
	GUIObject.UICorner_A2 = Instance.new("UICorner")
	GUIObject.LegsTypeButton = Instance.new("TextButton")

	GUIObject.HP = Instance.new("Frame")
	GUIObject.HPButton = Instance.new("TextButton")
	GUIObject.UIGradient_A3 = Instance.new("UIGradient")
	GUIObject.UIAspectRatioConstraint_A1 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_A3 = Instance.new("UICorner")
	GUIObject.HPFrame = Instance.new("Frame")

	GUIObject.FPFrame = Instance.new("Frame")
	GUIObject.UIGradient_A4 = Instance.new("UIGradient")
	GUIObject.UICorner_A4 = Instance.new("UICorner")
	GUIObject.FPExecute = Instance.new("TextButton")

	GUIObject.TopHPFrame = Instance.new("Frame")
	GUIObject.UIGradient_A5 = Instance.new("UIGradient")
	GUIObject.UICorner_A5 = Instance.new("UICorner")
	GUIObject.TopHPText = Instance.new("TextBox")

	GUIObject.BottomHPFrame = Instance.new("Frame")
	GUIObject.UIGradient_A6 = Instance.new("UIGradient")
	GUIObject.UICorner_A6 = Instance.new("UICorner")
	GUIObject.BottomHPText = Instance.new("TextBox")

	GUIObject.TopClothesFrame = Instance.new("Frame")
	GUIObject.UIGradient_A7 = Instance.new("UIGradient")
	GUIObject.UICorner_A7 = Instance.new("UICorner")
	GUIObject.TopClothesText = Instance.new("TextBox")

	GUIObject.BottomClothesFrame = Instance.new("Frame")
	GUIObject.UIGradient_A8 = Instance.new("UIGradient")
	GUIObject.UICorner_A8 = Instance.new("UICorner")
	GUIObject.BottomClothesText = Instance.new("TextBox")

	GUIObject.DamageFrame = Instance.new("Frame")
	GUIObject.UIGradient_A9 = Instance.new("UIGradient")
	GUIObject.UICorner_A9 = Instance.new("UICorner")
	GUIObject.DamageSFX = Instance.new("TextBox")

	GUIObject.VolumeFrame = Instance.new("Frame")
	GUIObject.UIGradient_A10 = Instance.new("UIGradient")
	GUIObject.UICorner_A10 = Instance.new("UICorner")
	GUIObject.VolumeText = Instance.new("TextBox")

	GUIObject.TPFrame = Instance.new("Frame")
	GUIObject.UIGradient_A12 = Instance.new("UIGradient")
	GUIObject.UICorner_A12 = Instance.new("UICorner")
	GUIObject.TPToggle = Instance.new("TextButton")
	GUIObject.PHFrame = Instance.new("Frame")
	GUIObject.UIGradient_A13 = Instance.new("UIGradient")
	GUIObject.UICorner_A13 = Instance.new("UICorner")
	GUIObject.PHToggle = Instance.new("TextButton")

	GUIObject.Recolor = Instance.new("Frame")
	GUIObject.RecolorButton = Instance.new("TextButton")
	GUIObject.UIGradient_A14 = Instance.new("UIGradient")
	GUIObject.UIAspectRatioConstraint_A2 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_A14 = Instance.new("UICorner")
	GUIObject.RecolorFrame = Instance.new("Frame")
	GUIObject.RecolorListFrame = Instance.new("ScrollingFrame")
	GUIObject.UIGridLayout_A1 = Instance.new("UIGridLayout")

	local Mouse = Player:GetMouse()

	local Method2CharacterFolder = game.Workspace:FindFirstChild("Method2CharacterFolder")

	if not Method2CharacterFolder then
		Method2CharacterFolder = Instance.new("Folder", game.Workspace)
		Method2CharacterFolder.Name = "Method2CharacterFolder"
	end

	local IS = game:GetService("InsertService")
	local UIS = game:GetService("UserInputService")
	local TS = game:GetService("TweenService")
	local MPS = game:GetService("MarketplaceService")

	local CVersion = "0.7.3:lerp()"

	local Method = 1
	local MaxMethod = 3

	local MaxBreastsType = 4
	local MaxTorsoType = 4
	local MaxArmType = 2
	local MaxLegsType = 3

	local KEYBIND = Enum.KeyCode.Insert
	local KeybindDetect = false

	local ClickExecute = false

	local IsEnterFrame = false
	local IsMouseDown = false

	local GuiPositionStart = nil
	local MouseDownStart = nil

	local AllConnect = {}
	local MeshEditConnect = {}

	local SelectPlayer = Player.Name

	local DarkerColorPercentage = 17.75
	local Darker2ColorPercentage = 32.75

	local Circle = 2*math.pi
	local PreviewRotate = 0
	local PreviewRadius = 5
	local PreviewRotateSpeed = 200
	local CharacterPreviewLoading = false

	local NPCs = {}

	local PositionPhysicsMultiply = 1
	local RotationPhysicsMultiply = 4

	local Function = {Spring = {}}

	function Function.PlayerDataDefault()
		return {
			CurrentClothes = {},
			ClothesRecolor = {},
			CurrentBundle = "nil",
			AutoExecute = true,
			DelayTime = 1,
			Tone = "Base",
			BundleBodyColor = true,
			Face = false,
			MeshSizeLock = false,
			AccessorySizeLock = false,
			MeshBasePartInvisible = false,
			BodyPartPhysics = false,
			CatalogUsername = "",
			CatalogOutfitId = "",
			CatalogClothes = {
				Shirt = "",
				Pants = "",
				ShirtGraphic = "",
			},
			CatalogAccessory = {},
			CatalogRemove = {},
			SkinTone = nil,
			BreastsScale = 1,
			ButtsScale = 1,
			BreastsType = 1,
			TorsoType = 1,
			ArmType = 1,
			LegsType = 1,
			ToggleBBC = false,
			Cooldown = false,
			updateCooldown = false,
			FPerson = false,

			TopRipped = false,
			BottomRipped = false,
			SavedPreviousHP = 0,
			TopHP = "",
			BottomHP = "",
			HPClothes = {
				Shirt = "",
				Pants = ""
			},
			DamageSFX = "",
			Volume = 1,
			TearParticles = true,
			HealParticles = true,

			PartList = Function.PartListDefault(),

			LocalTransparency = {
				["Head"] = false,
				["Right Arm"] = false,
				["Left Arm"] = false,
				["Torso"] = false,
				["Right Leg"] = false,
				["Left Leg"] = false
			},

			CurrentPartList = {
				Organ = {},
				Clothes = {},
				Accessory = {},
				ParentTransparency = {},
				RealtimeUpdateList = {
					["Mesh"] = {},
					["Accessory"] = {},
					["Special"] = {}
				},
				PartParent = {},
				BodyPartPhysics = {},
				AreolaDecal = {},
			}
		}
	end

	local R15Size = {
		["UpperTorso"] = Vector3.new(2, 1.6, 1),
		["UpperTorsoFemale"] = Vector3.new(2.043, 1.796, 1.01),
		["RightLowerArm"] = Vector3.new(1, 1.052, 1),
		["LeftLowerArm"] = Vector3.new(1, 1.052, 1),
		["RightLowerLeg"] = Vector3.new(1, 1.193, 1),
		["LeftLowerLeg"] = Vector3.new(1, 1.193, 1),
	}

	local R15Transparency = {
		"UpperTorso",
		"LowerTorso",
		"RightUpperArm",
		"RightLowerArm",
		"RightHand",
		"LeftUpperArm",
		"LeftLowerArm",
		"LeftHand",
		"RightUpperLeg",
		"RightLowerLeg",
		"RightFoot",
		"LeftUpperLeg",
		"LeftLowerLeg",
		"LeftFoot",
	}

	local Method2BodyPart = {
		"UpperTorso",
		"RightLowerArm",
		"LeftLowerArm",
		"RightLowerLeg",
		"LeftLowerLeg",
		"Head",
	}

	local R6Size = {
		["Head"] = Vector3.new(2, 1, 1),
		["Torso"] = Vector3.new(2, 2, 1),
		["Left Arm"] = Vector3.new(1, 2, 1),
		["Left Leg"] = Vector3.new(1, 2, 1),
		["Right Arm"] = Vector3.new(1, 2, 1),
		["Right Leg"] = Vector3.new(1, 2, 1),
	}

	local WeldCFrame = {
		["Torso"] = CFrame.new(0, -0.2, 0),
		["Right Arm"] = CFrame.new(0, 0.2, 0),
		["Left Arm"] = CFrame.new(0, 0.2, 0),
		["Right Leg"] = CFrame.new(0, 0.2, 0),
		["Left Leg"] = CFrame.new(0, 0.2, 0)
	}

	local ConvertPart = {
		["Torso"] = "UpperTorso",
		["Right Arm"] = "RightLowerArm",
		["Left Arm"] = "LeftLowerArm",
		["Right Leg"] = "RightLowerLeg",
		["Left Leg"] = "LeftLowerLeg"
	}

	local R6Mesh = {
		["TorsoMale"] = "rbxassetid://456901040",
		["TorsoFemale"] = "rbxassetid://9747912904",
		["Right Arm"] = "rbxassetid://5062992824",
		["Left Arm"] = "rbxassetid://5062992824",
		["Right Leg"] = "rbxassetid://5062992824",
		["Left Leg"] = "rbxassetid://5062992824"
	}

	local ConvertedPart = {}

	--[[
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------

                                      ████████╗░█████╗░██████╗░██╗░░░░░███████╗
                                      ╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██╔════╝
                                      ░░░██║░░░███████║██████╦╝██║░░░░░█████╗░░
                                      ░░░██║░░░██╔══██║██╔══██╗██║░░░░░██╔══╝░░
                                      ░░░██║░░░██║░░██║██████╦╝███████╗███████╗
                                      ░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚══════╝╚══════╝
                                  
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	]]

	function Function.PartListDefault()
		return {
			-- BODY PARTS
			["Torso"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["MeshId"] = "rbxasset://RoClothes/13181228593.mesh",
				["Size"] = Vector3.new(2.04, 2.06, 1.06),
				["CFrame"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Left Leg"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Mesh",
				["MeshId"] = "rbxasset://RoClothes/7332360863.mesh",
				["Size"] = Vector3.new(1.213, 2.18, 1.201),
				["CFrame"] = CFrame.new(-0.0359992981, 0.0627000332, 0.0440006256, -4.37113883e-08, 0, -1, 0, 0.999999881, 0, 1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Right Leg"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Mesh",
				["MeshId"] = "rbxasset://RoClothes/7332415457.mesh",
				["Size"] = Vector3.new(1.213, 2.18, 1.201),
				["CFrame"] = CFrame.new(0.0359992981, 0.0627000332, 0.0440006256, -4.37113883e-08, 0, -1, 0, 0.999999881, 0, 1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Left Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Mesh",
				["MeshId"] = "rbxasset://RoClothes/11617989163.mesh",
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(0.0349998474, 0, 0, -1, 0, -8.74227766e-08, 0, 0.999999881, 0, 8.74227766e-08, 0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			},
			["Right Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Mesh",
				["MeshId"] = "rbxasset://RoClothes/11617988681.mesh",
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(-0.0349998474, 0, 0, -1, 0, -8.74227766e-08, 0, 0.999999881, 0, 8.74227766e-08, 0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			},
			["Left Butt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt",
				["MeshId"] = "rbxasset://RoClothes/13181475662.mesh",
				["Size"] = Vector3.new(1.252, 1.239, 1.263),
				["CFrame"] = CFrame.new(-0.532000542, -0.961999893, 0.328999966, -1, 3.52998995e-06, -5.08968776e-07, 3.69696932e-06, 1, -1.92065613e-06, 5.08962978e-07, -1.92066227e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "PantsTexture",
				["Scale"] = "ButtsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			},
			["Right Butt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt",
				["MeshId"] = "rbxasset://RoClothes/13181475663.mesh",
				["Size"] = Vector3.new(1.252, 1.239, 1.263),
				["CFrame"] = CFrame.new(0.532000542, -0.961999893, 0.328999966, -1, 3.52998995e-06, -6.08968776e-07, 3.69696932e-06, 1, -1.92065613e-06, 6.08962978e-07, -1.92066227e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "PantsTexture",
				["Scale"] = "ButtsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			},
			["Left Breast"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Breast",
				["MeshId"] = "rbxasset://RoClothes/17645666081.mesh",
				["Size"] = Vector3.new(1.15, 1.403, 0.98),
				["CFrame"] = CFrame.new(-0.24647522, 0.635471106, -0.450698853, 0.320868134, 0.223423854, -0.920394123, -0.184720367, 0.967879057, 0.170553446, 0.928935945, 0.115290381, 0.351832479),
				["CFrame1"] = CFrame.new(0.200012207, 0.400005341, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "AreolaDecalCreate",
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			},
			["Right Breast"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Breast",
				["MeshId"] = "rbxasset://RoClothes/17645666081.mesh",
				["Size"] = Vector3.new(1.15, 1.403, 0.98),
				["CFrame"] = CFrame.new(0.24647522, 0.635471106, -0.450698853, -0.320868134, -0.223423854, -0.920394123, -0.184720367, 0.967879057, -0.170553446, 0.928935945, 0.115290381, -0.351832479),
				["CFrame1"] = CFrame.new(0.200012207, 0.400005341, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "AreolaDecalCreate",
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			},
			["Left Nipple"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["MeshId"] = "rbxasset://RoClothes/17645756055.mesh",
				["Size"] = Vector3.new(0.129, 0.067, 0.129),
				["CFrame"] = CFrame.new(-0.572320938, -0.203234434, 0.00150489807, 0.000296547514, 0.999854326, -0.0170696471, -0.982211947, 0.0029140336, -0.18775323, -0.187775597, 0.0168216899, 0.982067883),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			},
			["Right Nipple"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["MeshId"] = "rbxasset://RoClothes/17645756055.mesh",
				["Size"] = Vector3.new(0.129, 0.067, 0.129),
				["CFrame"] = CFrame.new(-0.572320938, -0.203234434, 0.00150489807, -0.000296547514, 0.999854326, -0.0170696471, -0.982211947, 0.0029140336, 0.18775323, 0.187775597, 0.0168216899, 0.982067883),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			},
			["BBC Rod"] = {
				["Instance"] = "Mesh",
				["Name"] = "BBC Rod",
				["MeshId"] = "rbxassetid://14437003062",
				["Size"] = Vector3.new(0.565, 0.802, 1.98),
				["CFrame"] = CFrame.new(-0.077, -0.982, -0.233, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["CFrame1"] = CFrame.new(0, -0.2, 0.9, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "BBCRodPhysics",

			},
			["BBC Tip"] = {
				["Instance"] = "Mesh",
				["Name"] = "BBC Tip",
				["MeshId"] = "rbxassetid://14437018423",
				["Size"] = Vector3.new(0.444, 0.313, 0.481),
				["CFrame"] = CFrame.new(0.017, 0.283, -0.838, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "BBC Rod",

				},
				["Function"] = "DarkPart"
			},
			["BBC Balls"] = {
				["Instance"] = "Mesh",
				["Name"] = "BBC Balls",
				["MeshId"] = "rbxassetid://14436718311",
				["Size"] = Vector3.new(1.036, 0.976, 0.592),
				["CFrame"] = CFrame.new(0.002, -0.441, 0.652, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "BBC Rod",

				},
				["Function"] = "BBCBallPhysics",
			},
			["EasterSack"] = {
				["Instance"] = "Mesh",
				["Name"] = "BBC Balls",
				["MeshId"] = "rbxasset://RoClothes/74969809748782.mesh",
				["Size"] = Vector3.new(1.036, 0.976, 0.592),
				["CFrame"] = CFrame.new(0.002, -0.441, 0.652, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["TextureId"] = "rbxasset://RoClothes/easter_balls_better.png",
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "BBC Rod",

				},
				["Function"] = "BBCBallPhysics",
			},
			["Cock"] = {
				["Instance"] = "Mesh",
				["Name"] = "Rod",
				["Size"] = Vector3.new(1.2970000505447388, 0.46000000834465027, 0.47099998593330383),
				["CFrame"] = CFrame.new(-0.0308074951, -0.971994877, -0.571624756, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),
				["CFrame1"] = CFrame.new(0.5, -0, 0.0379999988, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/RoCat Cock.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "BBCRodPhysics"
			}, 
			["Balls"] = {
				["Instance"] = "Mesh",
				["Name"] = "Balls",
				["Size"] = Vector3.new(0.4475859999656677, 0.8527889847755432, 0.7235980033874512),
				["CFrame"] = CFrame.new(-0.0351104736, -0.967835665, -0.569778442, -6.90403394e-05, 1.09312105e-05, -1, 0.156382754, 0.987696528, 0, 0.987696528, -0.156382754, -6.99003576e-05),
				["CFrame1"] = CFrame.new(-1.52587927e-05, 0.299999237, 0.0345458984, 1.00000429, 1.04308157e-07, 4.76063741e-13, 3.27825546e-07, 1.00000226, 1.43209888e-11, -6.2847505e-12, -1.91024085e-10, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/RoCat Balls.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "BBCBallPhysics"
			},
			["Tip"] = {
				["Instance"] = "Mesh",
				["Name"] = "Tip",
				["Size"] = Vector3.new(0.37700000405311584, 0.328000009059906, 0.37400001287460327),
				["CFrame"] = CFrame.new(-0.621873856, 0.0263288021, 0.00502586365, -1, 3.88713488e-08, 2.91103174e-06, -1.36291813e-08, 0.999996185, -3.10204257e-07, -2.91137076e-06, -3.12861516e-07, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = "rbxasset://RoClothes/RoCat Cocktip.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Rod",
				},
				["Function"] = "DarkPart"
			},
			["Left Breast Type 2"] = {
				["Instance"] = "Part",
				["Name"] = "Left Breast",
				["Size"] = Vector3.new(0.8140669465065002, 0.8140669465065002, 0.8140669465065002),
				["CFrame"] = CFrame.new(0, 0.883000016, -0.344000012, -1, 0, 8.74227766e-08, 0, 1, 0, -8.74227766e-08, 0, -1),
				["CFrame1"] = CFrame.new(0.400000006, 0.600000024, -0.300000012, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType2Mesh", "AreolaDecalType2Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Right Breast Type 2"] = {
				["Instance"] = "Part",
				["Name"] = "Right Breast",
				["Size"] = Vector3.new(0.8140669465065002, 0.8140669465065002, 0.8140669465065002),
				["CFrame"] = CFrame.new(0, 0.883000016, -0.344000012, -1, 0, 8.74227766e-08, 0, 1, 0, -8.74227766e-08, 0, -1),
				["CFrame1"] = CFrame.new(-0.400024414, 0.600001335, -0.299987793, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType2Mesh", "AreolaDecalType2Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Right Breast Type 3"] = {
				["Instance"] = "Part",
				["Name"] = "Right Breast",
				["Size"] = Vector3.new(1.4028211832046509, 1.4687727689743042, 1.24605131149292),
				["CFrame"] = CFrame.new(0.215000004, 0.758000016, -0.268999994, -4.37113883e-08, 0, 1, 0, 1, 0, -1, 0, -4.37113883e-08),
				["CFrame1"] = CFrame.new(-0.299987793, 0.5, -0.200012207, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType3Mesh", "AreolaDecalType3Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Left Breast Type 3"] = {
				["Instance"] = "Part",
				["Name"] = "Left Breast",
				["Size"] = Vector3.new(1.4028211832046509, 1.4687727689743042, 1.24605131149292),
				["CFrame"] = CFrame.new(-0.215000004, 0.758000016, -0.268999994, -4.37113883e-08, 5.22728624e-06, 1, 0, 1, 0, -1, 0, -4.37113883e-08),
				["CFrame1"] = CFrame.new(-0.299987793, 0.5, 0.200012207, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType3Mesh", "AreolaDecalType3Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Left Nipple Type 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["Size"] = Vector3.new(0.10870949923992157, 0.14377030730247498, 0.11643027514219284),
				["CFrame"] = CFrame.new(0.698000014, -0.256999999, -0.367000014, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/5270413936.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167.00000524520874, 169.00000512599945),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			}, 
			["Right Nipple Type 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["Size"] = Vector3.new(0.10870949923992157, 0.14377030730247498, 0.11643027514219284),
				["CFrame"] = CFrame.new(0.698000014, -0.256999999, 0.367000014, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/5270413632.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167.00000524520874, 169.00000512599945),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			},
			["Right Breast Type 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Breast",
				["Size"] = Vector3.new(1.309288501739502, 1.3237565755844116, 1.0778127908706665),
				["CFrame"] = CFrame.new(0.2, 0.67, -0.435, -0.303515047, 0.0131401122, -0.95273608, 0.386091501, 0.915834308, -0.110366784, 0.871098161, -0.401341259, -0.283042789),
				["CFrame1"] = CFrame.new(0.400146484, 0.399963379, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/7220038121.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType3Mesh", "AreolaDecalType3Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Left Breast Type 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Breast",
				["Size"] = Vector3.new(1.309288501739502, 1.3237565755844116, 1.0778127908706665),
				["CFrame"] = CFrame.new(-0.2, 0.67, -0.435, 0.373207688, -0.0456757545, -0.926622808, 0.386091858, 0.915835142, 0.110358819, 0.843593001, -0.398948252, 0.359431773),
				["CFrame1"] = CFrame.new(0.400146484, 0.399963379, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/7220038121.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType3Mesh", "AreolaDecalType3Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Left Areola Type 4"] = {
				["Instance"] = "Part",
				["Name"] = "Areola",
				["Size"] = Vector3.new(0.4839892089366913, 0.48398923873901367, 0.17859317362308502),
				["CFrame"] = CFrame.new(-0.559692383, 0.0360107422, 0.0500183105, -0.115508914, 0.290242553, 0.949961782, -0.0913974494, 0.949200869, -0.301123828, -0.989094198, -0.121604398, -0.0831084549),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
				},
				["Function"] = {"DarkPart", "AreolaType4Mesh"},
				["Scale"] = "BreastsScale"
			}, 
			["Right Areola Type 4"] = {
				["Instance"] = "Part",
				["Name"] = "Areola",
				["Size"] = Vector3.new(0.48398923873901367, 0.48398929834365845, 0.17859318852424622),
				["CFrame"] = CFrame.new(-0.559631348, 0.0362243652, -0.0501708984, 0.0580038428, 0.306949109, 0.949959099, -0.0913976729, 0.949200273, -0.301123589, -0.994123936, -0.0693574548, 0.0831099451),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
				},
				["Function"] = {"DarkPart", "AreolaType4Mesh"},
				["Scale"] = "BreastsScale"
			}, 
			["Left Nipple Type 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["Size"] = Vector3.new(0.11428011208772659, 0.163490429520607, 0.154353529214859),
				["CFrame"] = CFrame.new(-3.05175781e-05, 0, -0.0799560547, 0.468626767, -0.125764415, 0.87440002, 0.0493227318, -0.984550238, -0.16804342, 0.882020473, 0.12187916, -0.455186784),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/7223274409.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Areola",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			}, 
			["Right Nipple Type 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["Size"] = Vector3.new(0.11428012698888779, 0.1634904444217682, 0.1543535441160202),
				["CFrame"] = CFrame.new(0.000122070312, -7.62939453e-06, -0.0800170898, 0.468629152, -0.125764504, 0.874397278, 0.0493227914, -0.984549701, -0.168042675, 0.882019937, 0.121878669, -0.455182761),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/7223274409.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Areola",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			}, 
			["Pussy Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Pussy",
				["MeshId"] = "rbxasset://RoClothes/17633723189.mesh",
				["Size"] = Vector3.new(0.82, 0.876, 0.825),
				["CFrame"] = CFrame.new(0, -0.925573111, -0.0344238281, -1, 0, 0, 1.1765762e-13, 1, 0, 0, 0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Clitoris Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Clitoris",
				["MeshId"] = "rbxasset://RoClothes/17633756976.mesh",
				["Size"] = Vector3.new(0.016, 0.032, 0.013),
				["CFrame"] = CFrame.new(0, -0.0782728195, 0.396118164, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "DarkPart"
			},
			["Vulva Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vulva",
				["MeshId"] = "rbxasset://RoClothes/17633771118.mesh",
				["Size"] = Vector3.new(0.049, 0.339, 0.569),
				["CFrame"] = CFrame.new(0, -0.231252432, 0.116136551, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "DarkPart"
			},
			["Vagina Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vagina",
				["MeshId"] = "rbxasset://RoClothes/17633784085.mesh",
				["Size"] = Vector3.new(0.048, 0.357, 0.555),
				["CFrame"] = CFrame.new(0, -0.218520164, 0.12276268, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 89, 89)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "Dark2Part"
			},
			["Pussy Open"] = {
				["Instance"] = "Mesh",
				["Name"] = "Pussy",
				["Size"] = Vector3.new(0.8848919868469238, 0.8711600303649902, 0.8346620202064514),
				["CFrame"] = CFrame.new(-0.00100517273, -0.964430332, -0.0420532227, -0.999993682, 7.40205633e-06, -4.17192183e-07, 9.17161924e-06, 0.999999881, -1.33617547e-07, -4.1726986e-07, 1.33675684e-07, -1.00000024),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/17108921573.mesh",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Clitoris Open"] = {
				["Instance"] = "Mesh",
				["Name"] = "Clitoris",
				["Size"] = Vector3.new(0.016096899285912514, 0.03247833997011185, 0.01232868805527687),
				["CFrame"] = CFrame.new(3.05175781e-05, -0.0711487532, 0.40284729, 0.999993682, 8.84806468e-07, 4.17230467e-07, 8.84806468e-07, 0.999999881, -1.33648342e-07, 4.17230467e-07, -1.33648342e-07, 1.00000024),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/17108921543.mesh",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "DarkPart"
			}, 
			["Vulva Open"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vulva",
				["Size"] = Vector3.new(0.5450000166893005, 0.375, 0.6100000143051147),
				["CFrame"] = CFrame.new(0.000427246094, -0.242344975, 0.102287292, 0.999993682, 8.84806468e-07, 4.17230467e-07, 8.84806468e-07, 0.999999881, -1.33648342e-07, 4.17230467e-07, -1.33648342e-07, 1.00000024),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/17108921578.mesh",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "DarkPart"
			}, 
			["Vagina Open"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vagina",
				["Size"] = Vector3.new(0.5199980139732361, 0.4561500549316406, 0.6124080419540405),
				["CFrame"] = CFrame.new(0.000490188599, -0.203095198, 0.101016998, 0.999993682, 8.84806468e-07, 4.17230467e-07, 8.84806468e-07, 0.999999881, -1.33648342e-07, 4.17230467e-07, -1.33648342e-07, 1.00000024),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/17108921539.mesh",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 89, 89)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "Dark2Part"
			}, 
			["Torso2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["MeshId"] = "rbxasset://RoClothes/137558328898044.mesh",
				["Size"] = Vector3.new(2.009, 2, 1.127),
				["CFrame"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Right Arm2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Mesh",
				["Size"] = Vector3.new(1.229590654373169, 2.055715322494507, 1.0100106000900269),
				["CFrame"] = CFrame.new(-0.0845117569, -0.000298976898, 0.000483512878, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/17873855289.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Right Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			}, 
			["Left Arm2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Mesh",
				["Size"] = Vector3.new(1.229590654373169, 2.055715322494507, 1.0100106000900269),
				["CFrame"] = CFrame.new(0.0504875183, -0.000301837921, 0.000484466553, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/17873855280.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Left Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			}, 
			["Torso3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["Size"] = Vector3.new(2.262770891189575, 2.165092706680298, 1.2769441604614258),
				["CFrame"] = CFrame.new(0.00048828125, -0.0753002167, 0.000483989716, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/17873855318.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Right Leg3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Mesh",
				["Size"] = Vector3.new(1.4192306995391846, 2.530543327331543, 1.411695957183838),
				["CFrame"] = CFrame.new(0.0505523682, 0.149428248, 0.050807476, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/17873855309.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Left Leg3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Mesh",
				["Size"] = Vector3.new(1.4192306995391846, 2.530543327331543, 1.411695957183838),
				["CFrame"] = CFrame.new(-0.049446106, 0.149427295, 0.0508079529, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxasset://RoClothes/17873855322.mesh",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Torso4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["MeshId"] = "rbxasset://RoClothes/7829803053.mesh",
				["Size"] = Vector3.new(2.009, 2, 1.127),
				["CFrame"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Left Leg2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Mesh",
				["MeshId"] = "rbxasset://RoClothes/9067190251.mesh",
				["Size"] = Vector3.new(1.402345895767212, 2.247053861618042, 1.5714069604873657),
				["CFrame"] = CFrame.new(-0.0995101929, 0.0462403297, 0.000484466553, -1, -8.84762244e-07, -4.17234219e-07, -8.84762244e-07, 1, -1.33645642e-07, 4.17234361e-07, -1.33645287e-07, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Right Leg2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Mesh",
				["MeshId"] = "rbxasset://RoClothes/9067191575.mesh",
				["Size"] = Vector3.new(1.399999976158142, 2.2464888095855713, 1.5719980001449585),
				["CFrame"] = CFrame.new(0.10049057, 0.0462414026, 0.000483989716, -1, -8.84762244e-07, -4.17234219e-07, -8.84762244e-07, 1, -1.33645642e-07, 4.17234361e-07, -1.33645287e-07, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},

			-- CLOTHES PARTS
			["School Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "School Shirt",
				["MeshId"] = "rbxasset://RoClothes/8708773284.mesh",
				["Size"] = Vector3.new(1.95, 1.237, 2.063),
				["CFrame"] = CFrame.new(0., 0.395723343, -0.401777267, -4.4567679e-07, 4.7127628e-06, -1, 1.06013331e-05, 1, 4.71275825e-06, 1, -1.06013313e-05, -4.4572667e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["School Collor"] = {
				["Instance"] = "Mesh",
				["Name"] = "Collor",
				["MeshId"] = "rbxasset://RoClothes/8708773488.mesh",
				["Size"] = Vector3.new(1.833, 0.681, 2.05),
				["CFrame"] = CFrame.new(0.0488710403, 0.292836428, -0.00204086304, 1, -7.24058646e-06, -2.78201196e-06, 8.68098778e-06, 0.999997139, -1.66889549e-06, 2.3908276e-06, -1.04128333e-06, 1.00000143),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17, 17, 17)
				},
				["Recolor"] = "Tertiary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "School Shirt",
				},
			},
			["School Bow"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bow",
				["MeshId"] = "rbxasset://RoClothes/8708773674.mesh",
				["Size"] = Vector3.new(0.87, 1.255, 1.917),
				["CFrame"] = CFrame.new(-0.598809242, -0.0214169025, -0.00198173523, 1, -7.24058646e-06, -2.78201196e-06, 8.68098778e-06, 0.999997139, -1.66889549e-06, 2.3908276e-06, -1.04128333e-06, 1.00000143),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(117, 0, 0)
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "School Shirt",
				},
			},
			["Skirt 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt",
				["MeshId"] = "rbxasset://RoClothes/8609086938.mesh",
				["Size"] = Vector3.new(1.85, 1.405, 2.619),
				["CFrame"] = CFrame.new(-0.0003657341, -0.680291414, 0.209050179, -2.56359476e-06, -2.94868323e-06, -1.00000048, -2.50712965e-05, 0.999999046, -3.85198973e-06, 1, 2.55514824e-05, 1.07363007e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17, 17, 17)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Skirt 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt",
				["MeshId"] = "rbxasset://RoClothes/11389496406.mesh",
				["Size"] = Vector3.new(2.666, 1.507, 2.062),
				["CFrame"] = CFrame.new(0.0089969635, -0.731234312, 0.254065514, -1.00000048, 2.71013369e-06, 3.48198853e-07, 1.80675625e-06, 0.999999046, 9.60324201e-07, -4.78581001e-07, 1.44048965e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17, 17, 17)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["School Left Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Clothes",
				["MeshId"] = "rbxasset://RoClothes/6866262171.mesh",
				["Size"] = Vector3.new(1.089, 0.983, 1.051),
				["CFrame"] = CFrame.new(0.038, 0.517, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
			},
			["School Right Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Clothes",
				["MeshId"] = "rbxasset://RoClothes/6866262171.mesh",
				["Size"] = Vector3.new(1.089, 0.983, 1.051),
				["CFrame"] = CFrame.new(-0.038, 0.517, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
			},
			["Bra"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bra",
				["MeshId"] 