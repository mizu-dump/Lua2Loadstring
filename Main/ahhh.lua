local Reanimate_Settings = {
	Frequency = 6, -- this is basically how fast the oscillation goes
	Amplification = 6, -- this is how far the oscillation goes
	FrontOffset = 2.5, -- this is how much youre in front of the player during prediction
}

local ReanimateVoidstar
local ReanimateDummy

if not isfolder("FEVerse") then makefolder("FEVerse") end
if not isfolder("FEVerse/RBXMXFiles") then makefolder("FEVerse/RBXMXFiles") end
if not isfolder("FEVerse/Songs") then makefolder("FEVerse/Songs") end
if not isfolder("FEVerse/Sounds") then makefolder("FEVerse/Sounds") end

do
	local Accessories = {}
	local Aligns = {}
	local Attachments = {}
	local BindableEvent = nil
	local Blacklist = {}
	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new
	local Character = nil
	local CurrentCamera = nil
	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local UserInputType = Enum.UserInputType
	local MouseButton1 = UserInputType.MouseButton1
	local Touch = UserInputType.Touch
	local Exceptions = {}
	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin
	local mathpi = math.pi

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil
	local OptionsUseServerBreakJoints

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Tools = {}

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, - 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	local Color3fromRGB = Color3.fromRGB

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BackendAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Highlight and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model
					HighlightObject.OutlineColor = Color3fromRGB(255, 0, 0)
					HighlightObject.FillColor = Color3fromRGB(0, 0, 0)

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					taskspawn(ApplyDescription, RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									local BaseOffset = (Position - LastPosition) / DeltaTime * 0.13
									local Frequency = Reanimate_Settings.Frequency
									local Amplification = Reanimate_Settings.Amplification
									local Time = tick()
									local TargetFace = Target.CFrame.LookVector
									local Oscillation = mathsin(Time * mathpi * 2 * Frequency) * Amplification
									local OscillatedOffset = TargetFace * Oscillation
									local FrontFaceOffset = TargetFace * Reanimate_Settings.FrontOffset
									Offset = BaseOffset + OscillatedOffset + FrontFaceOffset
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = CFrame.new(Target.Position + Offset) * CFrame.Angles(0, Target.Orientation.Y, 0)
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local HideCharacterOffset = typeof(OptionsHideCharacter) == "Vector3" and OptionsHideCharacter or HideCharacterOffset
					local RootPartCFrame = RigHumanoidRootPart.CFrame + HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			local ToolFling = OptionsDefaultFlingOptions.ToolFling
			local Tools2 = {}

			if ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")

				tableclear(Tools)

				if type(ToolFling) == "string" then
					local Tool = FindFirstChildOfClassAndName(Backpack, "Tool", ToolFling)

					if Tool then
						Tool.Parent = Character
						tableinsert(Tools2, Tool)
					end
				else
					for Index, Tool in GetChildren(Backpack) do
						if IsA(Tool, "Tool") then
							Tool.Parent = Character
							tableinsert(Tools2, Tool)
						end
					end
				end

				UnequipTools(Humanoid)
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else

				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if replicatesignal and OptionsUseServerBreakJoints then
				replicatesignal(Humanoid.ServerBreakJoints)
			end

			ChangeState(Humanoid, Dead)
			Wait(Humanoid.Died)

			for Index, Tool in Tools2 do
				local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle")

				if Handle then
					Tool.Parent = Character
				else
					tableremove(Tools2, Index)
				end
			end

			Tools = Tools2
			UnequipTools(Humanoid)

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		local UserInputType = InputObject.UserInputType

		if UserInputType == MouseButton1 or UserInputType == Touch then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = nil
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						Tool.Parent = Character

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end

		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	local Register = function()
		repeat
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
			taskwait()
		until IsRegistered
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius
			OptionsUseServerBreakJoints = Options.UseServerBreakJoints

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = "non"
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			local function CreateObject(Name)
				local Part = Instance.new("Part")
				Part.Name = Name
				Part.Massless = true
				Part.CanCollide = true
				Part.CanTouch = false
				Part.Transparency = 1
				Part.Size = Vector3new(0.1, 0.1, 0.1)
				Part.Anchored = true
				Part.Parent = Rig
				return Part
			end

			ReanimateVoidstar = CreateObject("Reanimate_Voidstar")
			ReanimateDummy = CreateObject("Reanimate_Dummy")
			
			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
				ReanimateVoidstar.Anchored = false
				ReanimateDummy.Anchored = false
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)

			if not IsRegistered then
				taskspawn(Register)
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

local Rad = math.rad



