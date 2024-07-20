local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Robojini-GUI/main/AutoStoryGui.lua"))()
local Window = Library.CreateLib("Roblox Is Unbreakable V1.0 - Phantom Blood Ru - Auto Story", "RJTheme6")

-- 1 Section Auto(Bugged)
local Tab = Window:NewTab("Авто прохождение")
local Section = Tab:NewSection("Авто прохождение 1 части(Баганое)")

-- Chests Auto Farm
local running = false

local function pressE()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    VirtualInputManager:SendKeyEvent(true, "E", false, game)
    wait(0.15)
    VirtualInputManager:SendKeyEvent(false, "E", false, game)
end

local function interactWithChest(chest)
    local FX = chest:FindFirstChild("FX")
    local WoodTop = chest:FindFirstChild("WoodTop")
    if FX and WoodTop then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local proximityPrompt = WoodTop:FindFirstChild("ProximityPrompt")
            if proximityPrompt then
                local isOpen = not proximityPrompt.Enabled
                if not isOpen then
                    proximityPrompt.HoldDuration = 0.01
                    player.Character.HumanoidRootPart.CFrame = FX.CFrame * CFrame.new(0, 2, 0)
                    wait(0.15)
                    pressE()
                end
            end
        end
    end
end

local function teleportToAllChests()
    local chestFolder = game:GetService("Workspace"):FindFirstChild("Chests")
    if not chestFolder then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Ошибка",
            Text = "",
            Duration = 3
        })
        return
    end

    local spawnedChests = chestFolder:FindFirstChild("SpawnedChests")
    if not spawnedChests then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Ошибка",
            Text = "",
            Duration = 3
        })
        return
    end

    while running do
        for _, chest in ipairs(spawnedChests:GetChildren()) do
            interactWithChest(chest)
            if not running then break end
        end
        wait(0.20)
    end
end

local function enableChestAutoFarm()
    running = true
    spawn(function()
        teleportToAllChests()
    end)
    spawn(function()
        wait(10)
        running = false
    end)
end

-- Item Auto Sell
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

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
    {nameWithSpace = "Fabric", nameWithoutSpace = "Fabric", price = 500},
    {nameWithSpace = "Leather", nameWithoutSpace = "Leather", price = 1500},
    {nameWithSpace = "Meteorite Shard", nameWithoutSpace = "MeteoriteShard", price = 2000},
    {nameWithSpace = "Pure Meteorite Shard", nameWithoutSpace = "PureMeteoriteShard", price = 20000},
    {nameWithSpace = "Steel Ball", nameWithoutSpace = "SteelBall", price = 3000},
    {nameWithSpace = "Gold Ingot", nameWithoutSpace = "GoldIngot", price = 10000},
    {nameWithSpace = "Steel Ingot", nameWithoutSpace = "SteelIngot", price = 1500},
    {nameWithSpace = "Stone", nameWithoutSpace = "Stone", price = 500},
    {nameWithSpace = "Vampire Blood", nameWithoutSpace = "VampireBlood", price = 6000},
    {nameWithSpace = "Wood", nameWithoutSpace = "Wood", price = 500},
    {nameWithSpace = "Locacaca", nameWithoutSpace = "Locacaca", price = 40000},
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
    while getCashAmount() < 15000 do
        for _, item in ipairs(itemsToSell) do
            sellItem(item)
            wait(0.01)
            if getCashAmount() >= 15000 then break end
        end
    end
end

local function checkCashAndSell()
    delay(10, function()
        isRunning = false
    end)
    while isRunning do
        if getCashAmount() < 11500 then
            autoSellItems()
        end
        wait(1)
    end
end

-- Dio Brando(Teen) Auto Farm
local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")

local isEnabled = false
local selectedEnemy = "Dio Brando (Teen)"
local initialPosition = nil
local targetCFrame = CFrame.new(372.002289, 30.8957806, 3871.77686, -0.116508633, -4.07337026e-08, 0.993189692, -9.74306147e-09, 1, 3.98700806e-08, -0.993189692, -5.03149966e-09, -0.116508633)
local maxKills = 1
local isReturnEnabled = true
local checkHeightTriggered = false

