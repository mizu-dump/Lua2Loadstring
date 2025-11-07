
loadstring([[ 
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- MAIN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SuperGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 655, 0, 690)
Frame.Position = UDim2.new(0.5, -300, 0.5, -225)
Frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
Frame.BorderColor3 = Color3.fromRGB(0,130,255)
Frame.BorderSizePixel = 4
Frame.Active = true
Frame.Draggable = true
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,50)
Title.BackgroundTransparency = 0
Title.BackgroundColor3 = Color3.fromRGB(0,0,0)
Title.BorderColor3 = Color3.fromRGB(0,130,255)
Title.BorderSizePixel = 5
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Text = "1durss f3x gui"
Title.Font = Enum.Font.Code
Title.TextScaled = true
Title.Parent = Frame

-- SCROLLING FRAME
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1,-30,1,-50)
ScrollingFrame.Position = UDim2.new(0,10,0,60)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0,20)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame

Instance.new("UIPadding",ScrollingFrame).PaddingTop = UDim.new(-0,8)

local function updateCanvas()
    ScrollingFrame.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
end

-- BUTTON CREATION
local function createButton(name,callback,parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,85,0,40)
    btn.Position = UDim2.new(0,15,0,0)
    btn.BackgroundColor3 = Color3.fromRGB(0,0,0)
    btn.BorderColor3 = Color3.fromRGB(0,130,255)
    btn.BorderSizePixel = 1.5
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.Arial
    btn.TextScaled = true
    btn.Text = name
    btn.Parent = parent
    btn.MouseButton1Click:Connect(callback)
end

local function createHeader(text)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1,0,0,50) 
    lbl.BackgroundColor3 = Color3.fromRGB(0,0,0) 
    lbl.BackgroundTransparency = 0
    lbl.BorderColor3 = Color3.fromRGB(0,130,255)
    lbl.BorderSizePixel = 4
    lbl.TextColor3 = Color3.fromRGB(255,255,255)
    lbl.Font = Enum.Font.Code
    lbl.TextScaled = true
    lbl.Text = text
    lbl.Parent = ScrollingFrame
end

-- CHAT HELPER
local function forceChat(msg)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TextChatService = game:GetService("TextChatService")
    if TextChatService and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local general = TextChatService:FindFirstChild("TextChannels") and TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        if general then general:SendAsync(msg) return end
    end
    local events = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if events then
        local say = events:FindFirstChild("SayMessageRequest")
        if say then say:FireServer(msg,"All") end
    end
end

-- FE3 FUNCTIONS
local function getTool()
    for _,v in Player:GetDescendants() do
        if v.Name=="SyncAPI" then return v.Parent end
    end
    for _,v in game.ReplicatedStorage:GetDescendants() do
        if v.Name=="SyncAPI" then return v.Parent end
    end
    return nil
end

local function getRemote()
    local t = getTool()
    if t and t:FindFirstChild("SyncAPI") then return t.SyncAPI.ServerEndpoint end
    return nil
end

local function invoke(args)
    local remote = getRemote()
    if remote then remote:InvokeServer(unpack(args)) end
end

local function CreatePart(cf,parent) invoke({"CreatePart","Normal",cf,parent}) end
local function SetName(p,s) invoke({"SetName",{p},s}) end
local function AddMesh(p) invoke({"CreateMeshes",{{Part=p}}}) end
local function SetMesh(p,id) invoke({"SyncMesh",{{Part=p,MeshId="rbxassetid://"..id}}}) end
local function SetTexture(p,id) invoke({"SyncMesh",{{Part=p,TextureId="rbxassetid://"..id}}}) end
local function MeshResize(p,size) invoke({"SyncMesh",{{Part=p,Scale=size}}}) end
local function SetLocked(p,b) invoke({"SetLocked",{p},b}) end
local function SpawnDecal(p,face) invoke({"CreateTextures",{{Part=p,Face=face,TextureType="Decal"}}}) end
local function AddDecal(p,id,face) invoke({"SyncTexture",{{Part=p,Face=face,TextureType="Decal",Texture="rbxassetid://"..id}}}) end

