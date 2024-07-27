local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Robojini-GUI/main/AutoStoryGui.lua"))()
local Window = Library.CreateLib("Roblox Is Unbreakable V1.1 - Phantom Blood Ru - Auto Story", "RJTheme6")

-- 1 Section Auto(Bugged)
local Tab = Window:NewTab("Авто прохождение")
local Section = Tab:NewSection("Авто прохождение 1 части")

local PlayerName = game:GetService("Players").LocalPlayer.Name
game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "Start")
local function FirstQuest()
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_1)
end

local function SecondQuest()
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective2, 
        [2] = 2, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_2)
end

local function ThirdQuest()
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective3, 
        [2] = 3, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_3)
end

local function FourthQuest()
    local A_4 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective4, 
        [2] = 4, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_4)
end

local function FifthQuest()
    local A_5 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective5, 
        [2] = 5, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_5)
end

local function SixthQuest()
    local A_6 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective6, 
        [2] = 6, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_6)
end

local function SeventhQuest()
    local A_7 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective7, 
        [2] = 7, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_7)
end

local function EighthQuest()
    local A_8 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective8, 
        [2] = 8, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_8)
end

local function NinthQuest()
    local A_9 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective9, 
        [2] = 9, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_9)
end

local function TenthQuest()
    local A_10 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective10, 
        [2] = 10, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_10)
end

local function EleventhQuest()
    local A_11 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective11, 
        [2] = 11, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_11)
end

local function TwelfthQuest()
    local A_12 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective12, 
        [2] = 12, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_12)
end

local function ThirteenthQuest()
    local A_13 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective13, 
        [2] = 13, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_13)
end

local function FourteenthQuest()
    local A_14 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective14, 
        [2] = 14, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_14)
end

local function FifteenthQuest()
    local A_15 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective15, 
        [2] = 15, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_15)
end

local function SixteenthQuest()
    local A_16 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.MainQuest.Objective16, 
        [2] = 16, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("MainQuest", "AddProgress", A_16)
end

local function StartJonathanQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("JonathanQuest", "Start")
    local A_1 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.JonathanQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("JonathanQuest", "AddProgress", A_1)
end

local function StartJonathan2Quest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("Jonathan2Quest", "Start")
    local A_2 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.Jonathan2Quest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("Jonathan2Quest", "AddProgress", A_2)
end

local function StartJonathan3Quest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("Jonathan3Quest", "Start")
    local A_3 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.Jonathan3Quest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("Jonathan3Quest", "AddProgress", A_3)
end

local function StartBrufordQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("BrufordQuest", "Start")
    local A_4 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.BrufordQuest.Objective1, 
        [2] = 1, 
        [3] = 1
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("BrufordQuest", "AddProgress", A_4)
end

local function StartStraizoQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("StraizoQuest", "Start")
    local A_5 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.StraizoQuest.Objective1, 
        [2] = 1, 
        [3] = 10
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("StraizoQuest", "AddProgress", A_5)
end

local function StartPoliceOfficerQuest()
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("PoliceOfficerQuest", "Start")
    local A_6 = 
    {
        [1] = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.PoliceOfficerQuest.Objective1, 
        [2] = 1, 
        [3] = 5
    }
    game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Quests.QuestUpdateEvent:FireServer("PoliceOfficerQuest", "AddProgress", A_6)
end

local PlayerName = game:GetService("Players").LocalPlayer.Name
Section:NewButton("Автоматическое прохождение 1 части", "Скрипт автоматически проходит сюжет 1 части.", function()
    FirstQuest()
    SecondQuest()
    ThirdQuest()
    FourthQuest()
    FifthQuest()
    SixthQuest()
    SeventhQuest()
    EighthQuest()
    NinthQuest()
    TenthQuest()
    EleventhQuest()
    TwelfthQuest()
    ThirteenthQuest()
    FourteenthQuest()
    FifteenthQuest()
    SixteenthQuest()
    StartJonathanQuest()
    StartJonathan2Quest()
    StartJonathan3Quest()
    StartBrufordQuest()
    StartStraizoQuest()
    StartPoliceOfficerQuest()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2 Section Semi-Auto 
local Tab = Window:NewTab("Пошаговое прохождение")
local Section = Tab:NewSection("Пошаговое прохождение 1 части")

Section:NewLabel("Если вы не хотите получить баги следуйте заданой")
Section:NewLabel("последовательности кнопок.")

Section:NewButton("Первый квест", "Выполняет первый квест", function()
    FirstQuest()
end)

Section:NewButton("Второй квест", "Выполняет второй квест", function()
    SecondQuest()
end)

Section:NewButton("Третий квест", "Выполняет третий квест", function()
    ThirdQuest()
end)

Section:NewButton("Четвертый квест", "Выполняет четвертый квест", function()
    FourthQuest()
end)

Section:NewButton("Пятый квест", "Выполняет пятый квест", function()
    FifthQuest()
end)

Section:NewButton("Шестой квест", "Выполняет шестой квест", function()
    SixthQuest()
end)

Section:NewButton("Седьмой квест", "Выполняет седьмой квест", function()
    SeventhQuest()
end)

Section:NewButton("Восьмой квест", "Выполняет восьмой квест", function()
    EighthQuest()
end)

Section:NewButton("Девятый квест", "Выполняет девятый квест", function()
    NinthQuest()
end)

Section:NewButton("Десятый квест", "Выполняет десятый квест", function()
    TenthQuest()
end)

Section:NewButton("Одиннадцатый квест", "Выполняет одиннадцатый квест", function()
    EleventhQuest()
end)

Section:NewButton("Двенадцатый квест", "Выполняет двенадцатый квест", function()
    TwelfthQuest()
end)

Section:NewButton("Тринадцатый квест", "Выполняет тринадцатый квест", function()
    ThirteenthQuest()
end)

Section:NewButton("Четырнадцатый квест", "Выполняет четырнадцатый квест", function()
    FourteenthQuest()
end)

Section:NewButton("Пятнадцатый квест", "Выполняет пятнадцатый квест", function()
    FifteenthQuest()
end)

Section:NewButton("Шестнадцатый квест", "Выполняет шестнадцатый квест", function()
    SixteenthQuest()
end)

Section:NewButton("Первый квест от Джонатана", "Выполняет первый квест от Джонатана", function()
    StartJonathanQuest()
end)

Section:NewButton("Второй квест от Джонатана", "Выполняет второй квест от Джонатана", function()
    StartJonathan2Quest()
end)

Section:NewButton("Третий квест от Джонатана", "Выполняет третий квест от Джонатана", function()
    StartJonathan3Quest()
end)

Section:NewButton("Квест от Уильяма Цеппели", "Выполняет квест от Уильяма Цеппели", function()
    StartBrufordQuest()
end)

Section:NewButton("Квест с Стразио", "Выполняет квест от Стразио", function()
    StartStraizoQuest()
end)

Section:NewButton("Квест с полицейским", "Выполняет квест от полицейского", function()
    StartPoliceOfficerQuest()
end)