local killCountValue = player:FindFirstChild("KillCount")
if not killCountValue then
    killCountValue = Instance.new("IntValue")
    killCountValue.Name = "KillCount"
    killCountValue.Value = 0
    killCountValue.Parent = player
end

local function createBox()
    local workspace = game:GetService("Workspace")
    local model = Instance.new("Model")
    model.Name = "Antifly-model"
    model.Parent = workspace

    local down = Instance.new("Part")
    down.Size = Vector3.new(10, 1, 10)
    down.Anchored = true
    down.Transparency = 1
    down.CanCollide = true
    down.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -7.5, 0)
    down.Parent = model

    local top = Instance.new("Part")
    top.Size = Vector3.new(10, 1, 10)
    top.Anchored = true
    top.Transparency = 1
    top.CanCollide = true
    top.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 7.5, 0)
    top.Parent = model

    local right = Instance.new("Part")
    right.Size = Vector3.new(1, 15, 10)
    right.Anchored = true
    right.Transparency = 1
    right.CanCollide = true
    right.CFrame = humanoidRootPart.CFrame * CFrame.new(5.5, 0, 0)
    right.Parent = model

    local left = Instance.new("Part")
    left.Size = Vector3.new(1, 15, 10)
    left.Anchored = true
    left.Transparency = 1
    left.CanCollide = true
    left.CFrame = humanoidRootPart.CFrame * CFrame.new(-5.5, 0, 0)
    left.Parent = model

    local front = Instance.new("Part")
    front.Size = Vector3.new(10, 15, 1)
    front.Anchored = true
    front.Transparency = 1
    front.CanCollide = true
    front.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -5.5)
    front.Parent = model

    local back = Instance.new("Part")
    back.Size = Vector3.new(10, 15, 1)
    back.Anchored = true
    back.Transparency = 1
    back.CanCollide = true
    back.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 5.5)
    back.Parent = model

    game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Light Punch", true, false)

    delay(1, function()
        model:Destroy()
    end)
end

local function checkHeight()
    while isEnabled and killCountValue.Value < maxKills do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 500 then
                    humanoidRootPart.CFrame = targetCFrame
                    createBox()
                    checkHeightTriggered = true
                end
            end
        end
        task.wait(1)
    end
end

spawn(checkHeight)

local function autoFarm()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(372.002289, 30.8957806, 3871.77686, -0.116508633, -4.07337026e-08, 0.993189692, -9.74306147e-09, 1, 3.98700806e-08, -0.993189692, -5.03149966e-09, -0.116508633)
    
    wait(1)

    while isEnabled and killCountValue.Value < maxKills do
        task.wait()

        if selectedEnemy then
            local enemies = game:GetService("Workspace").NPCs.Hostile:GetChildren()
            local currentEnemy = nil

            for i = 1, #enemies do
                local v = enemies[i]
                if v.Name == selectedEnemy and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                    currentEnemy = v
                    break
                end
            end

            if currentEnemy then
                while currentEnemy:FindFirstChildOfClass("Humanoid").Health > 0 and isEnabled do
                    task.wait()
                    humanoidRootPart.CFrame = CFrame.new(currentEnemy.HumanoidRootPart.Position + Vector3.new(0, 7, 0), currentEnemy.HumanoidRootPart.Position)
                    game.Workspace.CurrentCamera.CameraSubject = player.Character
                    game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
                    pcall(function()
                        if player:DistanceFromCharacter(currentEnemy.HumanoidRootPart.Position) < 10 then
                            for i = 1, 4 do
                                game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Light Punch", true, false)
                            end
                            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Kick", true, false)
                        end
                    end)
                end
                killCountValue.Value = killCountValue.Value + 1

                if killCountValue.Value < maxKills then
                    isEnabled = false
                    createBox()
                    task.wait(0.25)
                    isEnabled = true
                end
            else
                humanoidRootPart.CFrame = initialPosition
                game.Workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
                game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                isEnabled = false
            end
        end
    end
    if killCountValue.Value >= maxKills then
        isEnabled = false
        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        humanoidRootPart.CFrame = targetCFrame
        createBox()
    elseif checkHeightTriggered then
        checkHeightTriggered = false
        autoFarm()
    else
        autoFarm()
    end
