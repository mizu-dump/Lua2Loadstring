local aa=Instance.new("ScreenGui")
local ba=Instance.new("Frame") local ca=Instance.new("TextButton")
local da=Instance.new("TextButton")local _b=Instance.new("TextBox")aa. Name="Exploit
SS"
aa.Parent=game.CoreGui;aa.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ba.Name="skidd
ed"
ba.Parent=aa;ba.BackgroundColor3=Color3.new(0.352941,1, 0.956863)
ba.Position=UDim2.new(0.0971659869, 0, 0.335380852, 0)ba. Size=UDim2.new(0,358, 0, 292) ca
• Name="Execute"ca.Parent=ba
ca. BackgroundColor3=Color3.new(0.6,1,0.411765)ca.Position=UDim2.new(0.0363128483,0,
0.743150711,0)
ca. Size=UDim2.new(0,157, 0, 64)ca. Font=Enum. Font. SourceSans; ca. Text="Execute" ca. TextColor3=Color3.new(0,0,0)ca. TextSize=25; da. Name="Clear"da. Parent=ba da. BackgroundColor3=Color3.new(0.6,1,0.411765)da.Position=UDim2.new(0.522346377,0,0
. 743150711, 0)
da. Size=UDim2.new(0,157,0, 64)da. Font=Enum. Font. Sourcesans; da. Text="Clear" da. TextColor3=Color3.new(0,0, 0)da. TextSize=25;_b. Name="source"_ _b. Parent=ba
_b.BackgroundColor3=Color3.new(0.6,1,0.411765)_b.Position=UDim2.new(O.0251396634, 0,
0. 0787671208, 0)
_b.Size=UDim2.new(0,339, 0, 151)_b.Font=Enum.Font.SourceSans;_b.Text=""
_b.TextColor3=Color3.new(0,0,0)_b.TextSize=20
ca. MouseButton1Down: connect(function()
game. ReplicatedStorage.RemoteEvent:FireServer (_b.Text)end)