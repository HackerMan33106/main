local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Robojini-GUI/main/AutoStoryGui.lua"))()
local Window = Library.CreateLib("Roblox Is Unbreakable V1.0 - Golden Wind Ru - Auto Story", "RJTheme6")

-- 1 Section AutoStory
local Tab = Window:NewTab("Авто прохождение")
local Section = Tab:NewSection("Авто прохождение 5 части")

local PlayerName = game:GetService("Players").LocalPlayer.Name
local function FirstQuest()
        game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiLuggageQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.KoichiLuggageQuest.Objective1, 
        [2] = 1, 
        [3] = 1, 
        [4] = ""
    }
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.KoichiLuggageQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.KoichiLuggageQuest.Objective3, 
        [2] = 3, 
        [3] = 1
    }
    local A_4 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.KoichiLuggageQuest.Objective4, 
        [2] = 4, 
        [3] = 1
    }
    local A_5 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.KoichiLuggageQuest.Objective5, 
        [2] = 5, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiLuggageQuest", "AddProgress", A_5)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiLuggageQuest", "AddProgress", A_4)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiLuggageQuest", "AddProgress", A_3)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiLuggageQuest", "AddProgress", A_2)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiLuggageQuest", "AddProgress", A_1)
end

local function SecondQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("GiornoLucaQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.GiornoLucaQuest.Objective1, 
        [2] = 1, 
        [3] = 1, 
        [4] = ""
    }
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.GiornoLucaQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.GiornoLucaQuest.Objective3, 
        [2] = 3, 
        [3] = 1
    }
    local A_4 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.GiornoLucaQuest.Objective4, 
        [2] = 4, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("GiornoLucaQuest", "AddProgress", A_4)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("GiornoLucaQuest", "AddProgress", A_3)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("GiornoLucaQuest", "AddProgress", A_2)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("GiornoLucaQuest", "AddProgress", A_1)
end

local function ThreeQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiPassportQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.KoichiPassportQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.KoichiPassportQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.KoichiPassportQuest.Objective3, 
        [2] = 3, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiPassportQuest", "AddProgress", A_3)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiPassportQuest", "AddProgress", A_2)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("KoichiPassportQuest", "AddProgress", A_1)
end

local function FourQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("GiornoBrunoQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.GiornoBrunoQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.GiornoBrunoQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("GiornoBrunoQuest", "AddProgress", A_2)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("GiornoBrunoQuest", "AddProgress", A_1)
end

local function FiveQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("PassioneQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.PassioneQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.PassioneQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.PassioneQuest.Objective3, 
        [2] = 3, 
        [3] = 3, 
        [4] = ""
    }
    local A_4 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.PassioneQuest.Objective4, 
        [2] = 4, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("PassioneQuest", "AddProgress", A_1)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("PassioneQuest", "AddProgress", A_2)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("PassioneQuest", "AddProgress", A_3)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("PassioneQuest", "AddProgress", A_4)
end

local function FiveQuest_One()
    local A_5 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.PassioneQuest.Objective6, 
        [2] = 6, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("PassioneQuest", "AddProgress", A_5)
end

local function SixQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("BrunoGangQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.BrunoGangQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.BrunoGangQuest.Objective2.OptionalObjective1, 
        [2] = 1, 
        [3] = 1
    }
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.BrunoGangQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    local A_4 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.BrunoGangQuest.Objective3, 
        [2] = 3, 
        [3] = 1
    }
    local A_5 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.BrunoGangQuest.Objective4, 
        [2] = 4, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("BrunoGangQuest", "AddProgress", A_5)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("BrunoGangQuest", "AddProgress", A_4)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("BrunoGangQuest", "AddProgress", A_3)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("BrunoGangQuest", "AddProgressOptional", A_2)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("BrunoGangQuest", "AddProgress", A_1)
end

