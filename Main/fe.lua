local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local remoteEvent = ReplicatedStorage:WaitForChild("ShowScreenGUI")


remoteEvent:FireServer() 