end

local function monitorHeight()
    while isEnabled do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 500 then
                    humanoidRootPart.CFrame = targetCFrame
                    repeat
                        createBox()
                        task.wait(1)
                        yPosition = humanoidRootPart.Position.Y
                    until yPosition >= 0 and yPosition <= 500
                    autoFarm()
                end
            end
        end
        task.wait(1)
    end
end

function autoFarmDioBT()
    isEnabled = true
    initialPosition = humanoidRootPart.CFrame
    if killCountValue.Value >= maxKills then
        killCountValue.Value = 0
    end
    spawn(autoFarm)
    spawn(monitorHeight)
end

-- Zombie Auto Farm
local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")

local isEnabled = false
local selectedEnemy = "Zombie"
local initialPosition = nil
local targetCFrame = CFrame.new(-514.219849, 37.8774948, 1061.24097, 0.148308083, 4.02562996e-08, -0.988941193, -1.1931699e-09, 1, 4.0527528e-08, 0.988941193, -4.83058527e-09, 0.148308083)
local maxKills = 10
local isReturnEnabled = true
local checkHeightTriggered = false

local killCountValue = player:FindFirstChild("KillCount")
if not killCountValue then
    killCountValue = Instance.new("IntValue")
    killCountValue.Name = "KillCount"
    killCountValue.Value = 0
    killCountValue.Parent = player
end

local function createBox()
    local workspace = game:GetService("Workspace")
    local model = Instance.new("Model")
    model.Name = "Antifly-model"
    model.Parent = workspace

    local down = Instance.new("Part")
    down.Size = Vector3.new(10, 1, 10)
    down.Anchored = true
    down.Transparency = 1
    down.CanCollide = true
    down.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -7.5, 0)
    down.Parent = model

    local top = Instance.new("Part")
    top.Size = Vector3.new(10, 1, 10)
    top.Anchored = true
    top.Transparency = 1
    top.CanCollide = true
    top.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 7.5, 0)
    top.Parent = model

    local right = Instance.new("Part")
    right.Size = Vector3.new(1, 15, 10)
    right.Anchored = true
    right.Transparency = 1
    right.CanCollide = true
    right.CFrame = humanoidRootPart.CFrame * CFrame.new(5.5, 0, 0)
    right.Parent = model

    local left = Instance.new("Part")
    left.Size = Vector3.new(1, 15, 10)
    left.Anchored = true
    left.Transparency = 1
    left.CanCollide = true
    left.CFrame = humanoidRootPart.CFrame * CFrame.new(-5.5, 0, 0)
    left.Parent = model

    local front = Instance.new("Part")
    front.Size = Vector3.new(10, 15, 1)
    front.Anchored = true
    front.Transparency = 1
    front.CanCollide = true
    front.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -5.5)
    front.Parent = model

    local back = Instance.new("Part")
    back.Size = Vector3.new(10, 15, 1)
    back.Anchored = true
    back.Transparency = 1
    back.CanCollide = true
    back.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 5.5)
    back.Parent = model

    game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Light Punch", true, false)

    delay(1, function()
        model:Destroy()
    end)
end

local function checkHeight()
    while isEnabled and killCountValue.Value < maxKills do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 500 then
                    humanoidRootPart.CFrame = targetCFrame
                    createBox()
                    checkHeightTriggered = true
                end
            end
        end
        task.wait(1)
    end
end

spawn(checkHeight)

