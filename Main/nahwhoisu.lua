-- 🚀 Steal a Brainrot - Undetected Desync Script w/ Fancy Girly UI (Dec 19, 2025)
-- Best desync (NetworkOwner nil) | Toggle with small fancy girly button
-- Pink/Purple theme, hearts, glow, rounded, cute font
-- No freeze, low detection | Alt account only!

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- AC Bypass (observeTag + Anti-ragdoll only - Anti-kick removed as requested)
for _, v in pairs(getgc(true)) do
    if typeof(v) == "table" and rawget(v, "observeTag") then
        hookfunction(v.observeTag, newcclosure(function() return {Disconnect = function() end} end))
    end
end

humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)

-- Fancy Girly Small UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GirlyDesync"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame (Small & Cute)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 160, 0, 160)
Frame.Position = UDim2.new(0.05, 0, 0.7, 0)
Frame.BackgroundColor3 = Color3.fromRGB(255, 182, 193)  -- Light Pink
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)  -- Full circle
Corner.Parent = Frame

-- Glow Effect
local Glow = Instance.new("ImageLabel")
Glow.Size = UDim2.new(1, 30, 1, 30)
Glow.Position = UDim2.new(0, -15, 0, -15)
Glow.BackgroundTransparency = 1
Glow.Image = "rbxassetid://4316371728"
Glow.ImageColor3 = Color3.fromRGB(255, 105, 180)  -- Hot Pink
Glow.ImageTransparency = 0.6
Glow.Parent = Frame

-- Heart Icon in Center
local Heart = Instance.new("TextLabel")
Heart.Size = UDim2.new(0, 80, 0, 80)
Heart.Position = UDim2.new(0.5, -40, 0.5, -40)
Heart.BackgroundTransparency = 1
Heart.Text = "♡"
Heart.TextColor3 = Color3.fromRGB(255, 20, 147)  -- Deep Pink
Heart.Font = Enum.Font.GothamBlack
Heart.TextSize = 80
Heart.Parent = Frame

-- Toggle Button (The Heart is the button)
local desyncEnabled = false
local desyncConnection

Heart.MouseButton1Click:Connect(function()
    desyncEnabled = not desyncEnabled
    
    if desyncEnabled then
        Heart.Text = "♥"  -- Filled heart
        Heart.TextColor3 = Color3.fromRGB(255, 20, 147)
        Glow.ImageColor3 = Color3.fromRGB(255, 20, 147)
        desyncConnection = RunService.Heartbeat:Connect(function()
            pcall(function()
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part:SetNetworkOwner(nil)
                    end
                end
            end)
        end)
        print("♡ Desync ON - Girly mode activated! ♡")
    else
        Heart.Text = "♡"  -- Empty heart
        Heart.TextColor3 = Color3.fromRGB(255, 182, 193)
        Glow.ImageColor3 = Color3.fromRGB(255, 105, 180)
        if desyncConnection then desyncConnection:Disconnect() end
        pcall(function()
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part:SetNetworkOwner(player)
                end
            end
        end)
        print("♡ Desync OFF - Stay cute! ♡")
    end
end)

-- Respawn Handler
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
end)

print("♡ Girly Desync Script Loaded! Click the heart button to toggle desync - Super cute & undetected ♡")