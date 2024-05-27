local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Heaven Stand", "RJTheme1")

-- 1 Section Teleporting
local Tab = Window:NewTab("Телепортация")
local Section = Tab:NewSection("Телепорт")

-- Teleport to bosses
Section:NewDropdown("Телепорт к боссам", "Вы телепортируетесь к боссам.", {"DIO", "Silver Chariot Requiem", "Garou", "Asta", "Vergil", "Minos Prime", "Sakuya Izayoi", "Sisyphus Prime", "just a cosmic garou"}, function(teleport)
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
Section:NewDropdown("Телепорт к НПС", "Вы телепортируетесь к НПС.", {"Shop", "Seller", "Pucci", "RaymondZl", "Boxing Master", "Gojo", "Toji", "Yuta"}, function(npc)
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
Section:NewDropdown("Телепорт к манекенам", "Вы телепортируетесь к манекенам.", {"Dummy", "300 Health Dummy", "Blocking dummy", "Attacking dummy", "Numbness dummy"}, function(dummy)
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
Section:NewTextBox("Телепорт к игроку", "Введите ник для телепортации(Неправильный ник не телепортиртирует).", function(ply)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies[ply].HumanoidRootPart.CFrame or game:GetService("Workspace")[ply].HumanoidRootPart.CFrame
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2 Section Bosses
local Tab = Window:NewTab("Боссы")
local Section = Tab:NewSection("Управление боссами")

-- Boss slowdown
Section:NewDropdown("Замедение босса", "Вы сильно замедляете босса.", {"DIO", "Silver Chariot Requiem", "Garou", "Asta", "Vergil", "Minos Prime", "Sakuya Izayoi", "Sisyphus Prime", "just a cosmic garou"}, function(slow)

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
Section:NewDropdown("Моментальное убийство боссов", "Вы моментально убиваете босса.", {"DIO", "Silver Chariot Requiem", "Garou", "Asta", "Vergil", "Minos Prime", "Sakuya Izayoi", "Sisyphus Prime", "just a cosmic garou"}, function(kill)
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

-- 3 Section Teleport to Items
local Tab = Window:NewTab("Тп к предметам")
local Section = Tab:NewSection("Телепорт")

Section:NewLabel("Совет: Прыгайте перед телепортом.")

-- Teleport to box
Section:NewDropdown("Телепортация к ящикам", "Вы телепортируетесь к ящику.", {"Ящик 1", "Ящик 2", "Ящик 3", "Ящик 4", "Ящик 5", "Ящик 6"}, function(box)
if box == "Ящик 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.6195755, 2.29400635, 272.246124, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Ящик 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76.5198746, 2.29400635, 211.432983, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Ящик 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-119.116692, 2.29400635, -11.8983154, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Ящик 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76.1594696, 2.29400635, -150.602936, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Ящик 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-281.939026, 2.29400635, -6.23294067, 1, 0, 0, 0, -1, 0, 0, 0, -1)
elseif box == "Ящик 6" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-404.760468, 2.29400635, 133.927063, 1, 0, 0, 0, -1, 0, 0, 0, -1)
    end
end)

-- Teleport to dualknife
Section:NewDropdown("Телепортация к двойным ножам", "Вы телепортируетесь к двойнуму ножу", {"Dualknife 1", "Dualknife 2", "Dualknife 3", "Dualknife 4", "Dualknife 5", "Dualknife 6"}, function(dualknife)
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
Section:NewDropdown("Телепортация к зелённому ребёнку", "Вы телепортируетесь к зелённому ребёнку.", {"Зелённый ребёнок 1", "Зелённый ребёнок 2", "Зелённый ребёнок 3"}, function(gb)
if gb == "Зелённый ребёнок 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(90.19207, 0.967250109, -243.308884, 0, 0, -1, -1, 0, 0, 0, 1, 0)
elseif gb == "Зелённый ребёнок 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-134.000931, 1.44551516, -191.255386, 0, 1, 0, 0, 0, -1, -1, 0, 0)
elseif gb == "Зелённый ребёнок 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-232.313889, 1.44551516, -4.18959045, 0, 1, 0, 0, 0, -1, -1, 0, 0)
    end
end)

-- Teleport to mini hakkero
Section:NewDropdown("Телепортация к мини Хаккеро", "Вы телепортируетесь к мини Хаккеро.", {"Мини Хаккеро 1", "Мини Хаккеро 2", "Мини Хаккеро 3", "Мини Хаккеро 4", "Мини Хаккеро 5"}, function(mh)
if mh == "Мини Хаккеро 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(23.5779266, 1.27398145, 90.3544998, -1, 0, -0, 0, 0, -1, 0, -1, -0)
elseif mh == "Мини Хаккеро 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-523.490234, 1.27398145, -277.166809, -1, 0, -0, 0, 0, -1, 0, -1, -0)
elseif mh == "Мини Хаккеро 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-225.36087, 1.52194595, -24.3506012, -1, 0, -0, 0, 0, -1, 0, -1, -0)
elseif mh == "Мини Хаккеро 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-580.705933, 1.27398145, -204.590973, -1, 0, -0, 0, 0, -1, 0, -1, -0)
elseif mh == "Мини Хаккеро 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-52.7155457, 1.52194595, -88.0363083, -1, 0, -0, 0, 0, -1, 0, -1, -0)
    end
end)

-- Teleport to xsoul
Section:NewButton("Телепортация к XSoul", "Вы телепортируетесь к XSoul.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Item_Spawnner"].XSoul.XSoul.CFrame
end)

-- Teleport to requiem arrow
Section:NewButton("Телепортация к реквием стреле", "Вы телепортируетесь к реквием стреле.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Item_Spawnner"]["Requiem Arrow"]["Requiem Arrow"].CFrame
end)

-- Teleport to watch
Section:NewButton("Телепортация к часам", "Вы телепортируетесь к часам Сакуи.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Item_Spawnner"].Watch.Watch.CFrame
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4 Section Misc
local Tab = Window:NewTab("Остальное")
local Section = Tab:NewSection("Остальное")

-- Speed
Section:NewSlider("Скорость", "Вы управляете своей скоростью.", 500, 16, function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end)

-- Jump
Section:NewSlider("Сила прыжка", "Вы управляете своей силой прыжка.", 500, 50, function(jump)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
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
    wait(1)
    game.Players.LocalPlayer.Character.Humanoid.RigType = 0
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

-- 5 Section Settings
-- Settings
local Tab = Window:NewTab("Настройки")
local Section = Tab:NewSection("Настройки")

Section:NewButton("Отключение дождя", "Вы отключаете навсегда дождь.", function()
    game:GetService("Workspace").Effects.Weather:Destroy()
end)

Section:NewButton("Отключение моргания света", "Вы отключете навсегда моргание света.", function()
    game.Lighting.IMPACT1:Destroy()
    game.Lighting.IMPACT2:Destroy()
end)

Section:NewButton("Удаление облаков", "Вы навсегда удаляете облака.", function()
    game:GetService("Workspace").Terrain.Clouds:Destroy()
end)

Section:NewButton("Отключение тряски экрана", "Вы отключете навсегда тряску экрана.", function()
    game.Players.LocalPlayer.Settings["Camera Shake"].Value = false
    game.Players.LocalPlayer.Settings.CameraShake.Value = false
end)

Section:NewButton("Удаление розового эффекта", "Вы удалите розовый эффект.", function()
    game.Lighting.ColorCorrection:Destroy()
end)

Section:NewButton("Включение ужасно плохой графики", "Вы включаете навсегда плохую графику.", function()
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

Section:NewButton("Удаление всех эффектов", "Вы навсегда удаляете все эффекты.", function()
    game:GetService("Workspace").Effects:Destroy()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 6 Section Fun
-- Fun
local Tab = Window:NewTab("Веселье")
local Section = Tab:NewSection("Веселье")

-- Undressing the players
Section:NewTextBox("Раздевание игрока", "Введите никнейм игрока(Неправильный ник не раздените).", function(utp)
    game:GetService("Workspace").Enemies[utp].Shirt:Destroy()
	game:GetService("Workspace").Enemies[utp].Pants:Destroy()
    game:GetService("Workspace").Enemies[utp]["Shirt Graphic"]:Destroy()
end)

-- Field Of Viev
Section:NewSlider("FOV", "Вы можете контролировать свой FOV.", 120, 1, function(fov)
    game:GetService("Workspace").Camera.FieldOfView = fov
end)

-- Default field of viev
Section:NewButton("Обычный FOV", "Вы ставете себе обычный FOV.", function()
    game:GetService("Workspace").Camera.FieldOfView = 70
end)

-- Player Info
Section:NewTextBox("Инфо про игрока", "Введите ник для информации(Неправильный ник нет инфы.).", function(pi)
    game:GetService("Workspace").NameValue:Destroy()
    local ws = game:GetService("Workspace")
    local vs = Instance.new("StringValue")
        vs.Name = "NameValue"
        vs.Value = pi
        vs.Parent = workspace
    wait(0.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/main/main/ru-translate/PlayerInfoRu-HeavenStand.lua", true))()
end)

-- Sit
Section:NewKeybind("Сесть", "Вы садитесь.", Enum.KeyCode.V, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true 
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 7 Section Other scripts
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

-- 8 Section Credit
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
