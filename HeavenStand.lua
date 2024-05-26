local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Heaven Stand", "RJTheme1")

--- 1 Section Teleporting
local Tab = Window:NewTab("Teleporting")
local Section = Tab:NewSection("Teleport")

-- Teleport to bosses
Section:NewDropdown("Teleport to bosses", "You teleport to the bosses.", {"DIO", "Silver Chariot Requiem", "Garou", "Asta", "Vergil", "Minos Prime", "Sakuya Izayoi", "Sisyphus Prime", "just a cosmic garou"}, function(teleport)
if teleport == "DIO" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.DIO.HumanoidRootPart.CFrame
elseif teleport == "Silver Chariot Requiem" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Silver Chariot Requiem"].HumanoidRootPart.CFrame
elseif teleport == "Garou" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.Garou.HumanoidRootPart.CFrame
elseif teleport == "Asta" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.Asta.HumanoidRootPart.CFrame
elseif teleport == "Vergil" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.Vergil.HumanoidRootPart.CFrame
elseif teleport == "Minos Prime" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Minos Prime"].HumanoidRootPart.CFrame
elseif teleport == "Sakuya Izayoi" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Sakuya Izayoi"].HumanoidRootPart.CFrame
elseif teleport == "Sisyphus Prime" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Sisyphus Prime"].HumanoidRootPart.CFrame
elseif teleport == "just a cosmic garou" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["just a cosmic garou"].HumanoidRootPart.CFrame
    end
end)

-- Teleport to NPC
Section:NewDropdown("Teleport to NPC", "You teleport to the NPC.", {"Shop", "Seller", "Pucci", "RaymondZl", "Boxing Master", "Gojo", "Toji", "Yuta"}, function(npc)
if npc == "Shop" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Shop.HumanoidRootPart.CFrame
elseif npc == "Seller" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Seller.HumanoidRootPart.CFrame
elseif npc == "Pucci" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Pucci.HumanoidRootPart.CFrame
elseif npc == "RaymondZl" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.RaymondZl.HumanoidRootPart.CFrame
elseif npc == "Boxing Master" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC["Boxing Master"].HumanoidRootPart.CFrame
elseif npc == "Gojo" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Gojo.HumanoidRootPart.CFrame
elseif npc == "Toji" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Toji.HumanoidRootPart.CFrame
elseif npc == "Yuta" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Yuta.HumanoidRootPart.CFrame
    end
end)

-- Teleport to dummy
Section:NewDropdown("Teleport to dummy", "You teleport to dummy.", {"Dummy", "300 Health Dummy", "Blocking dummy", "Attacking dummy", "Numbness dummy"}, function(dummy)
if dummy == "Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["just a dummy"].HumanoidRootPart.CFrame
elseif dummy == "300 Health Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["just a dummy but 300 hp"].HumanoidRootPart.CFrame
elseif dummy == "Blocking dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["just a dummy but death effect"].HumanoidRootPart.CFrame
elseif dummy == "Attacking dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["just a dummy but attack you"].HumanoidRootPart.CFrame
elseif dummy == "Numbness dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["just a dummy but infinity"].HumanoidRootPart.CFrame
    end
end)