local function SevenQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MrXQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MrXQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MrXQuest.Objective3, 
        [2] = 3, 
        [3] = 1
    }
    local A_4 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MrXQuest.Objective4, 
        [2] = 4, 
        [3] = 1
    }
    local A_5 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MrXQuest.Objective5, 
        [2] = 5, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXQuest", "AddProgress", A_5)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXQuest", "AddProgress", A_4)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXQuest", "AddProgress", A_3)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXQuest", "AddProgress", A_2)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXQuest", "AddProgress", A_1)
end

local function EightQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("RisottoBrunoQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.RisottoBrunoQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.RisottoBrunoQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.RisottoBrunoQuest.Objective3, 
        [2] = 3, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("RisottoBrunoQuest", "AddProgress", A_3)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("RisottoBrunoQuest", "AddProgress", A_2)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("RisottoBrunoQuest", "AddProgress", A_1)
end

local function NineQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXBrunoQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MrXBrunoQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MrXBrunoQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MrXBrunoQuest.Objective3, 
        [2] = 3, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXBrunoQuest", "AddProgress", A_3)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXBrunoQuest", "AddProgress", A_2)
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MrXBrunoQuest", "AddProgress", A_1)
end

local running = false

local function teleportToChest(chest)
    local FX = chest:FindFirstChild("FX")
    if FX and FX:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(FX.Position + Vector3.new(0, 2, 0))
        end
    end
end

local function teleportToAllChests()
    local chestFolder = game:GetService("Workspace"):FindFirstChild("Chests")
    if not chestFolder then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Ошибка",
            Text = "Папка Chests не найдена в Workspace",
            Duration = 3
        })
        return
    end

    local spawnedChests = chestFolder:FindFirstChild("SpawnedChests")
    if not spawnedChests then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Ошибка",
            Text = "Папка SpawnedChests не найдена в Chests",
            Duration = 3
        })
        return
    end

    local startTime = tick()
    local duration = 150

    while running and (tick() - startTime < duration) do
        for _, chest in ipairs(spawnedChests:GetChildren()) do
            if running then
                teleportToChest(chest)
                wait(0.20)
            end
        end
    end

    running = false
end

local function enableChestTP()
    if not running then
        running = true
        spawn(function()
            teleportToAllChests()
        end)
    end
end

Section:NewButton("Автоматическое прохождение 5 части", "Скрипт автоматически проходит сюжет 5 части.", function()
    FirstQuest()
    wait(1)
    SecondQuest()
    wait(1)
    ThreeQuest()
    wait(1)
    FourQuest()
    wait(1)
    FiveQuest()
    enableChestTP()
    wait(150)
    FiveQuest_One()
    wait(1)
    SixQuest()
    wait(1)
    SevenQuest()
    wait(1)
    EightQuest()
    wait(1)
    NineQuest()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2 Section Semi-Auto 
local Tab = Window:NewTab("Пошаговое прохождение")
local Section = Tab:NewSection("Пошаговое прохождение 5 части")

Section:NewLabel("Если вы не хотите получить баги следуйте заданной")
Section:NewLabel("последовательности кнопок.")

Section:NewButton("Koichi Luggage Quest", "Выполнение первого квеста", function()
    FirstQuest()
end)

Section:NewButton("Giorno Luca Quest", "Выполнение второго квеста", function()
    SecondQuest()
end)

Section:NewButton("Koichi Passport Quest", "Выполнение третьего квеста", function()
    ThreeQuest()
end)

Section:NewButton("Giorno Bruno Quest", "Выполнение четвёртого квеста", function()
    FourQuest()
end)

Section:NewButton("Passione Quest", "Выполнение пятого квеста", function()
    FiveQuest()
    enableChestTP()
    wait(150)
    FiveQuest_One()
end)

Section:NewButton("Bruno Gang Quest", "Выполнение шестого квеста", function()
    SixQuest()
end)

Section:NewButton("MrX Quest", "Выполнение седьмого квеста", function()
    SevenQuest()
end)

Section:NewButton("Risotto Bruno Quest", "Выполнение восьмого квеста", function()
    EightQuest()
end)

Section:NewButton("MrX Bruno Quest", "Выполнение девятого квеста", function()
    NineQuest()
end)
