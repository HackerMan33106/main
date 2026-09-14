_G.ChestColors = {
    ["Uncommon Chest"] = Color3.fromRGB(0, 255, 0),
    ["Common Chest"] = Color3.fromRGB(255, 255, 255),
    ["Rare Chest"] = Color3.fromRGB(0, 71, 254),
    ["Mythical Chest"] = Color3.fromRGB(255, 0, 255),
    ["Legendary Chest"] = Color3.fromRGB(255, 215, 0)
}

local running = false

local function createHighlightChest(target, color)
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESPHighlight"
    highlight.Adornee = target
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = color
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = color
    highlight.OutlineTransparency = 0
    return highlight
end

local function createNameTag(chest, color, isOpen)
    local nameTag = Instance.new("BillboardGui")
    nameTag.Name = "ESPNameTag"
    nameTag.Enabled = true
    nameTag.Size = UDim2.new(0, 200, 0, 70)
    nameTag.AlwaysOnTop = true
    nameTag.StudsOffset = Vector3.new(0, 3, 0)
    nameTag.Adornee = chest

    local tag = Instance.new("TextLabel", nameTag)
    tag.Name = "Tag"
    tag.BackgroundTransparency = 1
    tag.Position = UDim2.new(0, -50, 0, 0)
    tag.Size = UDim2.new(0, 300, 0, 40)
    tag.TextSize = 15
    tag.TextColor3 = color
    tag.TextStrokeColor3 = Color3.new(0, 0, 0)
    tag.TextStrokeTransparency = 0.4
    tag.Font = Enum.Font.SourceSansSemibold
    tag.TextScaled = false

    local rewardDisplayName = chest:GetAttribute("RewardDisplayName")
    local rewardAmount = chest:GetAttribute("RewardAmount")
    
    if isOpen then
        tag.Text = "Закрыт\n" .. chest.Name .. "\n" .. rewardDisplayName .. " x" .. tostring(rewardAmount)
    else
        tag.Text = "Открыт\n" .. chest.Name .. "\n" .. rewardDisplayName .. " x" .. tostring(rewardAmount)
    end

    return nameTag
end

local function loadChest(chest)
    if chest and chest:FindFirstChild("WoodTop") then
        local color = _G.ChestColors[chest.Name] or Color3.new(1, 1, 1)
        
        local isOpen = chest.WoodTop.ProximityPrompt.Enabled
        
        local highlight = createHighlightChest(chest, color)
        highlight.Parent = chest

        local nameTag = createNameTag(chest, color, isOpen)
        nameTag.Parent = chest
    end
end

local function unloadChest(chest)
    for _, child in ipairs(chest:GetChildren()) do
        if child:IsA("Highlight") and child.Name == "ESPHighlight" then
            child:Destroy()
        elseif child:IsA("BillboardGui") and child.Name == "ESPNameTag" then
            child:Destroy()
        end
    end
end

local function processChests()
    local chestFolder = game:GetService("Workspace"):FindFirstChild("Chests")
    if chestFolder then
        local spawnedChests = chestFolder:FindFirstChild("SpawnedChests")
        if spawnedChests then
            for _, chest in ipairs(spawnedChests:GetChildren()) do
                if _G.ChestColors[chest.Name] then
                    unloadChest(chest)
                    loadChest(chest)
                else

                end
            end
        else
            
        end
    else
        
    end
end

local espConnection

local function EnableChestESP()
    if running then return end
    running = true
    espConnection = game:GetService("RunService").RenderStepped:Connect(function()
        processChests()
    end)
end

local function DisableChestESP()
    if not running then return end
    running = false
    if espConnection then
        espConnection:Disconnect()
        espConnection = nil
    end
    local chestFolder = game:GetService("Workspace"):FindFirstChild("Chests")
    if chestFolder then
        local spawnedChests = chestFolder:FindFirstChild("SpawnedChests")
        if spawnedChests then
            for _, chest in ipairs(spawnedChests:GetChildren()) do
                unloadChest(chest)
            end
        end
    end
end

Section:NewToggle("Вкл/Выкл ESP на сундуки", "Вкл/Выкл ESP на сундуки", function(CESP)
    if CESP then
        EnableChestESP()
    else
        DisableChestESP()
    end
end)
