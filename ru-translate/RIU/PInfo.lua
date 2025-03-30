--!nocheck
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/GUIs/main/PinfoGUILeft.lua"))()
local Window = Library.CreateLib("Информация о игроке №1", "RJTheme3")

local Tab = Window:NewTab("Выбор игрока")
local Section = Tab:NewSection("")
local playerService = game:GetService("Players")
local workspace = game:GetService("Workspace")
local localPlayer = playerService.LocalPlayer
local coreGui = game:GetService("CoreGui")

local function clearWindow()
    for _, gui in pairs(coreGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            local main = gui:FindFirstChild("Main")
            if main then
                local mainSide = main:FindFirstChild("MainSide")
                if mainSide then
                    local tabFrames = mainSide:FindFirstChild("tabFrames")
                    if tabFrames then
                        for _, button in ipairs(tabFrames:GetChildren()) do
                            if button:IsA("TextButton") then
                                if button.Name == "Выбор игрокаTabButton" then
                                    button:Destroy()
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local function updateDropdown(dropdown)
    local playerNames = {}
    for _, player in pairs(playerService:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    
    dropdown:Refresh(playerNames, true) 
end

local dropdown = Section:NewDropdown("Выбор игрока", "Выберите игрока о котором вы хотите узнать инфу.", {}, function(selectedPlayer)
    local targetPlayer = workspace:FindFirstChild(selectedPlayer)
    if targetPlayer and targetPlayer:FindFirstChild("HumanoidRootPart") then
        clearWindow()
        local PlayerName = selectedPlayer
        local PlayerDisplayName = playerService:FindFirstChild(PlayerName).DisplayName

        local Tab = Window:NewTab("Игрок")
        local Section = Tab:NewSection("Выбранный игрок: " .. PlayerName .. " (" .. PlayerDisplayName .. ")")
        Section:NewButton("Скопировать ник выбранного игрока", "Нажмите чтобы скопировать.", function()
            setclipboard(PlayerName)
        end)
        
        local PlayerID = game:GetService("Players"):FindFirstChild(PlayerName).UserId
        Section:NewLabel("ID игрока: " .. PlayerID)
        Section:NewButton("Скопировать ID выбранного игрока", "Нажмите чтобы скопировать.", function()
            setclipboard(PlayerID)
        end)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Способность")
        local Speciality = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Speciality")
        Section = Tab:NewSection("Способность: " .. Speciality)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Стенд")
        local Stand = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Stand")
        Section = Tab:NewSection("Стенд: " .. Stand)

        local StandSkin = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("StandSkin")
        Section:NewLabel("Скин на стенд: " .. StandSkin)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Деньги")
        local cash = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Cash")
        Section = Tab:NewSection("Количество денег: " .. cash .. "$")

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Стенды в хранилище")
        local StandStorageSlots = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("StandStorageSlots")
        Section = Tab:NewSection("Всего доступных ячеек: " .. StandStorageSlots)
        
        local StandInStorage1 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot1_StandSkin")
        Section:NewLabel("Ячейка 1: " .. StandInStorage1)

        local StandInStorage2 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot2_StandSkin")
        Section:NewLabel("Ячейка 2: " .. (StandStorageSlots >= 2 and StandInStorage2 or "❌Недоступно❌"))
        
        local StandInStorage3 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot3_StandSkin")
        Section:NewLabel("Ячейка 3: " .. (StandStorageSlots >= 3 and StandInStorage3 or "❌Недоступно❌"))
        
        local StandInStorage4 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot4_StandSkin")
        Section:NewLabel("Ячейка 4: " .. (StandStorageSlots >= 4 and StandInStorage4 or "❌Недоступно❌"))
        
        local StandInStorage5 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot5_StandSkin")
        Section:NewLabel("Ячейка 5: " .. (StandStorageSlots >= 5 and StandInStorage5 or "❌Недоступно❌"))
        
        local StandInStorage6 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot6_StandSkin")
        Section:NewLabel("Ячейка 6: " .. (StandStorageSlots >= 6 and StandInStorage6 or "❌Недоступно❌"))
        
        local StandInStorage7 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot7_StandSkin")
        Section:NewLabel("Ячейка 7: " .. (StandStorageSlots >= 7 and StandInStorage7 or "❌Недоступно❌"))

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Остальная инфа")
        local BannedBefore = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("BannedBefore")
        local banned = BannedBefore and "✅Да✅" or "❌Нет❌"
        Section = Tab:NewSection("Был забанен ранее: " .. banned)

        if banned == "✅Да✅" then
            local BanReason = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("BanReason")
            Section:NewLabel("Причина бана: " .. BanReason)
        end

        local CashBoost = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("CashBoost")
        local cashboost = CashBoost and "✅Есть✅" or "❌Нету❌"
        Section:NewLabel("Буст к деньгам: " .. cashboost)
        if cashboost == "✅Есть✅" then
            local CashBoostTime = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("CashBoostTime")
            Section:NewLabel("Он ещё будет длится: " .. CashBoostTime .. " секунд")
        end

        local ExperienceBoost = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("ExperienceBoost")
        local dayOfWeek = os.date("*t").wday
        local experienceboost
        
        if ExperienceBoost == true then
            if dayOfWeek == 6 or dayOfWeek == 7 or dayOfWeek == 1 then
                experienceboost = "Включён бесплатный выходной буст"
            else
                experienceboost = "✅Есть✅"
            end
        else
            experienceboost = "❌Нету❌"
        end
        Section:NewLabel("Буст к опыту: " .. experienceboost)
        
        local ExperienceBoostTime = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("ExperienceBoostTime")
        if experienceboost == "✅Есть✅" then
        Section:NewLabel("Он ещё будет длится: " .. ExperienceBoostTime .. " секунд")
        else
        
        end

        local AccountAge = playerService:FindFirstChild(PlayerName).AccountAge
        local sucday = (AccountAge == 1 and " день" or AccountAge >= 2 and AccountAge <= 4 and " дня" or " дней")
        Section:NewLabel("Аккаунт существует: " .. AccountAge .. sucday)

        local DashDistance = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("DashDistance")
        Section:NewLabel("Длина деша: " .. DashDistance .. "см")

        local Experience = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Experience")
        Section:NewLabel("Количество опыта: " .. Experience)

        local HealthRegen = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("HealthRegen")
        Section:NewLabel("Количество регенерируемых ХП: " .. HealthRegen)

        local MaxHealth = workspace:FindFirstChild(PlayerName):FindFirstChild("Humanoid").MaxHealth
        Section:NewLabel("Максимум ХП: " .. MaxHealth)

        local JumpPower = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("JumpPower")
        Section:NewLabel("Сила прыжка: " .. JumpPower)

        local SprintSpeed = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SprintSpeed")
        Section:NewLabel("Скорость бега: " .. SprintSpeed)

        local WalkSpeed = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("WalkSpeed")
        Section:NewLabel("Скорость ходьбы: " .. WalkSpeed)

        local Level = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Level")
        Section:NewLabel("Уровень: " .. Level)

        local LoginDay = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("LoginDay")
        Section:NewLabel("Пройдено ежедневных наград: " .. LoginDay)

        local MaxBlockingHealth = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("MaxBlockingHealth")
        Section:NewLabel("Максимум блокируемого урона: " .. MaxBlockingHealth)

        local Tokens = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Tokens")
        Section:NewLabel("Есть токенов: " .. Tokens)

        local SpawnPoint_PhantomBlood = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SpawnPoint_PhantomBlood")
        Section:NewLabel("Точка спавна в Phantom Blood: " .. SpawnPoint_PhantomBlood)

        local SpawnPoint_GoldenWind = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SpawnPoint_GoldenWind")
        Section:NewLabel("Точка спавна в Golden Wind: " .. SpawnPoint_GoldenWind)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Одежда")
        local OutfitHead = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("OutfitHead")
        Section = Tab:NewSection("Голова: " .. OutfitHead)

        local OutfitUpper = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("OutfitUpper")
        local OutfitLower = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("OutfitLower")
        local OutfitMisc = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("OutfitMisc")

        Section:NewLabel("Туловище: " .. OutfitUpper)
        Section:NewLabel("Ноги: " .. OutfitLower)
        Section:NewLabel("Остальная одежда: " .. OutfitMisc)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[

        local Tab = Window:NewTab("Очки навыков")
        local SkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SkillPoints")
        Section = Tab:NewSection("Осталось очков навыков: " .. SkillPoints)

        local PlayerSkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("PlayerSkillPoints")
        local SpecialitySkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SpecialitySkillPoints")
        local StandSkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("StandSkillPoints")
        local WeaponSkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("WeaponSkillPoints")
        Section:NewLabel("Количество потраченных очков на\n  вкладку Player: " .. PlayerSkillPoints)
        Section:NewLabel("Количество потраченных очков на\n  вкладку Stand: " .. StandSkillPoints)
        Section:NewLabel("Количество потраченных очков на\n  вкладку Speciality: " .. SpecialitySkillPoints)
        Section:NewLabel("Количество потраченных очков на\n  вкладку Weapon: " .. WeaponSkillPoints)
        Section:NewLabel("Всего очков: " .. Level)

        --]]
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Оружие")
        local Weapon = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Weapon")
        Section = Tab:NewSection("Оружие: " .. Weapon)

        local WeaponSkin = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("WeaponSkin")
        Section:NewLabel("Скин на оружие: " .. WeaponSkin)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Предметы")
        local Section = Tab:NewSection("Предметы и их количество")
        
        local ignoreAttributes = {
            ClassName = true,
            Name = true,
            Parent = true,
            Archivable = true
        }
        
        local Inventory = workspace:FindFirstChild(PlayerName).PlayerStatistics:FindFirstChild("Inventory")
        
        if Inventory then
            local attributes = {}
        
            for attributeName, attributeValue in pairs(Inventory:GetAttributes()) do
                if not ignoreAttributes[attributeName] then
                    table.insert(attributes, {name = attributeName, value = attributeValue})
                end
            end
        
            table.sort(attributes, function(a, b)
                return a.name < b.name
            end)
        
            for _, attribute in ipairs(attributes) do
                if attribute.value > 0 then
                    Section:NewLabel("Предмета" .. attribute.name .. ": " .. attribute.value)
                end
            end
        else
            Section:NewLabel("У папки 'Inventory' было изменено название или\n  её место нахождение.")
        end

        local Tab = Window:NewTab("Чертежи")
        local Section = Tab:NewSection("Чертежи и их количество")
        
        local Schematics = workspace:FindFirstChild(PlayerName).PlayerStatistics.Inventory:FindFirstChild("Schematics")
        
        if Schematics then
            local attributes = {}
        
            for attributeName, attributeValue in pairs(Schematics:GetAttributes()) do
                if not ignoreAttributes[attributeName] then
                    table.insert(attributes, {name = attributeName, value = attributeValue})
                end
            end
        
            table.sort(attributes, function(a, b)
                return a.name < b.name
            end)
        
            for _, attribute in ipairs(attributes) do
                if attribute.value > 0 then
                    Section:NewLabel("Чертёж: " .. attribute.name .. ": " .. attribute.value)
                end
            end
        else
            Section:NewLabel("У папки 'Schematics' было изменено название или\n  её место нахождение.")
        end

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/GUIs/main/PinfoGUIRight.lua"))()
        local Window = Library.CreateLib("Информация о игроке №2", "RJTheme3")

        local Tab = Window:NewTab("Части святого трупа")
        local heartEquipped = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Heart"):GetAttribute("Heart_Equipped")
        local heartMerged = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Heart"):GetAttribute("Heart_Merged")
        
        if heartEquipped and heartMerged then
            heart = "✅Есть✅ ✅Было использовано✅"
        elseif heartEquipped then
            heart = "✅Есть✅ ❌Не было использовано❌"
        else
            heart = "❌Нет❌ ❌Не было использовано❌"
        end
        
        local Section = Tab:NewSection("Сердце: " .. heart)
        
        local LeftEye = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("LeftEye"):GetAttribute("LeftEye_Equipped")
        local LeftLeg = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("LeftLeg"):GetAttribute("LeftLeg_Equipped")
        local RightArm = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("RightArm"):GetAttribute("RightArm_Equipped")
        local RightEye = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("RightEye"):GetAttribute("RightEye_Equipped")
        local RightLeg = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("RightLeg"):GetAttribute("RightLeg_Equipped")
        local leftArmEquipped = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("LeftArm"):GetAttribute("LeftArm_Equipped")
        local leftArmMerged = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("LeftArm"):GetAttribute("LeftArm_Merged")
        local ribcageEquipped = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Ribcage"):GetAttribute("Ribcage_Equipped")
        local ribcageMerged = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Ribcage"):GetAttribute("Ribcage_Merged")
        local skullEquipped = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Skull"):GetAttribute("Skull_Equipped")
        local skullMerged = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Skull"):GetAttribute("Skull_Merged")

        if leftArmEquipped and leftArmMerged then
            leftarm = "✅Есть✅ ✅Было использовано✅"
        elseif leftArmEquipped then
            leftarm = "✅Есть✅ ❌Не было использовано❌"
        else
            leftarm = "❌Нет❌ ❌Не было использовано❌"
        end
        if LeftEye == true then
            lefteye = "✅Есть✅"
        else
            lefteye = "❌Нет❌"
        end
        if LeftLeg == true then
            leftleg = "✅Есть✅"
        else
            leftleg = "❌Нет❌"
        end
        if ribcageEquipped and ribcageMerged then
            ribcage = "✅Есть✅ ✅Было использовано✅"
        elseif ribcageEquipped then
            ribcage = "✅Есть✅ ❌Не было использовано❌"
        else
            ribcage = "❌Нет❌ ❌Не было использовано❌"
        end
        if RightArm == true then
            rightarm = "✅Есть✅"
        else
            rightarm = "❌Нет❌"
        end
        if RightEye == true then
            righteye = "✅Есть✅"
        else
            righteye = "❌Нет❌"
        end
        if RightLeg == true then
            rightleg = "✅Есть✅"
        else
            rightleg = "❌Нет❌"
        end
        if skullEquipped and skullMerged then
            skull = "✅Есть✅ ✅Было использовано✅"
        elseif skullEquipped then
            skull = "✅Есть✅ ❌Не было использовано❌"
        else
            skull = "❌Нет❌ ❌Не было использовано❌"
        end
        Section:NewLabel("Левая рука: " .. leftarm)
        Section:NewLabel("Правая рука: " .. rightarm)
        Section:NewLabel("Левая нога: " .. leftleg)
        Section:NewLabel("Правая нога: " .. rightleg)
        Section:NewLabel("Рёбра: " .. ribcage)
        Section:NewLabel("Левый глаз: " .. lefteye)
        Section:NewLabel("Правый глаз: " .. righteye)
        Section:NewLabel("Череп: " .. skull)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Промокоды")
        local Section = Tab:NewSection("Введённые промокоды")
        
        local RedeemedCodes = workspace:FindFirstChild(PlayerName).PlayerStatistics:FindFirstChild("RedeemedCodes")
        
        if RedeemedCodes then
            local attributes = {}
        
            for attributeName, attributeValue in pairs(RedeemedCodes:GetAttributes()) do
                if not ignoreAttributes[attributeName] then
                    local cleanedName = attributeName:gsub("^RedeemedCodes_", "")
                    table.insert(attributes, {name = cleanedName, value = attributeValue})
                end
            end
        
            table.sort(attributes, function(a, b)
                return a.name < b.name
            end)
        
            for _, attribute in ipairs(attributes) do
                Section:NewButton("Был введён: " .. attribute.name, "Нажмите чтобы скопировать.", function()
                    setclipboard(attribute.name)
                end)
            end
        else
            Section:NewLabel("У папки 'RedeemedCodes' было изменено название или\n  её место нахождение.")
        end

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Испытания")
        local Trials = workspace:FindFirstChild(PlayerName).PlayerStatistics:FindFirstChild("Trials"):GetAttribute("TrialsUnlocked")
        local trials = Trials and "были разблокированы" or "не были разблокированы"
        Section = Tab:NewSection("Испытания " .. trials)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Отряд")
        local Squad = workspace:FindFirstChild(PlayerName).PlayerStates:GetAttribute("Squad"):gsub("'s Squad", "")
        Section = Tab:NewSection("Игрок находится в отряде: " .. Squad)
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Ошибка",
            Text = "Не удалось найти игрока или его HumanoidRootPart в Workspace",
            Duration = 3
        })
    end
end)

playerService.PlayerAdded:Connect(function()
    updateDropdown(dropdown)
end)

playerService.PlayerRemoving:Connect(function()
    updateDropdown(dropdown)
end)

updateDropdown(dropdown)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Section:NewButton("Обновить список игроков", "Обновляет список игроков.", function()
    updateDropdown(dropdown)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Tab = Window:NewTab("Информация")
local Section = Tab:NewSection("1. Если вместо информации просто пустое место это\n   значит что у него ничего нет в информации о нём.")
local Section = Tab:NewSection("2. Информация не обновляется в настоящем времени.\n   Будет добавлено в следующих обновлениях.")
local Section = Tab:NewSection("3. Просмотр очков работает по какой-то причине\n    не правильно. Будет исправлено в\n   следующих обновлениях.")
local Section = Tab:NewSection('4. В остальной информации есть пункт "Буст к опыту"\n    и с пятницы до воскресенья там будет написано')
local Section = Tab:NewSection('"Включён бесплатный выходной буст" тут имеется\n   введу то что в RIU с пятницы до воскресенья даётся\n   бесплатный буст к опыту.')
local Section = Tab:NewSection("При выборе игрока выбор самого себя сделан\n специально чтобы узнать о себе больше инфы.")
