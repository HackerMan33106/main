local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Golden Records V1.5", "RJTheme1")

-- 1 Section Teleporting
local Tab = Window:NewTab("Телепортация")
local Section = Tab:NewSection("Телепорт")

-- Teleport to locations
Section:NewDropdown("Телепорт в локации", "Вы телепортируетесь в другие локации.", {"Stardust Desert", "Eldritch Graveyard", "Woodlands", "Joe's Bar", "Police Station", "Kaz-Mart", "Blissful Respite", "Valley Of The Damned", "The Oasis", "DIOs Mansion", "Cottage", "Lower Kharvid", "Golden State Prison", "Kharvid", "The Highlands", "Peak Of The New Moon", "Forbidden Peak"}, function(lt)
if lt == "Stardust Desert" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1239.9989, 835.596619, -1623.56592, -0.680912614, -4.23435935e-08, -0.732364655, 2.55698769e-08, 1, -8.15911108e-08, 0.732364655, -7.42828874e-08, -0.680912614)
elseif lt == "Eldritch Graveyard" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(715.283936, 772.66095, -1786.20032, -0.932443917, -1.12905916e-08, -0.361314774, 1.88276577e-08, 1, -7.98371076e-08, 0.361314774, -8.12463412e-08, -0.932443917)
elseif lt == "Woodlands" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(450.418152, 754.975952, -1514.48767, -0.900912941, 1.19270034e-08, -0.433999896, 9.57306678e-09, 1, 7.60945706e-09, 0.433999896, 2.70074851e-09, -0.900912941)
elseif lt == "Joe's Bar" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1236.26282, 772.875977, -2048.9436, -0.99690032, -6.81640913e-08, 0.0786750987, -7.37045056e-08, 1, -6.75176466e-08, -0.0786750987, -7.31070742e-08, -0.99690032)
elseif lt == "Police Station" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1374.83752, 773.065979, -1874.60132, -0.618956864, -6.56748043e-08, 0.785425007, -5.72410208e-08, 1, 3.8507924e-08, -0.785425007, -2.11237836e-08, -0.618956864)
elseif lt == "Kaz-Mart" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1589.81982, 772.843811, -2124.2854, -0.605611563, 5.47180834e-09, 0.795760393, -5.33422337e-08, 1, -4.74721809e-08, -0.795760393, -7.11973414e-08, -0.605611563)
elseif lt == "Blissful Respite" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2885.23706, 877.039246, -2084.60449, -0.85909009, 2.65205848e-08, 0.511824369, 9.19536358e-09, 1, -3.63815005e-08, -0.511824369, -2.65485767e-08, -0.85909009)
elseif lt == "Valley Of The Damned" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2759.51978, 827.690186, -2834.84497, -0.107718691, 2.71949592e-08, -0.994181395, -6.32937187e-08, 1, 3.42119399e-08, 0.994181395, 6.66107027e-08, -0.107718691)
elseif lt == "The Oasis" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1740.42224, 754.304565, -2126.21851, -0.229509726, -3.46061988e-08, -0.973306358, 4.46963844e-09, 1, -3.66092578e-08, 0.973306358, -1.27525084e-08, -0.229509726)
elseif lt == "DIOs Mansion" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1922.73401, 826.447144, -1169.94702, 0.462498575, 2.39085418e-09, 0.886620045, -5.7708851e-09, 1, 3.1374417e-10, -0.886620045, -5.26168842e-09, 0.462498575)
elseif lt == "Cottage" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1108.05591, 754.640808, -873.482056, -0.999017298, -3.01524423e-08, -0.0443214923, -3.3209993e-08, 1, 6.82493706e-08, 0.0443214923, 6.96542202e-08, -0.999017298)
elseif lt == "Lower Kharvid" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1830.49866, 839.396973, -1006.06708, 0.010862424, -5.88395217e-08, -0.999940991, -3.09403454e-08, 1, -5.91791007e-08, 0.999940991, 3.15813473e-08, 0.010862424)
elseif lt == "Golden State Prison" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-284.572479, 772.988586, -2076.72021, -0.0278782304, -7.62336416e-09, -0.999611318, -9.03173358e-08, 1, -5.10746156e-09, 0.999611318, 9.01398494e-08, -0.0278782304)
elseif lt == "Kharvid" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2714.46191, 944.055481, -1365.02966, -0.775224686, -1.42873917e-08, -0.631685615, 2.83607515e-09, 1, -2.60984052e-08, 0.631685615, -2.20236362e-08, -0.775224686)
elseif lt == "The Highlands" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2370.8623, 1282.46265, 255.122177, 0.818221867, 2.72186895e-08, 0.574902594, 5.43571099e-09, 1, -5.50811698e-08, -0.574902594, 4.81936233e-08, 0.818221867)
elseif lt == "Peak Of The New Moon" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1956.65125, 2186.00879, 38.3031807, 0.0268582348, -6.85129606e-08, 0.999639273, 2.4432433e-08, 1, 6.78812384e-08, -0.999639273, 2.26004477e-08, 0.0268582348)
elseif lt == "Forbidden Peak" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3364.47827, 1558.37598, -1854.65991, -0.827324212, -2.66625531e-08, -0.561724722, -4.99688078e-08, 1, 2.61299729e-08, 0.561724722, 4.96866726e-08, -0.827324212)
    end