local function autoFarm()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-513.754639, 40, 1060.27808, 0.0189703461, -5.61600473e-08, -0.999820054, 1.77890644e-08, 1, -5.58326292e-08, 0.999820054, -1.67266982e-08, 0.0189703461)
    
    wait(1)

    while isEnabled and killCountValue.Value < maxKills do
        task.wait()

        if selectedEnemy then
            local enemies = game:GetService("Workspace").NPCs.Hostile:GetChildren()
            local currentEnemy = nil

            for i = 1, #enemies do
                local v = enemies[i]
                if v.Name == selectedEnemy and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                    currentEnemy = v
                    break
                end
            end

            if currentEnemy then
                while currentEnemy:FindFirstChildOfClass("Humanoid").Health > 0 and isEnabled do
                    task.wait()
                    humanoidRootPart.CFrame = CFrame.new(currentEnemy.HumanoidRootPart.Position + Vector3.new(0, 7, 0), currentEnemy.HumanoidRootPart.Position)
                    game.Workspace.CurrentCamera.CameraSubject = player.Character
                    game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
                    pcall(function()
                        if player:DistanceFromCharacter(currentEnemy.HumanoidRootPart.Position) < 10 then
                            for i = 1, 4 do
                                game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Light Punch", true, false)
                            end
                            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Kick", true, false)
                        end
                    end)
                end
                killCountValue.Value = killCountValue.Value + 1

                if killCountValue.Value < maxKills then
                    isEnabled = false
                    createBox()
                    task.wait(0.25)
                    isEnabled = true
                end
            else
                humanoidRootPart.CFrame = initialPosition
                game.Workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
                game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                isEnabled = false
            end
        end
    end
    if killCountValue.Value >= maxKills then
        isEnabled = false
        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        humanoidRootPart.CFrame = targetCFrame
        createBox()
    elseif checkHeightTriggered then
        checkHeightTriggered = false
        autoFarm()
    else
        autoFarm()
    end
end

local function monitorHeight()
    while isEnabled do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 500 then
                    humanoidRootPart.CFrame = targetCFrame
                    repeat
                        createBox()
                        task.wait(1)
                        yPosition = humanoidRootPart.Position.Y
                    until yPosition >= 0 and yPosition <= 500
                    autoFarm()
                end
            end
        end
        task.wait(1)
    end
end

function autoFarmZombie()
    isEnabled = true
    initialPosition = humanoidRootPart.CFrame
    if killCountValue.Value >= maxKills then
        killCountValue.Value = 0
    end
    spawn(autoFarm)
    spawn(monitorHeight)
end

-- Dio Brando Auto Farm
local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")

local isEnabled = false
local selectedEnemy = "Dio Brando"
local initialPosition = nil
local targetCFrame = CFrame.new(-993.690186, 471.548676, -25.0742912, -0.817308187, 1.50021137e-07, -0.576200724, 8.95156376e-08, 1, 1.33389747e-07, 0.576200724, 5.74415573e-08, -0.817308187)
local maxKills = 1
local isReturnEnabled = true
local checkHeightTriggered = false

local killCountValue = player:FindFirstChild("KillCount")
if not killCountValue then
    killCountValue = Instance.new("IntValue")
    killCountValue.Name = "KillCount"
    killCountValue.Value = 0
    killCountValue.Parent = player
end

local function createBox()
    local workspace = game:GetService("Workspace")
    local model = Instance.new("Model")
    model.Name = "Antifly-model"
    model.Parent = workspace

    local down = Instance.new("Part")
    down.Size = Vector3.new(10, 1, 10)
    down.Anchored = true
    down.Transparency = 1
    down.CanCollide = true
    down.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -7.5, 0)
    down.Parent = model

    local top = Instance.new("Part")
    top.Size = Vector3.new(10, 1, 10)
    top.Anchored = true
    top.Transparency = 1
    top.CanCollide = true
    top.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 7.5, 0)
    top.Parent = model

    local right = Instance.new("Part")
    right.Size = Vector3.new(1, 15, 10)
    right.Anchored = true
    right.Transparency = 1
    right.CanCollide = true
    right.CFrame = humanoidRootPart.CFrame * CFrame.new(5.5, 0, 0)
    right.Parent = model

    local left = Instance.new("Part")
    left.Size = Vector3.new(1, 15, 10)
    left.Anchored = true
    left.Transparency = 1
    left.CanCollide = true
    left.CFrame = humanoidRootPart.CFrame * CFrame.new(-5.5, 0, 0)
    left.Parent = model

    local front = Instance.new("Part")
    front.Size = Vector3.new(10, 15, 1)
    front.Anchored = true
    front.Transparency = 1
    front.CanCollide = true
    front.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -5.5)
    front.Parent = model

    local back = Instance.new("Part")
    back.Size = Vector3.new(10, 15, 1)
    back.Anchored = true
    back.Transparency = 1
    back.CanCollide = true
    back.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 5.5)
    back.Parent = model

    game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Light Punch", true, false)

    delay(1, function()
        model:Destroy()
    end)
