local a=game:GetService("Players")
local b=game:GetService("UserInputService")
local c=a.LocalPlayer
local d=script.Parent
if(not d or not d:IsA("ScreenGui"))then
	local e=c:WaitForChild("PlayerGui")
	d=Instance.new("ScreenGui")
	d.Name="SkinManagerGUI"
	d.ResetOnSpawn=false
	d.Parent=e
else
	d.Name="SkinManagerGUI"
end

local function f(g,h,i)
	local j=g:FindFirstChild(i)
	if j and j.ClassName==h then return j end
	local k=Instance.new(h)
	k.Name=i
	k.Parent=g
	return k
end

local l=d:FindFirstChild("MainFrame")
if not l then
	l=Instance.new("Frame")
	l.Name="MainFrame"
	l.Size=UDim2.new(0,450,0,300)
	l.Position=UDim2.new(0,30,0,50)
	l.BackgroundColor3=Color3.fromRGB(30,30,30)
	l.BorderSizePixel=0
	l.Parent=d
	local m=Instance.new("UICorner")
	m.CornerRadius=UDim.new(0,6)
	m.Parent=l
end

local n=f(l,"Frame","TopBar")
n.Size=UDim2.new(1,0,0,28)
n.BackgroundColor3=Color3.fromRGB(45,45,45)
n.BorderSizePixel=0
n.Parent=l
local o=n:FindFirstChild("UICorner")or Instance.new("UICorner",n)
o.CornerRadius=UDim.new(0,6)

local p=f(n,"TextLabel","Title")
p.Text="Skin Manager"
p.Size=UDim2.new(1,-90,1,0)
p.Position=UDim2.new(0,10,0,0)
p.TextXAlignment=Enum.TextXAlignment.Left
p.BackgroundTransparency=1
p.TextColor3=Color3.new(1,1,1)
p.Font=Enum.Font.GothamBold
p.TextSize=16

local q=f(n,"TextButton","Minimize")
q.Size=UDim2.new(0,40,1,0)
q.Position=UDim2.new(1,-90,0,0)
q.BackgroundTransparency=1
q.Text="-"
q.TextColor3=Color3.new(1,1,1)
q.Font=Enum.Font.GothamBold
q.TextSize=20

local r=f(n,"TextButton","Close")
r.Size=UDim2.new(0,40,1,0)
r.Position=UDim2.new(1,-45,0,0)
r.BackgroundTransparency=1
r.Text="X"
r.TextColor3=Color3.new(1,1,1)
r.Font=Enum.Font.GothamBold
r.TextSize=16

local s=l:FindFirstChild("ModeList")
if not s then
	s=Instance.new("ScrollingFrame")
	s.Name="ModeList"
	s.Size=UDim2.new(0,200,1,-40)
	s.Position=UDim2.new(0,10,0,35)
	s.BackgroundColor3=Color3.fromRGB(40,40,40)
	s.BorderSizePixel=0
	s.ScrollBarThickness=6
	s.Parent=l
	local t=Instance.new("UICorner",s)
	t.CornerRadius=UDim.new(0,6)
end

local u=l:FindFirstChild("SkinList")
if not u then
	u=Instance.new("ScrollingFrame")
	u.Name="SkinList"
	u.Size=UDim2.new(0,200,1,-40)
	u.Position=UDim2.new(0,230,0,35)
	u.BackgroundColor3=Color3.fromRGB(40,40,40)
	u.BorderSizePixel=0
	u.ScrollBarThickness=6
	u.Parent=l
	local v=Instance.new("UICorner",u)
	v.CornerRadius=UDim.new(0,6)
end

local w=s:FindFirstChildOfClass("UIListLayout")
if not w then
	w=Instance.new("UIListLayout")
	w.Parent=s
	w.SortOrder=Enum.SortOrder.LayoutOrder
	w.Padding=UDim.new(0,4)
end

local x=u:FindFirstChildOfClass("UIListLayout")
if not x then
	x=Instance.new("UIListLayout")
	x.Parent=u
	x.SortOrder=Enum.SortOrder.LayoutOrder
	x.Padding=UDim.new(0,4)
end

local function y(z)
	for _,A in ipairs(z:GetChildren())do
		if A:IsA("TextButton")then A:Destroy()end
	end
end

local function B(C,D)
	C.CanvasSize=UDim2.new(0,0,0,D.AbsoluteContentSize.Y+10)
end

w:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	B(s,w)
end)
x:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	B(u,x)
end)

B(s,w)
B(u,x)

local E=false
q.MouseButton1Click:Connect(function()
	E=not E
	if E then
		s.Visible=false
		u.Visible=false
		q.Text="+"
		l.Size=UDim2.new(0,450,0,28)
	else
		s.Visible=true
		u.Visible=true
		q.Text="-"
		l.Size=UDim2.new(0,450,0,300)
	end
end)

r.MouseButton1Click:Connect(function()
	d:Destroy()
end)

local F=false
local G
local H

local function I(J)
	local K=J.Position-G
	l.Position=UDim2.new(H.X.Scale,H.X.Offset+K.X,H.Y.Scale,H.Y.Offset+K.Y)
end

n.InputBegan:Connect(function(L)
	if L.UserInputType==Enum.UserInputType.MouseButton1 then
		F=true
		G=L.Position
		H=l.Position
		L.Changed:Connect(function()
			if L.UserInputState==Enum.UserInputState.End then
				F=false
			end
		end)
	end
end)

b.InputChanged:Connect(function(M)
	if F and M.UserInputType==Enum.UserInputType.MouseMovement then
		I(M)
	end
end)

task.defer(function()
	task.wait(.6)
	local N=workspace:FindFirstChild("Saving")
	if not N then return end

	local O=c.Name.."'s Data"
	local P=N:FindFirstChild(O)
	if not P then return end

	local Q=P:FindFirstChild("ModeData")
	if not Q then return end

	local R=Q:FindFirstChild("STARGLITCHER")
	if not R then return end

	local function S(T)
		y(u)
		local U=T:FindFirstChild("SkinsUnlocked")
		local V=T:FindFirstChild("SkinEquipped")
		if not U or not V then return end
		for _,W in ipairs(U:GetChildren())do
			if W:IsA("Folder")then
				local X=Instance.new("TextButton")
				X.Size=UDim2.new(1,-10,0,30)
				X.BackgroundColor3=Color3.fromRGB(60,60,60)
				X.TextColor3=Color3.new(1,1,1)
				X.Font=Enum.Font.GothamSemibold
				X.TextSize=14
				X.Text=W.Name
				X.Parent=u
				X.MouseButton1Click:Connect(function()
					V.Value=W.Name
				end)
			end
		end
	end

	local function Y()
		y(s)
		for _,Z in ipairs(R:GetChildren())do
			if Z:IsA("Folder")then
				local _=Z:FindFirstChild("SkinsUnlocked")
				local a0=Z:FindFirstChild("SkinEquipped")
				if _ and a0 then
					local a1=Instance.new("TextButton")
					a1.Size=UDim2.new(1,-10,0,30)
					a1.BackgroundColor3=Color3.fromRGB(70,70,70)
					a1.TextColor3=Color3.new(1,1,1)
					a1.Font=Enum.Font.GothamSemibold
					a1.TextSize=14
					a1.Text=Z.Name
					a1.Parent=s
					a1.MouseButton1Click:Connect(function()
						S(Z)
					end)
				end
			end
		end
	end

	Y()
end)