Empyrean = Start({
	Accessories = {
		-- Lightning Cannon
		{ Name = "Torso", MeshId = "131018666998514",  TextureId = "114854030584735", Offset = CFrame.identity },
		{ Name = "Right Arm", MeshId = "74241169361466", TextureId = "103596506136222", Offset = CFrame.Angles(Rad(90), 0, 0) },
		{ Name = "Left Arm", MeshId = "103399434286698", TextureId = "71393000026580", Offset = CFrame.Angles(Rad(90), 0, 0) },
		{ Name = "Right Leg",MeshId = "80852136456671",  TextureId = "114854030584735", Offset = CFrame.Angles(Rad(90), 0, Rad(180))},
		{ Name = "Left Leg", MeshId = "80852136456671", TextureId = "114854030584735", Offset = CFrame.Angles(Rad(90), 0, Rad(180)) },
		-- Glitchy Limbs (Monochrome)
		{ Name = "Torso", MeshId = "94838871645327",  TextureId = "108681181592495", Offset = CFrame.identity },
		{ Name = "Right Arm", MeshId = "18885728798", TextureId = "18885728798", Offset = CFrame.identity },
		{ Name = "Left Arm", MeshId = "18885728798", TextureId = "18885728798", Offset = CFrame.identity },
		{ Name = "Right Leg",MeshId = "100080236046620",  TextureId = "78703116520529", Offset = CFrame.identity },
		{ Name = "Left Leg", MeshId = "91790195871679", TextureId = "108681181592495", Offset = CFrame.identity },
		-- Gojo Rig
		{ Name = "Torso", MeshId = "113465334594272",  TextureId = "94020114074172", Offset = CFrame.identity },
		{ Name = "Right Arm",MeshId = "82030652840870",  TextureId = "137595219926625", Offset = CFrame.identity },
		{ Name = "Left Arm", MeshId = "91244322746029", TextureId = "137595219926625", Offset = CFrame.identity },
		{ Name = "Right Leg", MeshId = "132187752780278", TextureId = "97394845862368", Offset = CFrame.Angles(3.15, 0, 0) },
		{ Name = "Left Leg", MeshId = "131967977780088", TextureId = "97394845862368", Offset =  CFrame.Angles(3.15, 0, 0) },
		-- New Free Hair Limbs
		{ MeshId = "319354652", Name = "Left Arm", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(0, -1.57, 0), TextureId = "376186990" },
		{ MeshId = "319354652", Name = "Right Arm", Offset = CFrame.new(-0.15, 0, 0) * CFrame.Angles(0, 1.57, 0), TextureId = "304117018" },
		{ MeshId = "81642452", Name = "Left Leg", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, Rad(180)), TextureId = "6858317942" },
		{ MeshId = "81642452", Name = "Right Leg", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, Rad(180)), TextureId = "6858318826" },
		-- New Free Rig
		{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.Angles(0, 0, -0.25), TextureId = "4819722776" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(-1.57, 0, 1.57), TextureId = "3033903209" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.new(-0.15, 0, 0) * CFrame.Angles(-1.57, 0, -1.57), TextureId = "3360978739" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.new(0.15, 0, 0) * CFrame.Angles(-1.57, 0, 1.57), TextureId = "3033898741" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(-1.57, 0, -1.57), TextureId = "3409604993" },
		-- SB Rig
		{ MeshId = "125443585075666", Name = "Torso", Offset = CFrame.Angles(0, 3.15, 0), TextureId = "121023324229475" },
		{ MeshId = "121342985816617", Name = "Left Arm", Offset = CFrame.Angles(0, 0, 1.57), TextureId = "129264637819824" },
		{ MeshId = "121342985816617", Name = "Right Arm", Offset = CFrame.Angles(0, 3.15, 1.57), TextureId = "129264637819824" },
		{ MeshId = "83395427313429", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "97148121718581" },--18641142410
		-- Prosthetics
		{ MeshId = "117554824897780", Name = "Right Leg", Offset = CFrame.Angles(0, -1.57, 0), TextureId = "99077561039115" },
		{ MeshId = "123388937940630", Name = "Left Leg", Offset = CFrame.Angles(0, 1.57, 0), TextureId = "99077561039115" },
		{ MeshId = "117554824897780", Name = "Right Leg", Offset = CFrame.Angles(0, -1.57, 0), TextureId = "84429400539007" },
		{ MeshId = "123388937940630", Name = "Left Leg", Offset = CFrame.Angles(0, 1.57, 0), TextureId = "84429400539007" },
		-- Classic Cheap Rig
		{ MeshId = "12344206657", Name = "Left Arm", Offset = CFrame.new(0.05, 0.05, -0.075) * CFrame.Angles(-2, 0, 0), TextureId = "12344206675" },
		{ MeshId = "12344207333", Name = "Right Arm", Offset = CFrame.new(-0.05, 0.05, -0.075) * CFrame.Angles(-1.95, 0, 0), TextureId = "12344207341" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(1.57, 1.57, 0), TextureId = "11159284657" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(1.57, -1.57, 0), TextureId = "11263219250" },
		-- Grey Mesh Rig 
		{ MeshId = "127552124837034", Names = {"Torso"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "131014325980101" },--14255556501
		{ MeshId = "117287001096396", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "120169691545791" },--14255556501
		{ MeshId = "121304376791439", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 0), TextureId = "131014325980101" },--18641142410
		-- Classical Products rig (white/black arms)
		{ MeshId = "14241018198", Names = {"Torso"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14251599953" },
		{ MeshId = "17374767929", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17374768001" },
		{ MeshId = "17387586286", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17387586304" },
		{ MeshId = "14255522247", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255543546" },
		-- Noob Rig
		{ MeshId = "18640899369", Name = "Torso", Offset = CFrame.Angles(0, 0, 0), TextureId = "18640899481" },
		{ MeshId = "18640914129", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "18640914168" },
		{ MeshId = "18640901641", Names = { "Left Leg", "Right Leg"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "18640901676" },
		-- Genesis Black Rig
		{ MeshId = "110684113028749", Name = "Torso", Offset = CFrame.identity, TextureId = "70661572547971" },
		{ MeshId = "125405780718494", Name = "Left Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
		{ MeshId = "125405780718494", Name = "Right Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
		{ MeshId = "125405780718494", Name = "Left Leg", Offset = CFrame.Angles(0, 0, Rad(90)), TextureId = "136752500636691" },
		{ MeshId = "125405780718494", Name = "Right Leg", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
		-- Genesis White Rig
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "130689541138804" },
		{ MeshId = "99608462237958", Name = "Left Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "130809869695496" },
		{ MeshId = "139733645770094", Name = "Right Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "130809869695496" },
		{ MeshId = "105141400603933", Name = "Left Leg", Offset = CFrame.Angles(0, 0, Rad(90)), TextureId = "71060417496309" },
		{ MeshId = "90736849096372", Name = "Right Leg", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "79186624401216" },
		-- request
		{ MeshId = "14768666349", Name = "Torso", Offset = CFrame.Angles(0, 0, 0), TextureId = "14768664565" },
		{ MeshId = "14768684979", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14768683674" },
		-- ReanimateVoidstar 
		{ Name = "Reanimate_Voidstar",  MeshId = "93839976189892", TextureId = "87530318962700", Offset = CFrame.identity },
		{ Name = "Reanimate_Dummy",  MeshId = "104517187424526", TextureId = "133044964286932", Offset = CFrame.Angles(0, Rad(180), 0) },

	},
	ApplyDescription = true,
	BreakJointsDelay = 0.255,
	ClickFling = true,
	DefaultFlingOptions = {
		HatFling = false,
		Highlight = true,
		PredictionFling = true,
		Timeout = 1,
		ToolFling = false,
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = Vector3.new(0, -30, 0),
	ParentCharacter = true,
	PermanentDeath = true,
	Refit = true,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
	UseServerBreakJoints = true,
})

DefaultFlingOptions = {
	HatFling = false,
	Highlight = true,
	PredictionFling = true,
	Timeout = 1,
	ToolFling = false,
}
-- WILL NOT WORK IF YOU REMOVE THE REANIMATION.
return(function(...)local f={"\077\050\102\085\090\113\080\067\120\097\110\112\089\066\077\065\051\101\076\087\108\065\061\061","\074\086\104\047\109\115\061\061";"\083\120\107\119\110\107\053\069\108\084\066\073";"\089\115\120\077\084\076\090\118\117\065\061\061","\121\057\098\061";"\047\074\117\099","\082\087\056\110","\054\057\119\117\104\057\119\097\115\048\053\109\049\080\089\109\051\065\061\061";"\102\047\102\067\072\065\061\061","\098\108\067\112\089\101\054\082\078\065\070\068\089\066\115\071\100\112\081\067\116\090\098\086\101\101\047\047\117\082\098\090\101\071\067\077\080\071\075\114\117\052\056\086\053\117\067\117\077\085\065\048\069\066\056\077\082\070\085\121\051\102\081\112\107\074\079\106\047\107\089\113\090\057\055\084\114\104\056\056\118\102\074\065\109\112\080\072\071\068\072\056\050\050\103\074\110\081\120\097\115\113\085\085\050\112\085\075";"\117\116\090\078";"\117\121\103\050\115\109\119\087\122\079\117\051\121\057\085\051";"\053\115\050\077";"\100\052\088\070\056\087\068\047","\098\087\110\098\104\089\050\061","\049\066\083\097\088\106\111\070\074\078\065\122","\122\070\082\083\100\088\061\061";"\050\054\078\120","\069\070\108\090\121\082\084\086\122\099\108\049\118\113\072\097\054\115\061\061";"\105\082\084\086\049\048\111\051\119\122\117\079\118\082\119\102\115\121\098\061","\085\090\089\079\054\109\082\055\117\115\061\061","\114\073\121\103\053\081\056\073\050\065\061\061";"\055\065\119\119\090\116\118\051\077\098\061\061","\101\077\115\067\103\073\108\121","\097\043\072\071\073\070\074\077\088\075\065\085","\118\048\047\120\118\099\085\067\104\120\089\097";"\067\100\088\066","\086\073\112\080\110\118\070\074\074\054\081\061";"\068\057\066\085\074\081\112\105\086\099\084\061","\116\051\121\066\083\100\109\068\108\068\119\086","\100\116\086\121";"\066\090\089\107\054\098\061\061","\104\051\048\067\072\052\084\061","\122\103\117\075\114\116\085\116\115\113\117\115\069\099\117\078","\048\077\083\083\072\050\048\086","\071\090\105\080";"\075\051\082\054\075\085\108\118\055\049\115\076\049\081\113\109\106\098\054\085\050\051\055\070\105\112\097\108\090\105\118\106\121\053\086\081\043\121\085\119";"\099\106\054\119\066\065\061\061";"\084\055\112\100";"\111\114\075\107\089\066\057\105\073\047\103\048\121\065\061\061";"\111\068\112\102\087\076\077\061","\109\110\105\089\111\115\067\111\067\068\097\076\113\079\076\085\071\088\061\061","\049\090\119\052","\103\102\068\075\099\049\098\061";"\119\113\089\109\115\055\111\069\104\047\084\065\081\121\089\049\122\115\061\061","\110\090\072\081\102\070\114\054\101\084\070\089","\115\121\085\102\118\090\119\055\104\109\052\079\117\121\115\061","\052\115\075\117\072\111\083\076","\043\115\043\077\110\116\112\113","\051\056\115\120\097\105\103\111\120\076\090\055\080\115\061\061","\052\084\100\055\075\066\088\110";"\098\119\081\086";"\082\048\082\116\118\070\111\083\081\098\061\061";"\111\078\065\079\102\098\108\080\087\081\073\106\099\120\087\071\055\111\118\070\083\111\113\065","\115\113\111\077\114\109\050\056","\079\072\083\089","\103\043\071\120\115\101\105\083\097\057\083\097\052\072\107\113\108\050\120\074\048\084\103\103\086\050\067\043\072\099\051\050\106\112\077\120\099\120\068\066";"\104\070\086\089\105\104\103\066\051\121\055\061","\116\111\043\056\108\105\070\081";"\043\049\104\048\049\086\116\118\068\116\066\101";"\080\072\105\056\120\088\061\061";"\105\108\076\054\067\111\085\055\111\085\082\053\111\098\061\061";"\089\053\085\109\077\043\065\086\087\086\108\089\119\088\061\061","\073\043\069\055\052\098\061\061";"\107\066\079\106\056\088\061\061";"\110\105\083\086\116\075\073\070\121\088\061\061";"\082\106\051\108\054\069\097\048\048\086\101\112";"\067\109\081\102\105\066\075\108\085\115\061\061";"\071\074\083\049\117\116\075\052\116\104\077\061","\086\075\090\081\074\076\104\108\053\043\049\072\098\115\061\061","\110\077\111\075\111\076\075\051\076\112\115\061","\086\056\081\073\084\104\105\104\066\117\089\104","\077\116\119\110\098\098\061\061";"\111\101\085\090\083\120\079\113\089\115\061\061";"\103\100\115\070\117\056\073\119\053\114\074\051","\100\113\117\102\104\056\103\047\119\079\115\061","\083\048\077\056\117\073\049\108\077\066\049\110\120\068\055\114\090\111\101\054\078\088\061\061";"\048\118\066\108\109\087\074\086\054\104\104\101\048\088\061\061";"\052\075\080\043";"\081\049\114\113\071\103\088\086\099\118\070\078","\104\078\099\099\100\053\054\086\065\065\061\061","\081\087\086\106\109\088\061\061","\047\066\055\051","\056\078\071\084\115\088\061\061","\085\099\118\079\116\084\050\054\076\069\080\104\080\114\107\054\076\065\061\061","\071\106\088\098\077\114\100\061","\121\048\078\079\054\068\107\048\065\088\079\097\122\100\066\097\119\115\061\061","\100\082\099\109\104\109\118\052\117\070\085\080\122\075\103\089\100\098\061\061";"\049\075\081\073\115\082\085\079\119\056\108\119\115\121\082\097\082\080\100\061","\111\097\053\085\106\083\048\086\105\072\120\061","\090\117\084\079\047\114\099\119\090\090\113\083\071\110\050\088\089\068\112\105";"\052\057\054\050\116\116\097\076\074\051\082\065\053\081\082\085\097\081\108\072\089\102\073\049\108\109\079\043\083\113\072\120\056\101\054\068\111\099\052\043\118\065\120\116\067\067\104\122\074\099\100\090\101\111\049\110\076\118\111\051\106\067\089\043\068\055\111\048\066\114\073\049\047\069\043\071\115\080\051\053\117\089\098\052\111\118\079\086\084\089\078\069\102\109\111\088\051\121\113\107\111\048\090\053\107\100\054\065\079\088\061\061","\068\070\120\114\047\080\076\099\097\070\113\114\069\077\056\103\119\115\061\061";"\098\098\101\116\117\079\052\110\090\103\104\090\115\110\122\099\100\087\075\119\103\097\108\078","\080\083\110\121\099\087\072\083";"\051\112\077\077\076\056\087\051";"\117\122\119\122\121\120\099\109\118\079\119\113\105\048\085\066\119\088\061\061";"\098\071\108\103\115\103\122\079\068\117\100\118\120\086\108\071\102\098\085\105\105\098\061\061";"\054\068\080\083","\079\081\104\078\112\111\070\087\088\065\061\061","\110\077\122\043\099\105\043\051\065\111\107\115\118\119\057\072\120\111\121\070\089\103\107\090\087\103\075\078\070\114\082\043\047\065\074\083\117\049\077\090\114\089\119\049\054\120\081\080\072\055\090\082\050\065\067\083\081\068\122\053\055\082\090\109\087\108\051\056\076\088\098\101\088\076\052\119\077\121\074\102\113\052\105\080\108\076\085\085\122\080\101\101\086\122\083\101\067\081\102\122\043\057\121\099\112\048\048\057";"\067\068\089\085\074\055\066\113\106\098\061\061";"\119\076\100\068\085\076\067\089\102\099\104\061";"\082\122\079\078\121\048\103\077\119\113\072\097\082\070\082\090";"\104\109\085\097\100\099\103\066\051\121\055\061","\079\078\082\121\117\078\098\061","\121\106\113\054\118\088\061\061";"\105\070\118\120\114\121\079\101\115\120\084\113\081\090\088\109\085\088\061\061";"\049\075\106\065";"\071\047\113\079","\077\082\055\108\115\090\050\081\085\089\107\118\098\115\061\061","\104\118\099\061","\118\048\053\099\118\057\118\103\069\070\108\117\121\075\082\089\054\098\061\061","\067\084\055\050\074\054\115\111\043\076\073\061","\076\068\083\120\099\076\048\098\122\098\061\061","\085\113\082\055\049\113\082\087\117\057\108\089\114\121\082\056","\108\049\102\103\055\107\081\122\121\116\075\104\057\121\081\061";"\080\102\087\048\078\071\111\076\048\072\103\102\043\101\105\072","\055\098\061\061","\067\080\088\117\056\057\079\074\104\076\117\118\056\049\111\068\085\115\061\061";"\085\048\079\066\117\103\052\089\100\057\085\112\114\079\108\089\105\115\061\061";"\101\102\105\052\121\104\049\043","\082\048\082\116\118\070\111\083\081\065\061\061","\072\104\071\099\075\115\099\100";"\065\119\067\052\050\074\115\061","\073\080\114\103\121\119\100\061","\048\089\105\072\081\050\085\084\103\065\061\061","\116\055\086\103\078\098\073\102\110\102\100\065\107\101\057\078";"\066\085\108\052\071\090\068\087";"\069\098\061\061";"\083\106\065\101\087\082\048\080\103\122\112\074\118\085\050\083\077\086\107\043\077\077\074\113\068\102\054\100\052\069\084\061","\047\083\111\067\055\074\048\057\110\075\072\115\053\043\057\101\079\098\061\061";"\114\070\082\066","\106\118\112\110\075\115\067\086\110\054\112\052\055\057\110\102\082\122\116\122\110\120\048\068\104\117\108\121\076\098\061\061";"\050\050\065\099\097\065\061\061","\109\050\047\115","\117\087\054\084\118\115\061\061";"\088\117\089\069\052\122\077\061";"\110\117\106\120\082\098\061\061","\103\115\051\113";"\049\088\115\115\069\116\053\119\052\047\098\057\051\049\103\090","\104\109\085\097\100\088\061\061";"\079\065\085\065\067\048\118\116\065\109\119\121\116\116\072\084\084\081\103\086\120\065\061\061";"\090\047\111\053\114\048\085\079\105\088\061\061","\121\049\100\077\048\049\115\061";"\050\066\068\105\069\056\053\115\071\080\082\057";"\088\087\098\116\104\056\111\070";"\121\088\086\109\083\047\080\069\108\049\065\061","\104\109\085\047\114\098\061\061","\048\076\098\108","\049\100\065\049\105\068\077\055\079\115\061\061","\075\098\098\054\121\073\119\117\087\115\088\061";"\109\087\065\103\114\043\084\043\068\117\122\106\087\115\061\061","\099\053\079\099\122\050\067\070";"\117\056\083\065\103\085\068\078\104\084\050\072\057\098\061\061","\101\116\116\110\083\047\057\106\116\085\098\073\055\112\049\112\102\074\051\087\098\098\061\061";"\101\043\066\100\051\070\084\106\053\070\056\103";"\056\122\067\065\082\065\061\061";"\070\115\047\084";"\047\079\097\048\120\049\069\085\110\098\061\061","\119\109\085\121\051\090\120\073\122\079\119\104\105\104\077\086\069\115\061\061","\098\107\071\099\075\108\055\089";"\086\098\090\115";"\085\048\079\083\117\115\061\061";"\078\110\052\114\050\047\043\099\100\122\056\069\069\098\061\061","\114\122\089\099\114\070\055\113\081\056\052\122\051\090\119\120";"\049\069\116\106\052\047\073\061";"\071\107\083\084\122\069\100\043\100\088\047\050";"\110\112\088\101\069\049\075\053\120\088\115\074\109\076\056\111\090\099\098\061";"\071\088\047\081","\055\118\070\051\106\088\061\061","\084\074\106\068\111\065\061\061";"\120\079\071\101\054\115\061\061";"\056\108\100\097\067\088\061\061","\087\086\052\098\103\056\099\061","\069\084\075\106\090\055\116\055";"\081\103\117\084\122\090\117\090\054\090\052\065\105\116\100\083";"\098\107\106\052\069\084\121\106\121\122\051\114\113\085\089\122\101\080\120\047\055\102\081\109\049\106\050\053\113\073\087\080\071\070\082\113\054\111\071\082\079\121\073\070\084\073\068\065\047\097\110\080\068\102\119\052\115\105\107\057\111\080\056\077\079\075\111\102\055\112\077\055\066\098\114\078\080\078\086\117\065\090\082\097\116\068\057\056\072\113\115\076\087\098\090\067\120\080\119\082\107\117\076\122\085\104\085\084\110\075\107\049\049\104\098\099\109\056\081\061","\099\089\073\112\107\090\068\061","\073\087\073\114\089\122\087\077\071\115\101\106";"\112\106\070\109\108\082\120\115\079\108\108\102\120\048\078\067\051\101\118\085","\097\104\086\102\050\119\102\099\051\121\077\061";"\078\105\104\097\080\054\102\077\115\054\108\088\047\088\073\080\105\120\103\047","\117\090\108\083\114\109\050\061";"\068\107\106\098\043\043\104\111\051\112\068\061","\111\087\087\069\071\104\100\061";"\078\065\118\074\114\043\114\069\072\078\090\086","\085\048\079\066\117\099\117\053\100\057\119\055\115\121\087\116\117\090\119\055\114\109\108\112\117\120\119\077\054\090\119\056";"\054\082\099\057\089\075\054\071\115\078\120\061","\049\079\055\061","\051\104\086\108\100\103\050\087\100\082\100\047\049\082\082\081\117\116\120\061";"\067\073\090\122\052\077\122\054\099\088\076\048";"\047\120\074\113\074\098\061\061";"\107\089\121\107\074\098\061\061";"\057\070\110\057\121\086\053\081\122\086\103\119","\079\120\066\080\056\085\097\055\105\104\077\061";"\108\068\070\072\107\071\115\118\090\090\073\061";"\047\051\111\068\100\078\048\086\118\051\102\077\051\071\101\107\111\047\085\098","\116\115\122\116\057\076\101\097\120\115\061\061";"\051\057\052\066\114\104\117\085\119\121\079\067\054\121\053\078\119\098\061\061","\072\079\078\099\088\098\102\117\053\087\100\052\077\065\061\061","\115\116\104\073\121\075\085\052\104\047\103\089\081\075\118\077","\081\075\066\097\118\090\114\072\079\103\103\085\066\116\080\098\054\109\104\110\102\068\097\089\048\083\076\118\100\104\065\099\099\109\097\075\078\119\048\056\054\065\101\057\119\067\086\115\098\050\075\056\098\071\052\090\051\088\057\069\081\075\070\085\090\076\070\085\057\065\049\081\110\090\120\055\068\110\055\114\054\110\119\088\071\052\121\055\076\071\065\117\081\072\084\111\088\083\050\068\114\084\081\113\113\049\113\084","\081\120\111\076\116\079\108\055\053\104\068\061","\083\050\122\078\121\116\100\087\116\111\076\117\071\043\088\110\074\098\061\061","\097\110\114\066","\115\070\047\099\116\112\043\074\073\089\084\061";"\107\102\050\082\105\088\068\122\069\066\054\053\102\090\107\053";"\048\100\056\107\055\109\083\081\113\078\098\061";"\066\112\090\115\119\053\116\050\057\086\114\120\087\087\071\122";"\117\079\089\056\105\090\103\103\085\121\119\085\049\099\118\099\069\088\061\061","\084\115\086\080\098\070\115\061","\114\122\085\087\069\099\111\107\069\121\089\107\114\109\082\053","\120\049\089\097\070\077\085\104\111\082\112\077\119\114\052\122\068\099\103\105\068\067\107\071\057\115\051\081\081\056\052\049\056\103\067\078\090\103\109\076\050\121\108\048\053\072\090\088\055\047\069\081\104\113\079\109\108\116\110\069\050\048\083\071\047\075\121\080\066\104\097\108\075\099\112\110\043\090\053\080\115\049\054\067\117\057\120\116\083\066\083\048\071\105\111\072\090\100\098\082\109\085\057\117\073\078\081\077";"\081\121\047\052\100\104\053\077\119\056\108\056\114\070\118\053";"\048\065\051\071\070\048\102\081\047\114\100\061","\067\089\047\080\118\108\106\106\070\098\061\061";"\069\082\088\073\069\104\079\072\081\056\085\120\051\109\089\119\085\113\099\061","\051\069\049\081\067\053\048\071\089\065\061\061";"\070\107\113\057\089\084\105\100\067\119\104\116\116\088\101\049\054\122\098\061";"\117\112\115\102\075\070\086\117\055\057\122\077\083\088\061\061","\067\056\111\119";"\115\090\103\065\051\079\103\056\119\047\052\116\121\082\079\067\100\098\061\061";"\114\115\112\105","\103\074\114\111\119\112\117\047\049\053\068\061","\104\080\108\116\104\121\047\119\115\113\118\107\117\048\047\109","\043\074\116\079\069\117\050\112\053\055\056\103\088\120\054\103\067\065\061\061";"\079\053\075\074\100\074\068\077\074\088\061\061";"\057\083\043\102\116\111\114\104\043\066\098\080","\115\109\108\079\054\090\085\079\049\080\082\072\054\121\087\097\051\121\085\119\114\113\085\079\114\099\117\083\114\113\047\099\117\090\119\116\100\048\079\065\118\070\079\097\114\098\061\061","\074\088\061\061","\067\085\106\065";"\104\109\085\089\054\098\061\061","\074\081\083\070\084\121\071\087\102\075\099\061","\113\049\070\084\109\080\081\054\108\107\117\115\119\066\101\100\084\083\053\074\073\075\080\076\079\084\055\061";"\104\070\086\089\105\115\061\061";"\052\113\120\049";"\117\056\074\110\051\077\052\070\102\073\100\061","\082\121\047\077\100\109\119\104\051\116\052\102\081\103\053\116","\067\078\048\099\071\053\057\101\052\109\104\087\100\066\077\065\087\099\083\049\068\087\120\087\121\100\066\086\109\067\087\056\079\068\109\116\118\068\078\082\084\083\051\119\069\086\107\110\089\043\071\090\083\043\098\115\053\047\097\120\119\107\108\068\054\065\121\076\067\114\121\088\121\098\056\054\090\071\101\089\070\084\107\078\089\078\071\106\103\072\069\102\115\120\066\065\119\055\106\117\074\099\074\056\101\070\072\071\122\073\065\065\119\079\111\122\072\085\110\081\082\066\084\061","\100\109\085\083\051\121\087\057","\115\083\119\065\049\098\061\061";"\073\106\070\119\076\080\100\061";"\068\102\090\110","\080\043\103\073\100\078\087\065\056\112\056\100\115\098\061\061";"\097\048\066\108";"\120\077\107\086\086\056\065\071\101\078\090\067\113\106\083\110\100\085\081\061";"\076\085\043\082\052\117\076\057\104\065\061\061","\117\088\110\080\066\049\066\085";"\097\097\065\102","\089\113\116\067\057\088\120\080\072\115\061\061","\100\055\050\104\115\115\061\061","\122\066\068\056","\103\072\081\103\089\071\085\049\070\073\073\061";"\117\087\085\085","\081\054\075\113","\068\078\047\106\084\065\061\061";"\106\056\120\061","\100\113\082\055\114\121\082\055\054\090\085\089\054\048\086\079","\119\070\047\108\081\075\089\053\119\079\100\073\082\055\103\052","\074\085\081\056\098\068\066\115\102\065\061\061";"\099\113\067\121\113\056\049\097\070\084\054\061";"\083\050\077\089\106\089\053\107\103\088\061\061";"\057\122\101\048\084\121\084\061","\121\118\074\074","\107\085\065\050";"\101\108\069\120\043\109\056\098";"\076\078\116\118\120\067\114\052\118\079\100\061";"\108\074\056\109\076\070\114\108\072\086\107\080","\065\111\120\105\090\088\061\061";"\086\120\050\115\119\101\068\061","\081\055\103\067\069\121\103\053\049\057\082\084\115\082\118\102\119\080\054\061","\109\118\072\104\071\098\118\057\066\054\101\097","\078\084\090\086\090\089\106\072\055\051\088\061";"\065\108\103\070","\106\108\114\087";"\056\108\055\061","\122\102\049\047\054\050\114\082\086\053\043\082\102\086\111\109";"\067\080\069\080\043\122\071\116\047\050\074\115\055\065\061\061","\072\086\069\057\100\111\098\061","\118\065\047\099\052\089\071\099","\100\113\074\121\097\073\071\084\099\065\061\061","\117\101\075\115\082\105\076\066\099\099\106\110\085\115\061\061";"\075\057\071\050","\108\104\119\118\104\070\067\106\099\080\107\057","\067\116\120\110","\113\056\084\077\114\118\101\055\049\108\053\051\114\065\061\061";"\097\073\090\084\114\120\108\047\086\088\061\061","\075\106\055\097\054\106\070\080","\117\047\075\110";"\066\054\051\077","\054\068\105\090\105\047\075\076";"\115\067\105\116\098\049\121\099\122\049\119\050\088\066\104\101\105\079\106\101\107\079\073\061";"\115\070\104\070\070\112\083\086","\072\085\117\068\072\077\114\073\106\043\102\075\118\107\072\119\055\065\054\061","\050\101\114\089\075\085\085\120";"\099\081\050\047\083\071\083\100\121\043\088\061";"\068\103\068\053";"\050\116\089\115\084\043\120\082";"\117\090\084\065\049\055\117\080\115\082\089\076\114\056\104\086\118\122\104\061","\115\113\111\077\114\109\108\122\117\090\103\047\117\121\087\116\117\104\072\079\105\090\052\097\051\121\087\055","\081\108\109\081\080\107\080\108\076\085\108\111";"\051\079\072\087\082\079\111\069\079\051\090\053\116\108\056\054\099\082\068\118\088\103\084\061","\076\088\050\076\121\117\077\061";"\108\051\043\106";"\078\083\111\103\056\106\072\100\070\104\107\055\047\098\099\065\120\110\110\086\107\101\122\050\071\076\068\078\097\065\061\061";"\085\070\043\082\101\067\081\061";"\106\080\085\068\087\112\084\061","\076\047\103\105","\076\071\115\085\085\101\069\090\055\083\099\061";"\079\077\098\086\109\083\068\116\081\076\077\087\073\065\061\061";"\052\076\103\087\054\107\073\075\053\069\115\082";"\051\080\085\090\121\057\118\072\117\104\103\080\119\048\065\065";"\083\100\073\079\070\097\101\048","\083\105\117\103";"\099\043\080\114\104\090\051\088\050\117\110\101","\069\099\055\109\100\121\117\101\119\121\108\081\115\121\072\102\051\065\061\061";"\047\088\119\087\056\121\097\089\075\088\061\061","\072\104\103\115\079\072\104\090\070\081\078\098\122\075\101\118\079\090\098\047\069\055\079\107\118\111\056\103\114\113\118\086\109\087\075\076\065\050\106\119\075\075\120\072\078\047\071\082\098\048\115\076\072\069\056\115\077\112\110\082\068\055\081\099\112\077\057\065\110\066\107\069\079\103\112\073\082\067\098\057\066\103\054\051\049\119\103\050\088\072\067\101\100\102\088\068\079\105\102\109\083\071\101\101\110\050\120\043","\118\070\079\116\051\065\061\061","\097\050\104\049\057\116\052\115\070\097\107\110\055\121\079\051\065\116\106\080\083\069\082\069\081\110\086\075\083\101\105\085\115\112\047\085\047\110\067\047\075\069\048\104\083\085\050\105\122\114\115\082\047\113\076\083\120\116\117\101\111\043\104\047\115\106\068\088\098\051\106\086\074\105\122\073\116\066\106\085\103\111\120\120\079\122\076\080\073\108\049\097\106\121\082\098\054\047\051\097\089\055\084\084\112\079\117\074","\114\075\099\061","\111\047\122\075\066\073\075\112","\074\056\119\120\097\052\051\115\118\076\101\043\052\068\087\051\109\115\061\061","\056\110\054\099";"\122\057\106\099\076\079\077\102\107\117\087\102\098\084\089\102","\115\113\111\066\114\048\082\116\118\088\061\061";"\090\119\103\073\121\107\068\061";"\110\099\071\102\054\072\048\100\119\119\101\066";"\050\117\077\052\086\065\061\061","\084\054\109\057\053\097\108\057\053\049\050\074";"\103\048\068\088\107\118\089\089\051\048\049\113";"\116\118\097\057","\107\098\117\117\052\065\061\061";"\078\080\121\086\071\084\084\107\050\115\061\061";"\050\084\099\087\048\098\061\061";"\109\084\101\049\086\090\119\120","\107\082\113\068\110\050\082\117\116\049\065\100\078\086\116\072\112\065\061\061","\069\053\084\100\081\117\117\074\102\088\061\061","\111\066\071\110\111\049\110\084\107\120\055\073\075\084\054\121\079\113\083\087\084\054\089\107";"\100\090\103\070\119\057\079\076\049\057\053\053\121\070\065\047\100\115\061\061","\097\077\113\083\097\078\108\107\102\117\077\053\085\080\101\057\105\081\097\084\101\099\104\061";"\082\113\103\053\118\088\061\061","\069\104\053\054\121\108\050\061","\090\047\111\057\054\065\061\061","\069\087\047\114\117\056\055\061","\105\070\118\072\119\103\118\067\115\104\103\050\117\109\119\122\104\098\061\061","\110\066\047\056";"\087\101\047\086\117\098\061\061";"\117\113\047\089\118\070\119\084","\118\047\100\086\119\047\117\056\105\103\085\049\081\090\052\086";"\076\055\104\080\075\102\057\051","\054\122\052\054\081\082\119\113\117\082\117\108\049\099\117\079\049\047\120\061";"\090\066\119\077";"\118\113\084\103\102\117\075\104\083\073\079\090","\051\056\118\074\071\090\077\061","\098\116\083\079\065\122\065\113\118\116\098\061","\079\086\067\055\088\047\052\099\043\106\050\110";"\079\100\098\116\099\081\072\118\054\116\112\073\085\081\090\099\109\050\073\098\070\117\076\106\072\122\052\073";"\069\056\069\055\049\087\071\074\106\065\052\118\097\068\106\081\120\048\084\106\104\112\088\089\079\065\090\110\072\079\078\048\120\077\088\106\118\082\073\104\057\102\043\103\117\082\087\056\057\052\104\075\119\120\116\072\065\057\114\071\122\069\098\066\088\079\089\119\076\105\103\079\120\068\099\071\071\066\085\083\098\107\051\086\075\105\065\100\087\072\089\105\109\051\088\057\117\047\118\070\089\118\071\056\055\055\077\104";"\057\112\114\113\070\122\066\114";"\084\055\108\099\055\051\055\043\074\054\085\108\065\071\068\061";"\099\085\076\057";"\113\080\102\098\050\051\114\104\120\072\050\061";"\085\104\119\077\085\048\089\112\085\079\082\112\118\116\108\101";"\082\086\080\076\065\086\066\088\075\104\120\061","\101\083\121\112";"\108\087\104\055\071\109\055\106\117\088\085\070";"\103\105\054\065\105\079\105\082","\065\055\116\068\079\079\104\061";"\107\077\077\118\106\083\065\061";"\084\112\066\079\067\115\061\061","\055\122\072\055\104\080\088\082\110\065\103\043\110\066\109\085";"\118\121\087\065\054\121\119\101","\099\089\080\089\068\119\104\100\119\077\054\089","\082\075\121\085\100\057\100\061";"\049\065\061\061","\100\080\108\053\114\057\115\061";"\066\117\112\065\100\066\049\112";"\087\120\072\108\078\108\047\116\070\110\070\081";"\104\070\086\089\105\082\119\097\118\121\087\120\085\057\108\097\114\104\085\053\100\113\077\061";"\100\048\103\066\117\070\111\072";"\088\105\119\104\052\081\055\074\088\117\086\101","\118\108\117\081\070\075\073\115\067\066\100\115","\104\113\089\097\118\055\087\097\118\070\079\048\051\121\119\089\118\070\079\097\114\098\061\061";"\118\107\104\079\099\050\055\061","\088\104\077\098","\119\055\053\113\117\080\088\113\085\075\103\112\121\116\085\090\121\099\065\061";"\117\082\072\053\057\078\097\073\048\065\047\068\086\111\111\067\074\057\098\061";"\097\051\122\113\068\122\113\049\073\105\088\057","\048\081\087\114\070\065\061\061","\117\113\103\072\117\115\061\061";"\100\043\072\050\105\122\109\069\100\057\098\055\072\075\097\113\054\115\061\061";"\083\097\073\114\104\102\087\109\068\098\082\066\053\048\069\112\047\082\075\121\104\104\105\043\056\111\107\080\116\065\061\061";"\069\088\061\061";"\104\075\100\101";"\078\117\049\117\053\069\104\115\099\112\109\121\051\088\054\073\098\101\120\078\052\065\061\061";"\119\116\066\056\057\055\111\086\047\097\090\097\075\066\069\065\070\115\061\061","\086\121\120\057\104\098\083\081\102\083\100\061";"\113\068\099\055\113\074\113\057\104\098\061\061","\076\097\049\050\088\050\119\081\100\079\081\078\105\077\112\121\043\051\107\057\072\102\083\071","\106\048\121\115\097\043\120\098\099\115\061\061","\073\069\050\055\080\074\055\067