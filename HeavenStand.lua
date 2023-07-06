local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Heaven Stand", "RJTheme3")

-- 1 Section Teleporting
local Tab = Window:NewTab("Teleporting")
local Section = Tab:NewSection("Teleport")

-- Teleport to Sakuya Izayoi
Section:NewButton("Teleport to Sakuya Izayoi", "You teleport to Sakuya Izayoi.", function ()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Sakuya Izayoi"].HumanoidRootPart.CFrame
end)

-- Teleport to DIO
Section:NewButton("Teleport to DIO", "You teleport to DIO.", function ()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.DIO.HumanoidRootPart.CFrame
end)

-- Teleport to Silver Chariot Requiem
Section:NewButton("Teleport to Silver Chariot Requiem", "You teleport to Silver Chariot Requiem.", function ()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Silver Chariot Requiem"].HumanoidRootPart.CFrame
end)

-- Teleport to Vergil
Section:NewButton("Teleport to Vergil", "You teleport to Vergil.", function ()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.Vergil.HumanoidRootPart.CFrame
end)

-- Teleport to Garou
Section:NewButton("Teleport to Garou", "You teleport to Garou.", function ()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies.Garou.HumanoidRootPart.CFrame
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2 Section Slow Boss
local Tab = Window:NewTab("Slow Boss")
local Section = Tab:NewSection("Slow Boss")

-- Sakuya Izayoi


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3 Section Misc
local Tab = Window:NewTab("Misc")
local Section = Tab:NewSection("Misc")

-- Speed
Section:NewSlider("Speed", "You can control your speed.", 500, 0, function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end)


-- Jump
Section:NewSlider("Jump power", "You can control your jump power.", 500, 0, function(jump)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
end)


-- Hip Height
Section:NewSlider("Hip Height", "You can control your height.", 50, 0, function(height)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = height
end)


-- Sit
Section:NewKeybind("Sit", "You sit down.", Enum.KeyCode.Z, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true
end)