-- Teleport to players
Section:NewTextBox("Teleport to players", "Enter nickname for teleport(wrong nickname, no teleport).", function(ply)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies[ply].HumanoidRootPart.CFrame or game:GetService("Workspace")[ply].HumanoidRootPart.CFrame
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 2 Section Bosses
local Tab = Window:NewTab("Bosses")
local Section = Tab:NewSection("Bosses management")

-- Boss slowdown
Section:NewDropdown("Boss slowdown", "You slow down bosses a lot.", {"DIO", "Silver Chariot Requiem", "Garou", "Asta", "Vergil", "Minos Prime", "Sakuya Izayoi", "Sisyphus Prime", "just a cosmic garou"}, function(slow)

if slow == "DIO" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies.DIO.Humanoid.WalkSpeed = 0
        end
elseif slow == "Silver Chariot Requiem" then 
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies["Silver Chariot Requiem"].Humanoid.WalkSpeed = 0
        end
elseif slow == "Garou" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies.Garou.Humanoid.WalkSpeed = 0
        end
elseif slow == "Asta" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies.Asta.Humanoid.WalkSpeed = 0
        end
elseif slow == "Vergil" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies.Vergil.Humanoid.WalkSpeed = 0
        end
elseif slow == "Minos Prime" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies["Minos Prime"].Humanoid.WalkSpeed = 0
        end
elseif slow == "Sakuya Izayoi" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies["Sakuya Izayoi"].Humanoid.WalkSpeed = 0
        end
 elseif slow == "Sisyphus Prime" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies["Sisyphus Prime"].Humanoid.WalkSpeed = 0
        end
elseif slow == "just a cosmic garou" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies["just a cosmic garou"].Humanoid.WalkSpeed = 0
        end
    end
end)

-- Instant kill bosses
Section:NewDropdown("Instant kill bosses", "You instantly kill bosses.", {"DIO", "Silver Chariot Requiem", "Garou", "Asta", "Vergil", "Minos Prime", "Sakuya Izayoi", "Sisyphus Prime", "just a cosmic garou"}, function(kill)
if kill == "DIO" then
        game:GetService("Workspace").Enemies.DIO.Humanoid.RigType = 1
        wait(1)
        game:GetService("Workspace").Enemies.DIO.Humanoid.RigType = 0
elseif kill == "Silver Chariot Requiem" then 
    game:GetService("Workspace").Enemies["Silver Chariot Requiem"].Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies["Silver Chariot Requiem"].Humanoid.RigType = 0
elseif kill == "Garou" then
    game:GetService("Workspace").Enemies.Garou.Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies.Garou.Humanoid.RigType = 0
elseif kill == "Asta" then 
    game:GetService("Workspace").Enemies.Asta.Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies.Asta.Humanoid.RigType = 0
elseif kill == "Vergil" then
    game:GetService("Workspace").Enemies.Vergil.Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies.Vergil.Humanoid.RigType = 0
elseif kill == "Minos Prime" then 
    game:GetService("Workspace").Enemies["Minos Prime"].Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies["Minos Prime"].Humanoid.RigType = 0
elseif kill == "Sakuya Izayoi" then
    game:GetService("Workspace").Enemies["Sakuya Izayoi"].Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies["Sakuya Izayoi"].Humanoid.RigType = 0
elseif kill == "Sisyphus Prime" then
    game:GetService("Workspace").Enemies["Sisyphus Prime"].Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies["Sisyphus Prime"].Humanoid.RigType = 0
elseif kill == "just a cosmic garou" then
    game:GetService("Workspace").Enemies["just a cosmic garou"].Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies["just a cosmic garou"].Humanoid.RigType = 0
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 3 Section Teleport to Items
local Tab = Window:NewTab("Teleporting to items")
local Section = Tab:NewSection("Teleport")

Section:NewLabel("Tip: Jump in front of the teleport.")

-- Teleport to box
Section:NewDropdown("Teleport to Box", "You teleport to the box.", {"Box 1", "Box 2", "Box 3", "Box 4", "Box 5", "Box 6"}, function(box)
if box == "Box 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.6195755, 2.29400635, 272.246124, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76.5198746, 2.29400635, 211.432983, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-119.116692, 2.29400635, -11.8983154, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76.1594696, 2.29400635, -150.602936, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-281.939026, 2.29400635, -6.23294067, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 6" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-404.760468, 2.29400635, 133.927063, 1, 0, 0, 0, -1, 0, 0, 0, -1)
    end
end)

-- Teleport to dualknife
Section:NewDropdown("Teleport to Dualknife", "You teleport to dualknife", {"Dualknife 1", "Dualknife 2", "Dualknife 3", "Dualknife 4", "Dualknife 5", "Dualknife 6"}, function(dualknife)
if dualknife == "Dualknife 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-348.159332, 0.967250109, -0.619232178, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-204.379089, 1.24286401, -96.7065887, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76.1492462, 0.967250109, -49.3597107, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-117.80365, 0.967250109, -205.215302, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(56.9712219, 0.967250109, -328.415527, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 6" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90.19207, 0.967250109, -243.308884, 0, 0, -1, -1, 0, 0, 0, 1, 0)
    end
end)

-- Teleport to green baby
Section:NewDropdown("Teleport to green baby", "You teleport to green baby.", {"Green baby 1", "Green baby 2", "Green baby 3"}, function(gb)
if gb == "Green baby 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90.19207, 0.967250109, -243.308884, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif gb == "Green baby 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-134.000931, 1.44551516, -191.255386, 0, 1, 0, 0, 0, -1, -1, 0, 0)
elseif gb == "Green baby 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-232.313889, 1.44551516, -4.18959045, 0, 1, 0, 0, 0, -1, -1, 0, 0)
    end
