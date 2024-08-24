local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Robojini-GUI/main/GUI.lua"))()
local Window = Library.CreateLib("Roblox Is Unbreakable V1.3 - Golden Wind Ru - AutoFarm", "RJTheme7")

-- 1 Section Enemy AutoFarm
local Tab = Window:NewTab("Авто фарм врагов")
local Section = Tab:NewSection("Авто фарм")

local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
local humanoid = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid')

local isEnabled = false
local selectedEnemy = nil
local initialPosition = nil
local targetCFrame = CFrame.new(933.573914, 552.094543, -999.070801, -0.97075057, 2.71007434e-06, -0.240090311, -5.90356876e-06, 1, 3.51574672e-05, 0.240090311, 3.55465199e-05, -0.97075057)
local maxKills = 10
local isReturnEnabled = true
local checkHeightTriggered = false
local standAuraChecked = false

local abilities = {
    "Vampiric Barrage", "Vaporization Freeze", "Vine Whip", 
    "Arrow Stab", "Banana", "Arm Crusher", "Barrage", "Heavy Punch", "Light Punch Stand", 
    "Only One Punch", "Stand Kick", "Rainstorm", "Rain Barrier", 
    "Ground Slam", "I've Already Healed You", "Rock Trap", "Chop", "Dimensional Clone", 
    "Flag Slam", "Guess Who's Back", "Love Train", "7 Page Muda", "Frog Summon", 
    "Heal", "Return To Zero", "Nullify", "Bomb Plant", "Detonate", "Impale", 
    "Sheer Heart Attack", "Bites the Dust", "No Witnesses", "Heavenly Smite", 
    "Wound Stitch", "Scissors", "Scalpels", "Scalpel Slash", "Razors", "Blade Generation", 
    "Armor Shed", "Cycle Slash", "Heavy Rapier Slash", "Thousand Cuts", "3 Page Ora", 
    "Leg Crusher", "Beatdown", "Ari Beatdown", "Arm Extend", "Head Detach", 
    "Shin Kick", "Herbal Tea", "Arigato, Gyro.", "Melt Your Heart", "Disc Extraction"
}

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

    delay(1, function()
        model:Destroy()
    end)
end

local function checkHeight()
    targetCFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    while isEnabled do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 1500 then
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

local function findModelsInPlayer()
    local playerModel = game:GetService("Workspace"):FindFirstChild(player.Name)
    
    if not playerModel then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Ошибка",
            Text = "Игрок не найден",
            Duration = 3
        })
        return
    end
    
    local modelsFound = {}

    for _, object in ipairs(playerModel:GetChildren()) do
        if object:IsA("Model") then
            table.insert(modelsFound, object)
        end
    end

    for _, model in ipairs(modelsFound) do
        if not model:FindFirstChild("StandAura") then
            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Stand Summon", true, false)
            break
        end
    end
end

local function autoFarm()
    if not standAuraChecked then
        findModelsInPlayer()
        standAuraChecked = true
    end
    
    while isEnabled do
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
                            local PlayerName = LocalPlayer.Name
                            local abilityPath = game:GetService("Workspace"):FindFirstChild(PlayerName).Scripts.Controls.Abilities
                            for _, abilityName in ipairs(abilities) do
                                if abilityPath:FindFirstChild(abilityName) then
                                    game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer(abilityName, true, false)
                                end
                            end
                        end
                    end)
                end
                killCountValue.Value = killCountValue.Value + 1

                if killCountValue.Value < maxKills then
                    createBox()
                    task.wait(0.25)
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
                if yPosition < 0 or yPosition > 1500 then
                    humanoidRootPart.CFrame = targetCFrame
                    repeat
                        createBox()
                        task.wait(1)
                        yPosition = humanoidRootPart.Position.Y
                    until yPosition >= 0 and yPosition <= 1500
                    autoFarm()
                end
            end
        end
        task.wait(1)
    end
end