end

local function checkHeight()
    while isEnabled and killCountValue.Value < maxKills do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 500 then
                    humanoidRootPart.CFrame = targetCFrame
                    createBox()
                    checkHeightTriggered = true
                end
            end
        end
        task.wait(1)
    end
end

spawn(checkHeight)

local function autoFarm()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-993.690186, 471.548676, -25.0742912, -0.817308187, 1.50021137e-07, -0.576200724, 8.95156376e-08, 1, 1.33389747e-07, 0.576200724, 5.74415573e-08, -0.817308187)
    
    wait(1)

    while isEnabled and killCountValue.Value < maxKills do
        task.wait()

        if selectedEnemy then
            local enemies = game:GetService("Workspace").NPCs.Hostile:GetChildren()
            local currentEnemy = nil

            for i = 1, #enemies do
                local v = enemies[i]
                if v.Name == selectedEnemy and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                    currentEnemy = v
                    break
                end
            end

            if currentEnemy then
                while currentEnemy:FindFirstChildOfClass("Humanoid").Health > 0 and isEnabled do
                    task.wait()
                    humanoidRootPart.CFrame = CFrame.new(currentEnemy.HumanoidRootPart.Position + Vector3.new(0, 7, 0), currentEnemy.HumanoidRootPart.Position)
                    game.Workspace.CurrentCamera.CameraSubject = player.Character
                    game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
                    pcall(function()
                        if player:DistanceFromCharacter(currentEnemy.HumanoidRootPart.Position) < 10 then
                            for i = 1, 4 do
                                game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Light Punch", true, false)
                            end
                            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Kick", true, false)
                            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Vampiric Barrage", true, false)
                            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Vaporization Freeze", true, false)
                        end
                    end)
                end
                killCountValue.Value = killCountValue.Value + 1

                if killCountValue.Value < maxKills then
                    isEnabled = false
                    createBox()
                    task.wait(0.25)
                    isEnabled = true
                end
            else
                humanoidRootPart.CFrame = initialPosition
                game.Workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
                game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                isEnabled = false
            end
        end
    end
    if killCountValue.Value >= maxKills then
        isEnabled = false
        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        humanoidRootPart.CFrame = targetCFrame
        createBox()
    elseif checkHeightTriggered then
        checkHeightTriggered = false
        autoFarm()
    else
        autoFarm()
    end
end

local function monitorHeight()
    while isEnabled do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 500 then
                    humanoidRootPart.CFrame = targetCFrame
                    repeat
                        createBox()
                        task.wait(1)
                        yPosition = humanoidRootPart.Position.Y
                    until yPosition >= 0 and yPosition <= 500
                    autoFarm()
                end
            end
        end
        task.wait(1)
    end
end

function autoFarmDB()
    isEnabled = true
    initialPosition = humanoidRootPart.CFrame
    if killCountValue.Value >= maxKills then
        killCountValue.Value = 0
    end
    spawn(autoFarm)
    spawn(monitorHeight)
end

-- Bruford Auto Farm
local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")

local isEnabled = false
local selectedEnemy = "Bruford"
local initialPosition = nil
local targetCFrame = CFrame.new(-177.923325, 47.4650764, -261.351654, -0.999961376, -9.14478449e-08, -0.00878786668, -9.17719589e-08, 1, 3.64784682e-08, 0.00878786668, 3.7283538e-08, -0.999961376)
local maxKills = 1
local isReturnEnabled = true
local checkHeightTriggered = false

