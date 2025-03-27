local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/GUIs/main/PinfoGUILeft.lua"))()
local Window = Library.CreateLib("Information about player #1", "RJTheme3")

local Tab = Window:NewTab("Player selection")
local Section = Tab:NewSection("Please select the player you want to\nknow information about")
local playerService = game:GetService("Players")
local workspace = game:GetService("Workspace")
local localPlayer = playerService.LocalPlayer
local coreGui = game:GetService("CoreGui")

local function clearWindow()
    for _, gui in pairs(coreGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            local main = gui:FindFirstChild("Main")
            if main then
                local mainSide = main:FindFirstChild("MainSide")
                if mainSide then
                    local tabFrames = mainSide:FindFirstChild("tabFrames")
                    if tabFrames then
                        for _, button in ipairs(tabFrames:GetChildren()) do
                            if button:IsA("TextButton") then
                                if button.Name == "Player selectionTabButton" then
                                    button:Destroy()
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local function updateDropdown(dropdown)
    local playerNames = {}
    for _, player in pairs(playerService:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(playerNames, player.Name)
        end
    end
    
    dropdown:Refresh(playerNames, true)
end

local dropdown = Section:NewDropdown("Player selection", "Select the player you want to find out information about.", {}, function(selectedPlayer)
    local targetPlayer = workspace:FindFirstChild(selectedPlayer)
    if targetPlayer and targetPlayer:FindFirstChild("HumanoidRootPart") then
        clearWindow()
        local PlayerName = selectedPlayer

        local Tab = Window:NewTab("Player")
        local Section = Tab:NewSection("Selected player: " .. PlayerName)
        Section:NewButton("Copy the selected player's nickname", "Click to copy.", function()
            setclipboard(PlayerName)
        end)
        
        local PlayerID = game:GetService("Players"):FindFirstChild(PlayerName).UserId
        Section:NewLabel("Player ID: " .. PlayerID)
        Section:NewButton("Copy the ID of the selected player", "Click to copy.", function()
            setclipboard(PlayerID)
        end)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Ability")
        local Speciality = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Speciality")
        Section = Tab:NewSection("Ability: " .. Speciality)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Stand")
        local Stand = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Stand")
        Section = Tab:NewSection("Stand: " .. Stand)

        local StandSkin = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("StandSkin")
        Section:NewLabel("Skin on stand: " .. StandSkin)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Money")
        local cash = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Cash")
        Section = Tab:NewSection("Amount of money: " .. cash .. "$")

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Stands in the storage")
        local StandInStorage1 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot1_StandSkin")
        Section = Tab:NewSection("Cell 1: " .. StandInStorage1)

        local StandInStorage2 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot2_StandSkin")
        local StandInStorage3 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot3_StandSkin")
        local StandInStorage4 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot4_StandSkin")
        local StandInStorage5 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot5_StandSkin")
        local StandInStorage6 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot6_StandSkin")
        local StandInStorage7 = workspace:FindFirstChild(PlayerName).PlayerStatistics.StandStorage:GetAttribute("Slot7_StandSkin")
        Section:NewLabel("Cell 2: " .. StandInStorage2)
        Section:NewLabel("Cell 3: " .. StandInStorage3)
        Section:NewLabel("Cell 4: " .. StandInStorage4)
        Section:NewLabel("Cell 5: " .. StandInStorage5)
        Section:NewLabel("Cell 6: " .. StandInStorage6)
        Section:NewLabel("Cell 7: " .. StandInStorage7)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("The rest of this info")
        local BannedBefore = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("BannedBefore")
        local banned = BannedBefore and "✅Yes✅" or "❌No❌"
        Section = Tab:NewSection("He's been banned before: " .. banned)

        if banned == "✅Yes✅" then
            local BanReason = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("BanReason")
            Section:NewLabel("Reason for ban: " .. BanReason)
        end

        local CashBoost = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("CashBoost")
        local cashboost = CashBoost and "✅Yes✅" or "❌No❌"
        Section:NewLabel("Boost to money: " .. cashboost)
        if cashboost == "✅Yes✅" then
            local CashBoostTime = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("CashBoostTime")
            Section:NewLabel("It'll still last: " .. CashBoostTime .. " seconds")
        end

        local ExperienceBoost = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("ExperienceBoost")
        local dayOfWeek = os.date("*t").wday
        local experienceboost
        
        if ExperienceBoost == true then
            if dayOfWeek == 6 or dayOfWeek == 7 or dayOfWeek == 1 then
                experienceboost = "Free weekend boost included"
            else
                experienceboost = "✅Yes✅"
            end
        else
            experienceboost = "❌No❌"
        end
        Section:NewLabel("Boost to experience: " .. experienceboost)
        
        local ExperienceBoostTime = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("ExperienceBoostTime")
        if experienceboost == "✅Yes✅" then
        Section:NewLabel("It'll still last: " .. ExperienceBoostTime .. " seconds")
        else
        
        end

        local AccountAge = playerService:FindFirstChild(PlayerName).AccountAge
        local sucday = (AccountAge == 1 and " day" or " days")
        Section:NewLabel("The account exists: " .. AccountAge .. sucday)

        local DashDistance = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("DashDistance")
        Section:NewLabel("Dash length: " .. DashDistance .. "cm")

        local Experience = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Experience")
        Section:NewLabel("Amount of experience: " .. Experience)

        local HealthRegen = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("HealthRegen")
        Section:NewLabel("The amount of HP regenerated: " .. HealthRegen)

        local MaxHealth = workspace:FindFirstChild(PlayerName):FindFirstChild("Humanoid").MaxHealth
        Section:NewLabel("Maximum HP: " .. MaxHealth)

        local JumpPower = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("JumpPower")
        Section:NewLabel("The power of the jump: " .. JumpPower)

        local SprintSpeed = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SprintSpeed")
        Section:NewLabel("Running speed: " .. SprintSpeed)

        local WalkSpeed = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("WalkSpeed")
        Section:NewLabel("Walking speed: " .. WalkSpeed)

        local Level = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Level")
        Section:NewLabel("Level: " .. Level)

        local LoginDay = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("LoginDay")
        Section:NewLabel("Daily Rewards Passed: " .. LoginDay)

        local MaxBlockingHealth = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("MaxBlockingHealth")
        Section:NewLabel("Maximum blocked damage: " .. MaxBlockingHealth)

        local Tokens = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Tokens")
        Section:NewLabel("There are tokens: " .. Tokens)

        local SpawnPoint_PhantomBlood = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SpawnPoint_PhantomBlood")
        Section:NewLabel("The spawn point in Phantom Blood: " .. SpawnPoint_PhantomBlood)

        local SpawnPoint_GoldenWind = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SpawnPoint_GoldenWind")
        Section:NewLabel("The spawn point is in Golden Wind: " .. SpawnPoint_GoldenWind)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Clothes")
        local OutfitHead = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("OutfitHead")
        Section = Tab:NewSection("Head: " .. OutfitHead)

        local OutfitUpper = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("OutfitUpper")
        local OutfitLower = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("OutfitLower")
        local OutfitMisc = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("OutfitMisc")

        Section:NewLabel("Torso: " .. OutfitUpper)
        Section:NewLabel("Legs: " .. OutfitLower)
        Section:NewLabel("Other clothes: " .. OutfitMisc)

        ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[

        local Tab = Window:NewTab("Skill points")
        local SkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SkillPoints")
        Section = Tab:NewSection("Skill points left: " .. SkillPoints)

        local PlayerSkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("PlayerSkillPoints")
        local SpecialitySkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("SpecialitySkillPoints")
        local StandSkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("StandSkillPoints")
        local WeaponSkillPoints = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("WeaponSkillPoints")
        Section:NewLabel("The number of points spent on\n the Player tab: " .. PlayerSkillPoints)
        Section:NewLabel("The number of points spent on\n the Stand tab: " .. StandSkillPoints)
        Section:NewLabel("Number of points spent on\n the Speciality tab: " .. SpecialitySkillPoints)
        Section:NewLabel("The number of points spent on\n the Weapon tab: " .. WeaponSkillPoints)
        Section:NewLabel("Total points: " .. Level)

        --]]
        ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Weapons")
        local Weapon = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("Weapon")
        Section = Tab:NewSection("Weapons: " .. Weapon)

        local WeaponSkin = workspace:FindFirstChild(PlayerName).PlayerStatistics:GetAttribute("WeaponSkin")
        Section:NewLabel("Weapon Skin: " .. WeaponSkin)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Items")
        local Section = Tab:NewSection("Items and their quantity")
        
        local ignoreAttributes = {
            ClassName = true,
            Name = true,
            Parent = true,
            Archivable = true
        }
        
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
                if attribute.value > 0 then
                    Section:NewLabel("Quantity of item: " .. attribute.name .. ": " .. attribute.value)
                end
            end
        else
            Section:NewLabel("The name or location of the 'Inventory' folder\n  has been changed.")
        end

        local Tab = Window:NewTab("Schematics")
        local Section = Tab:NewSection("Schematics and their number")
        
        local Schematics = workspace:FindFirstChild(PlayerName).PlayerStatistics.Inventory:FindFirstChild("Schematics")
        
        if Schematics then
            local attributes = {}
        
            for attributeName, attributeValue in pairs(Schematics:GetAttributes()) do
                if not ignoreAttributes[attributeName] then
                    table.insert(attributes, {name = attributeName, value = attributeValue})
                end
            end
        
            table.sort(attributes, function(a, b)
                return a.name < b.name
            end)
        
            for _, attribute in ipairs(attributes) do
                if attribute.value > 0 then
                    Section:NewLabel("Schematic: " .. attribute.name .. ": " .. attribute.value)
                end
            end
        else
            Section:NewLabel("The name or location of the 'Schematics' folder\n  has been changed.")
        end

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/GUIs/main/PinfoGUIRight.lua"))()
        local Window = Library.CreateLib("Information about player #2", "RJTheme3")

        local Tab = Window:NewTab("Parts of a holy corpse")
        local heartEquipped = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Heart"):GetAttribute("Heart_Equipped")
        local heartMerged = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Heart"):GetAttribute("Heart_Merged")
        
        if heartEquipped and heartMerged then
            heart = "✅Yes✅ ✅Has been used✅"
        elseif heartEquipped then
            heart = "✅Yes✅ ❌Not used❌"
        else
            heart = "❌No❌ ❌Not used❌"
        end
        
        local Section = Tab:NewSection("Heart: " .. heart)
        
        local LeftEye = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("LeftEye"):GetAttribute("LeftEye_Equipped")
        local LeftLeg = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("LeftLeg"):GetAttribute("LeftLeg_Equipped")
        local RightArm = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("RightArm"):GetAttribute("RightArm_Equipped")
        local RightEye = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("RightEye"):GetAttribute("RightEye_Equipped")
        local RightLeg = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("RightLeg"):GetAttribute("RightLeg_Equipped")
        local leftArmEquipped = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("LeftArm"):GetAttribute("LeftArm_Equipped")
        local leftArmMerged = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("LeftArm"):GetAttribute("LeftArm_Merged")
        local ribcageEquipped = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Ribcage"):GetAttribute("Ribcage_Equipped")
        local ribcageMerged = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Ribcage"):GetAttribute("Ribcage_Merged")
        local skullEquipped = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Skull"):GetAttribute("Skull_Equipped")
        local skullMerged = game:GetService("Workspace"):FindFirstChild(PlayerName).PlayerStatistics.Inventory.SaintsCorpse:FindFirstChild("Skull"):GetAttribute("Skull_Merged")

        if leftArmEquipped and leftArmMerged then
            leftarm = "✅Yes✅ ✅Has been used✅"
        elseif leftArmEquipped then
            leftarm = "✅Yes✅ ❌Not used❌"
        else
            leftarm = "❌No❌ ❌Not used❌"
        end
        if LeftEye == true then
            lefteye = "✅Yes✅"
        else
            lefteye = "❌No❌"
        end
        if LeftLeg == true then
            leftleg = "✅Yes✅"
        else
            leftleg = "❌No❌"
        end
        if ribcageEquipped and ribcageMerged then
            ribcage = "✅Yes✅ ✅Has been used✅"
        elseif ribcageEquipped then
            ribcage = "✅Yes✅ ❌Not used❌"
        else
            ribcage = "❌No❌ ❌Not used❌"
        end
        if RightArm == true then
            rightarm = "✅Yes✅"
        else
            rightarm = "❌No❌"
        end
        if RightEye == true then
            righteye = "✅Yes✅"
        else
            righteye = "❌No❌"
        end
        if RightLeg == true then
            rightleg = "✅Yes✅"
        else
            rightleg = "❌No❌"
        end
        if skullEquipped and skullMerged then
            skull = "✅Yes✅ ✅Has been used✅"
        elseif skullEquipped then
            skull = "✅Yes✅ ❌Not used❌"
        else
            skull = "❌No❌ ❌Not used❌"
        end
        Section:NewLabel("Left arm: " .. leftarm)
        Section:NewLabel("Right arm: " .. rightarm)
        Section:NewLabel("Left leg: " .. leftleg)
        Section:NewLabel("Right leg: " .. rightleg)
        Section:NewLabel("Ribs: " .. ribcage)
        Section:NewLabel("Left eye: " .. lefteye)
        Section:NewLabel("Right eye: " .. righteye)
        Section:NewLabel("Skull: " .. skull)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Codes")
        local Section = Tab:NewSection("Entered codes")
        
        local RedeemedCodes = workspace:FindFirstChild(PlayerName).PlayerStatistics:FindFirstChild("RedeemedCodes")
        
        if RedeemedCodes then
            local attributes = {}
        
            for attributeName, attributeValue in pairs(RedeemedCodes:GetAttributes()) do
                if not ignoreAttributes[attributeName] then
                    local cleanedName = attributeName:gsub("^RedeemedCodes_", "")
                    table.insert(attributes, {name = cleanedName, value = attributeValue})
                end
            end
        
            table.sort(attributes, function(a, b)
                return a.name < b.name
            end)
        
            for _, attribute in ipairs(attributes) do
                Section:NewButton("Was entered: " .. attribute.name, "Click to copy.", function()
                    setclipboard(attribute.name)
                end)
            end
        else
            Section:NewLabel("The name or location of the 'RedeemedCodes' folder\n  has been changed.")
        end

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Trials")
        local Trials = workspace:FindFirstChild(PlayerName).PlayerStatistics:FindFirstChild("Trials"):GetAttribute("TrialsUnlocked")
        local trials = Trials and "were unlocked" or "were not unlocked"
        Section = Tab:NewSection("The trials " .. trials)

        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        local Tab = Window:NewTab("Squad")
        local Squad = workspace:FindFirstChild(PlayerName).PlayerStates:GetAttribute("Squad"):gsub("'s Squad", "")
        Section = Tab:NewSection("The player is in a squad: " .. Squad)
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = "Unable to find the player or his HumanoidRootPart in Workspace",
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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Section:NewButton("Update the list of players", "Updates the list of players.", function()
    updateDropdown(dropdown)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Tab = Window:NewTab("Information")
local Section = Tab:NewSection("1. If there is an empty space instead of information,\n   it means that there is no information about them.")
local Section = Tab:NewSection("2. Information is not updated in real-time.\n    This will be added in future updates.")
local Section = Tab:NewSection("3. Viewing points is not working correctly for some reason.\n    This will be fixed in future updates.")
local Section = Tab:NewSection('4. In the other information section, there is an "XP Boost"\n   option,and from Friday to Sunday, it will say')
local Section = Tab:NewSection('"Free Weekend Boost is Enabled". This refers tothe fact\n  that a free XP boost is given in RIU from Friday to Sunday.')
local Section = Tab:NewSection("The option to select yourself as a player is intentionally\n implemented to allow you to learn more information\n about yourself.")