end)

-- Teleport to mini hakkero
Section:NewDropdown("Teleport to mini Hakkero", "You teleport to mini Hakkero.", {"Mini Hakkero 1", "Mini Hakkero 2", "Mini Hakkero 3", "Mini Hakkero 4", "Mini Hakkero 5"}, function(mh)
if mh == "Mini Hakkero 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(23.5779266, 1.27398145, 90.3544998, -1, 0, -0, 0, 0, -1, 0, -1, -0)
elseif mh == "Mini Hakkero 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-523.490234, 1.27398145, -277.166809, -1, 0, -0, 0, 0, -1, 0, -1, -0)
elseif mh == "Mini Hakkero 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-225.36087, 1.52194595, -24.3506012, -1, 0, -0, 0, 0, -1, 0, -1, -0)
elseif mh == "Mini Hakkero 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-580.705933, 1.27398145, -204.590973, -1, 0, -0, 0, 0, -1, 0, -1, -0)
elseif mh == "Mini Hakkero 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-52.7155457, 1.52194595, -88.0363083, -1, 0, -0, 0, 0, -1, 0, -1, -0)
    end
end)

-- Teleport to xsoul
Section:NewButton("Teleport to XSoul", "You teleport to XSoul.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Item_Spawnner"].XSoul.XSoul.CFrame
end)

-- Teleport to requiem arrow
Section:NewButton("Teleport to requiem arrow", "You teleport to the requiem arrow.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Item_Spawnner"]["Requiem Arrow"]["Requiem Arrow"].CFrame
end)

-- Teleport to watch
Section:NewButton("Teleport to watch", "You teleport to watch.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Item_Spawnner"].Watch.Watch.CFrame
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 4 Section Misc
local Tab = Window:NewTab("Misc")
local Section = Tab:NewSection("Misc")

-- Speed
Section:NewSlider("Speed", "You can control your speed.", 500, 16, function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end)

-- Jump
Section:NewSlider("Jump power", "You can control your jump power.", 500, 50, function(jump)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
end)

-- Hip Height
Section:NewSlider("Hip Height", "You can control your height.", 50, 0, function(height)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = height
end)

-- Gravity
Section:NewSlider("Gravity", "You can control your gravity.", -1000, 196.2, function(gravity)
    game:GetService("Workspace").Gravity = gravity
end)

-- Suicide
Section:NewButton("Kill yourself", "You are dying.", function()
    game.Players.LocalPlayer.Character.Humanoid.RigType = 1
    wait(1)
    game.Players.LocalPlayer.Character.Humanoid.RigType = 0
end)

-- Noclip on/off
Section:NewButton("Noclip on", "You can go through walls and the rest of it.", function()
    while game:GetService("RunService").RenderStepped:wait() do
        game.Players.LocalPlayer.Character.Head.CanCollide = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        game.Players.LocalPlayer.Character.Torso.CanCollide = false
end
end)

Section:NewButton("Noclip off", "You can no longer pass through walls and the rest.", function()
while game:GetService("RunService").RenderStepped:wait() do
    game.Players.LocalPlayer.Character.Head.CanCollide = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
    game.Players.LocalPlayer.Character.Torso.CanCollide = true
end
end)

-- ESP
Section:NewButton("ESP", "You can see the players through the wall.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/ESP/main/ESP.lua", true))()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 5 Section Settings
-- Settings
local Tab = Window:NewTab("Settings")
local Section = Tab:NewSection("Settings")

Section:NewButton("Turn off the rain", "You're turning off the rain for good.", function()
    game:GetService("Workspace").Effects.Weather:Destroy()
end)

Section:NewButton("Turning off the blinking light", "You turn off the blinking lights permanently.", function()
    game.Lighting.IMPACT1:Destroy()
    game.Lighting.IMPACT2:Destroy()
end)

Section:NewButton("Cloud removal", "You are permanently removing clouds.", function()
    game:GetService("Workspace").Terrain.Clouds:Destroy()
end)

Section:NewButton("Disabling screen shake", "You disable screen shake permanently.", function()
    game.Players.LocalPlayer.Settings["Camera Shake"].Value = false
    game.Players.LocalPlayer.Settings.CameraShake.Value = false
end)

