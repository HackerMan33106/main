local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/GUIs/main/GUI.lua"))()
local Window = Library.CreateLib("Roblox Is Unbreakable V1.1 - Golden Wind Ru - AutoBuy", "RJTheme1")

-- 1 Section Buying
local Tab = Window:NewTab("Auto purchase")
local Section = Tab:NewSection("Automatic purchase of items")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local isRunning = false
local amount = 1

local itemsToBuy = {
    {name = "StoneMask", autoBuy = false, nameEng = "stone mask", nameEngForDropdown = "Stone Mask"},
    {name = "SteelBall", autoBuy = false, nameEng = "steel ball", nameEngForDropdown = "Steel Ball"},
    {name = "Arrow", autoBuy = false, nameEng = "arrow", nameEngForDropdown = "Arrow"},
    {name = "Locacaca", autoBuy = false, nameEng = "locacaca", nameEngForDropdown = "Locacaca"},
    {name = "RequiemArrow", autoBuy = false, nameEng = "requiem arrow", nameEngForDropdown = "Стрела реквием"}
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

Section:NewToggle("Auto purchase", "On/off automatic purchase.", function(AutoBuy)
    isRunning = AutoBuy
    if isRunning then
        autoBuyItems()
    end
end)

Section:NewTextBox("How much to buy", "The number of items you want to buy.", function(Iamount)
    amount = tonumber(Iamount)
end)

local function updateItemDropdown(dropdown)
    local dropdownItems = {}
    for _, item in ipairs(itemsToBuy) do
        local symbol = item.autoBuy and "✅" or "❌"
        table.insert(dropdownItems, symbol .. item.nameEngForDropdown .. symbol)
    end
end

local function createItemDropdown()
    local dropdownItems = {}
    for _, item in ipairs(itemsToBuy) do
        local symbol = item.autoBuy and "✅" or "❌"
        table.insert(dropdownItems, symbol .. item.nameEngForDropdown .. symbol)
    end

    dropdown = Section:NewDropdown("Select items for purchase", "Select items for purchase", dropdownItems, function(selected)
        for _, item in ipairs(itemsToBuy) do
            local symbol = item.autoBuy and "✅" or "❌"
            if symbol .. item.nameEngForDropdown .. symbol == selected then
                item.autoBuy = not item.autoBuy
                local newSymbol = item.autoBuy and "✅" or "❌"
                local statusText = item.autoBuy and "included" or "off"
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Information",
                    Text = newSymbol .. " Auto purchase for " .. item.nameEng .. " " .. statusText .. " " .. newSymbol,
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
        Title = "Information",
        Text = (autoBuy and "✅All items selected for auto purchase✅" or "❌All items removed from auto purchase❌"),
        Duration = 3
    })
    updateItemDropdown(dropdown)
end

Section:NewButton("Choose everything at once", "All items on the list are selected at once.", function()
    toggleAllItems(true)
end)

Section:NewButton("Take it all out at once", "All items on the list are taken off at once.", function()
    toggleAllItems(false)
end)

local function initializeUI()
    createItemDropdown()
end

initializeUI()
