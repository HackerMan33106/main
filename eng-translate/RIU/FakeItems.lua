local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/GUIs/main/GUI.lua"))()
local Window = Library.CreateLib("Roblox Is Unbreakable V1.6 - Phantom Blood Ru", "RJTheme1")

-- 1 Section number of items
local Tab = Window:NewTab("Number of items")
local Section = Tab:NewSection("Select the number of items you want\nto give yourself.")

Value = 1
Section:NewTextBox("Type in the number", "This number affects how many items you get in 1 click.", function(V)
    Value = V
end)

-- 2 Section add items
local Tab = Window:NewTab("Add items")
local Section = Tab:NewSection("Add fake items")
        
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
        Section:NewButton("Add item: " .. attribute.name, "When you press the button, you are given the \n   selected item.", function()
            local currentCount = Inventory:GetAttribute(attribute.name) or 0
            Inventory:SetAttribute(attribute.name, currentCount + Value)
        end)
    end
else
    Section:NewLabel("The 'Inventory' folder has had its name or\n location changed.")
end

-- 3 Section delete items
local Tab = Window:NewTab("Remove items")
local Section = Tab:NewSection("Removing fake items")
        
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
        Section:NewButton("Remove item: " .. attribute.name, "When you press the button, the selected item\n   is removed.", function()
            local currentCount = Inventory:GetAttribute(attribute.name) or 0
            Inventory:SetAttribute(attribute.name, currentCount - Value)
        end)
    end
else
    Section:NewLabel("The 'Inventory' folder has had its name or\n location changed.")
end