Section:NewButton("Removing the pink effect", "You will remove the pink effect.", function()
    game.Lighting.ColorCorrection:Destroy()
end)

Section:NewButton("The inclusion of horribly bad graphics", "You're turning on permanently bad graphics.", function()
    game.Players.LocalPlayer.Settings["Camera Shake"].Value = false
    game.Players.LocalPlayer.Settings.CameraShake.Value = false
    game:GetService("Workspace").Effects:Destroy()
    game:GetService("Workspace").Terrain.Clouds:Destroy()
    game.Lighting.IMPACT1:Destroy()
    game.Lighting.IMPACT2:Destroy()
    game.Lighting.Atmosphere:Destroy()
    game.Lighting.Sky:Destroy()
    game.Lighting.GlobalShadows = false
    game.Players.LocalPlayer.Settings["Low Graphics"].Value = true
    game.Lighting.ColorCorrection:Destroy()
end)

Section:NewButton("Removing all effects", "You permanently remove all effects.", function()
    game:GetService("Workspace").Effects:Destroy()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 6 Section Fun
-- Fun
local Tab = Window:NewTab("Fun")
local Section = Tab:NewSection("Fun")

-- Undressing the players
Section:NewTextBox("Undressing the plr", "Enter nickname to undress(wrong nickname = no undressing).", function(utp)
    game:GetService("Workspace").Enemies[utp].Shirt:Destroy()
	game:GetService("Workspace").Enemies[utp].Pants:Destroy()
    game:GetService("Workspace").Enemies[utp]["Shirt Graphic"]:Destroy()
end)

-- Field Of Viev
Section:NewSlider("Field Of Viev", "You can control your field of viev.", 120, 1, function(fov)
    game:GetService("Workspace").Camera.FieldOfView = fov
end)

-- Default field of viev
Section:NewButton("Default field of viev", "You set Default field of view.", function()
    game:GetService("Workspace").Camera.FieldOfView = 70
end)

-- Player Info
Section:NewTextBox("Player Info", "Enter nickname for info(Incorrect nickname no info.).", function(pi)
    game:GetService("Workspace").NameValue:Destroy()
    local ws = game:GetService("Workspace")
    local vs = Instance.new("StringValue")
        vs.Name = "NameValue"
        vs.Value = pi
        vs.Parent = workspace
    wait(0.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/main/main/PlayerInfo.lua", true))()
end)

-- Sit
Section:NewKeybind("Sit", "You sit down.", Enum.KeyCode.V, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true 
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 7 Section Other scripts
-- Other scripts
local Tab = Window:NewTab("Other scripts")
local Section = Tab:NewSection("Scripts")

-- DarkDex
Section:NewDropdown("Selecting a version of DarkDex", "Several versions of DarkDex.", {"DarkDex V4", "DarkDex V3", "DarkDex V1.1.0 Alpha"}, function(dex)
    if dex == "DarkDex V4" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V4", true))()
    elseif dex == "DarkDex V3" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V3", true))()
    elseif dex == "DarkDex V1.1.0 Alpha" then
        loadstring(game:HttpGet("https://github.com/HackerMan33106/DarkDex/raw/main/DarkDex-V1.1.0%20Alpha", true))()
        end
    end)

-- Infinite Yeild
Section:NewButton("Inject Infinite Yeild", "You inject Infinite Yeild.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Infinite-yeild/main/Infiniteyeild.lua", true))()
end)

-- CMD-X
Section:NewButton("Inject CMD-X", "You inject CMD-X.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/CMD-X/main/CMD-X.lua", true))()
end)

-- Your script
Section:NewTextBox("Your script", "Paste the link to your script here.", function(uscript)
	loadstring(game:HttpGet(uscript, true))()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 8 Section Credit
-- Credit
local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("By HackerMan33105")

Section:NewLabel("Helped with ideas ---> rusterd")
Section:NewLabel("Made a GUI guide ---> Robojini")
Section:NewButton("This is Robojini's discord", "Click to copy the link.", function()
    setclipboard("https://discord.gg/E4BdnAXsuE")
end)
Section:NewButton("Here's Robojini's YouTube channel", "Click to copy the link.", function()
    setclipboard("https://www.youtube.com/@Robojini")
end)

local ws = game:GetService("Workspace")
local vs = Instance.new("StringValue")
    vs.Name = "NameValue"
    vs.Value = "Abobatest"
    vs.Parent = workspace
