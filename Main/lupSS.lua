local L=Instance.new("Folder")L.Name="LupSS"L.Parent=R
local function CR(n)local r=Instance.new("RemoteEvent")r.Name=n r.Parent=L return r end
local Rem={Exec=CR("Execute"),ExecCli=CR("ExecuteClient"),GetScr=CR("GetScripts"),PostScr=CR("PostScript"),Rate=CR("RateScript")}

local Hub={Scripts={},ID=1,Add=function(s,u,un,t,d,c,tg)local sc={Id=s.ID,UserId=u,Username=un,Title=t,Description=d,Code=c,Tags=tg or{},Upvotes=0,Downvotes=0,Timestamp=os.time(),Executions=0}table.insert(s.Scripts,1,sc)s.ID=s.ID+1 return sc end,Get=function(s,l)local r={}for i,v in ipairs(s.Scripts)do if i>(l or 50)then break end table.insert(r,v)end return r end,Rate=function(s,id,up)for _,v in ipairs(s.Scripts)do if v.Id==id then if up then v.Upvotes=v.Upvotes+1 else v.Downvotes=v.Downvotes+1 end return true end end return false end,IncExec=function(s,id)for _,v in ipairs(s.Scripts)do if v.Id==id then v.Executions=v.Executions+1 return true end end return false end}

Hub:Add(1,"LupSS","Welcome","Your first script!",[[print("Welcome to LupSS!")
local p=Instance.new("Part")p.Size=Vector3.new(10,1,10)p.Position=Vector3.new(0,10,0)p.BrickColor=BrickColor.Random()p.Material=Enum.Material.Neon p.Parent=workspace
task.spawn(function()while p.Parent do p.CFrame=p.CFrame*CFrame.Angles(0,math.rad(1),0)task.wait()end end)]],{"Tutorial"})

Hub:Add(1,"LupSS","FE God Mode","Invincibility!",[[local p=game.Players.LocalPlayer
local c=p.Character or p.CharacterAdded:Wait()
local h=c:WaitForChild("Humanoid")
h.MaxHealth=math.huge h.Health=math.huge
h:GetPropertyChangedSignal("Health"):Connect(function()if h.Health<h.MaxHealth then h.Health=h.MaxHealth end end)
print("God Mode ON!")]],{"FE","Exploit"})

Hub:Add(1,"LupSS","Infinite Jump","Jump forever!",[[local p=game.Players.LocalPlayer
local c=p.Character or p.CharacterAdded:Wait()
local h=c:WaitForChild("Humanoid")
game:GetService("UserInputService").JumpRequest:Connect(function()h:ChangeState(Enum.HumanoidStateType.Jumping)end)
print("Infinite Jump ON!")]],{"Movement","FE"})

local Data={}
local function InitP(p)if not S.Validate()then return end Data[p.UserId]={History={},Vars={},ExecCount=0,Start=os.time()}end
local function CleanP(p)Data[p.UserId]=nil end

local function Sandbox(p,cli)local d=Data[p.UserId]return setmetatable({},{__index=function(_,k)local v={print=function(...)print("["..p.Name.."]",...)end,warn=function(...)warn("["..p.Name.."]",...)end,error=error,wait=task.wait,task=task,math=math,string=string,table=table,type=type,typeof=typeof,tonumber=tonumber,tostring=tostring,pcall=pcall,Vector3=Vector3,Vector2=Vector2,CFrame=CFrame,Color3=Color3,UDim2=UDim2,Enum=Enum,Instance=Instance,require=require,loadstring=loadstring,game=game,workspace=workspace,Players=P,RunService=game:GetService("RunService"),TweenService=T,UserInputService=U,player=p,owner=cli and p or nil,shared=d.Vars,_G=d.Vars,HttpGet=function(u)return H:GetAsync(u)end}return v[k]or _G[k]end})end

local function Exec(p,c)if not S.Validate()then S.Kick(p)return false,"Not in Studio"end local d=Data[p.UserId]if not d then return false,"Not initialized"end local f,e=loadstring(c)if not f then return false,"❌ Error:\n"..tostring(e)end setfenv(f,Sandbox(p,false))local s,r=pcall(f)d.ExecCount=d.ExecCount+1 if s then return true,r else return false,"❌ Error:\n"..tostring(r)end end