end)

-- Teleport to NPC
Section:NewDropdown("Телепорт к НПС", "Вы телепортируетесь к НПС.", {"Dio Brando", "Officer John", "Skill Purger", "Boss", "Speciality Reroller", "Barista", "Garbageman", "Hobo", "Priest", "Enrico Pucci", "Merchant", "Alchemist", "Vinny", "Archvox", "Prime Fridia", "Fisherman"}, function(npc)
if npc == "Dio Brando" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Dio Brando"].HumanoidRootPart.CFrame
elseif npc == "Officer John" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Officer John"].HumanoidRootPart.CFrame
elseif npc == "Skill Purger" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Skill Purger"].HumanoidRootPart.CFrame
elseif npc == "Boss" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs.Boss.HumanoidRootPart.CFrame
elseif npc == "Speciality Reroller" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Speciality Reroller"].Head.CFrame
elseif npc == "Barista" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs.Barista.HumanoidRootPart.CFrame
elseif npc == "Garbageman" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs.Garbageman.HumanoidRootPart.CFrame
elseif npc == "Hobo" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs.Hobo.HumanoidRootPart.CFrame
elseif npc == "Priest" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs.Priest.HumanoidRootPart.CFrame
elseif npc == "Enrico Pucci" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Enrico Pucci"].HumanoidRootPart.CFrame
elseif npc == "Merchant" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs.Merchant.HumanoidRootPart.CFrame
elseif npc == "Alchemist" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs.Alchemist.HumanoidRootPart.CFrame
elseif npc == "Vinny" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs.Vinny.HumanoidRootPart.CFrame
elseif npc == "Archvox" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs.Archvox.Head.CFrame
elseif npc == "Prime Fridia" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Prime Fridia"].HumanoidRootPart.CFrame
elseif npc == "Fisherman" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").NPCs["Fisherman 2"].HumanoidRootPart.CFrame
    end
end)

