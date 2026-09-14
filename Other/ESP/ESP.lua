_G.ESPColor = Color3.fromRGB(255, 255, 255)

local running = false
local highlightCache = {}
local localPlayer = game:GetService("Players").LocalPlayer

local function createHighlight(target, color)
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
    local nameTag = Instance.new("BillboardGui")
    nameTag.Name = "ESPNameTag"
    nameTag.Enabled = true
    nameTag.Size = UDim2.new(0, 200, 0, 50)
    nameTag.AlwaysOnTop = true
    nameTag.StudsOffset = Vector3.new(0, 1.8, 0)
    nameTag.Adornee = target

    local tag = Instance.new("TextLabel", nameTag)
    tag.Name = "Tag"
    tag.BackgroundTransparency = 1
    tag.Position = UDim2.new(0, -50, 0, 0)
    tag.Size = UDim2.new(0, 300, 0, 20)
    tag.TextSize = 15
    tag.TextColor3 = Color3.new(1, 1, 1)
    tag.TextStrokeColor3 = Color3.new(0, 0, 0)
    tag.TextStrokeTransparency = 0.4
    tag.Text = playerName
    tag.Font = Enum.Font.SourceSansBold
    tag.TextScaled = false

    return nameTag
end

local function esp(target, color)
    if target.Character and target.Character.Parent.Name ~= "Map" and target ~= localPlayer then
        if not highlightCache[target] then
            local highlight = createHighlight(target.Character, color)
            highlight.Parent = target.Character
            highlightCache[target] = highlight

            local nameTag = createNameTag(target.Character.Head, target.Name)
            nameTag.Parent = target.Character
        else
            highlightCache[target].FillColor = color
            highlightCache[target].OutlineColor = color
        end
    end
end

local function removeEsp(target)
    if highlightCache[target] then
        highlightCache[target]:Destroy()
        highlightCache[target] = nil

        local nameTag = target.Character and target.Character:FindFirstChild("ESPNameTag")
        if nameTag then
            nameTag:Destroy()
        end
    end
end

local function LoadPlayer(v)
    if v == localPlayer or v.Character.Parent.Name == "Map" then return end

    local function onCharacterAdded(character)
        if running then
            esp(v, _G.ESPColor)
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
end

local function UnloadPlayer(v)
    removeEsp(v)
end

local function EnablePlayerESP()
    running = true

    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        spawn(function()
            LoadPlayer(v)
        end)
    end

    game:GetService("Players").PlayerAdded:Connect(function(v)
        if running then
            LoadPlayer(v)
        end
    end)

    game:GetService("Players").PlayerRemoving:Connect(function(v)
        UnloadPlayer(v)
    end)
end

local function DisablePlayerESP()
    running = false

    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        UnloadPlayer(v)
    end
end

Section:NewToggle("Вкл/выкл ESP на игроков", "Вкл/выкл ESP на игроков", function(ESP)
    if ESP then
        EnablePlayerESP()
    else
        DisablePlayerESP()
    end
end)