-- SKYBOX FUNCTION
local function Sky(id)
    local char = Player.Character or Player.CharacterAdded:Wait()
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    for _,d in ipairs(char:GetDescendants()) do
        if d:IsA("SpecialMesh") and d.MeshId == "rbxassetid://111891702759441" then d:Destroy() end
    end
    local targetPos = root.Position + Vector3.new(0,60,0)
    local before = {}
    for _,bp in ipairs(workspace:GetDescendants()) do
        if bp:IsA("BasePart") then before[bp] = true end
    end
    CreatePart(CFrame.new(targetPos), workspace)
    task.wait(0.1)
    local skyPart
    for _,bp in ipairs(workspace:GetDescendants()) do
        if bp:IsA("BasePart") and not before[bp] then
            if (bp.Position - targetPos).Magnitude < 8 then skyPart = bp break end
        end
    end
    if not skyPart then return end
    skyPart.Anchored = true
    skyPart.CanCollide = false
    skyPart.Massless = true
    skyPart.Transparency = 1
    SetName(skyPart,"Skybox")
    AddMesh(skyPart)
    SetMesh(skyPart,"111891702759441")
    SetTexture(skyPart,id)
    MeshResize(skyPart,Vector3.new(20000,20000,20000))
    SetLocked(skyPart,true)
    skyPart.Transparency = 0
end