-- Teleport to rokakaka trees
Section:NewDropdown("Телепорт к дереву рокакаки", "Вы телепортируетесь к дереву рокакаки.", {"Дерево 1", "Дерево 2", "Дерево 3", "Дерево 4", "Дерево 5", "Дерево 6"}, function(rt)
if rt == "Дерево 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1144.59851, 765.504211, -687.196716, -0.870877743, -1.21682469e-08, -0.491499722, 6.10492457e-09, 1, -3.55745655e-08, 0.491499722, -3.39816673e-08, -0.870877743)
elseif rt == "Дерево 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1126.14307, 769.019104, -652.394226, -0.569854438, 5.42213243e-08, -0.821745694, 4.30509708e-08, 1, 3.61286219e-08, 0.821745694, -1.47888937e-08, -0.569854438)
elseif rt == "Дерево 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1491.41931, 764.752075, -729.650635, 0.300007761, 6.84150763e-08, -0.953936756, -9.78955939e-09, 1, 6.86399133e-08, 0.953936756, -1.12538858e-08, 0.300007761)
elseif rt == "Дерево 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1453.21313, 766.708862, -123.495041, 0.979225576, 3.7545508e-08, 0.202773884, -5.30831414e-08, 1, 7.11869887e-08, -0.202773884, -8.04719988e-08, 0.979225576)
elseif rt == "Дерево 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1445.74438, 764.864746, -157.637665, 0.966194451, 1.78608719e-08, 0.257814407, -3.80548526e-09, 1, -5.50164501e-08, -0.257814407, 5.21754799e-08, 0.966194451)
elseif rt == "Дерево 6" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-636.417419, 766.538391, -918.262573, 0.569859982, 2.63670916e-08, -0.821741819, -1.0599237e-08, 1, 2.47364937e-08, 0.821741819, -5.38650147e-09, 0.569859982)
    end
end)

-- Teleport to trash
Section:NewDropdown("Телепорт к мусору", "Вы телепортируетесь к мусору", {"Мусор 1", "Мусор 2", "Мусор 3", "Мусор 4", "Мусор 5", "Мусор 6", "Мусор 7", "Мусор 8", "Мусор 9", "Мусор 10"}, function(trash)
if trash == "Мусор 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1193.05176, 771.358521, -2026.44385, -0.601351619, 0, 0.798984647, 0, 1, 0, -0.798984647, 0, -0.601351619)
elseif trash == "Мусор 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1561.79712, 752.455383, -1639.07764, -0.790538669, 0, -0.612412214, 0, 1, 0, 0.612412214, 0, -0.790538669)
elseif trash == "Мусор 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1674.78101, 774.22345, -1914.88025, -0.790538669, 0, -0.612412214, 0, 1, 0, 0.612412214, 0, -0.790538669)
elseif trash == "Мусор 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1153.06604, 753.276978, -1620.0564, 0.051210165, 0, 0.998687863, 0, 1, 0, -0.998687863, 0, 0.051210165)
elseif trash == "Мусор 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-855.703674, 751.294983, -2212.13696, 0.10996455, -0, -0.993935525, 0, 1, -0, 0.993935525, 0, 0.10996455)
elseif trash == "Мусор 6" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-641.170105, 751.294983, -1601.64636, 0.999967754, 0, 0.00802788325, 0, 1, 0, -0.00802788325, 0, 0.999967754)
elseif trash == "Мусор 7" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1994.94299, 753.174194, -1709.40039, 0.999967754, 0, 0.00802788325, 0, 1, 0, -0.00802788325, 0, 0.999967754)
elseif trash == "Мусор 8" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1559.79199, 770.79718, -2179.97974, -0.481579065, 0, -0.876402736, 0, 1, 0, 0.876402736, 0, -0.481579065)
elseif trash == "Мусор 9" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1353.31006, 771.358521, -2246.54639, -0.481579065, 0, -0.876402736, 0, 1, 0, 0.876402736, 0, -0.481579065)
elseif trash == "Мусор 10" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-885.841736, 753.264648, -1453.20496, -0.481579065, 0, -0.876402736, 0, 1, 0, 0.876402736, 0, -0.481579065)
    end
end)

