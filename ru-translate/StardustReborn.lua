local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Stardust Reborn", "RJTheme1")

--- 1 Section Teleporting
local Tab = Window:NewTab("Телепортация")
local Section = Tab:NewSection("Телепорт")

-- Teleport to bosses
Section:NewDropdown("Телепот к боссам", "Вы телепортируетесь к боссам.", {"DIO", "Diavolo", "Jotaro P3", "Chaka", "Goku"}, function(teleport)
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
Section:NewDropdown("Телепортация к НПС", "Вы телепортируетесь к НПС.", {"Enrico Pucci", "Jotaro", "VerifiedPixel", "Giorno Giovanna", "Becca", "TheForgotten0range", "k7rdan", "Shadow DIO", "Goku"}, function(npc)
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
Section:NewDropdown("Телепортация к манекенам", "Вы телепортируетесь к манекенам.", {"Immortal Dummy", "Mortal Dummy", "Block Dummy", "Perfect Block Dummy", "Deflect Dummy", "Barraging Dummy"}, function(dummy)
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
Section:NewTextBox("Телепорт к игроку", "Введите ник для телепортации(Неправильный ник не телепортиртирует).", function(ply)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive[ply].HumanoidRootPart.CFrame
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 2 Section Bosses
local Tab = Window:NewTab("Боссы")
local Section = Tab:NewSection("Управление боссами")

-- Instant kill bosses
Section:NewDropdown("Моментальное убийство боссов", "Вы моментально убиваете боссов.", {"DIO", "Diavolo", "Jotaro P3", "Chaka", "Goku"}, function(kill)
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
local Tab = Window:NewTab("Тп к предметам")
local Section = Tab:NewSection("Телепорт")

Section:NewLabel("Совет: Прыгайте перед телепортом.")

-- Teleport to arrow
Section:NewButton("Телепорт к стрелам", "Вы телепортируетесь к стрелам.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items.Arrow.Handle.CFrame
end)

-- Teleport to rokakaka
Section:NewButton("Телепорт к рокакаке", "Вы телепортируетесь к рокакакам.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items.Roka.Handle.CFrame
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 4 Section Misc
local Tab = Window:NewTab("Остальное")
local Section = Tab:NewSection("Остальное")

-- Speed
Section:NewSlider("Скорость", "Вы управляете своей скоростью.", 500, 16, function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end)

-- Hip Height
Section:NewSlider("Высота персонажа", "Вы управляете своей высотой персонажа.", 50, 0, function(height)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = height
end)

-- Gravity
Section:NewSlider("Гравитация", "Вы управляете своей гравитецией.", -1000, 196.2, function(gravity)
    game:GetService("Workspace").Gravity = gravity
end)

-- Suicide
Section:NewButton("Самоубийство", "Вы умираете.", function()
    game.Players.LocalPlayer.Character.Humanoid.RigType = 1
end)

-- Noclip on/off
Section:NewButton("Включение ноуклипа", "Вы можете проходить через стены и остальное.", function()
    while game:GetService("RunService").RenderStepped:wait() do
        game.Players.LocalPlayer.Character.Head.CanCollide = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        game.Players.LocalPlayer.Character.Torso.CanCollide = false
end
end)

Section:NewButton("Выключение ноуклипа", "Вы больше не можете проходить через стены и остальное.", function()
while game:GetService("RunService").RenderStepped:wait() do
    game.Players.LocalPlayer.Character.Head.CanCollide = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
    game.Players.LocalPlayer.Character.Torso.CanCollide = true
end
end)

-- ESP
Section:NewButton("ESP", "Вы теперь видете игроков через стены.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/ESP/main/ESP.lua", true))()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 5 Section Fun
-- Fun
local Tab = Window:NewTab("Веселье")
local Section = Tab:NewSection("Веселье")

-- Undressing the players
Section:NewTextBox("Раздевание игрока", "Введите никнейм игрока(Неправильный ник не раздените).", function(utp)
    game:GetService("Workspace").Game.Alive[utp].Shirt:Destroy()
	game:GetService("Workspace").Game.Alive[utp].Pants:Destroy()
    game:GetService("Workspace").Game.Alive[utp]["Shirt Graphic"]:Destroy()
end)

-- Field Of Viev
Section:NewSlider("FOV", "Вы можете контролировать свой FOV.", 120, 1, function(fov)
    game:GetService("Workspace").Camera.FieldOfView = fov
end)

-- Default field of viev
Section:NewButton("Обычный FOV", "Вы ставете себе обычный FOV.", function()
    game:GetService("Workspace").Camera.FieldOfView = 70
end)

-- Sit
Section:NewKeybind("Сесть", "Вы садитесь.", Enum.KeyCode.V, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true 
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 6 Section Other scripts
-- Other scripts
local Tab = Window:NewTab("Другие скрипты")
local Section = Tab:NewSection("Скрипты")

-- DarkDex
Section:NewDropdown("Выбор версии DarkDex", "Несколько версий DarkDex.", {"DarkDex V4", "DarkDex V3", "DarkDex V1.1.0 Alpha"}, function(dex)
if dex == "DarkDex V4" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V4", true))()
elseif dex == "DarkDex V3" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V3", true))()
elseif dex == "DarkDex V1.1.0 Alpha" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V1.1.0%20Alpha", true))()
    end
end)

-- Infinite Yeild
Section:NewButton("Заинжектить Infinite Yeild", "Вы внедряете Infinite Yeild.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Infinite-yeild/main/Infiniteyeild.lua", true))()
end)

-- CMD-X
Section:NewButton("Заинжектить CMD-X", "Вы внедряете CMD-X.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/CMD-X/main/CMD-X.lua", true))()
end)

-- Your script
Section:NewTextBox("Твой скрипт", "Введите ссылку своего скрипта сюда.", function(uscript)
	loadstring(game:HttpGet(uscript, true))()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 7 Section Credit
-- Credit
local Tab = Window:NewTab("Благодарности")
local Section = Tab:NewSection("Создал HackerMan33105")

Section:NewLabel("Помогал с идеями ---> rusterd")
Section:NewLabel("Сделал гайд по GUI ---> Robojini")
Section:NewButton("Вот дискорд Robojini", "Нажми сюда для копирывания ссылки.", function()
    setclipboard("https://discord.gg/E4BdnAXsuE")
end)
Section:NewButton("Вот ютуб канал Robojini", "Нажми сюда для копирывания ссылки.", function()
    setclipboard("https://www.youtube.com/@Robojini")
end)