local function spam(id)
    local parts = {}
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            table.insert(parts, part)
        end
    end

    local batchSize = 30 -- moderate batch size for speed
    local delay = 0.02   -- tiny delay to reduce lag

    task.spawn(function()
        for i = 1, #parts, batchSize do
            for j = i, math.min(i + batchSize - 1, #parts) do
                local p = parts[j]
                SetLocked(p, false)
                for _, face in ipairs(Enum.NormalId:GetEnumItems()) do
                    SpawnDecal(p, face)
                    AddDecal(p, id, face)
                end
                SetLocked(p, true)
            end
            task.wait(delay) -- small delay prevents freezing
        end
    end)
end
                    

-- BTOOLS MONITORING
local btoolsAvailable = false
Player.Backpack.ChildAdded:Connect(function(child)
    if child.Name=="SyncAPI" then btoolsAvailable = true end
end)
Player.Character.ChildAdded:Connect(function(child)
    if child.Name=="SyncAPI" then btoolsAvailable = true end
end)
btoolsAvailable = getTool() ~= nil

local function waitForTool(timeout)
    local t = 0
    local tool = getTool()
    while not tool and t < (timeout or 10) do
        task.wait(0.1)
        t += 0.1
        tool = getTool()
    end
    return tool
end

-- TOP BUTTON
createButton("Get F3X",function()
    forceChat("/e ;btools")
    btoolsAvailable = getTool() ~= nil
end, ScrollingFrame)

-- SECTION FUNCTION
local function createSection(title, items)
    createHeader(title)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.Size = UDim2.new(1,0,0,50)
    sectionFrame.Position = UDim2.new(0,15,0,0)
    sectionFrame.BackgroundTransparency = 1
    sectionFrame.Parent = ScrollingFrame

    local grid = Instance.new("UIGridLayout")
    grid.CellSize = UDim2.new(0,85,0,40)
    grid.FillDirection = Enum.FillDirection.Horizontal
    grid.SortOrder = Enum.SortOrder.LayoutOrder
    grid.CellPadding = UDim2.new(0,4.5,0,4.5)
    grid.Parent = sectionFrame

    for name, data in pairs(items) do
        if type(data) == "table" then
            createButton(name,function()
                forceChat("/e ;music "..data[1].." ;pitch "..data[2].." ;volume 10")
            end, sectionFrame)
        else
            createButton(name,function()
                if waitForTool(10) then
                    if title:find("SKYBOX") then
                        Sky(data)
                    else
                        spam(data)
                    end
                else
                    forceChat("/e ;alert hit btools first")
                end
            end, sectionFrame)
        end
    end

    -- Adjust frame size to fit all buttons
    task.spawn(function()
        task.wait(0.05)
        sectionFrame.Size = UDim2.new(1,0,0,grid.AbsoluteContentSize.Y)
        updateCanvas()
    end)
end

-- SKYBOXES
local skyboxIDs = { 
    ["Hackers skybox"]="125187203022244",
    ["Blue2Spooky sky"]="120399026975934",
    ["Collad For skybox"]="94813634951114",
    ["Diney skyboxes"]="124262327975082",
    ["K00pidd sky"]="77002436311560",
    ["K00PK2 sky"]="100241243385132",
    ["C0ikaz skybox"]="103141150354227",
    ["S00plkidd sky"]="87318640912201",
    ["Collab 1x9x8x7x6xC sky"]="117335754907635", 
    ["Wait Collab skybox"]="113655603110873", 
    ["Team good sky"]="136146134122120", 
    ["K00pidd 2 Skylar"]="127544567870383",
    ["R0X1O01 skybox"]="111198068025077", 
    ["Z00gkidd sky"]="112349002151481", 
    ["T00kshaf1y skybox"]="83941932239085", 
    ["Lnicky skybox"]="128478908602974",
    ["Lnicky 2 skybox"]="84898241912780",
    ["Lnicky 3 Sky"]="115953727216627",
    ["LnickyThe sky"]="77053619446045",
    ["K0rtexX01 skybox"]="117713273366913", 
    ["C1xO sky"]="94762118132739", 
    ["Ac1d skybox"]="100336557694812", 
    ["Haxxer sky"]="116394296618826",
    ["Haxxer 2 skybox"]="97364444780318",
    ["zPgkidds sky"]="112118355683070", 
    ["Protokidd skybox"]="110507052307515", 
    ["Protokidd 2 skybox"]="118415345581884", 
    ["C00kiddCk4 skybox"]="123542305450020", 
    ["Ck4 skybox"]="120869173554798", 
    ["F3x good skybox"]="84373210313145", 
    ["1x1x1x1xC Collab sky"]="136324999493105",
    ["1x9x8x7 Cand 1x9x6x3 C"]="93392218949232",
    ["Herckidd Teman"]="131529695732032",
    ["aw3s0m3guy911 Teman"]="70897706144484",
    ["SHD0K1DD skybox"]="91848616978884",
    ["Swordhaxxor sky"]="126412920617610",
    ["N0wkidd skybox"]="88756569179017",
    ["LnickyTheHacker sky"]="108723411070734",
    ["loadstring skybox"]="88993029145272",
    ["Trollge skybox"]="71949294283169",
    ["Mario 666 spooky skt"]="129137252595113",
    ["red sky"]="118054717296250",
    ["A rest sky"]="78451062904863",
    ["Skybox"]="109715390907066",
    ["Skybox 2"]="70864891993186",
    ["Exploiters F3X sky"]="123115386803755", 
    ["Exploiters F3X 2 skybox"]="102592992248155", 
    ["Exploiters F3X 3 skybox"]="71290321490933",
}
createSection("SKYBOXERZZ!", skyboxIDs)

-- DECALS
local decalIDs = {
    ["Hackers Decal"]="125187203022244",
    ["Blue2Spooky Decal"]="120399026975934",
    ["Collad For Decal"]="94813634951114",
    ["Diney Decal"]="124262327975082",
    ["K00pidd Decal"]="77002436311560",
    ["K00PK2 Decal"]="100241243385132",
    ["C0ikaz Decal"]="103141150354227",
    ["S00plkidds Decal"]="87318640912201",
    ["Collab 1x9x8x7x6xC Dec"]="117335754907635", 
    ["Wait Collab Decal"]="113655603110873", 
    ["Team good Decal"]="136146134122120", 
    ["K00pidd 2 Decal"]="127544567870383",
    ["R0X1O01 Decal"]="111198068025077", 
    ["Z00gkidd Decal"]="112349002151481", 
    ["T00kshaf1y Decal"]="83941932239085", 
    ["Lnicky Decal"]="128478908602974",
    ["Lnicky 2 Decal"]="84898241912780",
    ["Lnicky 3 Decal"]="115953727216627",
    ["LnickyThe Decal"]="131820886033217",
    ["K0rtexX01 Decal"]="77053619446045", 
    ["C1xO Decal"]="94762118132739", 
    ["Ac1d Decal"]="100336557694812", 
    ["Haxxer Decal"]="116394296618826",
    ["Haxxer 2 Decal"]="97364444780318",
    ["zPgkidds Decal"]="112118355683070", 
    ["Protokidd Decal"]="110507052307515", 
    ["Protokidd 2 Decal"]="118415345581884", 
    ["C00kiddCk4 Decal"]="123542305450020", 
    ["Ck4 Decal"]="120869173554798", 
    ["F3x good Decal"]="84373210313145", 
    ["1x1x1x1xC Collab Decal"]="136324999493105",
    ["1x9x8x7 Cand 1x9x6x3 C"]="93392218949232",
    ["Herckidd Teman"]="131529695732032",
    ["aw3s0m3guy911 Teman"]="70897706144484",
    ["SHD0K1DD Decal"]="91848616978884",
    ["Swordhaxxor Dec"]="126412920617610",
    ["N0wkidd Decal"]="88756569179017",
    ["LnickyTheHacker Dec"]="108723411070734",
    ["loadstring Decal"]="88993029145272",
    ["Trollge Decal"]="71949294283169",
    ["Mario 666 spooky Dec"]="129137252595113",
    ["Red Decal"]="118054717296250",
    ["A rest Decal"]="78451062904863",
    ["Decal"]="109715390907066",
    ["Decal 2"]="70864891993186",
    ["Exploiters F3X Decal"]="123115386803755", 
    ["Exploiters F3X 2 Dec"]="102592992248155", 
    ["Exploiters F3X 3 Dec"]="71290321490933",
}
createSection("SHIT ONLY MAP", decalIDs)

-- MUSIC
local musicData = {
    ["B2Pistolz"]={"99993460719133",0.2},
    ["Elevator"]={"73835470482241",0.28},
    ["epix sax"]={"80515722989681",0.22},
    ["flip flap"]={"87911918307772",0.1},
    ["Eminem"]={"82177193637774",0.105},
    ["trollroast"]={"102687438407332",0.08},
    ["notorious kfc"]={"73220012904899",0.1},
    ["dave the cringelord"]={"126582829334710",0.1},
    ["LazyTown"]={"106687731139619",0.118},
    ["eminem 2"]={"107997455941110",0.1},
    ["shiawase"]={"5409360995",1},
    ["moms car"]={"5410255602",1},
    ["friday the 13th"]={"931382811",1},
    ["every end"]={"107057266766632",0.1},
    ["skoop lap"]={"93750619424961",0.1},
    ["666 fanmade"]={"100902363388706",0.1},
    ["piraten"]={"73002098096282",0.1},
    ["shed laugh remix"]={"78154888193339",0.4},
    ["shed laugh"]={"101389433601746",1},
    ["username 666"]={"94472355031298",0.14},
    ["Username 666"]={"3245582536",1},
    ["mr krabs bol"]={"83197094750741",0.1},
    ["Mexican"]={"75114960938580",0.1},
    ["JJ fad"]={"135835517068588",0.1},
    ["Meet Yo Maker"]={"89740490855607",0.1},
    ["My salsa"]={"119840238198839",0.1},
    ["hitler sparta remix"]={"119427795491464",0.1}
}
createSection("MOOSIC", musicData)

-- GEARS
local gearData = {
    ["R6, CLICK BEFORE USING GEARS"]="r6",
    ["subspace tripmine"]="11999247",
    ["periastron blacklist"]="85693489445825",
    ["time stopppperrz"]="71037101",
    ["periastron 2"]="120307951",
    ["dance potion"]="27858062",
    ["GUN, shoot skids with it"]="97885508",
    ["SKELETONSSSZ"]="95951330",
    ["zomboz"]="26421972",
    ["FAME POTIOOON"]="124126528",
    ["hyperlaser"]="130113146",
    ["vampire sword"]="94794847",
    ["bear spawner"]="90718350",
    ["WHALE SPAWN"]="188643628"
}

createHeader("GEARRSZ")
local gearFrame = Instance.new("Frame")
gearFrame.Size = UDim2.new(1,0,0,50)
gearFrame.Position = UDim2.new(0,15,0,0)
gearFrame.BackgroundTransparency = 1
gearFrame.Parent = ScrollingFrame

local grid2 = Instance.new("UIGridLayout")
grid2.CellSize = UDim2.new(0,85,0,40)
grid2.FillDirection = Enum.FillDirection.Horizontal
grid2.SortOrder = Enum.SortOrder.LayoutOrder
grid2.CellPadding = UDim2.new(0,4.5,0,4.5)
grid2.Parent = gearFrame

for name,id in pairs(gearData) do
    createButton(name,function()
        if id == "r6" then
            forceChat("/e ;r6")
        else
            forceChat("/e ;gear me "..id)
        end
    end, gearFrame)
end
task.spawn(function()
    task.wait(0.05)
    gearFrame.Size = UDim2.new(1,0,0,grid.AbsoluteContentSize.Y)
    updateCanvas()
end)

-- FINALIZE
updateCanvas()
]])()