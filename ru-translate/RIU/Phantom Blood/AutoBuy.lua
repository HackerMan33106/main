local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Robojini-GUI/main/GUI.lua"))()
local Window = Library.CreateLib("Roblox Is Unbreakable V1.1 - Phantom Blood Ru - AutoBuy", "RJTheme1")

-- 1 Section Buying
local Tab = Window:NewTab("Авто покупка")
local Section = Tab:NewSection("Автоматическая покупка предметов")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local isRunning = false
local amount = 1

local itemsToBuy = {
    {name = "StoneMask", autoBuy = false, nameRussian = "каменной маски", nameRussianForDropdown = "Каменная маска"},
    {name = "SteelBall", autoBuy = false, nameRussian = "стального шара", nameRussianForDropdown = "Стальной шар"},
    {name = "Arrow", autoBuy = false, nameRussian = "стрелы", nameRussianForDropdown = "Стрела"},
    {name = "Locacaca", autoBuy = false, nameRussian = "локакаки", nameRussianForDropdown = "Локакака"},
    {name = "RequiemArrow", autoBuy = false, nameRussian = "реквием стрелы", nameRussianForDropdown = "Стрела реквием"}
}

local function buyItem(item)
    local PlayerName = LocalPlayer.Name
    local A_1 = game:GetService("Workspace"):FindFirstChild(PlayerName)
    local A_2 = item.name
    local A_3 = amount
    local Event = game:GetService("ReplicatedStorage").Events.ItemBuyEvent
    Event:FireServer(A_1, A_2, A_3)
end

local function autoBuyItems()
    while isRunning do
        for _, item in ipairs(itemsToBuy) do
            if item.autoBuy then
                buyItem(item)
                wait(0.01)
            end
        end
        wait(0.20)
    end
end

Section:NewToggle("Авто покупка", "Вкл/выкл автоматическую покупку.", function(AutoBuy)
    isRunning = AutoBuy
    if isRunning then
        autoBuyItems()
    end
end)

Section:NewTextBox("Сколько купить", "Количество предметов которое вы хотите купить.", function(Iamount)
    amount = tonumber(Iamount)
end)

local function updateItemDropdown(dropdown)
    local dropdownItems = {}
    for _, item in ipairs(itemsToBuy) do
        local symbol = item.autoBuy and "✅" or "❌"
        table.insert(dropdownItems, symbol .. item.nameRussianForDropdown .. symbol)
    end
end

local function createItemDropdown()
    local dropdownItems = {}
    for _, item in ipairs(itemsToBuy) do
        local symbol = item.autoBuy and "✅" or "❌"
        table.insert(dropdownItems, symbol .. item.nameRussianForDropdown .. symbol)
    end

    dropdown = Section:NewDropdown("Выберите предметы для покупки", "Выберите предметы для покупки", dropdownItems, function(selected)
        for _, item in ipairs(itemsToBuy) do
            local symbol = item.autoBuy and "✅" or "❌"
            if symbol .. item.nameRussianForDropdown .. symbol == selected then
                item.autoBuy = not item.autoBuy
                local newSymbol = item.autoBuy and "✅" or "❌"
                local statusText = item.autoBuy and "включена" or "выключена"
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Информация",
                    Text = newSymbol .. " Авто покупка для " .. item.nameRussian .. " " .. statusText .. " " .. newSymbol,
                    Duration = 3
                })
                updateItemDropdown(dropdown)
                break
            end
        end
    end)
end

local function toggleAllItems(autoBuy)
    for _, item in ipairs(itemsToBuy) do
        item.autoBuy = autoBuy
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "Информация",
        Text = (autoBuy and "✅Все предметы выбраны для авто покупки✅" or "❌Все предметы убраны с авто покупки❌"),
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
