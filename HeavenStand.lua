local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Heaven Stand", "RJTheme1")

--- 1 Section Teleporting
-- Teleport to bosses
local Tab = Window:NewTab("Teleporting")
local Section = Tab:NewSection("Teleport")

Section:NewDropdown("Teleport to bosses", "You teleport to the bosses.", {"DIO", "Silver Chariot Requiem", "Garou"}, function(teleport)
    if teleport == "DIO" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.DIO.HumanoidRootPart.CFrame
elseif teleport == "Silver Chariot Requiem" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Silver Chariot Requiem"].HumanoidRootPart.CFrame
elseif teleport == "Garou" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.Garou.HumanoidRootPart.CFrame
    end
end)

-- Teleport to NPC
Section:NewDropdown("Teleport to NPC", "You teleport to the NPC.", {"Shop", "Seller", "Pucci", "RaymondZl", "Genos", "Inosuke"}, function(npc)
    if npc == "Shop" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Shop.HumanoidRootPart.CFrame
elseif npc == "Seller" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Seller.HumanoidRootPart.CFrame
elseif npc == "Pucci" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Pucci.HumanoidRootPart.CFrame
elseif npc == "RaymondZl" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.RaymondZl.HumanoidRootPart.CFrame
elseif npc == "Genos" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Genos.HumanoidRootPart.CFrame
elseif npc == "Inosuke" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPC.Inosuke.HumanoidRootPart.CFrame
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
Section:NewTextBox("Teleport to players", "Enter a nickname for the person you want to teleport to. (If it doesn't teleport, you entered the wrong nickname.)", function(ply)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies[ply].HumanoidRootPart.CFrame
    if not ply then
        paint("Player is not find.")
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 2 Section Bosses
-- Slow Bosses
local Tab = Window:NewTab("Bosses")
local Section = Tab:NewSection("Bosses")

Section:NewDropdown("Boss slowdown", "You slow down bosses a lot.", {"DIO", "Silver Chariot Requiem", "Garou"}, function(slow)

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
end
end)

-- Instant kill bosses
Section:NewDropdown("Instant kill bosses", "You instantly kill bosses.", {"DIO", "Silver Chariot Requiem", "Garou"}, function(kill)
    if kill == "DIO" then
        game:GetService("Workspace").Enemies["250 Health : S:Diavolo Dummy"].Humanoid.RigType = 1
        wait(1)
        game:GetService("Workspace").Enemies["250 Health : S:Diavolo Dummy"].Humanoid.RigType = 0
elseif kill == "Silver Chariot Requiem" then 
    game:GetService("Workspace").Enemies["Silver Chariot Requiem"].Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies["Silver Chariot Requiem"].Humanoid.RigType = 0
elseif kill == "Garou" then
    game:GetService("Workspace").Enemies.Garou.Humanoid.RigType = 1
    wait(1)
    game:GetService("Workspace").Enemies.Garou.Humanoid.RigType = 0
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 3 Section Teleport to Box
local Tab = Window:NewTab("Teleporting to items")
local Section = Tab:NewSection("Teleport")

-- Box
Section:NewDropdown("Teleport to Box", "You teleport to the box.", {"Box 1", "Box 2", "Box 3", "Box 4", "Box 5", "Box 6"}, function(box)
    if box == "Box 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(252.181274, 792.200134, -911.60022, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(448.601593, 792.274414, -988.935547, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(526.20752, 792.279419, -242.273483, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(312.261688, 792.279419, -754.043213, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(416.404785, 792.279419, -644.913269, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Box 6" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(290.041901, 792.279419, -224.886932, 1, 0, 0, 0, -1, 0, 0, 0, -1)
end
end)

-- Blindfold
Section:NewDropdown("Teleport to Blindfold", "You teleport to blindfold", {"Blindfold 1", "Blindfold 2", "Blindfold 3", "Blindfold 4"}, function(blindfold)
    if blindfold == "Blindfold 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(424.152283, 791.303406, -810.273315, 0, 0, -1, 0, 1, 0, 1, 0, 0)
elseif blindfold == "Blindfold 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(122.364876, 792.148987, -359.520874, 0, 0, 1, 0, 1, -0, -1, 0, 0)
elseif blindfold == "Blindfold 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(18.4519958, 792.148987, 95.1386795, 1, 0, 0, 0, 1, 0, 0, 0, 1)
elseif blindfold == "Blindfold 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(496.809113, 785.683655, 393.475372, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end
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
local Head = game.Players.LocalPlayer.Character.Head
local Torso = game.Players.LocalPlayer.Character.Torso
local LeftArm = game.Players.LocalPlayer.Character["Left Arm"]
local RightArm = game.Players.LocalPlayer.Character["Right Arm"]
local LeftLeg = game.Players.LocalPlayer.Character["Left Leg"]
local RightLeg = game.Players.LocalPlayer.Character["Right Leg"]
local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

Section:NewToggle("Noclip", "You can walk through walls, objects, etc.", function(noclip)
    if noclip then
        Head.CanCollide = false
        Torso.CanCollide = false
        LeftArm.CanCollide = false
        RightArm.CanCollide = false
        LeftLeg.CanCollide = false
        RightLeg.CanCollide = false
        HRP.CanCollide = false
    else
        Head.CanCollide = true
        Torso.CanCollide = true
        LeftArm.CanCollide = true
        RightArm.CanCollide = true
        LeftLeg.CanCollide = true
        RightLeg.CanCollide = true
        HRP.CanCollide = true
    end
end)

-- Sit
Section:NewKeybind("Sit", "You sit down.", Enum.KeyCode.V, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true 
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 5 Section Credit
-- Credit
local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("By HackerMan")

Section:NewLabel("Helped with ideas _trrrr")
Section:NewLabel("Made according to the Robojini guide")
Section:NewButton("His discord", "Click to copy the link.", function()
    setclipboard("https://discord.gg/E4BdnAXsuE")
end)