local killCountValue = player:FindFirstChild("KillCount")
if not killCountValue then
    killCountValue = Instance.new("IntValue")
    killCountValue.Name = "KillCount"
    killCountValue.Value = 0
    killCountValue.Parent = player
end

local function createBox()
    local workspace = game:GetService("Workspace")
    local model = Instance.new("Model")
    model.Name = "Antifly-model"
    model.Parent = workspace

    local down = Instance.new("Part")
    down.Size = Vector3.new(10, 1, 10)
    down.Anchored = true
    down.Transparency = 1
    down.CanCollide = true
    down.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -7.5, 0)
    down.Parent = model

    local top = Instance.new("Part")
    top.Size = Vector3.new(10, 1, 10)
    top.Anchored = true
    top.Transparency = 1
    top.CanCollide = true
    top.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 7.5, 0)
    top.Parent = model

    local right = Instance.new("Part")
    right.Size = Vector3.new(1, 15, 10)
    right.Anchored = true
    right.Transparency = 1
    right.CanCollide = true
    right.CFrame = humanoidRootPart.CFrame * CFrame.new(5.5, 0, 0)
    right.Parent = model

    local left = Instance.new("Part")
    left.Size = Vector3.new(1, 15, 10)
    left.Anchored = true
    left.Transparency = 1
    left.CanCollide = true
    left.CFrame = humanoidRootPart.CFrame * CFrame.new(-5.5, 0, 0)
    left.Parent = model

    local front = Instance.new("Part")
    front.Size = Vector3.new(10, 15, 1)
    front.Anchored = true
    front.Transparency = 1
    front.CanCollide = true
    front.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -5.5)
    front.Parent = model

    local back = Instance.new("Part")
    back.Size = Vector3.new(10, 15, 1)
    back.Anchored = true
    back.Transparency = 1
    back.CanCollide = true
    back.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 5.5)
    back.Parent = model

    game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Light Punch", true, false)

    delay(1, function()
        model:Destroy()
    end)
end

local function checkHeight()
    while isEnabled and killCountValue.Value < maxKills do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 500 then
                    humanoidRootPart.CFrame = targetCFrame
                    createBox()
                    checkHeightTriggered = true
                end
            end
        end
        task.wait(1)
    end
end

spawn(checkHeight)

local function autoFarm()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-177.923325, 47.4650764, -261.351654, -0.999961376, -9.14478449e-08, -0.00878786668, -9.17719589e-08, 1, 3.64784682e-08, 0.00878786668, 3.7283538e-08, -0.999961376)
    
    wait(1)

    while isEnabled and killCountValue.Value < maxKills do
        task.wait()

        if selectedEnemy then
            local enemies = game:GetService("Workspace").NPCs.Hostile:GetChildren()
            local currentEnemy = nil

            for i = 1, #enemies do
                local v = enemies[i]
                if v.Name == selectedEnemy and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid").Health > 0 then
                    currentEnemy = v
                    break
                end
            end

            if currentEnemy then
                while currentEnemy:FindFirstChildOfClass("Humanoid").Health > 0 and isEnabled do
                    task.wait()
                    humanoidRootPart.CFrame = CFrame.new(currentEnemy.HumanoidRootPart.Position + Vector3.new(0, 7, 0), currentEnemy.HumanoidRootPart.Position)
                    game.Workspace.CurrentCamera.CameraSubject = player.Character
                    game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
                    pcall(function()
                        if player:DistanceFromCharacter(currentEnemy.HumanoidRootPart.Position) < 10 then
                            for i = 1, 4 do
                                game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Light Punch", true, false)
                            end
                            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Kick", true, false)
                            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Vampiric Barrage", true, false)
                            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Vaporization Freeze", true, false)
                        end
                    end)
                end
                killCountValue.Value = killCountValue.Value + 1

                if killCountValue.Value < maxKills then
                    isEnabled = false
                    createBox()
                    task.wait(0.25)
                    isEnabled = true
                end
            else
                humanoidRootPart.CFrame = initialPosition
                game.Workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
                game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                isEnabled = false
            end
        end
    end
    if killCountValue.Value >= maxKills then
        isEnabled = false
        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        humanoidRootPart.CFrame = targetCFrame
        createBox()
    elseif checkHeightTriggered then
        checkHeightTriggered = false
        autoFarm()
    else
        autoFarm()
    end
