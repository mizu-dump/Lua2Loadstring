-- Create main ScreenGui
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FallControlGui"
gui.ResetOnSpawn = false

-- === Toggle Button ===
local toggleBtn = Instance.new("TextButton")
toggleBtn.Parent = gui
toggleBtn.Size = UDim2.new(0, 150, 0, 50)
toggleBtn.Position = UDim2.new(0.5, -160, 0.85, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextScaled = true
toggleBtn.Text = "Slow Fall: OFF"

-- === Speed TextBox ===
local box = Instance.new("TextBox")
box.Parent = gui
box.Size = UDim2.new(0, 150, 0, 50)
box.Position = UDim2.new(0.5, 10, 0.85, 0)
box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
box.TextColor3 = Color3.fromRGB(255, 255, 255)
box.PlaceholderText = "Speed (0.1 - 1)"
box.Text = ""
box.TextScaled = true
box.Font = Enum.Font.SourceSans
box.ClearTextOnFocus = false

-- === Variables ===
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

getgenv().slowFallEnabled = false
getgenv().fallMultiplier = 0.5 -- Default

-- === Fall Logic ===
RunService:BindToRenderStep("SlowFallControl", Enum.RenderPriority.Character.Value + 1, function()
	if not slowFallEnabled then return end
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		local hrp = char.HumanoidRootPart
		local vel = hrp.Velocity
		if vel.Y < 0 then
			hrp.Velocity = Vector3.new(vel.X, vel.Y * fallMultiplier, vel.Z)
		end
	end
end)

-- === Toggle Button Function ===
toggleBtn.MouseButton1Click:Connect(function()
	slowFallEnabled = not slowFallEnabled
	toggleBtn.Text = slowFallEnabled and "Slow Fall: ON" or "Slow Fall: OFF"
	toggleBtn.BackgroundColor3 = slowFallEnabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(30, 30, 30)
end)

-- === TextBox Input Function ===
box.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local val = tonumber(box.Text)
		if val and val > 0 and val <= 1 then
			fallMultiplier = val
			box.TextColor3 = Color3.fromRGB(0, 255, 0)
		else
			box.TextColor3 = Color3.fromRGB(255, 0, 0)
		end
	end
end)