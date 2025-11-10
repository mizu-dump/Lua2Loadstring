ROBLOX: Panel secret
Download All
client
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local superJumpEnabled = false
local originalJumpPower = humanoid.JumpPower

local function enableSuperJump()
    superJumpEnabled = true
    humanoid.JumpPower = 150
end

local function disableSuperJump()
    superJumpEnabled = false
    humanoid.JumpPower = originalJumpPower
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end

    if input.KeyCode == Enum.KeyCode.J then
        if superJumpEnabled then
            disableSuperJump()
            print("Super Jump Disabled")
        else
            enableSuperJump()
            print("Super Jump Enabled")
        end
    end
end)

local shopGUI = Instance.new("ScreenGui")
shopGUI.Name = "ShopGUI"
shopGUI.Parent = localPlayer.PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
mainFrame.Parent = shopGUI

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Text = "Item Shop"
titleLabel.TextScaled = true
titleLabel.Parent = mainFrame

local itemFrame = Instance.new("Frame")
itemFrame.Name = "ItemFrame"
itemFrame.Size = UDim2.new(0.9, 0, 0.7, 0)
itemFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
itemFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
itemFrame.Parent = mainFrame

local itemNameLabel = Instance.new("TextLabel")
itemNameLabel.Name = "ItemNameLabel"
itemNameLabel.Size = UDim2.new(1, 0, 0.2, 0)
itemNameLabel.Position = UDim2.new(0, 0, 0, 0)
itemNameLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
itemNameLabel.TextColor3 = Color3.new(1, 1, 1)
itemNameLabel.Text = "Item Name"
itemNameLabel.TextScaled = true
itemNameLabel.Parent = itemFrame

local itemDescriptionLabel = Instance.new("TextLabel")
itemDescriptionLabel.Name = "ItemDescriptionLabel"
itemDescriptionLabel.Size = UDim2.new(1, 0, 0.5, 0)
itemDescriptionLabel.Position = UDim2.new(0, 0, 0.2, 0)
itemDescriptionLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
itemDescriptionLabel.TextColor3 = Color3.new(1, 1, 1)
itemDescriptionLabel.Text = "Item Description"
itemNameLabel.TextXAlignment = Enum.TextXAlignment.Left
itemDescriptionLabel.TextScaled = true
itemDescriptionLabel.Parent = itemFrame

local itemCostLabel = Instance.new("TextLabel")
itemCostLabel.Name = "ItemCostLabel"
itemCostLabel.Size = UDim2.new(1, 0, 0.2, 0)
itemCostLabel.Position = UDim2.new(0, 0, 0.7, 0)
itemCostLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
itemCostLabel.TextColor3 = Color3.new(1, 1, 1)
itemCostLabel.Text = "Cost: 0"
itemCostLabel.TextScaled = true
itemCostLabel.Parent = itemFrame

local buyButton = Instance.new("TextButton")
buyButton.Name = "BuyButton"
buyButton.Size = UDim2.new(0.9, 0, 0.2, 0)
buyButton.Position = UDim2.new(0.05, 0, 0.85, 0)
buyButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
buyButton.TextColor3 = Color3.new(1, 1, 1)
buyButton.Text = "Buy"
buyButton.TextScaled = true
buyButton.Parent = mainFrame

local items = {
    {Name = "Speed Boost", Description = "Increases your speed for 10 seconds.", Cost = 100, Effect = function()
        local oldWalkSpeed = humanoid.WalkSpeed
        humanoid.WalkSpeed = humanoid.WalkSpeed * 2
        wait(10)
        humanoid.WalkSpeed = oldWalkSpeed
    end},
    {Name = "Health Potion", Description = "Restores 50 health.", Cost = 50, Effect = function()
        humanoid.Health = math.min(humanoid.Health + 50, humanoid.MaxHealth)
    end}
}

local currentItemIndex = 1

local function updateItemDisplay()
    local item = items[currentItemIndex]
    itemNameLabel.Text = item.Name
    itemDescriptionLabel.Text = item.Description
    itemCostLabel.Text = "Cost: " .. item.Cost
end

updateItemDisplay()

buyButton.MouseButton1Click:Connect(function()
    local item = items[currentItemIndex]
    local cost = item.Cost

    local success, message = pcall(function()
        ReplicatedStorage.PurchaseItem:FireServer(item.Name, cost)
    end)

    if success then
        print("Purchase Initiated: " .. item.Name)
    else
        print("Error initiating purchase: " .. message)
    end
end)

ReplicatedStorage.PurchaseItemResponse.OnClientEvent:Connect(function(itemName, success, message)
    if success then
        print("Successfully purchased: " .. itemName)
        items[currentItemIndex].Effect()
    else
        print("Failed to purchase: " .. itemName .. ". Reason: " .. message)
    end
end)

local function nextItem()
    currentItemIndex = currentItemIndex + 1
    if currentItemIndex > #items then
        currentItemIndex = 1
    end
    updateItemDisplay()
end

local function previousItem()
    currentItemIndex = currentItemIndex - 1
    if currentItemIndex < 1 then
        currentItemIndex = #items
    end
    updateItemDisplay()
end

local nextButton = Instance.new("TextButton")
nextButton.Name = "NextButton"
nextButton.Size = UDim2.new(0.1, 0, 0.1, 0)
nextButton.Position = UDim2.new(0.9, 0, 0.15, 0)
nextButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
nextButton.TextColor3 = Color3.new(1, 1, 1)
nextButton.Text = ">"
nextButton.TextScaled = true
nextButton.Parent = itemFrame

nextButton.MouseButton1Click:Connect(nextItem)

local previousButton = Instance.new("TextButton")
previousButton.Name = "PreviousButton"
previousButton.Size = UDim2.new(0.1, 0, 0.1, 0)
previousButton.Position = UDim2.new(0, 0, 0.15, 0)
previousButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
previousButton.TextColor3 = Color3.new(1, 1, 1)
previousButton.Text = "<"
previousButton.TextScaled = true
previousButton.Parent = itemFrame

previousButton.MouseButton1Click:Connect(previousItem)

local chatService = game:GetService("Chat")

local function processCommand(message)
    local commandParts = string.split(message, " ")
    local commandName = commandParts[1]

    if commandName == "/tp" then
        if #commandParts == 4 then
            local x, y, z = tonumber(commandParts[2]), tonumber(commandParts[3]), tonumber(commandParts[4])
            if x and y and z then
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
                else
                    print("Character or HumanoidRootPart not found.")
                end
            else
                print("Invalid coordinates. Usage: /tp x y z")
            end
        else
            print("Invalid number of arguments. Usage: /tp x y z")
        end
    elseif commandName == "/help" then
        print("Available commands: /tp x y z, /help")
    else
        print("Unknown command. Use /help for available commands.")
    end
end

chatService.Chatted:Connect(function(playerName, message, chatType)
    if playerName == localPlayer.Name and string.sub(message, 1, 1) == "/" then
        processCommand(message)
    end
end)
