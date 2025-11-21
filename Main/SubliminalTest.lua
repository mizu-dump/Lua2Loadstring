local _A=game:GetService("Players")
local _B=game:GetService("TweenService")
local _C=_A.LocalPlayer
local _D=_C.Name
local _E=workspace:WaitForChild("Saving"):WaitForChild(_D.."'s Data"):WaitForChild("ModeData")
local _F=_E:FindFirstChild("SUBLIMINAL")
if not _F then return end
local _G=Instance.new("ScreenGui")
_G.Parent=_C:WaitForChild("PlayerGui")
local _H=Instance.new("Frame")
_H.Size=UDim2.new(0,300,0,420)
_H.Position=UDim2.new(0,20,0.5,-210)
_H.BackgroundColor3=Color3.fromRGB(25,25,25)
_H.BorderSizePixel=0
_H.Parent=_G
local _I=Instance.new("UICorner",_H)
_I.CornerRadius=UDim.new(0,10)
local _J=Instance.new("Frame")
_J.Size=UDim2.new(1,0,0,35)
_J.BackgroundColor3=Color3.fromRGB(40,40,40)
_J.BorderSizePixel=0
_J.Parent=_H
Instance.new("UICorner",_J).CornerRadius=UDim.new(0,10)
_J.ClipsDescendants=true
local _K=Instance.new("TextLabel")
_K.Size=UDim2.new(1,-70,1,0)
_K.Position=UDim2.new(0,10,0,0)
_K.BackgroundTransparency=1
_K.Font=Enum.Font.GothamBold
_K.TextSize=16
_K.TextXAlignment=Enum.TextXAlignment.Left
_K.TextColor3=Color3.fromRGB(255,255,255)
_K.Text="SUBLIMINAL Skins"
_K.Parent=_J
local _L=Instance.new("TextButton")
_L.Size=UDim2.new(0,30,0,28)
_L.Position=UDim2.new(1,-65,0.5,-14)
_L.BackgroundColor3=Color3.fromRGB(60,60,60)
_L.Font=Enum.Font.GothamBold
_L.TextSize=16
_L.TextColor3=Color3.fromRGB(255,255,255)
_L.Text="-"
_L.Parent=_J
Instance.new("UICorner",_L).CornerRadius=UDim.new(0,6)
local _M=Instance.new("TextButton")
_M.Size=UDim2.new(0,30,0,28)
_M.Position=UDim2.new(1,-35,0.5,-14)
_M.BackgroundColor3=Color3.fromRGB(100,50,50)
_M.Font=Enum.Font.GothamBold
_M.TextSize=16
_M.TextColor3=Color3.fromRGB(255,255,255)
_M.Text="X"
_M.Parent=_J
Instance.new("UICorner",_M).CornerRadius=UDim.new(0,6)
local _N=false
_L.MouseButton1Click:Connect(function()
    _N=not _N
    _B:Create(_H,TweenInfo.new(0.25),{Size=_N and UDim2.new(0,300,0,35) or UDim2.new(0,300,0,420)}):Play()
end)
_M.MouseButton1Click:Connect(function()
    _G:Destroy()
end)
local _O=Instance.new("ScrollingFrame")
_O.Size=UDim2.new(1,0,1,-40)
_O.Position=UDim2.new(0,0,0,40)
_O.BackgroundColor3=Color3.fromRGB(35,35,35)
_O.BorderSizePixel=0
_O.CanvasSize=UDim2.new(0,0,0,0)
_O.ScrollBarThickness=4
_O.Parent=_H
Instance.new("UICorner",_O).CornerRadius=UDim.new(0,8)
local _P=Instance.new("Frame")
_P.Size=UDim2.new(0,280,0,420)
_P.Position=UDim2.new(0,340,0.5,-210)
_P.BackgroundColor3=Color3.fromRGB(30,30,30)
_P.BorderSizePixel=0
_P.Parent=_G
Instance.new("UICorner",_P).CornerRadius=UDim.new(0,10)
local _Q=Instance.new("ScrollingFrame")
_Q.Size=UDim2.new(1,0,1,0)
_Q.BackgroundColor3=Color3.fromRGB(35,35,35)
_Q.BorderSizePixel=0
_Q.ScrollBarThickness=4
_Q.CanvasSize=UDim2.new(0,0,0,0)
_Q.Parent=_P
Instance.new("UICorner",_Q).CornerRadius=UDim.new(0,10)
local function _R(S,T)
    local U=Instance.new("TextButton")
    U.Size=UDim2.new(1,-20,0,32)
    U.Position=UDim2.new(0,10,0,0)
    U.BackgroundColor3=Color3.fromRGB(60,60,60)
    U.Font=Enum.Font.Gotham
    U.TextColor3=Color3.fromRGB(255,255,255)
    U.Text=T
    U.TextSize=14
    U.Parent=S
    Instance.new("UICorner",U).CornerRadius=UDim.new(0,6)
    return U
end
local _V=0
for _,W in ipairs(_F:GetChildren())do
    if W:FindFirstChild("SkinsUnlocked") and W:FindFirstChild("SkinEquipped") then
        local X=_R(_O,W.Name)
        X.Position=UDim2.new(0,10,0,_V)
        _V+=38
        X.MouseButton1Click:Connect(function()
            for _,Y in ipairs(_Q:GetChildren())do
                if Y:IsA("TextButton")then Y:Destroy()end
            end
            local Z=W.SkinsUnlocked
            local a=W.SkinEquipped
            local b=0
            for _,c in ipairs(Z:GetChildren())do
                if c:IsA("Folder")then
                    local d=_R(_Q,c.Name)
                    d.Position=UDim2.new(0,10,0,b)
                    b+=38
                    d.MouseButton1Click:Connect(function()
                        a.Value=c.Name
                    end)
                end
            end
            _Q.CanvasSize=UDim2.new(0,0,0,b)
        end)
    end
end
_O.CanvasSize=UDim2.new(0,0,0,_V)