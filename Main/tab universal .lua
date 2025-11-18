local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ADZZ HUB",
   Icon = activity, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "ADZZ HUB LOADING",
   LoadingSubtitle = " ADZ",
   ShowText = "ADZZ HUB", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Light", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = ADZZ, -- Create a custom folder for your hub/game
      FileName = "ADZZ Hub"
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "ADZZ HUB KEY",
      Subtitle = "ADZZ KEY SYSTEM",
      Note = "N", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"121212"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})