end

local function monitorHeight()
    while isEnabled do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 500 then
                    humanoidRootPart.CFrame = targetCFrame
                    repeat
                        createBox()
                        task.wait(1)
                        yPosition = humanoidRootPart.Position.Y
                    until yPosition >= 0 and yPosition <= 500
                    autoFarm()
                end
            end
        end
        task.wait(1)
    end
end

function autoFarmBruford()
    isEnabled = true
    initialPosition = humanoidRootPart.CFrame
    if killCountValue.Value >= maxKills then
        killCountValue.Value = 0
    end
    spawn(autoFarm)
    spawn(monitorHeight)
end

local PlayerName = game:GetService("Players").LocalPlayer.Name
Section:NewButton("Автоматическое прохождение 1 части", "Скрипт автоматически проходит сюжет 1 части.", function()
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar (Teen)"].Scripts.QuestHandler.UpdateEvent:FireServer()
    wait(1)
    autoFarmDioBT()
    wait(1)
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar (Teen)"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
    wait(1)
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar (Mansion)"].Scripts.QuestHandler.UpdateEvent:FireServer()
    wait(1)
    enableChestAutoFarm()
    wait(10)
    spawn(checkCashAndSell)
    game:GetService("Workspace").NPCs.Friendly["Robert E. O. Speedwagon"].Scripts.QuestHandler.UpdateEvent:FireServer("AntidoteStep")
    wait(1)
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar (Mansion)"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
    wait(1)
    game:GetService("Workspace").NPCs.Friendly["Will Zeppeli (Hamon)"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
    wait(1)
    game:GetService("Workspace").NPCs.Friendly["Straizo"].Scripts.QuestHandler.UpdateEvent:FireServer()
    wait(1)
    autoFarmZombie()
    if game.Players.LocalPlayer.KillCount == maxKills then
    game:GetService("Workspace").NPCs.Friendly["Straizo"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
    wait(1)
    game:GetService("Workspace").NPCs.Friendly["Will Zeppeli"].Scripts.QuestHandler.UpdateEvent:FireServer()
    wait(1)
    game:GetService("ReplicatedStorage").Events.ItemBuyEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "StoneMask", 1)
    wait(1)
    game:GetService("ReplicatedStorage").Events.ItemUseEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "Stone Mask", "StoneMask")
    wait(5)
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "Vamp_SuperhumanStrength1", 1, "Attribute", "Speciality")
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerSkills.Speciality.Vampirism["Vamp_VaporizationFreeze"], 2, "BoolValue", "Speciality")
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "Vamp_SuperhumanStrength2", 2, "Attribute", "Speciality")
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "Vamp_SuperhumanStrength3", 3, "Attribute", "Speciality")
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerSkills.Speciality.Vampirism["Vamp_VampiricBarrage"], 3, "BoolValue", "Speciality")
    wait(3)
    autoFarmBruford()
    wait(1)
    game:GetService("Workspace").NPCs.Friendly["Will Zeppeli"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
    wait(1)
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar"].Scripts.QuestHandler.UpdateEvent:FireServer()
    autoFarmDB()
    end
end)

