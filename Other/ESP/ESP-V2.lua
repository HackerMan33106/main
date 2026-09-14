_G.ESPColor = Color3.fromRGB(200, 200, 200)

local running = false
local highlightCache = {}
local nameTagCache = {}
local playerService = game:GetService("Players")
local localPlayer = playerService.LocalPlayer

local function createHighlightPlayer(target, color)
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

local function createNameTag(target, playerName)
    if not target:FindFirstChild("Head") then return end

    local nameTag = Instance.new("BillboardGui")
    nameTag.Name = "ESPNameTag"
    nameTag.Enabled = true
    nameTag.Size = UDim2.new(0, 200, 0, 50)
    nameTag.AlwaysOnTop = true
    nameTag.StudsOffset = Vector3.new(0, 1.5, 0)

    local tag = Instance.new("TextLabel", nameTag)
    tag.Name = "Tag"
    tag.BackgroundTransparency = 1
    tag.Position = UDim2.new(0, -50, 0, -19)
    tag.Size = UDim2.new(0, 300, 0, 20)
    tag.TextSize = 15
    tag.TextColor3 = Color3.new(1, 1, 1)
    tag.TextStrokeColor3 = Color3.new(0, 0, 0)
    tag.TextStrokeTransparency = 0.4
    tag.Text = playerName
    tag.Font = Enum.Font.SourceSansSemibold
    tag.TextScaled = false

    local healthLevelTag = Instance.new("TextLabel", nameTag)
    healthLevelTag.Name = "HealthLevelTag"
    healthLevelTag.BackgroundTransparency = 1
    healthLevelTag.Position = UDim2.new(0, -50, 0, -6)
    healthLevelTag.Size = UDim2.new(0, 300, 0, 40)
    healthLevelTag.TextSize = 15
    healthLevelTag.TextColor3 = Color3.new(1, 1, 1)
    healthLevelTag.TextStrokeColor3 = Color3.new(0, 0, 0)
    healthLevelTag.TextStrokeTransparency = 0.4
    healthLevelTag.Font = Enum.Font.SourceSansSemibold
    healthLevelTag.TextScaled = false
    return nameTag
end

local function updateHealthAndLevel(target)
    if target.Character then
        local nameTag = nameTagCache[target]
        local healthLevelTag = nameTag and nameTag:FindFirstChild("HealthLevelTag")

        if healthLevelTag then
            local level = "N/A"
            local health = "N/A"

            local levelPath = game:GetService("Workspace"):FindFirstChild(target.Name)
            if levelPath and levelPath:FindFirstChild("Head") then
                local head = levelPath.Head
                if head:FindFirstChild("NameTag") then
                    local nameTag = head.NameTag
                    if nameTag:FindFirstChild("HUD") then
                        local hud = nameTag.HUD
                        if hud:FindFirstChild("Level") then
                            level = hud.Level.Text
                        end
                    end
                end
            end

            local healthPath = game:GetService("Workspace"):FindFirstChild(target.Name)
            if healthPath then
                local humanoid = healthPath:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    health = tostring(math.floor(humanoid.Health))
                end
            end

            healthLevelTag.Text = "Health: " .. health .. "\nLevel: " .. level
        end
    end
end

local function esp(target, color)
    if target.Character and running and target ~= localPlayer and target.Character.Parent.Name ~= "Map" then
        if not highlightCache[target] then
            local highlight = createHighlightPlayer(target.Character, color)
            highlight.Parent = target.Character
            highlightCache[target] = highlight
        else
            highlightCache[target].FillColor = color
            highlightCache[target].OutlineColor = color
        end

        if not nameTagCache[target] then
            local nameTag = createNameTag(target.Character.Head, target.Name)
            if nameTag then
                nameTag.Parent = target.Character.Head
                nameTagCache[target] = nameTag
            end
        end
    end
end

local function removeEsp(target)
    if highlightCache[target] then
        highlightCache[target]:Destroy()
        highlightCache[target] = nil
    end

    if nameTagCache[target] then
        nameTagCache[target]:Destroy()
        nameTagCache[target] = nil
    end
end

local function LoadPlayer(v)
    if v == localPlayer or (v.Character and v.Character.Parent.Name == "Map") then return end

    local function onCharacterAdded(character)
        if running then
            esp(v, _G.ESPColor)
            if v.Character:FindFirstChild("Head") and not nameTagCache[v] then
                local nameTag = createNameTag(v.Character.Head, v.Name)
                if nameTag then
                    nameTag.Parent = v.Character.Head
                    nameTagCache[v] = nameTag
                end
            end
        end
    end

    local function onCharacterRemoving(character)
        removeEsp(v)
    end

    v.CharacterAdded:Connect(onCharacterAdded)
    v.CharacterRemoving:Connect(onCharacterRemoving)

    if running then
        esp(v, _G.ESPColor)
    end

    if v.Character then
        updateHealthAndLevel(v)
        if v.Character:FindFirstChild("Head") and not nameTagCache[v] then
            local nameTag = createNameTag(v.Character.Head, v.Name)
            if nameTag then
                nameTag.Parent = v.Character.Head
                nameTagCache[v] = nameTag
            end
        end
    end
end

local function UnloadPlayer(v)
    removeEsp(v)
end

local function EnablePlayerESPV2()
    running = true

    for _, v in pairs(playerService:GetPlayers()) do
        if v ~= localPlayer and (v.Character and v.Character.Parent.Name ~= "Map") then
            spawn(function()
                LoadPlayer(v)
            end)
        end
    end

    playerService.PlayerAdded:Connect(function(v)
        if running and v ~= localPlayer and (v.Character and v.Character.Parent.Name ~= "Map") then
            LoadPlayer(v)
        end
    end)

    playerService.PlayerRemoving:Connect(function(v)
        UnloadPlayer(v)
    end)

    spawn(function()
        while running do
            for _, v in pairs(playerService:GetPlayers()) do
                if v ~= localPlayer and v.Character and v.Character.Parent.Name ~= "Map" then
                    if not highlightCache[v] then
                        esp(v, _G.ESPColor)
                    end
                    updateHealthAndLevel(v)
                end
            end
            wait(1)
        end
    end)

    spawn(function()
        while running do
            for _, v in pairs(playerService:GetPlayers()) do
                if v ~= localPlayer and v.Character and v.Character.Parent.Name ~= "Map" then
                    if not nameTagCache[v] then
                        wait(3)
                        local nameTag = createNameTag(v.Character.Head, v.Name)
                        if nameTag then
                            nameTag.Parent = v.Character.Head
                            nameTagCache[v] = nameTag
                        end
                    end
                end
            end
            wait(1)
        end
    end)
end

local function DisablePlayerESPV2()
    running = false

    for _, v in pairs(playerService:GetPlayers()) do
        UnloadPlayer(v)
    end
end

Section:NewToggle("Вкл/выкл ESP-V2 на игроков", "Он может работать не правильно.", function(ESPV2)
    if ESPV2 then
        EnablePlayerESPV2()
    else
        DisablePlayerESPV2()
    end
end)
