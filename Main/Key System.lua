---GALAXY'S HUB KEY SYSTEM---

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))() --Script For The Windows To Work 
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))() --Add-ons
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()--Add-ons
local Player = game.Players.LocalPlayer --Gets The Player

local Window = Fluent:CreateWindow({
    Title = "Galaxy's Hub Key System" .. Fluent.Version, 
    SubTitle = "by Galaxy",
    TabWidth = 160, --Size Of The Tab
    Size = UDim2.fromOffset(580, 460), --Size Of The Windows
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark", --Theme
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
}) -- Creates Windows

function MakeScriptHub() 
  loadstring(game:HttpGet("https://pastebin.com/raw/U83YAwAa"))() --Put Your Script
end

--Fluent provides Lucide Icons https://lucide.dev/icons/ f00or the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
} --Add Tabs

local Options = Fluent.Options --???

do

Fluent:Notify({
        Title = "Logged In!",
        Content = "Successfully Loaded Pls Enter The Key"..Player.Name..".",
        Duration = 1 -- Set to nil to make the notification not disappear
    }) --Notification

getgenv().Key = "KJ ARENA!" --Put Your Password
getgenv().KeyInput = "string" --???

    Tabs.Main:AddParagraph({
        Title = " Galaxy's Hub Key System",
        Content = "Key in discord (TYPE IN BROWSER (or chat) IF MOBILE): https://discord.gg/RVuFNJSJGj "
    }) --Paragraph You Can Remove This

local Input = Tabs.Main:AddInput("Input", {
        Title = "Type Key",
        Default = "",
        Placeholder = "Put your dc Key here",
        Numeric = false, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(txt)
            getgenv().KeyInput = txt
        end
    }) --Textbox/This Is Where  to Put The key



    Tabs.Main:AddButton({
        Title = "Check Key",
        Description = "Checks The Key",
        Callback = function()
            Window:Dialog({
                Title = "Key",
                Content = "you CONFIRM this is the key?",
                Buttons = {
                    {
                        Title = "Confirm?",
                        Callback = function()
                        
                                    if getgenv().KeyInput == getgenv().Key then
                                    
                                    Fluent:Notify({
    Title = "Checking Key",
    Content = "Please Wait",
    Duration = 3
})
wait(3)
Fluent:Notify({
    Title = "Correct Key",
    Content = "Loading!",
    Duration = 2
})
wait(2)
Fluent:Destroy()
wait(1)
MakeScriptHub()

else
                            Fluent:Notify({
    Title = "Checking Key",
    Content = "Please Wait",
    Duration = 1
})
wait(1)
Fluent:Notify({
    Title = "Incorrect Key",
    Content = "Please Get Key The Key.",
    Duration = 2
})
                        end
                                end

                    },
                    {
                        Title = "No (Cancel)",
                        Callback = function()

                        end
                    }
                }
            })
        end
    })--Checks The Key




    -- Addons:
    -- SaveManager (Allows you to have a configuration system)
    -- InterfaceManager (Allows you to have a interface managment system)

    -- Hand the library over to our managers
    SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)

    -- Ignore keys that are used by ThemeManager.
    -- (we dont want configs to save themes, do we?)
    SaveManager:IgnoreThemeSettings()

    -- You can add indexes of elements the save manager should ignore
    SaveManager:SetIgnoreIndexes({})

    -- use case for doing it this way:
    -- a script hub could have themes in a global folder
    -- and game configs in a separate folder per game
    InterfaceManager:SetFolder("FluentScriptHub")
    SaveManager:SetFolder("FluentScriptHub/specific-game")

    InterfaceManager:BuildInterfaceSection(Tabs.Settings)
    SaveManager:BuildConfigSection(Tabs.Settings)


    Window:SelectTab(1)

    Fluent:Notify({
        Title = "Fluent",
        Content = "The script has been loaded.",
        Duration = 8
    })

    -- You can use the SaveManager:LoadAutoloadConfig() to load a config
    -- which has been marked to be one that auto loads!
    SaveManager:LoadAutoloadConfig()
end