Section:NewButton("Перезапустить авто фарм зомби", "Продолжает авто фарм зомби если он збился.", function()
    autoFarmZombie()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2 Section Semi-Auto 
local Tab = Window:NewTab("Пошаговое прохождение")
local Section = Tab:NewSection("Пошаговое прохождение 1 части")

Section:NewLabel("Если вы не хотите получить баги следуйте заданой")
Section:NewLabel("последовательности кнопок.")

Section:NewButton("Первый квест(Jonathan Joestar (Teen))", "Принятие первого квеста.", function()
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar (Teen)"].Scripts.QuestHandler.UpdateEvent:FireServer()
end)

Section:NewButton("Убить Dio Brando(Teen)", "Автоматически убивает Dio Brando(Teen).", function()
    autoFarmDioBT()
end)

Section:NewButton("Первый квест принять(Jonathan Joestar (Teen)", "Принятие первого квеста.", function()
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar (Teen)"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
end)

Section:NewButton("Второй квест(Jonathan Joestar (Mansion))", "Принятие второго квеста.", function()
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar (Mansion)"].Scripts.QuestHandler.UpdateEvent:FireServer()
end)

Section:NewButton("Авто фарм сундуков и продажа предметов", "Автоматически фармит предметы в сундуках и продаёт их.", function()
    enableChestAutoFarm()
    wait(10)
    spawn(checkCashAndSell)
end)

Section:NewButton("Купить лекарство у Спидвагона", "Купить лекарство у Спидвагона.", function()
    game:GetService("Workspace").NPCs.Friendly["Robert E. O. Speedwagon"].Scripts.QuestHandler.UpdateEvent:FireServer("AntidoteStep")
end)

Section:NewButton("Второй квест принять(Отдать лекарство)", "Принятие второго квеста.", function()
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar (Mansion)"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
end)

Section:NewButton("Поговорить с Will Zeppeli", "Вы принимаете следующий квест.", function()
    game:GetService("Workspace").NPCs.Friendly["Will Zeppeli (Hamon)"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
end)

Section:NewButton("Третий квест(Straizo)", "Принятие третьего квеста.", function()
    game:GetService("Workspace").NPCs.Friendly["Straizo"].Scripts.QuestHandler.UpdateEvent:FireServer()
end)

Section:NewButton("Авто фарм зомби", "Автоматически убивает 10 зомби.", function()
    autoFarmZombie()
end)

Section:NewButton("Третий квест принять(Straizo)", "Принятие третьего квеста.", function()
    game:GetService("Workspace").NPCs.Friendly["Straizo"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
end)

Section:NewButton("Четвёртый квест(Will Zeppeli)", "Принятие чветвёртого квеста.", function()
    game:GetService("Workspace").NPCs.Friendly["Will Zeppeli"].Scripts.QuestHandler.UpdateEvent:FireServer()
end)

Section:NewButton("Покупка и использование каменной маски", "Автоматически покупает и использует каменную маску.", function()
    game:GetService("ReplicatedStorage").Events.ItemBuyEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "StoneMask", 1)
    wait(1)
    game:GetService("ReplicatedStorage").Events.ItemUseEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "Stone Mask", "StoneMask")
    wait(5)
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "Vamp_SuperhumanStrength1", 1, "Attribute", "Speciality")
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerSkills.Speciality.Vampirism["Vamp_VaporizationFreeze"], 2, "BoolValue", "Speciality")
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "Vamp_SuperhumanStrength2", 2, "Attribute", "Speciality")
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), "Vamp_SuperhumanStrength3", 3, "Attribute", "Speciality")
    game:GetService("ReplicatedStorage").Events.SkillUnlockEvent:FireServer(game:GetService("Workspace"):FindFirstChild(PlayerName), game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerSkills.Speciality.Vampirism["Vamp_VampiricBarrage"], 3, "BoolValue", "Speciality")
    wait(3)
end)

Section:NewButton("Авто убийство Bruford", "Автоматически убивает Bruford.", function()
    autoFarmBruford()
end)

Section:NewButton("Четвёртый квест принять(Will Zeppeli)", "Принятие чветвёртого квеста", function()
    game:GetService("Workspace").NPCs.Friendly["Will Zeppeli"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
end)

Section:NewButton("Пятый квест(Jonathan Joestar)", "Принятие пятого квеста", function()
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar"].Scripts.QuestHandler.UpdateEvent:FireServer()
end)

Section:NewButton("Авто убийство Dio Brando", "Принятие пятого квеста", function()
    autoFarmDB()
end)

Section:NewButton("Пятый квест принять(Jonathan Joestar)", "Принятие пятого квеста", function()
    game:GetService("Workspace").NPCs.Friendly["Jonathan Joestar"].Scripts.QuestHandler.UpdateEvent:FireServer(true)
end)
