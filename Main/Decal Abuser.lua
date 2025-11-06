--// FE Decal + Skybox GUI for F3X
--// Name: Decal Abuse
--// Works with SyncAPI exploit-based environment

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--// Create GUI
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "DecalAbuse"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Size = UDim2.new(0, 240, 0, 160)
Frame.Position = UDim2.new(1, -250, 0, 50)
Frame.Active = true
Frame.Draggable = true
Frame.BackgroundTransparency = 0.1

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "Decal Abuse Panel"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

local DecalLabel = Instance.new("TextLabel", Frame)
DecalLabel.Text = "Skybox Decal ID:"
DecalLabel.TextColor3 = Color3.new(1, 1, 1)
DecalLabel.BackgroundTransparency = 1
DecalLabel.Position = UDim2.new(0, 10, 0, 35)
DecalLabel.Size = UDim2.new(1, -20, 0, 20)
DecalLabel.Font = Enum.Font.SourceSans
DecalLabel.TextSize = 14

local SkyBoxTextBox = Instance.new("TextBox", Frame)
SkyBoxTextBox.PlaceholderText = "Enter Skybox Decal ID"
SkyBoxTextBox.Size = UDim2.new(1, -20, 0, 25)
SkyBoxTextBox.Position = UDim2.new(0, 10, 0, 55)
SkyBoxTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SkyBoxTextBox.TextColor3 = Color3.new(1, 1, 1)
SkyBoxTextBox.BorderSizePixel = 0
Instance.new("UICorner", SkyBoxTextBox).CornerRadius = UDim.new(0, 6)

local SpamLabel = Instance.new("TextLabel", Frame)
SpamLabel.Text = "Decal Spam ID:"
SpamLabel.TextColor3 = Color3.new(1, 1, 1)
SpamLabel.BackgroundTransparency = 1
SpamLabel.Position = UDim2.new(0, 10, 0, 85)
SpamLabel.Size = UDim2.new(1, -20, 0, 20)
SpamLabel.Font = Enum.Font.SourceSans
SpamLabel.TextSize = 14

local SpamTextBox = Instance.new("TextBox", Frame)
SpamTextBox.PlaceholderText = "Enter Decal Spam ID"
SpamTextBox.Size = UDim2.new(1, -20, 0, 25)
SpamTextBox.Position = UDim2.new(0, 10, 0, 105)
SpamTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpamTextBox.TextColor3 = Color3.new(1, 1, 1)
SpamTextBox.BorderSizePixel = 0
Instance.new("UICorner", SpamTextBox).CornerRadius = UDim.new(0, 6)

local SkyButton = Instance.new("TextButton", Frame)
SkyButton.Text = "Add Skybox"
SkyButton.Size = UDim2.new(0.47, 0, 0, 30)
SkyButton.Position = UDim2.new(0.025, 0, 1, -35)
SkyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
SkyButton.TextColor3 = Color3.new(1, 1, 1)
SkyButton.Font = Enum.Font.SourceSansBold
SkyButton.TextSize = 16
Instance.new("UICorner", SkyButton).CornerRadius = UDim.new(0, 6)

local SpamButton = Instance.new("TextButton", Frame)
SpamButton.Text = "Decal Spam"
SpamButton.Size = UDim2.new(0.47, 0, 0, 30)
SpamButton.Position = UDim2.new(0.505, 0, 1, -35)
SpamButton.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
SpamButton.TextColor3 = Color3.new(1, 1, 1)
SpamButton.Font = Enum.Font.SourceSansBold
SpamButton.TextSize = 16
Instance.new("UICorner", SpamButton).CornerRadius = UDim.new(0, 6)

--// Get F3X SyncAPI
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local tool

for _, v in ipairs(player:GetDescendants()) do
	if v.Name == "SyncAPI" then tool = v.Parent end
end
for _, v in ipairs(game.ReplicatedStorage:GetDescendants()) do
	if v.Name == "SyncAPI" then tool = v.Parent end
end
if not tool then
	warn("F3X tool not found! Equip F3X first.")
	return
end

local remote = tool:WaitForChild("SyncAPI").ServerEndpoint
local function _(args)
	remote:InvokeServer(unpack(args))
end

--// Helper functions
local function SpawnDecal(part,side)
	local args = {
		[1] = "CreateTextures",
		[2] = {
			[1] = {
				["Part"] = part,
				["Face"] = side,
				["TextureType"] = "Decal"
			}
		}
	}
	_(args)
end

local function AddDecal(part,asset,side)
	local args = {
		[1] = "SyncTexture",
		[2] = {
			[1] = {
				["Part"] = part,
				["Face"] = side,
				["TextureType"] = "Decal",
				["Texture"] = "rbxassetid://".. asset
			}
		}
	}
	_(args)
end

--// Decal Spam Function
local function spam(id)
	for _,v in ipairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			task.spawn(function()
				for _,face in ipairs(Enum.NormalId:GetEnumItems()) do
					SpawnDecal(v, face)
					AddDecal(v, id, face)
				end
			end)
		end
	end
end

--// Skybox Function
local function Sky(id)
	local root = char:WaitForChild("HumanoidRootPart")
	local cf = root.CFrame
	local args = {
		[1] = "CreatePart",
		[2] = "Normal",
		[3] = cf + Vector3.new(0,6,0),
		[4] = workspace
	}
	_(args)
	task.wait(0.5)
	for _,v in ipairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") and (v.Position - (cf.Position + Vector3.new(0,6,0))).Magnitude < 1 then
			local args2 = {
				[1] = "CreateMeshes",
				[2] = {
					[1] = {["Part"] = v}
				}
			}
			_(args2)
			local args3 = {
				[1] = "SyncMesh",
				[2] = {
					[1] = {
						["Part"] = v,
						["MeshId"] = "rbxassetid://8006679977",
						["TextureId"] = "rbxassetid://"..id,
						["Scale"] = Vector3.new(50,50,50)
					}
				}
			}
			_(args3)
		end
	end
end

--// Button Connections
SkyButton.MouseButton1Click:Connect(function()
	local id = SkyBoxTextBox.Text
	if id ~= "" then
		Sky(id)
	end
end)

SpamButton.MouseButton1Click:Connect(function()
	local id = SpamTextBox.Text
	if id ~= "" then
		spam(id)
	end
end)