Rem.Exec.OnServerEvent:Connect(function(p,c,id)if typeof(c)~="string"then return end if not S.Validate()then S.Kick(p)return end if id then Hub:IncExec(id)end local s,r=Exec(p,c)Rem.Exec:FireClient(p,s,r)end)
Rem.ExecCli.OnServerEvent:Connect(function(p,c,id)if typeof(c)~="string"then return end if not S.Validate()then S.Kick(p)return end if id then Hub:IncExec(id)end Rem.ExecCli:FireClient(p,c)end)
Rem.GetScr.OnServerEvent:Connect(function(p)Rem.GetScr:FireClient(p,Hub:Get(50))end)
Rem.PostScr.OnServerEvent:Connect(function(p,t,d,c,tg)if typeof(t)~="string"or typeof(c)~="string"then return end local sc=Hub:Add(p.UserId,p.Name,t,d or"",c,tg)Rem.PostScr:FireClient(p,true,sc)end)
Rem.Rate.OnServerEvent:Connect(function(p,id,up)Rem.Rate:FireClient(p,Hub:Rate(id,up))end)

P.PlayerAdded:Connect(function(p)InitP(p)p.CharacterAdded:Connect(function(c)task.wait(1)local ls=Instance.new("LocalScript")ls.Name="LupSS_Client"ls.Parent=c
ls.Source=[[local P,R,T,U=game:GetService("Players"),game:GetService("ReplicatedStorage"),game:GetService("TweenService"),game:GetService("UserInputService")
local p=P.LocalPlayer local L=R:WaitForChild("LupSS")
local Rem={Exec=L:WaitForChild("Execute"),ExecCli=L:WaitForChild("ExecuteClient"),GetScr=L:WaitForChild("GetScripts"),PostScr=L:WaitForChild("PostScript"),Rate=L:WaitForChild("RateScript")}

local g=Instance.new("ScreenGui")g.Name="LupSS_UI"g.ResetOnSpawn=false g.ZIndexBehavior=Enum.ZIndexBehavior.Sibling g.Parent=p.PlayerGui
local m=Instance.new("Frame")m.Size=UDim2.new(0,700,0,500)m.Position=UDim2.new(0.5,-350,0.5,-250)m.BackgroundColor3=Color3.fromRGB(25,25,35)m.BorderSizePixel=0 m.Parent=g
local mc=Instance.new("UICorner")mc.CornerRadius=UDim.new(0,12)mc.Parent=m

local h=Instance.new("Frame")h.Size=UDim2.new(1,0,0,50)h.BackgroundColor3=Color3.fromRGB(20,20,30)h.BorderSizePixel=0 h.Parent=m
local hc=Instance.new("UICorner")hc.CornerRadius=UDim.new(0,12)hc.Parent=h
local tl=Instance.new("TextLabel")tl.Size=UDim2.new(0,200,1,0)tl.Position=UDim2.new(0,15,0,0)tl.BackgroundTransparency=1 tl.Text="LupSS Executor"tl.Font=Enum.Font.GothamBold tl.TextSize=20 tl.TextColor3=Color3.fromRGB(255,255,255)tl.TextXAlignment=Enum.TextXAlignment.Left tl.Parent=h

local cb=Instance.new("TextButton")cb.Size=UDim2.new(0,40,0,40)cb.Position=UDim2.new(1,-45,0,5)cb.BackgroundColor3=Color3.fromRGB(255,50,50)cb.BorderSizePixel=0 cb.Text="X"cb.Font=Enum.Font.GothamBold cb.TextSize=18 cb.TextColor3=Color3.fromRGB(255,255,255)cb.Parent=h
local cbc=Instance.new("UICorner")cbc.CornerRadius=UDim.new(0,8)cbc.Parent=cb

local tf=Instance.new("Frame")tf.Size=UDim2.new(1,-20,0,40)tf.Position=UDim2.new(0,10,0,60)tf.BackgroundTransparency=1 tf.Parent=m
local function CT(n,po)local b=Instance.new("TextButton")b.Name=n b.Size=UDim2.new(0,150,1,0)b.Position=UDim2.new(0,po,0,0)b.BackgroundColor3=Color3.fromRGB(35,35,45)b.BorderSizePixel=0 b.Text=n b.Font=Enum.Font.GothamBold b.TextSize=14 b.TextColor3=Color3.fromRGB(200,200,220)b.Parent=tf local bc=Instance.new("UICorner")bc.CornerRadius=UDim.new(0,8)bc.Parent=b return b end
local et,st=CT("Executor",0),CT("Script Hub",165)

local co=Instance.new("Frame")co.Size=UDim2.new(1,-20,1,-120)co.Position=UDim2.new(0,10,0,110)co.BackgroundTransparency=1 co.Parent=m

local ef=Instance.new("Frame")ef.Name="Executor"ef.Size=UDim2.new(1,0,1,0)ef.BackgroundTransparency=1 ef.Visible=true ef.Parent=co
local cx=Instance.new("TextBox")cx.Size=UDim2.new(1,0,1,-50)cx.BackgroundColor3=Color3.fromRGB(30,30,40)cx.BorderSizePixel=0 cx.Text="-- LupSS\nprint('Hello!')"cx.Font=Enum.Font.Code cx.TextSize=14 cx.TextColor3=Color3.fromRGB(255,255,255)cx.TextXAlignment=Enum.TextXAlignment.Left cx.TextYAlignment=Enum.TextYAlignment.Top cx.MultiLine=true cx.ClearTextOnFocus=false cx.Parent=ef
local cxc=Instance.new("UICorner")cxc.CornerRadius=UDim.new(0,8)cxc.Parent=cx

local bf=Instance.new("Frame")bf.Size=UDim2.new(1,0,0,40)bf.Position=UDim2.new(0,0,1,-40)bf.BackgroundTransparency=1 bf.Parent=ef
local function CB(tx,po,cl)local b=Instance.new("TextButton")b.Size=UDim2.new(0,150,1,0)b.Position=UDim2.new(0,po,0,0)b.BackgroundColor3=cl b.BorderSizePixel=0 b.Text=tx b.Font=Enum.Font.GothamBold b.TextSize=14 b.TextColor3=Color3.fromRGB(255,255,255)b.Parent=bf local bc=Instance.new("UICorner")bc.CornerRadius=UDim.new(0,8)bc.Parent=b return b end
local eb,ec,cl=CB("Execute",0,Color3.fromRGB(50,200,50)),CB("Execute (FE)",160,Color3.fromRGB(50,150,255)),CB("Clear",320,Color3.fromRGB(200,50,50))

local sf=Instance.new("Frame")sf.Name="ScriptHub"sf.Size=UDim2.new(1,0,1,0)sf.BackgroundTransparency=1 sf.Visible=false sf.Parent=co
local sc=Instance.new("ScrollingFrame")sc.Size=UDim2.new(1,0,1,0)sc.BackgroundTransparency=1 sc.BorderSizePixel=0 sc.ScrollBarThickness=6 sc.Parent=sf
local ll=Instance.new("UIListLayout")ll.Padding=UDim.new(0,10)ll.Parent=sc

local function Card(sd)local cd=Instance.new("Frame")cd.Size=UDim2.new(1,-10,0,100)cd.BackgroundColor3=Color3.fromRGB(35,35,45)cd.BorderSizePixel=0 cd.Parent=sc
local cdc=Instance.new("UICorner")cdc.CornerRadius=UDim.new(0,10)cdc.Parent=cd
local av=Instance.new("ImageLabel")av.Size=UDim2.new(0,60,0,60)av.Position=UDim2.new(0,10,0,10)av.BackgroundColor3=Color3.fromRGB(50,50,60)av.BorderSizePixel=0 av.Image="rbxthumb://type=AvatarHeadShot&id="..sd.UserId.."&w=150&h=150"av.Parent=cd
local avc=Instance.new("UICorner")avc.CornerRadius=UDim.new(1,0)avc.Parent=av
local tit=Instance.new("TextLabel")tit.Size=UDim2.new(0,300,0,25)tit.Position=UDim2.new(0,80,0,10)tit.BackgroundTransparency=1 tit.Text=sd.Title tit.Font=Enum.Font.GothamBold tit.TextSize=16 tit.TextColor3=Color3.fromRGB(255,255,255)tit.TextXAlignment=Enum.TextXAlignment.Left tit.Parent=cd
local un=Instance.new("TextLabel")un.Size=UDim2.new(0,200,0,20)un.Position=UDim2.new(0,80,0,35)un.BackgroundTransparency=1 un.Text="by "..sd.Username un.Font=Enum.Font.Gotham un.TextSize=12 un.TextColor3=Color3.fromRGB(150,150,170)un.TextXAlignment=Enum.TextXAlignment.Left un.Parent=cd
local sta=Instance.new("TextLabel")sta.Size=UDim2.new(0,200,0,20)sta.Position=UDim2.new(0,80,0,55)sta.BackgroundTransparency=1 sta.Text=string.format("👍 %d  👎 %d  ▶ %d",sd.Upvotes,sd.Downvotes,sd.Executions)sta.Font=Enum.Font.Gotham sta.TextSize=11 sta.TextColor3=Color3.fromRGB(120,120,140)sta.TextXAlignment=Enum.TextXAlignment.Left sta.Parent=cd
local ex=Instance.new("TextButton")ex.Size=UDim2.new(0,100,0,30)ex.Position=UDim2.new(1,-110,0,35)ex.BackgroundColor3=Color3.fromRGB(50,200,50)ex.BorderSizePixel=0 ex.Text="Execute"ex.Font=Enum.Font.GothamBold ex.TextSize=13 ex.TextColor3=Color3.fromRGB(255,255,255)ex.Parent=cd
local exc=Instance.new("UICorner")exc.CornerRadius=UDim.new(0,8)exc.Parent=ex
ex.MouseButton1Click:Connect(function()cx.Text=sd.Code ef.Visible=true sf.Visible=false Rem.Exec:FireServer(sd.Code,sd.Id)end)end

local function Load()for _,c in pairs(sc:GetChildren())do if c:IsA("Frame")then c:Destroy()end end Rem.GetScr:FireServer()end
Rem.GetScr.OnClientEvent:Connect(function(scr)for _,c in pairs(sc:GetChildren())do if c:IsA("Frame")then c:Destroy()end end for _,s in ipairs(scr)do Card(s)end sc.CanvasSize=UDim2.new(0,0,0,ll.AbsoluteContentSize.Y+10)end)

local ct=ef
local function Switch(f)ct.Visible=false f.Visible=true ct=f end
et.MouseButton1Click:Connect(function()Switch(ef)end)
st.MouseButton1Click:Connect(function()Switch(sf)Load()end)

eb.MouseButton1Click:Connect(function()Rem.Exec:FireServer(cx.Text)end)
ec.MouseButton1Click:Connect(function()Rem.ExecCli:FireServer(cx.Text)end)
cl.MouseButton1Click:Connect(function()cx.Text=""end)
cb.MouseButton1Click:Connect(function()g:Destroy()end)

Rem.Exec.OnClientEvent:Connect(function(s,r)if s then print("✓ Success!")else warn("✗ Failed:\n"..tostring(r))end end)
Rem.ExecCli.OnClientEvent:Connect(function(c)local f,e=loadstring(c)if not f then warn("FE Error:",e)return end
local env={game=game,workspace=workspace,Players=game:GetService("Players"),LocalPlayer=p,player=p,owner=p,print=print,warn=warn,wait=task.wait,task=task,math=math,string=string,table=table,Vector3=Vector3,CFrame=CFrame,Color3=Color3,Instance=Instance,TweenService=T,UserInputService=U,require=require,loadstring=loadstring}
setfenv(f,env)local s,r=pcall(f)if s then print("✓ FE Success!")else warn("✗ FE Failed:",r)end end)

U.InputBegan:Connect(function(i,gp)if gp then return end if i.KeyCode==Enum.KeyCode.Insert then g.Enabled=not g.Enabled end end)

local dr,di,mp,fp=false
h.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dr=true mp=i.Position fp=m.Position i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then dr=false end end)end end)
U.InputChanged:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseMovement then di=i end end)
game:GetService("RunService").Heartbeat:Connect(function()if dr and di then local d=di.Position-mp m.Position=UDim2.new(fp.X.Scale,fp.X.Offset+d.X,fp.Y.Scale,fp.Y.Offset+d.Y)end end)

print("[LupSS] UI loaded! Press INSERT")
Load()]]end)end)

P.PlayerRemoving:Connect(function(p)CleanP(p)end)
for _,p in ipairs(P:GetPlayers())do InitP(p)end

print([[
════════════════════════════════════════════════════════
  ██╗     ██╗   ██╗██████╗ ███████╗███████╗
  ██║     ██║   ██║██╔══██╗██╔════╝██╔════╝
  ██║     ██║   ██║██████╔╝███████╗███████╗
  ██║     ██║   ██║██╔═══╝ ╚════██║╚════██║
  ███████╗╚██████╔╝██║     ███████║███████║
  ╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚══════╝
  
  Ultimate FE Executor + Script Hub v4.0
  
  ✓ Full FE Support        ✓ Script Hub
  ✓ Server Execution       ✓ User Avatars  
  ✓ Client Execution       ✓ Rating System
  ✓ Zero Restrictions      ✓ Studio-Only
  
  Press INSERT to toggle UI
════════════════════════════════════════════════════════
]])