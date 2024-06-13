local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Stardust Reborn V1.5", "RJTheme1")

-- 1 Section Teleporting
local Tab = Window:NewTab("Teleporting")
local Section = Tab:NewSection("Teleport")

-- Teleport to bosses
Section:NewDropdown("Teleport to bosses", "You teleport to the bosses.", {"DIO", "Diavolo", "Giorno Giovanna", "Chaka"}, function(teleport)
if teleport == "DIO" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive.DIO.HumanoidRootPart.CFrame
elseif teleport == "Diavolo" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive.Diavolo.HumanoidRootPart.CFrame
elseif teleport == "Giorno Giovanna" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Giorno Giovanna"].HumanoidRootPart.CFrame
elseif teleport == "Chaka" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive.Chaka.HumanoidRootPart.CFrame
    end
end)

-- Teleport to NPC
Section:NewDropdown("Teleport to NPC", "You teleport to the NPC.", {"Enrico Pucci", "Jotaro", "VerifiedPixel", "Becca", "TheForgotten0range", "k7rdan", "Shadow DIO", "Goku"}, function(npc)
    if npc == "Enrico Pucci" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC["Enrico Pucci"].HumanoidRootPart.CFrame
elseif npc == "Jotaro" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.Jotaro.HumanoidRootPart.CFrame
elseif npc == "VerifiedPixel" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.VerifiedPixel.HumanoidRootPart.CFrame
elseif npc == "Becca" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.Becca.HumanoidRootPart.CFrame
elseif npc == "TheForgotten0range" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.TheForgotten0range.HumanoidRootPart.CFrame
elseif npc == "k7rdan" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.k7rdan.HumanoidRootPart.CFrame
elseif npc == "Shadow DIO" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC["Shadow DIO"].HumanoidRootPart.CFrame
elseif npc == "Goku" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.NPC.Goku.HumanoidRootPart.CFrame
    end
end)

-- Teleport to dummy
Section:NewDropdown("Teleport to dummy", "You teleport to dummy.", {"Immortal Dummy", "Mortal Dummy", "Block Dummy", "Perfect Block Dummy", "Deflect Dummy", "Barraging Dummy"}, function(dummy)
    if dummy == "Immortal Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Immortal Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Mortal Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Mortal Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Block Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Block Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Perfect Block Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Perfect Block Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Deflect Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Deflect Dummy"].HumanoidRootPart.CFrame
elseif dummy == "Barraging Dummy" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Alive["Barraging Dummy"].HumanoidRootPart.CFrame
    end
end)

-- Teleport to players
Section:NewTextBox("Teleport to players", "Enter nickname for teleport.", function(ply)
    local player = game.Players:FindFirstChild(ply)
    
    if player then
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = "Player not found",
            Duration = 3
        })
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 2 Section Bosses
local Tab = Window:NewTab("Bosses")
local Section = Tab:NewSection("Bosses management")

-- Nic
Section:NewLabel("Nothing here yet :(")

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3 Section Teleport to Items
local Tab = Window:NewTab("Teleporting to items")
local Section = Tab:NewSection("Teleport")

-- Teleport to Arrow
Section:NewButton("Teleport to arrow", "You teleport to the arrow.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items.Arrow.Handle.CFrame
end)

-- Teleport to Rokakaka
Section:NewButton("Teleport to rokakaka", "You teleport to rokakaka.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items.Roka.Handle.CFrame
end)

-- Teleport to Boxing Glove
Section:NewButton("Teleport to boxing gloves", "You teleport to boxing gloves.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items["Boxing Glove"].Handle.CFrame
end)

-- Teleport to Dragon Ball
Section:NewButton("Teleport to dragon ball", "You teleport to dragon ball.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items["Dragon Ball"].Handle.CFrame
end)

-- Teleport to Jotaro's Hat
Section:NewButton("Teleport to Jotaro's hat", "You teleport to Jotaro's hat.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items["Jotaro's Hat"].Handle.CFrame
end)

-- Teleport to Blindfold
Section:NewButton("Teleport to blindfold", "You teleport to blindfold.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Game.Items.Blindfold.Handle.CFrame
end)