local function updateEnemyList(dropdown)
    local enemyNames = {}
    local uniqueEnemies = {}
    for _, enemy in ipairs(game:GetService("Workspace").NPCs.Hostile:GetChildren()) do
        if enemy:IsA("Model") and not uniqueEnemies[enemy.Name] then
            table.insert(enemyNames, enemy.Name)
            uniqueEnemies[enemy.Name] = true
        end
    end
    dropdown:Refresh(enemyNames)
end

Section:NewToggle("Вкл/выкл авто фарм врагов", "Вкл/выкл автоматический фарм врагов.", function(AFE)
    if AFE then
        if selectedEnemy then
            isEnabled = true
            initialPosition = humanoidRootPart.CFrame
            if killCountValue.Value >= maxKills then
                killCountValue.Value = 0
            end
            spawn(autoFarm)
            spawn(monitorHeight)
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Ошибка",
                Text = "Враг не выбран!",
                Duration = 3
            })
        end
    else
        isEnabled = false
        createBox()
        humanoid:ChangeState('Jumping')
        humanoidRootPart.CFrame = initialPosition
        game.Workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
end)

local enemyDropdown = Section:NewDropdown("Выберите врага", "Выбор врага которого нужно фармить.", {}, function(enemy)
    selectedEnemy = enemy
end)

game.Players.PlayerAdded:Connect(function()
    updateEnemyList(enemyDropdown)
end)

game.Players.PlayerRemoving:Connect(function()
    updateEnemyList(enemyDropdown)
end)

updateEnemyList(enemyDropdown)

Section:NewButton("Перезагрузить список", "Перезагрузка списка врагов.", function()
    updateEnemyList(enemyDropdown)
end)

