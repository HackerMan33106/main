local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Robojini-GUI/main/GUI"))()
local Window = Library.CreateLib("Roblox Is Unbreakable V1.3.5 - Phantom Blood Ru", "RJTheme1")

-- 1 Section Teleporting
local Tab = Window:NewTab("Авто продажа")
local Section = Tab:NewSection("Автоматическая продажа предметов")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local isRunning = false
local maxCashAmount = 250000
local useMaxLimit = true

local function waitForHUD()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")
    local hud = playerGui:WaitForChild("HUD")
    local screen = hud:WaitForChild("Screen")
    local statBar = screen:WaitForChild("StatBar")
    local cashLabel = statBar:WaitForChild("Cash")
    return cashLabel
end

local cashLabel = waitForHUD()

local itemsToSell = {
    {nameWithSpace = "Fabric", nameWithoutSpace = "Fabric", price = 500, autoSell = false, nameRussian = "ткани", nameRussianForDropdown = "Ткань"},
    {nameWithSpace = "Leather", nameWithoutSpace = "Leather", price = 1500, autoSell = false, nameRussian = "кожи", nameRussianForDropdown = "Кожа"},
    {nameWithSpace = "Meteorite Shard", nameWithoutSpace = "MeteoriteShard", price = 2000, autoSell = false, nameRussian = "осколка метеорита", nameRussianForDropdown = "Осколок метеорита"},
    {nameWithSpace = "Pure Meteorite Shard", nameWithoutSpace = "PureMeteoriteShard", price = 20000, autoSell = false, nameRussian = "чистого осколка метеорита", nameRussianForDropdown = "Чистый осколок метеорита"},
    {nameWithSpace = "Steel Ball", nameWithoutSpace = "SteelBall", price = 3000, autoSell = false, nameRussian = "стального шара", nameRussianForDropdown = "Стальной шар"},
    {nameWithSpace = "Gold Ingot", nameWithoutSpace = "GoldIngot", price = 10000, autoSell = false, nameRussian = "золотого слитка", nameRussianForDropdown = "Золотой слиток"},
    {nameWithSpace = "Steel Ingot", nameWithoutSpace = "SteelIngot", price = 1500, autoSell = false, nameRussian = "стального слитка", nameRussianForDropdown = "Стальной слиток"},
    {nameWithSpace = "Stone", nameWithoutSpace = "Stone", price = 500, autoSell = false, nameRussian = "камня", nameRussianForDropdown = "Камень"},
    {nameWithSpace = "Stone Mask", nameWithoutSpace = "StoneMask", price = 500, autoSell = false, nameRussian = "каменной маски", nameRussianForDropdown = "Каменная маска"},
    {nameWithSpace = "Vampire Blood", nameWithoutSpace = "VampireBlood", price = 6000, autoSell = false, nameRussian = "крови вампира", nameRussianForDropdown = "Кровь вампира"},
    {nameWithSpace = "Wood", nameWithoutSpace = "Wood", price = 500, autoSell = false, nameRussian = "дерева", nameRussianForDropdown = "Дерево"},
    {nameWithSpace = "Locacaca", nameWithoutSpace = "Locacaca", price = 40000, autoSell = false, nameRussian = "локакаки", nameRussianForDropdown = "Локакака"},
    {nameWithSpace = "Arrow", nameWithoutSpace = "Arrow", price = 5000, autoSell = false, nameRussian = "стрелы", nameRussianForDropdown = "Стрела"},
    {nameWithSpace = "Killer Tie", nameWithoutSpace = "KillerTie", price = 20000, autoSell = false, nameRussian = "убийственных галстуков", nameRussianForDropdown = "Убийственный галстук"},
    {nameWithSpace = "Passione Badge", nameWithoutSpace = "PassioneBadge", price = 35000, autoSell = false, nameRussian = "значков Passione", nameRussianForDropdown = "Значок Passione"},
    {nameWithSpace = "Ladybug Brooch", nameWithoutSpace = "LadybugBrooch", price = 35000, autoSell = false, nameRussian = "броши с божьей коровкой", nameRussianForDropdown = "Брошь с божьей коровкой"},
    {nameWithSpace = "Blackmore's Broken Mask", nameWithoutSpace = "BlackmoresBrokenMask", price = 35000, autoSell = false, nameRussian = "разбитой маски Блэкмора", nameRussianForDropdown = "Разбитая маска Блэкмора"},
    {nameWithSpace = "Blackmore's Umbrella", nameWithoutSpace = "BlackmoresUmbrella", price = 35000, autoSell = false, nameRussian = "зонта Блэкмора", nameRussianForDropdown = "Зонт Блэкмора"},
    {nameWithSpace = "Gyro's Teddy Bear", nameWithoutSpace = "GyrosTeddyBear", price = 35000, autoSell = false, nameRussian = "плюшевого мишки Джайро", nameRussianForDropdown = "Плюшевый мишка Джайро"},
    {nameWithSpace = "Horseshoe", nameWithoutSpace = "Horseshoe", price = 35000, autoSell = false, nameRussian = "подков", nameRussianForDropdown = "Подкова"},
}

