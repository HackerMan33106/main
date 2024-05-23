local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Player info", "RJTheme2")

local Tab = Window:NewTab("Player Infomation")
local Section = Tab:NewSection("Player Info")

Section:NewLabel()