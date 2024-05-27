local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Player infomation", "RJTheme3")

local PlayerName = game:GetService("Workspace").NameValue.Value

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Tab = Window:NewTab("Selected player")
local Section = Tab:NewSection("Selected player")

Section:NewLabel(PlayerName)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Tab = Window:NewTab("Stand")
local Section = Tab:NewSection("Stand")

local stand = game.Players[PlayerName].Data.Ability.Value
Section:NewLabel(stand)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Tab = Window:NewTab("Cash")
local Section = Tab:NewSection("Amount of money")

local cash = game.Players[PlayerName].Data.Cash.Value
Section:NewLabel(cash)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Tab = Window:NewTab("Stand in storage")
local Section = Tab:NewSection("Stand in storage")

local StandInStorage1 = game.Players[PlayerName].Data["Ability Storage"].Ability_Slot1.Value
local StandInStorage2 = game.Players[PlayerName].Data["Ability Storage"].Ability_Slot2.Value
local StandInStorage3 = game.Players[PlayerName].Data["Ability Storage"].Ability_Slot3.Value
local StandInStorage4 = game.Players[PlayerName].Data["Ability Storage"].Ability_Slot4.Value
local StandInStorage5 = game.Players[PlayerName].Data["Ability Storage"].Ability_Slot5.Value
local StandInStorage6 = game.Players[PlayerName].Data["Ability Storage"].Ability_Slot6.Value
Section:NewLabel(StandInStorage1)
Section:NewLabel(StandInStorage2)
Section:NewLabel(StandInStorage3)
Section:NewLabel(StandInStorage4)
Section:NewLabel(StandInStorage5)
Section:NewLabel(StandInStorage6)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Tab = Window:NewTab("Item in storage")
local Section = Tab:NewSection("Item in storage")

local ItemInStorage1 = game.Players[PlayerName].Data["Item Storage"].Item_Slot1.Value
local ItemInStorage2 = game.Players[PlayerName].Data["Item Storage"].Item_Slot2.Value
local ItemInStorage3 = game.Players[PlayerName].Data["Item Storage"].Item_Slot3.Value
local ItemInStorage4 = game.Players[PlayerName].Data["Item Storage"].Item_Slot4.Value
local ItemInStorage5 = game.Players[PlayerName].Data["Item Storage"].Item_Slot5.Value
local ItemInStorage6 = game.Players[PlayerName].Data["Item Storage"].Item_Slot6.Value
Section:NewLabel(ItemInStorage1)
Section:NewLabel(ItemInStorage2)
Section:NewLabel(ItemInStorage3)
Section:NewLabel(ItemInStorage4)
Section:NewLabel(ItemInStorage5)
Section:NewLabel(ItemInStorage6)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Tab = Window:NewTab("Statistics")
local Section = Tab:NewSection("Murder statistics")

local leaderstats = game.Players[PlayerName].leaderstats["Total Kill"].Value
Section:NewLabel(leaderstats)