-- Teleport to meteorite
Section:NewDropdown("Телепорт к метеориту", "Вы телепортируетесь к метеориту", {"Метеорит 1", "Метеорит 2", "Метеорит 3", "Метеорит 4", "Метеорит 5"}, function(mt)
if mt == "Метеорит 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-923.728027, 770, -1589.0155, 1, 0, 0, 0, 1, 0, 0, 0, 1)
elseif mt == "Метеорит 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1101.24451, 790, -2031.63721, 1, 0, 0, 0, 1, 0, 0, 0, 1)
elseif mt == "Метеорит 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1918.07471, 770, -2048.55396, 1, 0, 0, 0, 1, 0, 0, 0, 1)
elseif mt == "Метеорит 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-805.054932, 770, -1760.53772, 1, 0, 0, 0, 1, 0, 0, 0, 1)
elseif mt == "Метеорит 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1370.75806, 785, -1734.08545, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end
end)

-- Teleport to blight geode
Section:NewDropdown("Телепорт к ослепительному камню", "Вы телепортируетесь к ослепительному камню.", {"Блестящий геод 1", "Блестящий геод 2", "Блестящий геод 3", "Блестящий геод 4", "Блестящий геод 5", "Блестящий геод 6"}, function(bg)
if bg == "Блестящий геод 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1439.32947, 837, -882.814514, 0.41675356, -0.000575092039, -0.909019351, 0.00141216966, 0.999998987, 1.47799701e-05, 0.909018397, -0.00128984905, 0.416753978)
elseif bg == "Блестящий геод 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1807.35632, 914, -729.803772, -0.992264271, 8.93411998e-05, 0.124143414, 1.29116597e-05, 0.999999821, -0.0006164597, -0.124143444, -0.000610087998, -0.992264092)
elseif bg == "Блестящий геод 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2010.83801, 879, -1079.21399, -0.848583698, 0, 0.529061794, 0, 1, 0, -0.529061794, 0, -0.848583698)
elseif bg == "Блестящий геод 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1335.40295, 837, -760.411011, 0.00438994169, 0, 0.999990404, 0, 1, 0, -0.999990404, 0, 0.00438994169)
elseif bg == "Блестящий геод 5" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1700.76404, 906, -523.140015, -0.895974874, 0, 0.444104999, 0, 1, 0, -0.444104999, 0, -0.895974874)
elseif bg == "Блестящий геод 6" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1876.13196, 906, -566.901001, 0.979354441, -0, -0.202150509, 0, 1, -0, 0.202150509, 0, 0.979354441)
    end
end)

-- Teleport to players
Section:NewTextBox("Телепорт к игроку", "Введите ник для телепортации.", function(ply)
    local player = game.Players:FindFirstChild(ply)
    
    if player then
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Ошибка",
            Text = "Игрок не найден",
            Duration = 3
        })
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2 Bosses, Enemies and Dummy
local Tab = Window:NewTab("Боссы и враги")
local Section = Tab:NewSection("Боссы и враги")

-- Teleport to Dummy
Section:NewDropdown("Телепорт к манекенам", "Вы телепортируетесь к манекенам.", {"Манекен 1", "Манекен 2", "Манекен 3", "Манекен 4"}, function(dummy)
if dummy == "Манекен 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Dummy 1"].HumanoidRootPart.CFrame
elseif dummy == "Манекен 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Dummy 2"].HumanoidRootPart.CFrame
elseif dummy == "Манекен 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Dummy 3"].HumanoidRootPart.CFrame
elseif dummy == "Манекен 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies["Dummy 4"].HumanoidRootPart.CFrame
    end
end)

