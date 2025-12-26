--[[	
	














	
	/ ï¼²ï¼¯ï¼£ï¼¬ï¼¯ï¼´ï¼¨ï¼¥ï¼³
	Version - 0.7
	Link - discord.gg/HBzvWE6Rp3
	
	| RoClothes Is Exploiting Script, Allowing Player To Have Nude BodyParts/Clothes
	Can Be Use On Any Executor
	
	| This Script Will Cause FPS Drop
	Because Of BodyParts/Clothes Mesh Inside Player Model
	
	| ð”ð’ð„ ð€ð“ ð˜ðŽð”ð‘ ðŽð–ð ð‘ðˆð’ðŠ
	| ð–ðŽð‘ðŠ ðˆð ðð‘ðŽð†ð‘ð„ð’ð’	
	
	














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

                                      â–ˆâ–ˆâ•—â–‘â–‘â–‘â–‘â–‘â–‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–‘â–‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–‘â–‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–‘â–ˆâ–ˆâ•—â–‘â–‘â–‘â–‘â–‘
                                      â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–‘â–‘â–ˆâ–ˆâ•”â•â•â–ˆâ–ˆâ•—â–ˆâ–ˆâ•”â•â•â–ˆâ–ˆâ•—â–ˆâ–ˆâ•”â•â•â–ˆâ–ˆâ•—â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–‘â–‘
                                      â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–‘â–‘â–ˆâ–ˆâ•‘â–‘â–‘â–ˆâ–ˆâ•‘â–ˆâ–ˆâ•‘â–‘â–‘â•šâ•â•â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•‘â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–‘â–‘
                                      â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–‘â–‘â–ˆâ–ˆâ•‘â–‘â–‘â–ˆâ–ˆâ•‘â–ˆâ–ˆâ•‘â–‘â–‘â–ˆâ–ˆâ•—â–ˆâ–ˆâ•”â•â•â–ˆâ–ˆâ•‘â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–‘â–‘
                                      â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â•šâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•”â•â•šâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•”â•â–ˆâ–ˆâ•‘â–‘â–‘â–ˆâ–ˆâ•‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—
                                      â•šâ•â•â•â•â•â•â•â–‘â•šâ•â•â•â•â•â–‘â–‘â•šâ•â•â•â•â•â–‘â•šâ•â•â–‘â–‘â•šâ•â•â•šâ•â•â•â•â•â•â•
                                  
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
	GUIObject.MainFrame = Instance.new("Frame")
	GUIObject.PageFrame = Instance.new("Frame")
	GUIObject.UIGradient = Instance.new("UIGradient")
	GUIObject.UICorner = Instance.new("UICorner")
	GUIObject.Clothes_3 = Instance.new("Frame")
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

	local CVersion = "0.7"

	local Method = 1
	local MaxMethod = 2
	
	local MaxBreastsType = 4

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

	local PositionPhysicsMultiply = 1
	local RotationPhysicsMultiply = 4

	local Function = {Spring = {}}

	function Function.PlayerDataDefault()
		return {
			CurrentClothes = {},
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
			SkinTone = nil,
			BreastsScale = 1,
			ButtsScale = 1,
			BreastsType = 1,

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
					["Accessory"] = {}
				},
				PartParent = {},
				BodyPartPhysics = {},
				AreolaDecal = {},
			}
		}
	end

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

                                      â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–‘â–ˆâ–ˆâ•—â–‘â–‘â–‘â–‘â–‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—
                                      â•šâ•â•â–ˆâ–ˆâ•”â•â•â•â–ˆâ–ˆâ•”â•â•â–ˆâ–ˆâ•—â–ˆâ–ˆâ•”â•â•â–ˆâ–ˆâ•—â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–‘â–‘â–ˆâ–ˆâ•”â•â•â•â•â•
                                      â–‘â–‘â–‘â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•¦â•â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–‘â–‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–‘â–‘
                                      â–‘â–‘â–‘â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–ˆâ–ˆâ•”â•â•â–ˆâ–ˆâ•‘â–ˆâ–ˆâ•”â•â•â–ˆâ–ˆâ•—â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–‘â–‘â–ˆâ–ˆâ•”â•â•â•â–‘â–‘
                                      â–‘â–‘â–‘â–ˆâ–ˆâ•‘â–‘â–‘â–‘â–ˆâ–ˆâ•‘â–‘â–‘â–ˆâ–ˆâ•‘â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•¦â•â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—
                                      â–‘â–‘â–‘â•šâ•â•â–‘â–‘â–‘â•šâ•â•â–‘â–‘â•šâ•â•â•šâ•â•â•â•â•â•â–‘â•šâ•â•â•â•â•â•â•â•šâ•â•â•â•â•â•â•
                                  
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
				["MeshId"] = "rbxassetid://13181228593",
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
				["MeshId"] = "rbxassetid://7332360863",
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
				["MeshId"] = "rbxassetid://7332415457",
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
				["MeshId"] = "rbxassetid://11617989163",
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
				["MeshId"] = "rbxassetid://11617988681",
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
				["MeshId"] = "rbxassetid://13181475662",
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
				["MeshId"] = "rbxassetid://13181475663",
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
				["MeshId"] = "rbxassetid://10191869504",
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
				["MeshId"] = "rbxassetid://10191869504",
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
				["MeshId"] = "rbxassetid://10191870666",
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
				["MeshId"] = "rbxassetid://10191870666",
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
				["MeshId"] = "rbxassetid://5270413936",
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
				["MeshId"] = "rbxassetid://5270413632",
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
				["MeshId"] = "rbxassetid://7220038121",
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
				["MeshId"] = "rbxassetid://7220038121",
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
				["MeshId"] = "rbxassetid://7223274409",
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
				["MeshId"] = "rbxassetid://7223274409",
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
				["Name"] = "Pussy Closed",
				["MeshId"] = "rbxassetid://10191889916",
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
				["MeshId"] = "rbxassetid://10191889881",
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
					[2] = "Pussy Closed",
				},
				["Function"] = "DarkPart"
			},
			["Vulva Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vulva",
				["MeshId"] = "rbxassetid://10191890182",
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
					[2] = "Pussy Closed",
				},
				["Function"] = "DarkPart"
			},
			["Vagina Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vagina",
				["MeshId"] = "rbxassetid://10191890130",
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
					[2] = "Pussy Closed",
				},
				["Function"] = "Dark2Part"
			},
			-- CLOTHES PARTS
			["School Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "School Shirt",
				["MeshId"] = "rbxassetid://8708773284",
				["Size"] = Vector3.new(1.95, 1.237, 2.063),
				["CFrame"] = CFrame.new(0., 0.395723343, -0.401777267, -4.4567679e-07, 4.7127628e-06, -1, 1.06013331e-05, 1, 4.71275825e-06, 1, -1.06013313e-05, -4.4572667e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["School Collor"] = {
				["Instance"] = "Mesh",
				["Name"] = "Collor",
				["MeshId"] = "rbxassetid://8708773488",
				["Size"] = Vector3.new(1.833, 0.681, 2.05),
				["CFrame"] = CFrame.new(0.0488710403, 0.292836428, -0.00204086304, 1, -7.24058646e-06, -2.78201196e-06, 8.68098778e-06, 0.999997139, -1.66889549e-06, 2.3908276e-06, -1.04128333e-06, 1.00000143),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17, 17, 17)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "School Shirt",
				},
			},
			["School Bow"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bow",
				["MeshId"] = "rbxassetid://8708773674",
				["Size"] = Vector3.new(0.87, 1.255, 1.917),
				["CFrame"] = CFrame.new(-0.598809242, -0.0214169025, -0.00198173523, 1, -7.24058646e-06, -2.78201196e-06, 8.68098778e-06, 0.999997139, -1.66889549e-06, 2.3908276e-06, -1.04128333e-06, 1.00000143),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(117, 0, 0)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "School Shirt",
				},
			},
			["Skirt 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt",
				["MeshId"] = "rbxassetid://8609086938",
				["Size"] = Vector3.new(1.85, 1.405, 2.619),
				["CFrame"] = CFrame.new(-0.0003657341, -0.680291414, 0.209050179, -2.56359476e-06, -2.94868323e-06, -1.00000048, -2.50712965e-05, 0.999999046, -3.85198973e-06, 1, 2.55514824e-05, 1.07363007e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17, 17, 17)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Skirt 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt",
				["MeshId"] = "rbxassetid://11389496406",
				["Size"] = Vector3.new(2.666, 1.507, 2.062),
				["CFrame"] = CFrame.new(0.0089969635, -0.731234312, 0.254065514, -1.00000048, 2.71013369e-06, 3.48198853e-07, 1.80675625e-06, 0.999999046, 9.60324201e-07, -4.78581001e-07, 1.44048965e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17, 17, 17)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["School Left Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Clothes",
				["MeshId"] = "rbxassetid://6866262171",
				["Size"] = Vector3.new(1.089, 0.983, 1.051),
				["CFrame"] = CFrame.new(0.038, 0.517, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Parent"] = {
					[1] = "Left Arm",
				},
			},
			["School Right Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Clothes",
				["MeshId"] = "rbxassetid://6866262171",
				["Size"] = Vector3.new(1.089, 0.983, 1.051),
				["CFrame"] = CFrame.new(-0.038, 0.517, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Parent"] = {
					[1] = "Right Arm",
				},
			},
			["Bra"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bra",
				["MeshId"] = "rbxassetid://11381019021",
				["Size"] = Vector3.new(1.86, 1.101, 1.868),
				["CFrame"] = CFrame.new(0.00900268555, 0.499922037, -0.390037537, -1, 5.42022599e-06, -8.69745577e-07, 5.42022826e-06, 1, -2.88098545e-06, 8.69729888e-07, -2.88098977e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Panty"] = {
				["Instance"] = "Mesh",
				["Name"] = "Panty",
				["MeshId"] = "rbxassetid://11377850676",
				["Size"] = Vector3.new(1.783, 1.12, 1.484),
				["CFrame"] = CFrame.new(-1.90734863e-06, -0.912999868, 0.160000801, -1, 5.42022508e-06, -1.01899627e-06, 5.42022826e-06, 1, -2.88098499e-06, 1.01898058e-06, -2.88099e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Apron 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Apron",
				["MeshId"] = "rbxassetid://6491183076",
				["Size"] = Vector3.new(1.893, 2.61, 1.989),
				["CFrame"] = CFrame.new(7.62939453e-06, -0.251567364, -0.391598701, -1.83562111e-06, 1.28747515e-05, 1, -6.72226906e-06, 1, -1.28747643e-05, -1, -6.72229271e-06, -1.83553448e-06),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(231, 231, 236)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Apron 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Apron",
				["MeshId"] = "rbxassetid://11405661031",
				["Size"] = Vector3.new(2.001, 3.588, 1.835),
				["CFrame"] = CFrame.new(0, -0.756999969, -0.472000122, -1, -3.24366835e-12, 1.50995803e-07, 3.24366835e-12, 1, -4.8978031e-19, -1.50995803e-07, 0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(117, 0, 0)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Bodyless Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Shirt",
				["MeshId"] = "rbxassetid://9867233353",
				["Size"] = Vector3.new(2.121, 0.538, 1.158),
				["CFrame"] = CFrame.new(1.71661377e-05, 0.797148228, 0.00380325317, 1, 6.32340789e-06, -1.3013792e-07, -6.32385991e-06, 1, -4.80156132e-07, 1.3065187e-07, 4.80156814e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17,17,17)
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			},
			["Bodyless Neck"] = {
				["Instance"] = "Mesh",
				["Name"] = "Neck",
				["MeshId"] = "rbxassetid://4342469442",
				["Size"] = Vector3.new(1.312, 0.301, 1.354),
				["CFrame"] = CFrame.new(0.00418663025, 1.09489012, 0.00360298157, 1, -5.37213937e-12, 6.13908924e-12, -5.37213937e-12, 1, -1.63373362e-23, 6.13908924e-12, -1.63373346e-23, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17,17,17)
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			},
			["Bodyless Right Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sleeve",
				["MeshId"] = "rbxassetid://9867233367",
				["Size"] = Vector3.new(1.175, 1.87, 1.133),
				["CFrame"] = CFrame.new(-0.0374875069, 0.0970358849, 0, 1, 6.3234088e-06, -1.30139284e-07, -6.32385809e-06, 0.999999881, -4.80156075e-07, 1.30650506e-07, 4.80156814e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17,17,17)
				},
				["Parent"] = {
					[1] = "Right Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Bodyless Left Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sleeve",
				["MeshId"] = "rbxassetid://9867233360",
				["Size"] = Vector3.new(1.175, 1.87, 1.133),
				["CFrame"] = CFrame.new(0.0415430069, 0.0967195034, 0.0065574646, 1, 6.3234138e-06, -1.30144741e-07, -6.32385309e-06, 0.999999881, -4.80156075e-07, 1.30645049e-07, 4.80156814e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17,17,17)
				},
				["Parent"] = {
					[1] = "Left Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Dress Bra"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bra",
				["MeshId"] = "rbxassetid://8811986211",
				["TextureId"] = "http://www.roblox.com/asset/?id=395191839",
				["Size"] = Vector3.new(2.054, 1.488, 2),
				["CFrame"] = CFrame.new(1.90734863e-05, 0.295036316, -0.409999847, 6.08214521e-07, 1.17440368e-05, -1, 2.40081545e-06, 1, 1.17440377e-05, 1, -2.4008225e-06, 6.08186326e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163, 162, 165)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Dress Rope"] = {
				["Instance"] = "Mesh",
				["Name"] = "Rope",
				["MeshId"] = "rbxassetid://8811988447",
				["Size"] = Vector3.new(1.463, 0.492, 1.826),
				["CFrame"] = CFrame.new(7.62939453e-06, -0.292956591, -0.172002792, 6.08214521e-07, 1.17440368e-05, -1, 2.40081545e-06, 1, 1.17440377e-05, 1, -2.4008225e-06, 6.08186326e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(204, 187, 198)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Dress Skirt In"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt In",
				["MeshId"] = "rbxassetid://8811988165",
				["Size"] = Vector3.new(2.052, 1.423, 2.684),
				["CFrame"] = CFrame.new(3.81469727e-06, -0.948948383, 0.077996254, 6.08214521e-07, 1.17440368e-05, -1, 2.40081545e-06, 1, 1.17440377e-05, 1, -2.4008225e-06, 6.08186326e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(204, 187, 198)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Dress Skirt Out"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt Out",
				["MeshId"] = "rbxassetid://8811987828",
				["TextureId"] = "http://www.roblox.com/asset/?id=395191839",
				["Size"] = Vector3.new(2.139, 1.438, 2.702),
				["CFrame"] = CFrame.new(7.62939453e-06, -0.83894968, 0.0949964523, 6.08214521e-07, 1.17440368e-05, -1, 2.40081545e-06, 1, 1.17440377e-05, 1, -2.4008225e-06, 6.08186326e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163, 162, 165)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress"] = {
				["Instance"] = "Mesh",
				["Name"] = "Dress",
				["MeshId"] = "rbxassetid://8533956808",
				["Size"] = Vector3.new(2.55, 2.649, 2.777),
				["CFrame"] = CFrame.new(7.62939453e-06, -0.255959034, -0.136188507, -5.48989405e-08, -1.88403271e-09, -1, -4.65476489e-07, 1, -1.88494753e-09, 1, 4.65473931e-07, -5.48980879e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Bottom"] = {
				["Instance"] = "Mesh",
				["Name"] = "Dress Bottom",
				["MeshId"] = "rbxassetid://8533957053",
				["Size"] = Vector3.new(2.253, 1.889, 3.177),
				["CFrame"] = CFrame.new(0.0135879517, -0.964025736, 0.237159729, -5.42543361e-08, 1.51019786e-09, -1, -4.65476489e-07, 1, -1.88494731e-09, 1, 4.92539243e-07, -5.55426922e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(219, 219, 219)
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			},
			["Birdly Dress Sling"] = {
				["Instance"] = "Mesh",
				["Name"] = "Sling",
				["MeshId"] = "rbxassetid://8533957545",
				["Size"] = Vector3.new(2.003, 1.454, 1.783),
				["CFrame"] = CFrame.new(-0.0349998474, 0.305000067, -0.469562531, -4.3711843e-08, -1.44881884e-09, -1, -4.69112194e-07, 1, -1.44980017e-09, 1, 4.69109466e-07, -4.37109335e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(202, 203, 209)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Mail 1"] = {
				["Instance"] = "Part",
				["Name"] = "Mail 1",
				["Shape"] = Enum.PartType.Cylinder,
				["Size"] = Vector3.new(0.313, 0.762, 0.704),
				["CFrame"] = CFrame.new(0.0663223267, -0.0400261879, 0.839624405, 0.57357651, -7.94940647e-08, 0.819150627, 0.819151998, -5.04924913e-07, -0.573575318, 4.75954096e-07, 1, -2.35058806e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(202, 203, 209)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Mail 2"] = {
				["Instance"] = "Part",
				["Name"] = "Mail 2",
				["Shape"] = Enum.PartType.Cylinder,
				["Size"] = Vector3.new(0.308, 0.727, 0.693),
				["CFrame"] = CFrame.new(0.653236389, 0.786733389, 0.835962296, 0.57357651, -7.94940647e-08, 0.819150627, 0.819151998, -5.04924913e-07, -0.573575318, 4.75954096e-07, 1, -2.35058806e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(202, 203, 209)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Mail 3"] = {
				["Instance"] = "Part",
				["Name"] = "Mail 3",
				["Shape"] = Enum.PartType.Cylinder,
				["Size"] = Vector3.new(2.126, 0.704, 0.681),
				["CFrame"] = CFrame.new(0.355201721, 0.356162071, 0.838983536, 0.57357651, -7.94940647e-08, 0.819150627, 0.819151998, -5.04924913e-07, -0.573575318, 4.75954096e-07, 1, -2.35058806e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Right Sleeve"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sleeve",
				["MeshId"] = "rbxassetid://8477756263",
				["Size"] = Vector3.new(1.068, 1.202, 1.052),
				["CFrame"] = CFrame.new(-0.0390014648, -0.245999813, 0.00850009918, 1.13686838e-13, 3.7566391e-13, 1, 3.41060459e-13, 0.999999881, 1.25221285e-13, -1, -1.02318154e-12, -3.41060513e-13),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(219, 219, 219)
				},
				["Parent"] = {
					[1] = "Right Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Birdly Dress Right Sleeve 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sleeve 2",
				["MeshId"] = "rbxassetid://8533957322",
				["Size"] = Vector3.new(1.059, 0.947, 1.152),
				["CFrame"] = CFrame.new(-0.0125274658, -0.134218693, 0.00903892517, -4.9860995e-07, -1.62974948e-06, -0.999995708, -9.83640348e-06, 0.99999845, -2.19345497e-06, 1.00000191, 1.45387166e-05, -7.21604636e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Parent"] = {
					[1] = "Right Arm",
				},
			},
			["Birdly Dress Left Sleeve"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sleeve",
				["MeshId"] = "rbxassetid://8477756263",
				["Size"] = Vector3.new(1.068, 1.202, 1.052),
				["CFrame"] = CFrame.new(0.0390014648, -0.250999689, 0.00899982452, -4.37112746e-08, -3.23716395e-13, 1, -1.59999963e-05, 0.999999881, 1.25221299e-13, -1, -1.6e-05, -4.37117293e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(219, 219, 219)
				},
				["Parent"] = {
					[1] = "Left Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Birdly Dress Left Sleeve 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sleeve 2",
				["MeshId"] = "rbxassetid://8533957322",
				["Size"] = Vector3.new(1.059, 0.947, 1.152),
				["CFrame"] = CFrame.new(0.0060005188, -0.133999825, 0.00899982452, -4.37106387e-08, 2.26175061e-07, 1, 2.81108601e-06, 0.999999881, -2.26174407e-07, -1, 2.81108487e-06, -4.37117293e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Parent"] = {
					[1] = "Left Arm",
				},
			},
			["Right Shoe"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe",
				["MeshId"] = "rbxassetid://6860788547",
				["Size"] = Vector3.new(1.108, 0.771, 1.15),
				["CFrame"] = CFrame.new(-7.62939453e-06, -0.689962208, 0.0800008774, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Parent"] = {
					[1] = "Right Leg",
				},
			},
			["Left Shoe"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe",
				["MeshId"] = "rbxassetid://6860787685",
				["Size"] = Vector3.new(1.108, 0.771, 1.15),
				["CFrame"] = CFrame.new(-7.62939453e-06, -0.689962208, 0.0800008774, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Parent"] = {
					[1] = "Left Leg",
				},
			},
			["Right Sock"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sock",
				["MeshId"] = "rbxassetid://6721517477",
				["Size"] = Vector3.new(1.296, 1.524, 1.189),
				["CFrame"] = CFrame.new(0.0279846191, -0.307503283, 0.0619983673, -4.37113883e-08, 0, 1, 0, 1, 0, -1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237, 234, 234)
				},
				["Parent"] = {
					[1] = "Right Leg",
				},
				["Function"] = "TurtleTexture"
			},
			["Left Sock"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sock",
				["MeshId"] = "rbxassetid://6721513769",
				["Size"] = Vector3.new(1.296, 1.524, 1.189),
				["CFrame"] = CFrame.new(-0.0279998779, -0.307499111, 0.0620002747, -4.37113883e-08, 0, 1, 0, 1, 0, -1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237, 234, 234)
				},
				["Parent"] = {
					[1] = "Left Leg",
				},
				["Function"] = "TurtleTexture"
			},
			["Killer Sweater"] = {
				["Instance"] = "Mesh",
				["CFrame"] = CFrame.new(1.14440918e-05, -0.0547757149, -0.143913269, -1.00000191, 8.13039424e-06, -2.1779843e-07, 4.51686174e-06, 0.999996185, -4.80170343e-07, -3.03737522e-07, 1.44048386e-06, -1),
				["Color"] = {
					["Color"] = Color3.fromRGB(215, 215, 215),
					["Tone"] = "Base"
				},
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://10080455422",
				["Name"] = "Sweater",
				["Parent"] = {
					[1] = "Torso"
				},
				["Size"] = Vector3.new(2.621, 2.224, 2.378),
				["Transparency"] = 0,
				["Function"] = "TurtleTexture"
			},
			["Killer Sweater Tie"] = {
				["Instance"] = "Mesh",
				["CFrame"] = CFrame.new(-6.48498535e-05, 0.589792967, -0.781671524, -1, 3.46809134e-06, 1.14109309e-06, 3.61355137e-06, 0.984807909, 0.173647463, -5.21532229e-07, 0.173647463, -0.984807909),
				["Color"] = {
					["Color"] = Color3.fromRGB(215, 215, 215),
					["Tone"] = "Base"
				},
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://4729777667",
				["Name"] = "Tie",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Sweater"
				},
				["Size"] = Vector3.new(0.645, 1.120, 0.144),
				["Transparency"] = 0
			},
			["Killer Sweater Neck"] = {
				["Instance"] = "Mesh",
				["CFrame"] = CFrame.new(-7.62939453e-06, 1.13563347, -0.154616356, -1, 3.61355274e-06, 6.08947687e-07, 3.6135516e-06, 1, -1.92066636e-06, -6.08954679e-07, -1.92066432e-06, -1),
				["Color"] = {
					["Color"] = Color3.fromRGB(163, 162, 165),
					["Tone"] = "Base"
				},
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://4342469442",
				["Name"] = "Neck",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Sweater"
				},
				["Size"] = Vector3.new(1.209999918937683, 0.18462184071540833, 1.2289236783981323),
				["Transparency"] = 0
			},
			["Cow Bra"] = {
				["CFrame"] = CFrame.new(-0.00286865234, 0.475341082, -0.362598419, -6.51926314e-07, 1.17439922e-05, 1.00000191, -2.4008159e-06, 0.999996185, -8.13043971e-06, -1, -4.80170684e-07, -1.30372001e-07),
				["Color"] = {
					["Color"] = Color3.fromRGB(248, 248, 248),
					["Tone"] = "Base"
				},
				["Instance"] = "Mesh",
				["Material"] = Enum.Material.Fabric,
				["MeshId"] = "rbxassetid://6297176322",
				["Name"] = "Bra",
				["Parent"] = {
					[1] = "Torso"
				},
				["Size"] = Vector3.new(1.8829039335250854, 1.1392192840576172, 1.8722314834594727),
				["TextureId"] = "rbxassetid://12038926049",
				["Transparency"] = 0
			},
			["Cow Panty"] = {
				["CFrame"] = CFrame.new(5.7220459e-06, -0.986361265, 0.0423326492, -1.30375597e-07, 8.13039424e-06, 1.00000191, -4.80171025e-07, 0.999996185, -4.51686174e-06, -1, 1.44048408e-06, 3.91160427e-07),
				["Color"] = {
					["Color"] = Color3.fromRGB(248, 248, 248),
					["Tone"] = "Base"
				},
				["Instance"] = "Mesh",
				["Material"] = Enum.Material.Fabric,
				["MeshId"] = "rbxassetid://6297229742",
				["Name"] = "Panty",
				["Parent"] = {
					[1] = "Torso"
				},
				["Size"] = Vector3.new(1.1498957872390747, 0.9570162296295166, 1.8741321563720703),
				["TextureId"] = "rbxassetid://12038931250",
				["Transparency"] = 0
			},
			["Right Bunny Band"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Bunny Band",
				["Size"] = Vector3.new(1.0540573596954346, 0.4127587676048279, 1.6175404787063599),
				["CFrame"] = CFrame.new(0.249682188, -0.632135391, -0.000693321228, -1.30402327e-07, 9.93718913e-06, -1.00000191, -4.80150504e-07, 0.99999606