-- Teleport to all item spawns
Section:NewButton("Teleport to all item spawns", "You teleport to all item spawns.", function()
local PlayerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5224.83594, 63.1586914, 629.839966, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5299.05664, 62.1586914, 721.594116, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5255.34375, 62.1586914, 666.039307, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5204.03516, 61.1586914, 771.82312, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5212.80811, 61.1586914, 811.497375, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5157.85352, 81.1586914, 851.039307, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5150.58008, 45.1586914, 582.825928, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5150.42773, 69.1586914, 731.281067, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5325.32861, 63.1586914, 771.258789, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlayerPosition
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4 Section items to player
local Tab = Window:NewTab("Items to player")
local Section = Tab:NewSection("Automatic teleportation of items")

-- Arrow
local running = true

local function enableTeleportationToArrow()
    running = true

    while running do
        game:GetService("RunService").RenderStepped:wait()
        local itemsFolder = game:GetService("Workspace"):FindFirstChild("Game")
        if itemsFolder then
            itemsFolder = itemsFolder:FindFirstChild("Items")
        end
        
        if itemsFolder then
            local item = itemsFolder:FindFirstChild("Arrow")
            if item and item:FindFirstChild("Handle") then
            game:GetService("Workspace").Game.Items.Arrow.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end

local function disableTeleportationToArrow()
    running = false
end

Section:NewToggle("Arrows", "Arrows are automatically teleported to you.", function(aar)
    if aar then
        enableTeleportationToArrow()
    else
        disableTeleportationToArrow()
    end
end)

-- Rokakaka
local running = true

local function enableTeleportationToRoka()
    running = true

    while running do
        game:GetService("RunService").RenderStepped:wait()
        local itemsFolder = game:GetService("Workspace"):FindFirstChild("Game")
        if itemsFolder then
            itemsFolder = itemsFolder:FindFirstChild("Items")
        end
        
        if itemsFolder then
            local item = itemsFolder:FindFirstChild("Roka")
            if item and item:FindFirstChild("Handle") then
            game:GetService("Workspace").Game.Items.Roka.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end

local function disableTeleportationToRoka()
    running = false
end

Section:NewToggle("Rokakaka", "Rokakaks are automatically teleported to you.", function(aro)
    if aro then
        enableTeleportationToRoka()
    else
        disableTeleportationToRoka()
    end
end)

-- Boxing Gloves
local running = true

local function enableTeleportationToBG()
    running = true

    while running do
        game:GetService("RunService").RenderStepped:wait()
        local itemsFolder = game:GetService("Workspace"):FindFirstChild("Game")
        if itemsFolder then
            itemsFolder = itemsFolder:FindFirstChild("Items")
        end
        
        if itemsFolder then
            local item = itemsFolder:FindFirstChild("Boxing Glove")
            if item and item:FindFirstChild("Handle") then
            game:GetService("Workspace").Game.Items["Boxing Glove"].Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end

local function disableTeleportationToBG()
    running = false
end

Section:NewToggle("Boxing Gloves", "Boxing gloves are automatically teleported to you.", function(abg)
    if abg then
        enableTeleportationToBG()
    else
        disableTeleportationToBG()
    end
end)

-- Dragon Ball
local running = true

local function enableTeleportationToDB()
    running = true

    while running do
        game:GetService("RunService").RenderStepped:wait()
        local itemsFolder = game:GetService("Workspace"):FindFirstChild("Game")
        if itemsFolder then
            itemsFolder = itemsFolder:FindFirstChild("Items")
        end
        
        if itemsFolder then
            local item = itemsFolder:FindFirstChild("Dragon Ball")
            if item and item:FindFirstChild("Handle") then
            game:GetService("Workspace").Game.Items["Dragon Ball"].Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end

local function disableTeleportationToDB()
    running = false
end

Section:NewToggle("Dragon ball", "A dragon ball is automatically teleported to you.", function(adb)
    if adb then
        enableTeleportationToDB()
    else
        disableTeleportationToDB()
    end
end)

-- Jotaro's Hat
local running = true

local function enableTeleportationToJH()
    running = true

    while running do
        game:GetService("RunService").RenderStepped:wait()
        local itemsFolder = game:GetService("Workspace"):FindFirstChild("Game")
        if itemsFolder then
            itemsFolder = itemsFolder:FindFirstChild("Items")
        end
        
        if itemsFolder then
            local item = itemsFolder:FindFirstChild("Jotaro's Hat")
            if item and item:FindFirstChild("Handle") then
            game:GetService("Workspace").Game.Items["Jotaro's Hat"].Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end

local function disableTeleportationToJH()
    running = false
end

Section:NewToggle("Jotaro's hat", "Jotaro's hat is automatically teleported to you.", function(ajh)
    if ajh then
        enableTeleportationToJH()
    else
        disableTeleportationToJH()
    end
end)

-- Blindfold
local running = true

local function enableTeleportationToB()
    running = true

    while running do
        game:GetService("RunService").RenderStepped:wait()
        local itemsFolder = game:GetService("Workspace"):FindFirstChild("Game")
        if itemsFolder then
            itemsFolder = itemsFolder:FindFirstChild("Items")
        end
        
        if itemsFolder then
            local item = itemsFolder:FindFirstChild("Blindfold")
            if item and item:FindFirstChild("Handle") then
            game:GetService("Workspace").Game.Items["Blindfold"].Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end

local function disableTeleportationToB()
    running = false
end

Section:NewToggle("Blindfold", "A blindfold is automatically teleported to you.", function(ab)
    if ab then
        enableTeleportationToB()
    else
        disableTeleportationToB()
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5 Section Misc
local Tab = Window:NewTab("Misc")
local Section = Tab:NewSection("Misc")

-- Speed
Section:NewSlider("Speed", "You can control your speed.", 500, 16, function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end)

-- Hip Height
Section:NewSlider("Hip Height", "You can control your height.", 50, 0, function(height)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = height
end)

-- Gravity
Section:NewSlider("Gravity", "You can control your gravity.", -1000, 196.2, function(gravity)
    game:GetService("Workspace").Gravity = gravity
end)

-- Suicide
Section:NewButton("Kill yourself", "You are dying.", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

-- Noclip on/off
Section:NewToggle("Noclip", "You can walk through walls, objects, etc.", function(nc)
if nc then
        while game:GetService("RunService").RenderStepped:wait() do
    game.Players.LocalPlayer.Character.Head.CanCollide = false
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
    game.Players.LocalPlayer.Character.Torso.CanCollide = false
    end
    else
        while game:GetService("RunService").RenderStepped:wait() do
    game.Players.LocalPlayer.Character.Head.CanCollide = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
    game.Players.LocalPlayer.Character.Torso.CanCollide = true
end
end
end)

-- Emergency shutdown noclip
Section:NewButton("Emergency shutdown noclip", "In case noclip does not work.", function()
local PlayerPositions = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    wait(1)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlayerPositions
end)

-- Save Zone
Section:NewButton("Save Zone", "You're moving underground.", function()
backPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local part = Instance.new("Part")
part.Name = "SafeZone"
part.Size = Vector3.new(10, 1, 10)
part.Anchored = true
part.CanCollide = true
part.CFrame = CFrame.new(5454.37549, 50, 837.117554, 0.977138579, -6.786256e-09, -0.212603286, -3.76957132e-09, 1, -4.92450027e-08, 0.212603286, 4.89206187e-08, 0.977138579)
part.Parent = game.Workspace
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5454.37549, 55, 837.117554, 0.977138579, -6.786256e-09, -0.212603286, -3.76957132e-09, 1, -4.92450027e-08, 0.212603286, 4.89206187e-08, 0.977138579)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
end)

-- Save Zone back
Section:NewButton("Returning from the safe zone", "You move to a location where you have moved to a safe zone.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = backPos
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)

-- ESP
Section:NewButton("ESP", "You can see the players through the wall.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/ESP/main/ESP.lua", true))()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 6 Section Fun
-- Fun
local Tab = Window:NewTab("Fun")
local Section = Tab:NewSection("Fun")

-- Undressing the players
Section:NewTextBox("Undressing the plr", "Enter nickname to undress.", function(utp)
    local player = game.Players:FindFirstChild(utp)
    
    if player then
        local character = player.Character or player.CharacterAdded:Wait()
        for _, accessory in ipairs(character:GetChildren()) do
            if accessory:IsA("Accessory") then
                accessory:Destroy()
            end
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = "Player not found",
            Duration = 3
        })
    end
    game:GetService("Workspace").Game.Alive[utp].Shirt:Destroy()
	game:GetService("Workspace").Game.Alive[utp].Pants:Destroy()
    game:GetService("Workspace").Game.Alive[utp]["Shirt Graphic"]:Destroy()
