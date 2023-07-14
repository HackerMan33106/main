local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Stardust Reborn", "RJTheme1")

--- 1 Section Teleporting
local Tab = Window:NewTab("Teleporting")
local Section = Tab:NewSection("Teleport")

-- Teleport to bosses
Section:NewDropdown("Teleport to bosses", "You teleport to the bosses.", {"DIO", "Diavolo"}, function(teleport)
    if teleport == "DIO" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive.DIO.HumanoidRootPart.CFrame
elseif teleport == "Diavolo" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive.Diavolo.HumanoidRootPart.CFrame
    end
end)

-- Teleport to NPC
Section:NewDropdown("Teleport to NPC", "You teleport to the NPC.", {"Enrico Pucci", "Jotaro", "VerifiedPixel", "Giorno Giovanna", "Becca", "TheForgotten0range", "k7rdan", "Sans"}, function(npc)
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
elseif npc == "Sans" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.Sans.HumanoidRootPart.CFrame
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
Section:NewTextBox("Teleport to players", "Enter a nickname for the person you want to teleport to. (If it doesn't teleport, you entered the wrong nickname.)", function(ply)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive[ply].HumanoidRootPart.CFrame
end)

--- 2 Section Bosses
local Tab = Window:NewTab("Bosses")
local Section = Tab:NewSection("Bosses management")

-- Instant kill bosses
Section:NewDropdown("Instant kill bosses", "You instantly kill bosses.", {"DIO", "Diavolo"}, function(kill)
    if kill == "DIO" then
        game:GetService("Workspace").Game.Alive.DIO.Humanoid.RigType = 1
        wait(1)
        game:GetService("Workspace").Game.Alive.DIO.Humanoid.RigType = 0
elseif kill == "Diavolo" then 
    game:GetService("Workspace").Game.Alive.Diavolo.Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Game.Alive.Diavolo.Humanoid.RigType = 0
    end
end)

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
    game.Players.LocalPlayer.Character.Torso.CanCollide = false
    if game.Players.LocalPlayer.Character.Torso == true then
        game.Players.LocalPlayer.Character.Head.CanCollide = false
        end
    end
end)

Section:NewButton("Noclip off", "You stop walking through walls, objects, etc.", function()
    game.Players.LocalPlayer.Character.Humanoid.RigType = 1
end)

-- Sit
Section:NewKeybind("Sit", "You sit down.", Enum.KeyCode.V, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true 
end)

--- 5 Section Credit
-- Credit
local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("By HackerMan")

Section:NewLabel("Made according to the Robojini guide")
Section:NewButton("His discord", "Click to copy the link.", function()
    setclipboard("https://discord.gg/E4BdnAXsuE")
end)