-- Teleport to golems spawn
Section:NewDropdown("Телепорт к спавну голема", "Вы телепортируетесь к спавну голема.", {"Спавн голема 1", "Спавн голема 2", "Спавн голема 3"}, function(gs)
if gs == "Спавн голема 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2785.72046, 985.514282, -1257.67944, 0.93574053, -0, -0.352689117, 0, 1, -0, 0.352689117, 0, 0.93574053)
elseif gs == "Спавн голема 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2422.44556, 982.764282, -1404.69751, 0.93574053, -0, -0.352689117, 0, 1, -0, 0.352689117, 0, 0.93574053)
elseif gs == "Спавн голема 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3181.20532, 1048.01428, -926.75708, 0.93574053, -0, -0.352689117, 0, 1, -0, 0.352689117, 0, 0.93574053)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3 Teleport to items and etc.
local Tab = Window:NewTab("Предметы и остальное")
local Section = Tab:NewSection("Предметы и остальное")

-- Sand pile
Section:NewDropdown("Телепорт к куче песка", "Вы телепортируетесь к куче песка", {"Куча песка 1", "Куча песка 2", "Куча песка 3", "Куча песка 4"}, function(sp)
if sp == "Куча песка 1" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2396.06396, 882.5, -2112.48145, 0.999994814, -0.00149020599, -0.00285724876, 0.00147085183, 0.999976039, -0.00676388619, 0.00286725978, 0.00675964821, 0.999973059)
elseif sp == "Куча песка 2" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2759.68213, 882.5, -2275.11035, -0.731966197, -0.00173868833, -0.681338727, 0.000427788997, 0.999995351, -0.00301143527, 0.681340814, -0.00249573798, -0.731962085)
elseif sp == "Куча песка 3" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2914.19214, 882.5, -2455.7085, 0.0719054341, 0, 0.99741143, 0, 1, 0, -0.99741143, 0, 0.0719054341)
elseif sp == "Куча песка 4" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2170.56641, 948.5, -2047.85132, 0.0760170817, -0, -0.997106493, 0, 1, -0, 0.997106493, 0, 0.0760170817)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4 Section Misc
local Tab = Window:NewTab("Остальное")
local Section = Tab:NewSection("Остальное")

-- Speed
Section:NewSlider("Скорость", "Вы управляете своей скоростью.", 500, 16, function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end)

-- Jump
Section:NewSlider("Сила прыжка", "Вы управляете своей силой прыжка.", 500, 50, function(jump)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jump
end)

-- Hip Height
Section:NewSlider("Высота персонажа", "Вы управляете своей высотой персонажа.", 50, 2, function(height)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = height
end)

-- Gravity
Section:NewSlider("Гравитация", "Вы управляете своей гравитецией.", -1000, 196.2, function(gravity)
    game:GetService("Workspace").Gravity = gravity
end)

-- Suicide 1
Section:NewButton("Самоубийство вариант 1", "Вы умираете.", function()
    game.Players.LocalPlayer.Character.Humanoid.RigType = 0
end)

-- Suicide 2
Section:NewButton("Самоубийство вариант 2", "Вы умираете.", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

-- Save Zone
Section:NewButton("Безопасная зона", "Вы перемещаетесь под землю.", function()
backPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local part = Instance.new("Part")
part.Name = "SafeZone"
part.Size = Vector3.new(10, 1, 10)
part.Anchored = true
part.CanCollide = true
part.CFrame = CFrame.new(5454.37549, 30, 837.117554, 0.977138579, -6.786256e-09, -0.212603286, -3.76957132e-09, 1, -4.92450027e-08, 0.212603286, 4.89206187e-08, 0.977138579)
part.Parent = game.Workspace
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5454.37549, 35, 837.117554, 0.977138579, -6.786256e-09, -0.212603286, -3.76957132e-09, 1, -4.92450027e-08, 0.212603286, 4.89206187e-08, 0.977138579)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
end)

-- Save Zone back
Section:NewButton("Возвращение с безопасной зоны", "Вы перемещаетесь в место где вы переместились в безопасную зону.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = backPos
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)

-- ESP
Section:NewButton("ESP", "Вы теперь видете игроков через стены.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/ESP/main/ESP.lua", true))()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5 Section Fun
local Tab = Window:NewTab("Веселье")
local Section = Tab:NewSection("Веселье")

-- Undressing the players
Section:NewTextBox("Раздевание игрока", "Введите никнейм игрока.", function(utp)
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
            Title = "Ошибка",
            Text = "Игрок не найден",
            Duration = 3
        })
    end
    game:GetService("Workspace")[utp].Shirt:Destroy()
	game:GetService("Workspace")[utp].Pants:Destroy()
    game:GetService("Workspace")[utp]["Shirt Graphic"]:Destroy()