end)

-- Field Of Viev
Section:NewSlider("Field Of Viev", "You can control your field of viev.", 120, 1, function(fov)
    game:GetService("Workspace").Camera.FieldOfView = fov
end)

-- Default field of viev
Section:NewButton("Default field of viev", "You set Default field of view.", function()
    game:GetService("Workspace").Camera.FieldOfView = 70
end)

-- Sit
Section:NewKeybind("Sit", "You sit down.", Enum.KeyCode.V, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true 
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 7 Section Settings
-- Settings
local Tab = Window:NewTab("Settings")
local Section = Tab:NewSection("Settings")

Section:NewButton("Turning off blur", "You're turning off blur forever.", function()
    game.Lighting.Blur:Destroy()
end)

Section:NewButton("Disabling color correction", "You permanently disable color correction.", function()
    game.Lighting.ColorCorrection:Destroy()
end)

Section:NewButton("Always daytime", "Endless day.", function()
    game.Lighting.Settings.DayNightCycle.Value = false
end)

Section:NewButton("Cutscene off", "Turning off cutscenes.", function()
    game.Lighting.Settings.Cutscenes.Value = false
end)

Section:NewButton("The inclusion of horribly bad graphics", "You're turning on permanently bad graphics.", function()
    game:GetService("Workspace").Game.Misc:Destroy()
    game:GetService("Workspace").Game.Hitboxes:Destroy()
    game:GetService("Workspace").Game.Effects:Destroy()
    game:GetService("Workspace").Game.DestroyableObjects:Destroy()
    game:GetService("Workspace").Game.Map.Misc["Stupid Water"]:Destroy()
    game.Lighting.Bloom:Destroy()
    game.Lighting.BloomDomainEnd:Destroy()
    game.Lighting.Blur:Destroy()
    game.Lighting.ColorCorrection:Destroy()
    game.Lighting.DepthOfField:Destroy()
    game.Lighting.SunRays:Destroy()
    game.Lighting.Atmosphere:Destroy()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 8 Section Other scripts
-- Other scripts
local Tab = Window:NewTab("Other scripts")
local Section = Tab:NewSection("Scripts")

-- DarkDex
Section:NewDropdown("Selecting a version of DarkDex", "A few versions of DarkDex.", {"DarkDex V4", "DarkDex V3", "DarkDex V1.1.0 Alpha"}, function(dex)
if dex == "DarkDex V4" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V4", true))()
elseif dex == "DarkDex V3" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V3", true))()
elseif dex == "DarkDex V1.1.0 Alpha" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V1.1.0%20Alpha", true))()
    end
end)

-- Infinite Yeild
Section:NewButton("Inject Infinite Yeild", "You inject Infinite Yeild.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Infinite-yeild/main/Infiniteyeild.lua", true))()
end)

-- Your script
Section:NewTextBox("Your script", "Paste the link to your script here.", function(uscript)
	loadstring(game:HttpGet(uscript, true))()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 9 Section Credit
-- Credit
local Tab = Window:NewTab("Credit")
local Section = Tab:NewSection("By HackerMan33105")

Section:NewLabel("Helped with ideas ---> rusterd")
Section:NewLabel("Made a GUI guide ---> Robojini")
Section:NewButton("Here's Robojini's discord", "Click here to copy the link.", function()
    setclipboard("https://discord.gg/E4BdnAXsuE")
end)
Section:NewButton("Here's Robojini's YouTube channel", "Click here to copy the link.", function()
    setclipboard("https://www.youtube.com/@Robojini")
end)