Section:NewButton("Сбросить выбранного врага", "Сбросить текущего выбранного врага.", function()
    selectedEnemy = nil
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2 Section Player AutoFarm
local Tab = Window:NewTab("Авто фарм игроков")
local Section = Tab:NewSection("Авто фарм")

local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
local humanoid = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid')

local isEnabled = false
local selectedPlayer = nil
local initialPosition = nil
local targetCFrame = CFrame.new(933.573914, 552.094543, -999.070801, -0.97075057, 2.71007434e-06, -0.240090311, -5.90356876e-06, 1, 3.51574672e-05, 0.240090311, 3.55465199e-05, -0.97075057)
local maxKills = 10
local isReturnEnabled = true
local checkHeightTriggered = false

abilities = {
    "Vampiric Barrage", "Vaporization Freeze", "Vine Whip", 
    "Arrow Stab", "Banana", "Arm Crusher", "Barrage", "Heavy Punch", "Light Punch Stand", 
    "Only One Punch", "Stand Kick", "Rainstorm", "Rain Barrier", 
    "Ground Slam", "I've Already Healed You", "Rock Trap", "Chop", "Dimensional Clone", 
    "Flag Slam", "Guess Who's Back", "Love Train", "7 Page Muda", "Frog Summon", 
    "Heal", "Return To Zero", "Nullify", "Bomb Plant", "Detonate", "Impale", 
    "Sheer Heart Attack", "Bites the Dust", "No Witnesses", "Heavenly Smite", 
    "Wound Stitch", "Scissors", "Scalpels", "Scalpel Slash", "Razors", "Blade Generation", 
    "Armor Shed", "Cycle Slash", "Heavy Rapier Slash", "Thousand Cuts", "3 Page Ora", 
    "Leg Crusher", "Beatdown", "Ari Beatdown", "Arm Extend", "Head Detach", 
    "Shin Kick", "Herbal Tea", "Arigato, Gyro.", "Melt Your Heart", "Disc Extraction"
}

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

    delay(1, function()
        model:Destroy()
    end)
end

local function checkHeight()
    targetCFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    while isEnabled do
        if isReturnEnabled then
            if humanoidRootPart then
                local yPosition = humanoidRootPart.Position.Y
                if yPosition < 0 or yPosition > 1500 then
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
    while isEnabled do
        task.wait()

        if selectedPlayer then
            local targetPlayer = game.Players:FindFirstChild(selectedPlayer)
            local currentEnemy = targetPlayer and targetPlayer.Character

            if currentEnemy and currentEnemy:FindFirstChild("HumanoidRootPart") and currentEnemy:FindFirstChildOfClass("Humanoid").Health > 0 then
                while currentEnemy:FindFirstChildOfClass("Humanoid").Health > 0 and isEnabled do
                    task.wait()
                    humanoidRootPart.CFrame = CFrame.new(currentEnemy.HumanoidRootPart.Position + Vector3.new(0, 6, 0), currentEnemy.HumanoidRootPart.Position)
                    game.Workspace.CurrentCamera.CameraSubject = player.Character
                    game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
                    pcall(function()
                        if player:DistanceFromCharacter(currentEnemy.HumanoidRootPart.Position) < 10 then
                            for i = 1, 4 do
                                game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Light Punch", true, false)
                            end
                            game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer("Kick", true, false)
                            local PlayerName = LocalPlayer.Name
                            local abilityPath = game:GetService("Workspace"):FindFirstChild(PlayerName).Scripts.Controls.Abilities
                            for _, abilityName in ipairs(abilities) do
                                if abilityPath:FindFirstChild(abilityName) then
                                    game:GetService("Players").LocalPlayer.Backpack.Events.HotkeyEvent:FireServer(abilityName, true, false)
                                end
                            end
                        end
                    end)
                end
                killCountValue.Value = killCountValue.Value + 1

                if killCountValue.Value < maxKills then
                    createBox()
                    task.wait(0.25)
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
                if yPosition < 0 or yPosition > 1500 then
                    humanoidRootPart.CFrame = targetCFrame
                    repeat
                        createBox()
                        task.wait(1)
                        yPosition = humanoidRootPart.Position.Y
                    until yPosition >= 0 and yPosition <= 1500
                    autoFarm()
                end
            end
        end
        task.wait(1)
    end
end

local function updatePlayerList(dropdown)
    local playerNames = {}
    for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
        if p.Name ~= player.Name then
            table.insert(playerNames, p.Name)
        end
    end
    dropdown:Refresh(playerNames)
end

Section:NewToggle("Вкл/выкл авто фарм игроков", "Вкл/выкл автоматический фарм игроков.", function(AFE)
    if AFE then
        if selectedPlayer then
            isEnabled = true
            initialPosition = humanoidRootPart.CFrame
            if killCountValue.Value >= maxKills then
                killCountValue.Value = 0
            end
            spawn(autoFarm)
            spawn(monitorHeight)
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Ошибка",
                Text = "Игрок не выбран!",
                Duration = 3
            })
        end
    else
        isEnabled = false
        createBox()
        humanoid:ChangeState('Jumping')
        humanoidRootPart.CFrame = initialPosition
        game.Workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
end)

local playerDropdown = Section:NewDropdown("Выберите игрока", "Выбор игрока которого нужно фармить.", {}, function(player)
    selectedPlayer = player
end)

game.Players.PlayerAdded:Connect(function()
    updatePlayerList(playerDropdown)
end)

game.Players.PlayerRemoving:Connect(function()
    updatePlayerList(playerDropdown)
end)

updatePlayerList(playerDropdown)

Section:NewButton("Перезагрузить список", "Перезагрузка списка игроков.", function()
    updatePlayerList(playerDropdown)
end)

Section:NewButton("Сбросить выбранного игрока", "Сбросить текущего выбранного игрока.", function()
    selectedPlayer = nil
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3 Section More Info
local Tab = Window:NewTab("Доп инфо")
local Section = Tab:NewSection("Дополнительная информация")

Section:NewLabel("Если ваш персонаж пропал: Перезайдите на сервер")
Section:NewLabel("")
Section:NewLabel("Помните этот автофарм только бета")
Section:NewLabel("И в нём могут быть баги")
