local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Heaven Stand", "RJTheme1")

--- 1 Section Teleporting
local Tab = Window:NewTab("Teleporting")
local Section = Tab:NewSection("Teleport")

-- Teleport to bosses
Section:NewDropdown("Teleport to bosses", "You teleport to the bosses.", {"DIO", "Silver Chariot Requiem", "Garou", "Asta", "Vergil", "Minos Prime", "Sakuya Izayoi", "just a cosmic garou"}, function(teleport)
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
elseif teleport == "just a cosmic garou" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["just a cosmic garou"].HumanoidRootPart.CFrame
    end
end)

-- Teleport to NPC
Section:NewDropdown("Teleport to NPC", "You teleport to the NPC.", {"Shop", "Seller", "Pucci", "RaymondZl", "Boxing Master", "Gojo", "Yukari Yakumo"}, function(npc)
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
elseif npc == "Yukari Yakumo" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC["Yukari Yakumo"].HumanoidRootPart
    end
end)

-- Teleport to dummy
Section:NewDropdown("Teleport to dummy", "You teleport to dummy.", {"250 Health Dummy", "Dummy", "Blocking dummy", "Attacking dummy"}, function(dummy)
if dummy == "250 Health Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["250 Health : S:Diavolo Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["S:Diavolo Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Blocking dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["S:Diavolo Blocking"].HumanoidRootPart.CFrame
elseif dummy == "Attacking dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["S:Diavolo Attacking"].HumanoidRootPart.CFrame
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
Section:NewDropdown("Boss slowdown", "You slow down bosses a lot.", {"DIO", "Silver Chariot Requiem", "Garou", "Asta", "Vergil", "Minos Prime", "Sakuya Izayoi", "just a cosmic garou"}, function(slow)

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
elseif slow == "just a cosmic garou" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies["just a cosmic garou"].Humanoid.WalkSpeed = 0
        end
    end
end)

-- Instant kill bosses
Section:NewDropdown("Instant kill bosses", "You instantly kill bosses.", {"DIO", "Silver Chariot Requiem", "Garou", "Asta", "Vergil", "Minos Prime", "Sakuya Izayoi", "just a cosmic garou"}, function(kill)
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
elseif kill == "just a cosmic garou" then
    game:GetService("Workspace").Enemies["just a cosmic garou"].Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies["just a cosmic garou"].Humanoid.RigType = 0
    end
end)

--- 3 Section Teleport to Items
local Tab = Window:NewTab("Teleporting to items")
local Section = Tab:NewSection("Teleport")

-- Teleport to box
Section:NewDropdown("Teleport to Box", "You teleport to the box.", {"Box 1", "Box 2", "Box 3", "Box 4", "Box 5"}, function(box)
if box == "Box 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(701.850891, 1599.30188, -386.067169, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(217.80011, 1673.31958, -892.313843, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(456.85672, 1599.09717, -281.288269, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(632.252747, 1599.09717, -196.558029, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(391.982361, 1599.30188, -499.327942, 1, 0, 0, 0, -1, 0, 0, 0, -1)
    end
end)

-- Teleport to dualknife
Section:NewDropdown("Teleport to Dualknife", "You teleport to dualknife", {"Dualknife 1", "Dualknife 2", "Dualknife 3", "Dualknife 4", "Dualknife 5", "Dualknife 6"}, function(dualknife)
if dualknife == "Dualknife 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16.04953, 1597.9751, -103.170341, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-32.1399307, 1598.19727, -377.57843, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(291.438049, 1597.9751, -500.350464, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(438.514832, 1597.77039, -370.383759, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.2018356, 1597.77039, -569.645508, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif dualknife == "Dualknife 6" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(173.073059, 1597.77063, 41.3297195, 0, 0, -1, -1, 0, 0, 0, 1, 0)
    end
end)

-- Teleport to green baby
Section:NewDropdown("Teleport to green baby", "You teleport to green baby.", {"Green baby 1", "Green baby 2", "Green baby 3"}, function(gb)
if gb == "Green baby 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(722.09491, 1598.3999, -305.857971, 0, 1, 0, 0, 0, -1, -1, 0, 0)
elseif gb == "Green baby 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(628.981262, 1598.39026, -379.190613, -0.15102005, 0.988530755, 4.24385071e-05, 4.24385071e-05, 4.94122505e-05, -1, -0.988530755, -0.15101999, -4.94718552e-05)
elseif gb == "Green baby 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(365.458984, 1598.81506, -231.175369, -0.15102005, 0.988530755, 4.24385071e-05, 4.24385071e-05, 4.94122505e-05, -1, -0.988530755, -0.15101999, -4.94718552e-05)
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

-- Uncombat
Section:NewButton("Uncombat", "Turns off combat.", function()
    game.Players.LocalPlayer.Character.Settings["In_Combat"].Value = false
end)

-- Suicide
Section:NewButton("Kill yourself", "You are dying.", function()
    game.Players.LocalPlayer.Character.Humanoid.RigType = 1
end)

-- Noclip
Section:NewButton("Noclip on", "You can walk through walls, objects, etc.", function()
        while game:GetService("RunService").RenderStepped:wait() do
            game.Players.LocalPlayer.Character.Head.CanCollide = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
            game.Players.LocalPlayer.Character.Torso.CanCollide = false
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

-- Death GUI destroy
Section:NewButton("Destroy death gui", "You destroy the death gui.", function()
    game:GetService("Workspace")["Workspace Assets"]["Death Camera"]:Destroy()
    game:GetService("StarterGui").Death:Destroy()
    game.Players.LocalPlayer.PlayerGui.Death:Destroy()
    game:GetService("ReplicatedStorage").Assets.GUI["Death Screen"]:Destroy()
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

-- Sit
Section:NewKeybind("Sit", "You sit down.", Enum.KeyCode.V, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true 
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 7 Section Other scripts
-- Other scripts
local Tab = Window:NewTab("Other scripts")
local Section = Tab:NewSection("Scripts")

-- DarkDex V4
Section:NewButton("Inject DarkDex V4", "You inject DarkDex V4.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
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

Section:NewLabel("Helped with ideas _trrrr")
Section:NewLabel("Helped with script ChatGPT")
Section:NewLabel("Made according to the Robojini guide")
Section:NewButton("His discord", "Click to copy the link.", function()
    setclipboard("https://discord.gg/E4BdnAXsuE")
end)
