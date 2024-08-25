local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/GUIs/main/GUI.lua"))()
local Window = Library.CreateLib("Roblox Is Unbreakable V1.6 - Phantom Blood Ru", "RJTheme1")

-- 1 Section number of items
local Tab = Window:NewTab("Количество пердметов")
local Section = Tab:NewSection("Выбор количества предмето которые вы \n хотите себе выдать")

Value = 1
Section:NewTextBox("Впешите число", "Это число влияет на то сколько вы получите \n предметов за 1 нажатее.", function(V)
    Value = V
end)

-- 2 Section add items
local Tab = Window:NewTab("Выдать предметы")
local Section = Tab:NewSection("Выдача фейковых предметов")
        
local ignoreAttributes = {
    ClassName = true,
    Name = true,
    Parent = true,
    Archivable = true
}

local PlayerName = game.Players.LocalPlayer.Name
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
        Section:NewButton("Выдать предмет: " .. attribute.name, "При нажатии на кнопку вам выдаётся \n выбранный предмет.", function()
            local currentCount = Inventory:GetAttribute(attribute.name) or 0
            Inventory:SetAttribute(attribute.name, currentCount + Value)
        end)
    end
else
    Section:NewLabel("У папки 'Inventory' было изменено название или\n  её местонахождение.")
end

-- 3 Section delete items
local Tab = Window:NewTab("Убрать предметы")
local Section = Tab:NewSection("Удаление фейковых предметов")
        
local ignoreAttributes = {
    ClassName = true,
    Name = true,
    Parent = true,
    Archivable = true
}

local PlayerName = game.Players.LocalPlayer.Name
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
        Section:NewButton("Убрать предмет: " .. attribute.name, "При нажатии на кнопку у вас убирается \n выбранный предмет.", function()
            local currentCount = Inventory:GetAttribute(attribute.name) or 0
            Inventory:SetAttribute(attribute.name, currentCount - Value)
        end)
    end
else
    Section:NewLabel("У папки 'Inventory' было изменено название или\n  её местонахождение.")
end