local function getCashAmount()
    local cashText = cashLabel.Text
    local cashAmount = tonumber(cashText:match("%d+"))
    return cashAmount
end

local function sellItem(item)
    local PlayerName = LocalPlayer.Name
    local A_1 = game:GetService("Workspace"):FindFirstChild(PlayerName)
    local A_2 = item.nameWithSpace
    local A_3 = item.nameWithoutSpace
    local A_4 = "Cash"
    local A_5 = item.price
    local A_6 = 1
    local Event = game:GetService("ReplicatedStorage").Events.ItemSellEvent
    Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6)
end

local function autoSellItems()
    while isRunning and (not useMaxLimit or getCashAmount() < maxCashAmount) do
        for _, item in ipairs(itemsToSell) do
            if item.autoSell and (not useMaxLimit or getCashAmount() < maxCashAmount) then
                sellItem(item)
                wait(0.01)
            end
        end
        wait(0.01)
    end
end

local function checkCashAndSell()
    while isRunning do
        if not useMaxLimit or getCashAmount() < maxCashAmount then
            autoSellItems()
        end
        wait(0.01)
    end
end

Section:NewToggle("Авто продажа", "Вкл/выкл автоматическую продажу.", function(AutoSell)
    isRunning = AutoSell
    if isRunning then
        checkCashAndSell()
    end
end)

Section:NewToggle("Вкл/выкл макс ограничение", "Вкл/выкл максимальное количество получения денег.", function(AmountLimit)
    useMaxLimit = AmountLimit
end)

Section:NewTextBox("Макс ограничение", "Макс количество денег которые можно получить.", function(MaxAmount)
    local newMax = tonumber(MaxAmount)
    if newMax then
        maxCashAmount = newMax
    end
end)

local function updateItemDropdown(dropdown)
    local dropdownItems = {}
    for _, item in ipairs(itemsToSell) do
        local symbol = item.autoSell and "✅" or "❌"
        table.insert(dropdownItems, symbol .. item.nameRussianForDropdown .. symbol)
    end
    dropdown:Refresh(dropdownItems)
end

local function createItemDropdown()
    local dropdownItems = {}
    for _, item in ipairs(itemsToSell) do
        local symbol = item.autoSell and "✅" or "❌"
        table.insert(dropdownItems, symbol .. item.nameRussianForDropdown .. symbol)
    end

    dropdown = Section:NewDropdown("Выберите предметы для продажи", "Выберите предметы для продажи", dropdownItems, function(selected)
        for _, item in ipairs(itemsToSell) do
            local symbol = item.autoSell and "✅" or "❌"
            if symbol .. item.nameRussianForDropdown .. symbol == selected then
                item.autoSell = not item.autoSell
                local newSymbol = item.autoSell and "✅" or "❌"
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Информация",
                    Text = newSymbol .. " Авто продажа для " .. item.nameRussian .. " " .. (item.autoSell and "включена" or "выключена") .. " " .. newSymbol,
                    Duration = 3
                })
                break
            end
        end
        updateItemDropdown(dropdown)
    end)
end

local function toggleAllItems(autoSell)
    for _, item in ipairs(itemsToSell) do
        item.autoSell = autoSell
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "Информация",
        Text = (autoSell and "✅Все предметы выбраны для авто продажи✅" or "❌Все предметы убраны с авто продажи❌"),
        Duration = 3
    })
    updateItemDropdown(dropdown)
end

Section:NewButton("Выбрать всё сразу", "Все предметы из списка выбираются сразу.", function()
    toggleAllItems(true)
end)

Section:NewButton("Убрать все сразу", "Все предметы из списка снимаются сразу.", function()
    toggleAllItems(false)
end)

local function initializeUI()
    createItemDropdown()
end

initializeUI()
