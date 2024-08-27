local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Robojini-GUI/main/SpectateGui.lua"))()
local Window = Library.CreateLib("Spectate script 1.1", "RJTheme1")

-- 1 Section Spectate
local Tab = Window:NewTab("Наблюдение")
local Section = Tab:NewSection("Наблюдение")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local isSpectating = false
local spectatePlayer = nil
local originalCameraType = workspace.CurrentCamera.CameraType
local originalCameraSubject = workspace.CurrentCamera.CameraSubject

local function startSpectating(player)
    if not player or not player.Character or not player.Character:FindFirstChild("Humanoid") then
        return
    end
    
    isSpectating = true
    spectatePlayer = player
    originalCameraType = workspace.CurrentCamera.CameraType
    originalCameraSubject = workspace.CurrentCamera.CameraSubject
    
    workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
    workspace.CurrentCamera.CameraSubject = player.Character:FindFirstChild("Humanoid")
end

local function stopSpectating()
    isSpectating = false
    spectatePlayer = nil
    
    workspace.CurrentCamera.CameraType = originalCameraType
    workspace.CurrentCamera.CameraSubject = originalCameraSubject
end

local function toggleSpectate(playerName)
    if isSpectating then
        stopSpectating()
    else
        local player = Players:FindFirstChild(playerName)
        if player then
            startSpectating(player)
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Ошибка",
                Text = "Игрок с ником " .. playerName .. " не найден",
                Duration = 3
            })
        end
    end
end

local playerService = game:GetService("Players")
local workspace = game:GetService("Workspace")
local localPlayer = playerService.LocalPlayer

local function updateDropdown(dropdown)
    local playerNames = {}
    for _, player in pairs(playerService:GetPlayers()) do
        if player ~= localPlayer then
            table.insert(playerNames, player.Name)
        end
    end

    dropdown:Refresh(playerNames, true)
end

local dropdown = Section:NewDropdown("Наблюдать за игроком", "Выберите ник для наблюдения за игроком.", {}, function(selectedPlayer)
    targetPlayer = workspace:FindFirstChild(selectedPlayer)
    if targetPlayer and targetPlayer:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.Scripts.Controls.Enabled = false
        toggleSpectate(selectedPlayer)
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

Section:NewButton("Перестать наблюдать за игроком", "Вы перестаёте наблюдать за игроком.", function()
    game.Players.LocalPlayer.Character.Scripts.Controls.Enabled = true
    stopSpectating()
end)

Section:NewButton("Обновление списка игроков", "Обновляется список игроков.", function()
    updateDropdown(dropdown)
end)

timeTP = 0.25
Section:NewTextBox("Задержка телепорта к игроку", "Введите время в секундах.", function(timeOut)
    timeTP = timeOut
end)

Section:NewButton("Перестать наблюдать и телепортироваться.", "Вы телепортируетесь к игроку прекращая наблюдать.", function()
    game.Players.LocalPlayer.Character.Scripts.Controls.Enabled = true
    stopSpectating()
    wait(timeTP)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.HumanoidRootPart.CFrame
end)
