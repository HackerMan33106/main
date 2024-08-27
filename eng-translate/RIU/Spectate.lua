local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Robojini-GUI/main/SpectateGui.lua"))()
local Window = Library.CreateLib("Spectate script 1.1", "RJTheme1")

-- 1 Section Spectate
local Tab = Window:NewTab("Spectating")
local Section = Tab:NewSection("Spectating")

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
                Title = "Error",
                Text = "The player with the nickname " .. playerName .. " not found",
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

local dropdown = Section:NewDropdown("Spectate for the player", "Select a nickname to spectate for the player.", {}, function(selectedPlayer)
    targetPlayer = workspace:FindFirstChild(selectedPlayer)
    if targetPlayer and targetPlayer:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.Scripts.Controls.Enabled = false
        toggleSpectate(selectedPlayer)
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = "Failed to find the player or its HumanoidRootPart in the workspace",
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

Section:NewButton("Stop spectating the player", "You stop watching the player.", function()
    game.Players.LocalPlayer.Character.Scripts.Controls.Enabled = true
    stopSpectating()
end)

Section:NewButton("Updating the list of players", "The roster of players is being updated.", function()
    updateDropdown(dropdown)
end)

timeTP = 0.25
Section:NewTextBox("Delayed teleport to player", "Enter the time in seconds.", function(timeOut)
    timeTP = timeOut
end)

Section:NewButton("Stop spectate and teleport.", "You teleport to the player and stop watching.", function()
    game.Players.LocalPlayer.Character.Scripts.Controls.Enabled = true
    stopSpectating()
    wait(timeTP)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.HumanoidRootPart.CFrame
end)
