local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Heaven Stand", "RJTheme3")

-- 1 Section Teleporting
local Tab = Window:NewTab("Teleporting")
local Section = Tab:NewSection("Teleport")

Section:NewDropdown("Teleport to bosses", "You teleport to the bosses.", {"Sakuya Izayoi", "DIO", "Silver Chariot Requiem", "Vergil", "Garou"}, function(teleport)
    if teleport == "Sakuya Izayoi" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Sakuya Izayoi"].HumanoidRootPart.CFrame
elseif teleport == "DIO" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.DIO.HumanoidRootPart.CFrame
elseif teleport == "Silver Chariot Requiem" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Silver Chariot Requiem"].HumanoidRootPart.CFrame
elseif teleport == "Vergil" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.Vergil.HumanoidRootPart.CFrame
elseif teleport == "Garou" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.Garou.HumanoidRootPart.CFrame
end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2 Section Slow Boss
local Tab = Window:NewTab("Slow Boss")
local Section = Tab:NewSection("Slow Boss")

Section:NewDropdown("Boss slowdown", "You slow down bosses a lot.", {"Sakuya Izayoi", "DIO", "Silver Chariot Requiem", "Vergil", "Garou"}, function(slow)
    if slow == "Sakuya Izayoi" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies["Sakuya Izayoi"].Humanoid.WalkSpeed = 0
        end
elseif slow == "DIO" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies.DIO.Humanoid.WalkSpeed = 0
        end
elseif slow == "Silver Chariot Requiem" then 
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies["Silver Chariot Requiem"].Humanoid.WalkSpeed = 0
        end
elseif slow == "Vergil" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies.Vergil.Humanoid.WalkSpeed = 0
        end
elseif slow == "Garou" then
        while game:GetService("RunService").RenderStepped:wait() do
            game:GetService("Workspace").Enemies.Garou.Humanoid.WalkSpeed = 0
        end
end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3 Section Teleport to Box
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
Section:NewDropdown("Teleport to blindfold", "You teleport to blindfold", {"Blindfold 1", "Blindfold 2", "Blindfold 3", "Blindfold 4"}, function(blindfold)
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

-- 4 Section Misc
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

-- Sit
Section:NewKeybind("Sit", "You sit down.", Enum.KeyCode.X, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true 
end)