end)

-- Field Of Viev
Section:NewSlider("FOV", "Вы можете контролировать свой FOV.", 120, 1, function(fov)
    game:GetService("Workspace").Camera.FieldOfView = fov
end)

-- Default field of viev
Section:NewButton("Обычный FOV", "Вы ставете себе обычный FOV.", function()
    game:GetService("Workspace").Camera.FieldOfView = 70
end)

-- Sit
Section:NewKeybind("Сесть", "Вы садитесь.", Enum.KeyCode.X, function()
	game.Players.LocalPlayer.Character.Humanoid.Sit = true 
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- 6 Section Settings
-- Settings
local Tab = Window:NewTab("Настройки")
local Section = Tab:NewSection("Настройки")

--
Section:NewButton("Отключение блюра", "Вы отключаете навсегда блюр.", function()
    game.Lighting.Blur:Destroy()
end)

--
Section:NewButton("Отключение коррекции цвета", "Вы навсегда отключаете коррекцию цвета.", function()
    game.Lighting.ColorCorrection:Destroy()
end)

--
Section:NewButton("Удаление облаков", "Вы навсегда удаляете облака.", function()
    game:GetService("Workspace").Terrain.Clouds:Destroy()
end)

--
local function deleteAllHotbris()
    local workspace = game:GetService("Workspace")
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj.Name == "Hotbris" then
            obj:Destroy()
        end
    end
end

Section:NewButton("Ультра оптимизация", "Оптимизирует игру.", function()
    while game:GetService("RunService").RenderStepped:Wait() do
        deleteAllHotbris()
    end
end)

--
Section:NewButton("Включение ужасно плохой графики", "Вы включаете навсегда плохую графику.", function()
    game:GetService("Workspace").Terrain.Clouds.Enabled = false
    game.Lighting.Bloom:Destroy()
    game.Lighting.Blur:Destroy()
    game.Lighting.ColorCorrection:Destroy()
    game.Lighting.DepthOfField:Destroy()
    game.Lighting.SunRays:Destroy()
    game.Lighting.Atmosphere:Destroy()
    while game:GetService("RunService").RenderStepped:Wait() do
        deleteAllHotbris()
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 7 Section Other scripts
-- Other scripts
local Tab = Window:NewTab("Другие скрипты")
local Section = Tab:NewSection("Скрипты")

-- DarkDex
Section:NewDropdown("Выбор версии DarkDex", "Несколько версий DarkDex.", {"DarkDex V4", "DarkDex V3", "DarkDex V1.1.0 Alpha"}, function(dex)
if dex == "DarkDex V4" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V4", true))()
elseif dex == "DarkDex V3" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V3", true))()
elseif dex == "DarkDex V1.1.0 Alpha" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/DarkDex/main/DarkDex-V1.1.0%20Alpha", true))()
    end
end)

-- Infinite Yeild
Section:NewButton("Заинжектить Infinite Yeild", "Вы внедряете Infinite Yeild.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HackerMan33106/Infinite-yeild/main/Infiniteyeild.lua", true))()
end)

-- Your script
Section:NewTextBox("Твой скрипт", "Введите ссылку своего скрипта сюда.", function(uscript)
    loadstring(game:HttpGet(uscript, true))()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 8 Section Credit
-- Credit
local Tab = Window:NewTab("Благодарности")
local Section = Tab:NewSection("Создал HackerMan33105")

Section:NewLabel("Помогал с идеями ---> rusterd")
Section:NewLabel("Сделал гайд по GUI ---> Robojini")
Section:NewButton("Вот дискорд Robojini", "Нажми сюда для копирования ссылки.", function()
    setclipboard("https://discord.gg/E4BdnAXsuE")
end)
Section:NewButton("Вот ютуб канал Robojini", "Нажми сюда для копирования ссылки.", function()
    setclipboard("https://www.youtube.com/@Robojini")
end)
