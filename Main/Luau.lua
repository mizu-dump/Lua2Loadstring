-- LocalScript (StarterPlayerScripts ou StarterCharacterScripts)

local InsertService = game:GetService("InsertService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local GUN_ID = 29099749 -- Transmorph Ray Gun

local function giveLocalGun()
    local model

    -- trie load
    local success, result = pcall(function()
        return InsertService:LoadAsset(GUN_ID)
    end)

    if success and result then
        model = result:FindFirstChildWhichIsA("Model") or result
    else
        warn("Fail:", result)
        return
    end
    
    model.Parent = char

    -- ttrye find weld
    local handle = model:FindFirstChild("Handle") or model:FindFirstChildWhichIsA("BasePart")
    local rightHand = char:FindFirstChild("RightHand") or char:FindFirstChild("Right Arm")

    if handle and rightHand then
        -- destrói welds padrões do Roblox
        for _, v in ipairs(model:GetDescendants()) do
            if v:IsA("Weld") or v:IsA("Motor6D") then
                v:Destroy()
            end
        end

        -- manual (client only)
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = handle
        weld.Part1 = rightHand
        weld.Parent = handle

        handle.CFrame = rightHand.CFrame
    end

    print("Worked")
end

giveLocalGun()