local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Stardust Reborn", "RJTheme1")

--- 1 Section Teleporting
local Tab = Window:NewTab("Teleporting")
local Section = Tab:NewSection("Teleport")

-- Teleport to bosses
Section:NewDropdown("Teleport to bosses", "You teleport to the bosses.", {"DIO", "Diavolo", "Jotaro P3", "Chaka", "Goku"}, function(teleport)
if teleport == "DIO" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive.DIO.HumanoidRootPart.CFrame
elseif teleport == "Diavolo" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive.Diavolo.HumanoidRootPart.CFrame
elseif teleport == "Jotaro P3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Jotaro P3"].HumanoidRootPart.CFrame
elseif teleport == "Chaka" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive.Chaka.HumanoidRootPart.CFrame
elseif teleport == "Goku" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive.Goku.HumanoidRootPart.CFrame
    end
end)

-- Teleport to NPC
Section:NewDropdown("Teleport to NPC", "You teleport to the NPC.", {"Enrico Pucci", "Jotaro", "VerifiedPixel", "Giorno Giovanna", "Becca", "TheForgotten0range", "k7rdan", "Shadow DIO", "Goku"}, function(npc)
    if npc == "Enrico Pucci" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC["Enrico Pucci"].HumanoidRootPart.CFrame
elseif npc == "Jotaro" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.Jotaro.HumanoidRootPart.CFrame
elseif npc == "VerifiedPixel" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.VerifiedPixel.HumanoidRootPart.CFrame
elseif npc == "Giorno Giovanna" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC["Giorno Giovanna"].HumanoidRootPart.CFrame
elseif npc == "Becca" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.Becca.HumanoidRootPart.CFrame
elseif npc == "TheForgotten0range" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.TheForgotten0range.HumanoidRootPart.CFrame
elseif npc == "k7rdan" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.k7rdan.HumanoidRootPart.CFrame
elseif npc == "Shadow DIO" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC["Shadow DIO"].HumanoidRootPart.CFrame
elseif npc == "Goku" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.Goku.HumanoidRootPart.CFrame
    end
end)

-- Teleport to dummy
Section:NewDropdown("Teleport to dummy", "You teleport to dummy.", {"Immortal Dummy", "Mortal Dummy", "Block Dummy", "Perfect Block Dummy", "Deflect Dummy", "Barraging Dummy"}, function(dummy)
    if dummy == "Immortal Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Immortal Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Mortal Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Mortal Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Block Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Block Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Perfect Block Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Perfect Block Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Deflect Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Deflect Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Barraging Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Barraging Dummy"].HumanoidRootPart.CFrame
    end
end)

-- Teleport to players
Section:NewTextBox("Teleport to players", "Enter nickname for teleport(wrong nickname, no teleport).", function(ply)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive[ply].HumanoidRootPart.CFrame
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 2 Section Bosses
local Tab = Window:NewTab("Bosses")
local Section = Tab:NewSection("Bosses management")

-- Instant kill bosses
Section:NewDropdown("Instant kill bosses", "You instantly kill bosses.", {"DIO", "Diavolo", "Jotaro P3", "Chaka", "Goku"}, function(kill)
if kill == "DIO" then
        game:GetService("Workspace").Game.Alive.DIO.Humanoid.RigType = 1
        wait(1)
        game:GetService("Workspace").Game.Alive.DIO.Humanoid.RigType = 0
elseif kill == "Diavolo" then
    game:GetService("Workspace").Game.Alive.Diavolo.Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Game.Alive.Diavolo.Humanoid.RigType = 0
elseif kill == "Jotaro P3" then
    game:GetService("Workspace").Game.Alive["Jotaro P3"].Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Game.Alive["Jotaro P3"].Humanoid.RigType = 0
elseif kill == "Chaka" then
    game:GetService("Workspace").Game.Alive.Chaka.Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Game.Alive.Chaka.Humanoid.RigType = 0
elseif kill == "Goku" then
    game:GetService("Workspace").Game.Alive.Goku.Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Game.Alive.Goku.Humanoid.RigType = 0
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 3 Section Teleport to Items
local Tab = Window:NewTab("Teleporting to items")
local Section = Tab:NewSection("Teleport")

-- Teleport to arrow
Section:NewButton("Teleport to arrow", "You teleport to the arrow.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items.Arrow.Handle.CFrame
end)

-- Teleport to rokakaka
Section:NewButton("Teleport to rokakaka", "You teleport to rokakaka .", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items.Roka.Handle.CFrame
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 4 Section Misc
local Tab = Window:NewTab("Misc")
local Section = Tab:NewSection("Misc")

-- Speed
Section:NewSlider("Speed", "You can control your speed.", 500, 16, function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
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

--- 5 Section Fun
-- Fun
local Tab = Window:NewTab("Fun")
local Section = Tab:NewSection("Fun")

-- Undressing the players
Section:NewTextBox("Undressing the plr", "Enter nickname to undress(wrong nickname = no undressing).", function(utp)
    game:GetService("Workspace").Game.Alive[utp].Shirt:Destroy()
	game:GetService("Workspace").Game.Alive[utp].Pants:Destroy()
    game:GetService("Workspace").Game.Alive[utp]["Shirt Graphic"]:Destroy()
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

--- 6 Section Other scripts
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

-- Your script
Section:NewTextBox("Your script", "Paste the link to your script here.", function(uscript)
	loadstring(game:HttpGet(uscript, true))()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 7 Section Credit
-- Credit
local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("By HackerMan33105")

Section:NewLabel("Helped with script ChatGPT")
Section:NewLabel("Made according to the Robojini guide")
Section:NewButton("His discord", "Click to copy the link.", function()
    setclipboard("https://discord.gg/E4BdnAXsuE")
end)
