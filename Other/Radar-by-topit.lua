local scriptver = 'v1.3.2'
if ( _G.RadarKill ) then
    _G.RadarKill()
end

if ( not game:IsLoaded() ) then
    game.Loaded:Wait()
end

--- Настройки ---
local existingSettings = _G.RadarSettings or {}
local settings = {
    --- Настройки радара ---
    -- Линии
    RADAR_LINES = true; -- Отображение кольцевых линий и главных направлений 
    RADAR_LINE_DISTANCE = 50; -- Расстояние между каждым кольцевым кругом
    -- Масштаб
    RADAR_SCALE = 1; -- Управляет "приближением" радарного отображения 
    RADAR_RADIUS = 125; -- Размер самого радара
    -- Вращение
    RADAR_ROTATION = true; -- Включает или выключает вращение радара
    SMOOTH_ROT = true; -- Плавное вращение радара
    SMOOTH_ROT_AMNT = 30; -- Чем меньше число, тем плавнее вращение, больше число - более резкое
    -- Прочее
    CARDINAL_DISPLAY = true; -- Отображает четыре главных направления (север, восток, юг, запад) вокруг радара
    
    --- Настройки маркеров ---
    -- Отображение
    DISPLAY_OFFSCREEN = true; -- Отображает маркеры за пределами радара
    DISPLAY_TEAMMATES = true; -- Отображает маркеры союзников
    DISPLAY_TEAM_COLORS = true; -- Отображает маркеры союзников с заданным цветом (измените Team_Marker) или с цветом их команды (включите USE_TEAM_COLORS) 
    DISPLAY_FRIEND_COLORS = true; -- Отображает маркеры друзей с заданным цветом (Friend_Marker). Это имеет приоритет над DISPLAY_TEAM_COLORS и DISPLAY_RGB
    DISPLAY_RGB_COLORS = false; -- Отображает каждый маркер с RGB циклом. Имеет приоритет над DISPLAY_TEAM_COLORS, но не над DISPLAY_FRIEND_COLORS
    -- Масштаб
    MARKER_SCALE_BASE = 1.25; -- Базовый масштаб маркеров
    MARKER_SCALE_MAX = 1.25; -- Максимальный размер маркера
    MARKER_SCALE_MIN = 0.75; -- Минимальный размер маркера
    -- Затухание
    MARKER_FALLOFF = true; -- Влияет на масштаб маркеров в зависимости от расстояния до игрока - обходит SCALE_MIN и SCALE_MAX
    MARKER_FALLOFF_AMNT = 125; -- Начальное расстояние, с которого начинается затухание маркеров 
    -- Прочее
    OFFSCREEN_TRANSPARENCY = 0.3; -- Прозрачность маркеров за пределами радара
    USE_FALLBACK = false; -- Включает "резервный режим" для игр с включенным потоком
    USE_QUADS = true; -- Отображает маркеры на радаре в виде стрелок, а не точек 
    USE_TEAM_COLORS = false; -- Использует цвет команды для цвета маркера
    VISIBLITY_CHECK = false; -- Делает маркеры, которые не видны, слегка прозрачными
    
    --- Тема ---
    RADAR_THEME = {
        -- Радар
        Outline = Color3.fromRGB(35, 35, 45); -- Контур радара
        Background = Color3.fromRGB(25, 25, 35); -- Фон радара
        DragHandle = Color3.fromRGB(50, 50, 255); -- Ручка для перетаскивания 
        
        -- Линии
        Cardinal_Lines = Color3.fromRGB(110, 110, 120); -- Цвет горизонтальных и вертикальных линий
        Distance_Lines = Color3.fromRGB(65, 65, 75); -- Цвет кольцевых линий
        
        -- Маркеры
        Generic_Marker = Color3.fromRGB(255, 25, 115); -- Цвет маркера игрока без команды
        Local_Marker = Color3.fromRGB(115, 25, 255); -- Цвет вашего маркера, независимо от команды
        Team_Marker = Color3.fromRGB(25, 115, 255); -- Цвет маркеров ваших союзников. Используется, когда USE_TEAM_COLORS отключено
        Friend_Marker = Color3.fromRGB(25, 255, 115); -- Цвет маркеров ваших друзей. Используется, когда DISPLAY_FRIEND_COLORS включено 
    };
}

-- fill in missing settings 
for k, v in pairs(existingSettings) do 
    if ( v ~= nil ) then
        settings[k] = v 
    end
end

--- Radar settings 
-- lines 
local RADAR_LINES = settings.RADAR_LINES
local RADAR_LINE_DISTANCE = settings.RADAR_LINE_DISTANCE
-- scale
local RADAR_SCALE = settings.RADAR_SCALE
local RADAR_RADIUS = settings.RADAR_RADIUS
-- rotation
local RADAR_ROTATION = settings.RADAR_ROTATION
local SMOOTH_ROT = settings.SMOOTH_ROT
local SMOOTH_ROT_AMNT = settings.SMOOTH_ROT_AMNT
-- misc
local CARDINAL_DISPLAY = settings.CARDINAL_DISPLAY

--- Marker settings
-- display
local DISPLAY_OFFSCREEN = settings.DISPLAY_OFFSCREEN
local DISPLAY_TEAMMATES = settings.DISPLAY_TEAMMATES
local DISPLAY_TEAM_COLORS = settings.DISPLAY_TEAM_COLORS
local DISPLAY_FRIEND_COLORS = settings.DISPLAY_FRIEND_COLORS
local DISPLAY_RGB_COLORS = settings.DISPLAY_RGB_COLORS
-- scale 
local MARKER_SCALE_BASE = settings.MARKER_SCALE_BASE
local MARKER_SCALE_MAX = settings.MARKER_SCALE_MAX
local MARKER_SCALE_MIN = settings.MARKER_SCALE_MIN
-- falloff 
local MARKER_FALLOFF = settings.MARKER_FALLOFF
local MARKER_FALLOFF_AMNT = settings.MARKER_FALLOFF_AMNT
-- misc 
local OFFSCREEN_TRANSPARENCY = settings.OFFSCREEN_TRANSPARENCY
local USE_FALLBACK = settings.USE_FALLBACK
local USE_QUADS = settings.USE_QUADS
local USE_TEAM_COLORS = settings.USE_TEAM_COLORS
local VISIBLITY_CHECK = settings.VISIBLITY_CHECK

if ( DISPLAY_RGB_COLORS and DISPLAY_TEAM_COLORS ) then
    DISPLAY_TEAM_COLORS = false 
end

--- Theme 
local RADAR_THEME = settings.RADAR_THEME 

--- Services ---
local inputService = game:GetService('UserInputService')
local playerService = game:GetService('Players')
local runService = game:GetService('RunService')
local starterGui = game:GetService('StarterGui')

--- Localization ---
local newV2 = Vector2.new
local newV3 = Vector3.new

local mathSin = math.sin
local mathCos = math.cos
local mathExp = math.exp

--- Important tables ---
local scriptCns = {}
local radarObjects = {}

--- Other variables
local markerScale = math.clamp(RADAR_SCALE, MARKER_SCALE_MIN, MARKER_SCALE_MAX) * MARKER_SCALE_BASE
local scaleVec = newV2(markerScale, markerScale)

local quadPointA = newV2(0, 5)   * scaleVec
local quadPointB = newV2(4, -5)  * scaleVec
local quadPointC = newV2(0, -3)  * scaleVec
local quadPointD = newV2(-4, -5) * scaleVec

--- Drawing setup ---
local drawObjects = {}
local function newDrawObj(objectClass, objectProperties) -- this method is cringe but it's easy to work with 
    local obj = Drawing.new(objectClass)
    table.insert(drawObjects, obj)
    
    for i, v in pairs(objectProperties) do
        obj[i] = v
    end

    objectProperties = nil
    return obj
end

-- Drawing tween function 
local tweenExp, tweenQuad do -- obj property dest time 
    local function numLerp(a, b, c) -- skidded from wikipedia (😱😱)
        return (1 - c) * a + c * b
    end
    
    local tweenTypes = {}
    tweenTypes.Vector2 = Vector2.zero.Lerp
    tweenTypes.number = numLerp
    tweenTypes.Color3 = Color3.new().Lerp
    
    -- https://easings.net is useful for easing funcs
    
    function tweenExp(obj, property, dest, duration) 
        task.spawn(function()
            local initialVal = obj[property]
            local tweenTime = 0
            local lerpFunc = tweenTypes[typeof(dest)]
            
            while ( tweenTime < duration ) do 
                
                obj[property] = lerpFunc(initialVal, dest, 1 - math.pow(2, -10 * tweenTime / duration))
                
                local deltaTime = task.wait()
                tweenTime += deltaTime
            end

            obj[property] = dest
        end)
    end
    
    function tweenQuad(obj, property, dest, duration, func) 
        task.spawn(function()
            local initialVal = obj[property]
            local tweenTime = 0
            local lerpFunc = tweenTypes[typeof(dest)]
            
            while ( tweenTime < duration ) do 
                obj[property] = lerpFunc(initialVal, dest, 1 - (1 - tweenTime / duration) * (1 - tweenTime / duration))
                if ( func ) then
                    func(obj[property]) 
                end
                
                local deltaTime = task.wait()
                tweenTime += deltaTime
            end

            obj[property] = dest
        end)
    end
end

--- Local object manager --- 
local errMessage = 'Failed to get the %s instance. Your game may be unsupported, or simply has not finished loading.'

local clientPlayer = playerService.LocalPlayer

if ( not clientPlayer ) then
    for _, con in pairs(scriptCns) do 
        con:Disconnect() 
    end
    
    return messagebox(string.format(errMessage, 'LocalPlayer'), 'Player Radar', 0)
end

local clientRoot do 
    scriptCns.charRespawn = clientPlayer.CharacterAdded:Connect(function(newChar) 
        clientRoot = newChar:WaitForChild('HumanoidRootPart')
        
        if ( clientRoot ) then
            radarObjects.loadText.Visible = false 
            radarObjects.loadOverlay.Visible = false  
        else
            radarObjects.loadText.Visible = true 
            radarObjects.loadOverlay.Visible = true  
        end
    end)
    
    if ( clientPlayer.Character ) then 
        clientRoot = clientPlayer.Character:FindFirstChild('HumanoidRootPart')
    end
end

local clientCamera do 
    scriptCns.cameraUpdate = workspace:GetPropertyChangedSignal('CurrentCamera'):Connect(function() 
        clientCamera = workspace.CurrentCamera or workspace:FindFirstChildOfClass('Camera')
    end)

    clientCamera = workspace.CurrentCamera or workspace:FindFirstChildOfClass('Camera')
end

if ( not clientCamera ) then -- tested this out, deleting the camera instantly makes a new one but who cares
    for _, con in pairs(scriptCns) do 
        con:Disconnect() 
    end
    
    return messagebox(string.format(errMessage, 'Camera'), 'Player Radar', 0)
end

local clientTeam do 
    scriptCns.teamUpdate = clientPlayer:GetPropertyChangedSignal('Team'):Connect(function() 
        clientTeam = clientPlayer.Team
    end)

    clientTeam = clientPlayer.Team
end

--- PlaceID Check --- 
do
    local thisId = game.PlaceId
    local retardedGames = {
        292439477;   -- Phantom forces - support might be added
        3233893879;  -- Bad business
        8130299583;  -- Trident survival (server browser?) - support might be added
        9570110925;  -- Trident survival (server) - support might be added
    }
    local gameNotes = {
        [379614936] = 'This game is known to fuck up the radar - waiting a round should fix'; -- Assassins
        [2474168535] = 'Players that are lassoed don\'t appear on the radar properly'; -- Westbound 
    }
    
    local halfWidth = clientCamera.ViewportSize.X / 2
    
    local notif = Drawing.new('Text')
    notif.Center = true
    notif.Color = Color3.fromRGB(255, 255, 255)
    notif.Font = Drawing.Fonts.UI
    notif.Outline = true
    notif.Position = newV2(halfWidth, 200)
    notif.Size = 22
    notif.Transparency = 0 
    notif.Visible = true 
    notif.ZIndex = 500 
    
    if ( table.find(retardedGames, thisId) ) then
        notif.Text = 'Games with custom character systems\naren\'t supported. Sorry!'
        
        tweenExp(notif, 'Transparency', 1, 0.25)
        tweenExp(notif, 'Position', newV2(halfWidth, 150), 0.25)
        task.wait(5)
        
        tweenExp(notif, 'Position', newV2(halfWidth, 200), 0.25)
        tweenExp(notif, 'Transparency', 0, 0.25)
        task.wait(0.5)
        
        for _, con in pairs(scriptCns) do 
            con:Disconnect()
        end
        
        notif:Remove()
        return
    else
        -- might as well place loaded notification here 
        notif.Text = ('Версия радара: %s\n\nУправление:\n[-]: Отдалить     [+]: Приблизить     [End]: Выключить радар'):format(scriptver)
        
        local gameWarning = gameNotes[thisId]
        
        if ( gameWarning ) then 
            notif.Text = notif.Text .. string.format('\n\nGame warning: %s', gameWarning)
        end
        
        task.spawn(function()
            tweenExp(notif, 'Transparency', 1, 0.25)
            tweenExp(notif, 'Position', newV2(halfWidth, 150), 0.25)
            task.wait(gameWarning and 10 or 5)
            
            tweenExp(notif, 'Position', newV2(halfWidth, 200), 0.25)
            tweenExp(notif, 'Transparency', 0, 0.25)
            task.wait(0.5)
            
            if ( workspace.StreamingEnabled ) then
                notif.Text = 'Похоже, что эта игра использует StreamingEnabled - режим Fallback теперь включен.'
                tweenExp(notif, 'Transparency', 1, 0.25)
                tweenExp(notif, 'Position', newV2(halfWidth, 150), 0.25)
                task.wait(5)
                
                tweenExp(notif, 'Position', newV2(halfWidth, 200), 0.25)
                tweenExp(notif, 'Transparency', 0, 0.25)
                task.wait(1)
            end
            
            notif:Remove()
        end)
    end
end

--- Player managers --- 
if ( workspace.StreamingEnabled ) then
    USE_FALLBACK = true
end

local playerManagers = {}
if ( game.PlaceId == 292439477 ) then -- Phantom forces support (being developed soon 🤑)
    local function removePlayer(player) 
    end
    
    local function readyPlayer(thisPlayer) 
    
    end
    
    -- Setup managers for every existing player 
    for _, player in ipairs(playerService:GetPlayers()) do
        if ( player ~= clientPlayer ) then
            readyPlayer(player)
        end
    end

    -- Setup managers for joining players, and clean managers for leaving players
    scriptCns.pm_playerAdd = playerService.PlayerAdded:Connect(readyPlayer)
    scriptCns.pm_playerRemove = playerService.PlayerRemoving:Connect(removePlayer)
else
    
    local function removePlayer(player) 
        local thisName = player.Name
        local thisManager = playerManagers[thisName]

        -- had an error randomly happen where there was no manager made for someone before they were removed
        -- definitely not getting a 0.000001% chance of some retard joining then leaving a microsecond later
        -- so now there's this check for some random race condition that happens every 8 billion years 
        if ( not thisManager ) then
            return
        end
        local thisPlayerCns = thisManager.Cns
                
        if ( thisManager.onLeave ) then 
            thisManager.onLeave()
        end
        
        for _, con in pairs(thisPlayerCns) do
            con:Disconnect()
        end
        
        thisManager.onDeath = nil
        thisManager.onLeave = nil
        thisManager.onRemoval = nil
        thisManager.onRespawn = nil
        thisManager.onTeamChange = nil 
        
        thisManager.Player = nil
        
        playerManagers[thisName] = nil 
    end
    
    local function readyPlayer(thisPlayer) 
        local thisName = thisPlayer.Name

        local thisManager = {}
        local thisPlayerCns = {}
        
        local function deathFunc() -- Reusable on-death function - done so the same function doesnt get made 9138589135 times 
            if ( thisManager.onDeath ) then
                thisManager.onDeath()
            end
        end

        -- Setup connections
        thisPlayerCns['chr-add'] = thisPlayer.CharacterAdded:Connect(function(newChar) -- This handles when a player respawns
            if ( USE_FALLBACK ) then
                thisManager.Character = newChar 
                return  
            end
            
            -- Get the new instances 
            local RootPart = newChar:WaitForChild('HumanoidRootPart')
            local Humanoid = newChar:WaitForChild('Humanoid')
            
            -- Call onRespawn
            if ( thisManager.onRespawn ) then
                thisManager.onRespawn()
            end
            -- Update manager values 
            thisManager.Character = newChar
            thisManager.RootPart = RootPart
            thisManager.Humanoid = Humanoid
            
            -- Re-connect the death connection 
            if ( thisPlayerCns['chr-die'] ) then
                thisPlayerCns['chr-die']:Disconnect()
            end
            thisPlayerCns['chr-die'] = Humanoid.Died:Connect(deathFunc)
        end)

        thisPlayerCns['chr-remove'] = thisPlayer.CharacterRemoving:Connect(function() -- This handles when a player's character gets removed 
            if ( USE_FALLBACK ) then
                thisManager.Character = nil 
                return  
            end
            
            -- Call onRemoval
            if ( thisManager.onRemoval ) then
                thisManager.onRemoval()
            end
            
            -- Update manager values 
            thisManager.Character = nil
            thisManager.RootPart = nil
            thisManager.Humanoid = nil 
        end)
        
        thisPlayerCns['team'] = thisPlayer:GetPropertyChangedSignal('Team'):Connect(function()  -- This handles team changing, self explanatory
            thisManager.Team = thisPlayer.Team
            
            if ( thisManager.onTeamChange ) then
                thisManager.onTeamChange(thisManager.Team)
            end
        end)
        
        -- Check for an existing character
        if ( thisPlayer.Character ) then
            -- Fetch some stuff
            local Character = thisPlayer.Character
            local Humanoid = Character:FindFirstChild('Humanoid')
            local RootPart = Character:FindFirstChild('HumanoidRootPart')

            -- Set manager values 
            thisManager.Character = Character
            thisManager.RootPart = RootPart
            thisManager.Humanoid = Humanoid 

            if ( Humanoid ) then
                -- Setup death connection *only if the humanoid exists*
                -- This previously wasn't checked for which probably constantly errored, oops 🗿
                thisPlayerCns['chr-die'] = Humanoid.Died:Connect(deathFunc)
            end
        end
        
        -- Set existing values 
        thisManager.Team = thisPlayer.Team
        thisManager.Player = thisPlayer
        thisManager.Name = thisName 
        thisManager.DisplayName = thisPlayer.DisplayName  
        thisManager.Friended = clientPlayer:IsFriendsWith(thisPlayer.UserId)
        thisManager.GetCFrame = function() 
            local thisRoot = thisManager.RootPart
            local cframe  
            
            if ( thisRoot ) then
                cframe = thisRoot.CFrame
            elseif ( USE_FALLBACK and thisManager.Character ) then 
                cframe = thisManager.Character:GetPivot()
            end
            
            return cframe 
        end
        
        -- Finalize
        thisManager.Cns = thisPlayerCns 
        playerManagers[thisName] = thisManager
    end
    
    -- Setup managers for every existing player 
    for _, player in ipairs(playerService:GetPlayers()) do
        if ( player ~= clientPlayer ) then
            readyPlayer(player)
        end
    end

    -- Setup managers for joining players, and clean managers for leaving players
    scriptCns.pm_playerAdd = playerService.PlayerAdded:Connect(readyPlayer)
    scriptCns.pm_playerRemove = playerService.PlayerRemoving:Connect(removePlayer)
end

--- Radar UI --- 
local radarLines = {}
local radarPosition = newV2(300, 250)

-- main radar
radarObjects.main = newDrawObj('Circle', {
    Color = RADAR_THEME.Background;
    Position = radarPosition; 
    
    Filled = true;
    Visible = true;
    
    NumSides = 40;
    Radius = RADAR_RADIUS;
    ZIndex = 300;
})

radarObjects.outline = newDrawObj('Circle', {
    Color = RADAR_THEME.Outline;
    Position = radarPosition; 
    
    Filled = false;
    Visible = true;
    
    NumSides = 40;
    Thickness = 10;
    Radius = RADAR_RADIUS;
    ZIndex = 299;
})

radarObjects.dragHandle = newDrawObj('Circle', {
    Color = RADAR_THEME.DragHandle;
    Position = radarPosition; 
    
    Filled = false;
    Visible = false;
    
    NumSides = 40;
    Radius = RADAR_RADIUS;
    Thickness = 3;
    ZIndex = 325;
})

-- spawn overlay
radarObjects.loadOverlay = newDrawObj('Circle', {
    Color = Color3.new(0, 0, 0);
    Filled = true;
    NumSides = 40;
    Position = radarPosition; 
    Radius = RADAR_RADIUS;
    Transparency = 0.5;
    Visible = clientRoot == nil;
    ZIndex = 319;
})

radarObjects.loadText = newDrawObj('Text', {
    Center = true;
    Color = Color3.fromRGB(255, 255, 255);
    Font = Drawing.Fonts.UI;
    Outline = true;
    Position = radarPosition - newV2(0, 15);
    Size = 20;
    Text = 'Waiting for you to spawn in...';
    Transparency = 1;
    Visible = clientRoot == nil;
    ZIndex = 320;
})

-- text
radarObjects.zoomText = newDrawObj('Text', {
    Center = true;
    Color = Color3.fromRGB(255, 255, 255);
    Font = Drawing.Fonts.UI;
    Outline = true;
    Size = 20;
    Transparency = 0;
    Visible = true;
    ZIndex = 306;
})

radarObjects.hoverText = newDrawObj('Text', {
    Center = true;
    Color = Color3.fromRGB(255, 255, 255);
    Font = Drawing.Fonts.UI;
    Outline = true;
    Position = radarPosition;
    Size = 16;
    Transparency = 1;
    Visible = false;
    ZIndex = 306;
})

-- center marker
if ( USE_QUADS ) then 
    radarObjects.localMark = newDrawObj('Quad', {
        Color = RADAR_THEME.Local_Marker;
        Filled = true;
        Thickness = 2;
        Visible = true;
        ZIndex = 305;
    })
    
    radarObjects.localMarkStroke = newDrawObj('Quad', {
        Color = RADAR_THEME.Local_Marker;
        Filled = false;
        Thickness = 2;
        Visible = true;
        ZIndex = 304;
    })
else
    radarObjects.localMark = newDrawObj('Circle', {
        Color = RADAR_THEME.Local_Marker;
        Filled = true;
        NumSides = 20;
        Thickness = 2;
        Visible = true;
        ZIndex = 305;
    })
    
    radarObjects.localMarkStroke = newDrawObj('Circle', {
        Color = RADAR_THEME.Local_Marker;
        Filled = false;
        NumSides = 20;
        Thickness = 1;
        Visible = true;
        ZIndex = 304;
    })
end

-- lines
if ( RADAR_LINES ) then 
    for i = 0, RADAR_RADIUS, RADAR_SCALE * RADAR_LINE_DISTANCE do 
        local thisLine = newDrawObj('Circle', {
            Color = RADAR_THEME.Distance_Lines;
            Position = radarPosition; 
            Radius = i;
            
            Filled = false;
            Visible = true;
            
            Transparency = ((i / RADAR_LINE_DISTANCE) % 4 == 0) and 0.8 or 0.2;
            NumSides = 40;
            Thickness = 1;
            ZIndex = 300;
        })
        
        table.insert(radarLines, thisLine)
    end
    
    radarObjects.horizontalLine = newDrawObj('Line', {
        Color = RADAR_THEME.Cardinal_Lines;
        From = radarPosition - newV2(RADAR_RADIUS, 0);
        To = radarPosition + newV2(RADAR_RADIUS, 0);
                
        Visible = true; 
        
        Thickness = 1;
        Transparency = 0.2;
        ZIndex = 300;
    })
    
    radarObjects.verticalLine = newDrawObj('Line', {
        Color = RADAR_THEME.Cardinal_Lines;
        From = radarPosition - newV2(0, RADAR_RADIUS);
        To = radarPosition + newV2(0, RADAR_RADIUS);
        
        Visible = true; 
        
        Thickness = 1;
        Transparency = 0.2;
        ZIndex = 300;
    })
else
    radarLines = nil 
end

-- NSWE display 
if ( CARDINAL_DISPLAY ) then
    radarObjects.directionN = newDrawObj('Text', {
        Center = true;
        Color = Color3.fromRGB(255, 255, 255);
        Font = Drawing.Fonts.UI;
        Outline = true;
        Size = 16;
        Text = 'N';
        Transparency = 1;
        Visible = true;
        ZIndex = 303;
    })

    radarObjects.directionS = newDrawObj('Text', {
        Center = true;
        Color = Color3.fromRGB(255, 255, 255);
        Font = Drawing.Fonts.UI;
        Outline = true;
        Size = 16;
        Text = 'S';
        Transparency = 1;
        Visible = true;
        ZIndex = 303;
    })

    radarObjects.directionW = newDrawObj('Text', {
        Center = true;
        Color = Color3.fromRGB(255, 255, 255);
        Font = Drawing.Fonts.UI;
        Outline = true;
        Size = 16;
        Text = 'W';
        Transparency = 1;
        Visible = true;
        ZIndex = 303;
    })

    radarObjects.directionE = newDrawObj('Text', {
        Center = true;
        Color = Color3.fromRGB(255, 255, 255);
        Font = Drawing.Fonts.UI;
        Outline = true;
        Size = 16;
        Text = 'E';
        Transparency = 1;
        Visible = true;
        ZIndex = 303;
    })
end

--- Other functions ---
local destroying = false 
local function killScript() -- destroys the script; self explanatory
    if ( destroying ) then
        return
    end 
    
    destroying = true
    
    for _, con in pairs(scriptCns) do 
        con:Disconnect()
    end
    
    task.wait()
    for name, manager in pairs(playerManagers) do 
        for _, con in pairs(manager.Cns) do
            con:Disconnect()
        end
        
        -- just in case 
        manager.onDeath = nil 
        manager.onLeave = nil 
        manager.onRespawn = nil 
        manager.onRemoval = nil 
        manager.onTeamChange = nil 

        playerManagers[name] = nil 
    end
    
    for _, obj in ipairs(drawObjects) do 
        tweenExp(obj, 'Transparency', 0, 0.5)
    end
    
    task.wait(1)
    
    if ( not drawObjects ) then
        return
    end
    
    for _, obj in ipairs(drawObjects) do 
        obj:Remove()
    end
    _G.RadarKill = nil 
    drawObjects = nil
end

local function setRadarScale() -- updates the radar's scale using RADAR_SCALE 
    markerScale = math.clamp(RADAR_SCALE, MARKER_SCALE_MIN, MARKER_SCALE_MAX) * MARKER_SCALE_BASE
    
    if ( RADAR_LINES ) then
        -- Calculate how many radar lines can fit at this scale 
        local lineCount = math.floor(RADAR_RADIUS / (RADAR_SCALE * RADAR_LINE_DISTANCE))
        
        -- If more lines can fit than there are made, make more 
        if ( lineCount > #radarLines ) then
            for i = 1, lineCount - #radarLines do 
                
                local thisLine = newDrawObj('Circle', {
                    Color = RADAR_THEME.Distance_Lines;
                    
                    Position = radarPosition;
                    
                    Filled = false;
                    Visible = true;
                    
                    NumSides = 40;
                    Thickness = 1;
                    ZIndex = 300;
                })
                
                table.insert(radarLines, thisLine)
            end
        end
        
        -- Position every single line 
        for idx, line in ipairs(radarLines) do 
            if ( idx > lineCount ) then
                -- This line wont fit, hide it 
                line.Visible = false 
            else
                -- This line fits, set its radius and display it 
                line.Radius = idx * (RADAR_SCALE * RADAR_LINE_DISTANCE)
                line.Transparency = (idx % 4 == 0) and 0.8 or 0.2
                line.Visible = true
            end
        end
    end
    
    
    if ( USE_QUADS ) then 
        scaleVec = newV2(markerScale, markerScale)
        
        quadPointA = newV2(0, 5)   * scaleVec
        quadPointB = newV2(4, -5)  * scaleVec
        quadPointC = newV2(0, -3)  * scaleVec
        quadPointD = newV2(-4, -5) * scaleVec
    else
        radarObjects.localMark.Radius = markerScale * 3
        radarObjects.localMarkStroke.Radius = markerScale * 3 
    end
end

local function setRadarPosition(newPosition) -- sets the radar's position to newPosition
    radarPosition = newPosition
        
    radarObjects.main.Position = newPosition
    radarObjects.outline.Position = newPosition
    
    
    radarObjects.loadOverlay.Position = newPosition
    radarObjects.loadText.Position = newPosition - newV2(0, 15)
    
    if ( RADAR_LINES ) then
        for _, line in ipairs(radarLines) do 
            line.Position = newPosition
        end 
        
        radarObjects.horizontalLine.From = newPosition - newV2(RADAR_RADIUS, 0);
        radarObjects.horizontalLine.To = newPosition + newV2(RADAR_RADIUS, 0);
        
        radarObjects.verticalLine.From = newPosition - newV2(0, RADAR_RADIUS);
        radarObjects.verticalLine.To = newPosition + newV2(0, RADAR_RADIUS);
    end
    
    radarObjects.hoverText.Position = newPosition
end

--- Input and drag handling ---
do
    local radarDragging = false
    local radarHovering = false
    
    local zoomingIn = false
    local zoomingOut = false
        
    -- The keycode is only checked if its found in this dictionary,
    -- just so a giant elif chain isnt done on every keypress
    local keysToCheck = {
        End = true;
        Equals = true;
        Minus = true;
    }
    
    scriptCns.inputBegan = inputService.InputBegan:Connect(function(io) 
        local inputType = io.UserInputType.Name

        if ( inputType == 'Keyboard' ) then
            local keyCode = io.KeyCode.Name
            
            if ( not keysToCheck[keyCode] ) then
                return
            end
            
            if ( keyCode == 'End' ) then
                killScript() 
            elseif ( keyCode == 'Equals' ) then
                zoomingIn = true 
                
                local zoomText = radarObjects.zoomText
                zoomText.Position = radarPosition + newV2(0, RADAR_RADIUS + 25)
                tweenExp(zoomText, 'Transparency', 1, 0.3)
                
                local accel = 0.75
                
                scriptCns.zoomInCn = runService.Heartbeat:Connect(function(deltaTime) 
                    RADAR_SCALE = math.clamp(RADAR_SCALE + (deltaTime * accel), 0.02, 3)
                    
                    --[[if ( zoomingIn ) then
                        accel += deltaTime
                    else
                        accel /= 1.5
                    end]]
                    
                    accel += deltaTime
                    
                    zoomText.Text = ('Scale: %.2f'):format(RADAR_SCALE)
                    setRadarScale()
                end)
            elseif ( keyCode == 'Minus' ) then
                zoomingOut = true
                
                local zoomText = radarObjects.zoomText
                zoomText.Position = radarPosition + newV2(0, RADAR_RADIUS + 25)
                tweenExp(zoomText, 'Transparency', 1, 0.3)
                
                local accel = 0.75
                
                scriptCns.zoomOutCn = runService.Heartbeat:Connect(function(deltaTime) 
                    RADAR_SCALE = math.clamp(RADAR_SCALE - (deltaTime * accel), 0.02, 3)
                    
                    accel += deltaTime
                    
                    zoomText.Text = ('Scale: %.2f'):format(RADAR_SCALE)
                    setRadarScale()
                end)    
            end
        elseif ( inputType == 'MouseButton1' ) then
            local mousePos = inputService:GetMouseLocation()
            
            if ( (mousePos - radarPosition).Magnitude < RADAR_RADIUS ) then
                radarDragging = true
                radarObjects.dragHandle.Visible = true
                
                scriptCns.dragCn = inputService.InputChanged:Connect(function(io) 
                    if ( io.UserInputType.Name == 'MouseMovement' ) then
                        local mousePos = inputService:GetMouseLocation()
                        radarObjects.dragHandle.Position = mousePos
                    end
                end)
            end
        end
    end)

    scriptCns.inputEnded = inputService.InputEnded:Connect(function(io) 
        local inputType = io.UserInputType.Name
        if ( inputType == 'Keyboard' ) then
            local keyCode = io.KeyCode.Name
            
            if ( not keysToCheck[keyCode] ) then
                return
            end
            
            if ( keyCode == 'Equals' ) then
                zoomingIn = false 
                
                if ( zoomingOut == false ) then 
                    tweenExp(radarObjects.zoomText, 'Transparency', 0, 0.3)
                end      
                          
                local zoomCn = scriptCns.zoomInCn
                if ( zoomCn and zoomCn.Connected ) then 
                    -- task.wait(0.3)
                    zoomCn:Disconnect()
                end
            elseif ( keyCode == 'Minus' ) then
                zoomingOut = false
                
                if ( zoomingIn == false ) then 
                    tweenExp(radarObjects.zoomText, 'Transparency', 0, 0.3)
                end
                
                local zoomCn = scriptCns.zoomOutCn
                if ( zoomCn and zoomCn.Connected ) then 
                    -- task.wait(0.3)
                    zoomCn:Disconnect()
                end
            end
            
        elseif ( inputType == 'MouseButton1' ) then
            if ( radarDragging ) then
                scriptCns.dragCn:Disconnect()
                radarDragging = false 
                
                setRadarPosition(radarObjects.dragHandle.Position)
                radarObjects.dragHandle.Visible = false 
            end
        end
    end)
end

--- Player marker setup ---
local playerMarks = {} do 
    local function initMark(thisPlayer)
        local thisName = thisPlayer.Name 
        local thisManager = playerManagers[thisName]
        
        
        if ( not thisManager ) then -- no char manager for this player yet 
            for i = 1, 10 do -- wait and check 10 times 
                thisManager = playerManagers[thisName]
                if ( thisManager ) then -- if its found then cancel the wait 
                    break
                end
                task.wait(0.5)
            end 
            
            if ( not thisManager ) then -- if there is no manager when the loop ends, return out
                return
            end
        end
        
        local markers = {} 
        
        local markMain
        local markStroke
        
        --- Create markers 
        if ( USE_QUADS ) then 
            markMain = Drawing.new('Quad')
            markMain.Filled = true
            markMain.Thickness = 2
            markMain.Visible = true
            markMain.ZIndex = 303
            
            markStroke = Drawing.new('Quad')
            markStroke.Filled = false
            markStroke.Thickness = 2
            markStroke.Transparency = 0
            markStroke.ZIndex = 302
        else
            markMain = Drawing.new('Circle')
            markMain.Filled = true
            markMain.NumSides = 20
            markMain.Radius = markerScale * 3
            markMain.Thickness = 2
            markMain.Visible = true
            markMain.ZIndex = 303
            
            markStroke = Drawing.new('Circle')
            markStroke.Filled = false
            markStroke.NumSides = 20
            markStroke.Radius = markerScale * 3
            markStroke.Thickness = 1
            markStroke.Visible = true
            markStroke.ZIndex = 302
        end
        
        --- Register drawing objects
        table.insert(drawObjects, markMain)
        table.insert(drawObjects, markStroke)
        
        --- Setup callbacks
        thisManager.onDeath = function()
            markMain.Filled = false
        end
        thisManager.onRespawn = function()
            markMain.Filled = true
            
            markMain.Visible = true
            markStroke.Visible = true 
        end
        thisManager.onRemoval = function()
            markMain.Visible = false 
            markStroke.Visible = false
        end
        thisManager.onLeave = function()
            table.remove(drawObjects, table.find(drawObjects, markMain))
            table.remove(drawObjects, table.find(drawObjects, markStroke))

            task.spawn(function() 
                tweenExp(markMain, 'Transparency', 0, 1)
                tweenExp(markStroke, 'Transparency', 0, 1)
                task.wait(1.5)
                markMain:Remove()
                markStroke:Remove()
            end)
            
            playerMarks[thisName] = nil
        end
        
        if ( DISPLAY_TEAM_COLORS ) then 
            thisManager.onTeamChange = function(team) 
                if ( DISPLAY_FRIEND_COLORS and thisManager.Friended ) then 
                    return
                end
                
                local color 
                if ( USE_TEAM_COLORS ) then
                    color = thisPlayer.TeamColor.Color
                elseif ( team == clientTeam ) then
                    color = RADAR_THEME.Team_Marker
                else
                    color = RADAR_THEME.Generic_Marker
                end
                
                markMain.Color = color
                markStroke.Color = color
            end
        end 
        
        local color 
        
        -- friend check 
        if ( DISPLAY_FRIEND_COLORS and thisManager.Friended ) then -- friend colors take first priority
            color = RADAR_THEME.Friend_Marker
        elseif ( DISPLAY_TEAM_COLORS ) then  
            if ( USE_TEAM_COLORS ) then
                color = thisPlayer.TeamColor.Color
            elseif ( thisPlayer.Team == clientTeam ) then
                color = RADAR_THEME.Team_Marker
            else
                color = RADAR_THEME.Generic_Marker
            end
        else
            color = RADAR_THEME.Generic_Marker
        end
        
        markMain.Color = color 
        markStroke.Color = color 
        
        markers.main = markMain 
        markers.stroke = markStroke
        
        if ( thisManager.Humanoid and thisManager.Humanoid.Health == 0 ) then
            thisManager.onDeath()
        end
        
        playerMarks[thisName] = markers
        return markers
    end
    
    for _, manager in pairs(playerManagers) do
        initMark(manager.Player)
    end
    
    scriptCns.addMarks = playerService.PlayerAdded:Connect(function(player) 
        task.wait(0.3) -- This will hopefully prevent loading issues
        initMark(player)
    end)
end

local hoverPlayer
-- Hover display
do 

    local lastCheckTime = 0
    
    scriptCns.inputChanged = inputService.InputChanged:Connect(function(input) 
        local nowTime = tick() -- Funky optimization 

        if ( nowTime - lastCheckTime > 0.05 and input.UserInputType.Name == 'MouseMovement' ) then
            lastCheckTime = nowTime
            local mousePos = inputService:GetMouseLocation()
            
            -- Check if the mouse is inside of the radar 
            if ( (mousePos - radarPosition).Magnitude < RADAR_RADIUS ) then
                -- Get the closest player and set the hover text to their name 

                local distanceThresh = 50 -- math.huge 🤓🤓🤓🤓🤓🤓🤓
                hoverPlayer = nil
                
                for thisName in pairs(playerManagers) do 
                    local thisMark = playerMarks[thisName]
                    -- safety marker check, in case the player hasnt finished loading in 
                    if ( not thisMark ) then
                        continue
                    end
                    
                    local markPos = thisMark.main[USE_QUADS and 'PointD' or 'Position']
                    local distance = (mousePos - markPos).Magnitude

                    if ( distance < distanceThresh ) then
                        distanceThresh = distance
                        hoverPlayer = thisName
                    end
                end
                
                if ( hoverPlayer == nil ) then
                    radarObjects.hoverText.Visible = false  
                end
            else
                hoverPlayer = nil
                radarObjects.hoverText.Visible = false 
            end
        end
    end)
end

--- Main radar loop ---

-- Coordinate conversion functions
local function cartToPolar(x, y) 
    return math.sqrt(x^2 + y^2), math.atan2(y, x)
end
local function polarToCart(r, t) 
    return r * mathCos(t), r * mathSin(t)
end

do
    local finalLookVec = Vector3.zero
    
    local hOffset = newV2(RADAR_RADIUS, 0) -- Horizontal offset
    local vOffset = newV2(0, RADAR_RADIUS) -- Vertical offset
    
    local textOffset = newV2(0, 5)
    
    local rad90 = math.rad(90)
    local rad180 = math.rad(180)
    
    local rayParams
    if ( VISIBLITY_CHECK ) then
        rayParams = RaycastParams.new()
        rayParams.FilterType = Enum.RaycastFilterType.Blacklist
        rayParams.FilterDescendantsInstances = { clientPlayer.Character }
        
        scriptCns.rayUpdate = clientPlayer.CharacterAdded:Connect(function(newChar) 
            rayParams.FilterDescendantsInstances = { newChar }
        end)
    end
    
    scriptCns.radarLoop = runService.Heartbeat:Connect(function(deltaTime) 
        -- Safety rootpart check
        if ( not clientRoot ) then 
            return 
        end

        local selfPos = clientRoot.Position
        local cameraPos
        local camAngle = 0 

        -- Camera angle
        do 
            if ( RADAR_ROTATION ) then 
                local cameraLookVec = clientCamera.CFrame.LookVector
                local fixedLookVec = newV3(cameraLookVec.X, 0, cameraLookVec.Z).Unit
                
                if ( SMOOTH_ROT ) then
                    finalLookVec = finalLookVec:Lerp(fixedLookVec, 1 - mathExp(-SMOOTH_ROT_AMNT * deltaTime))
                else
                    finalLookVec = fixedLookVec
                end
                
                camAngle = math.atan2(finalLookVec.X, finalLookVec.Z)
            else
                camAngle = rad180
            end
            
            cameraPos = clientCamera.CFrame.Position 
        end
        
        -- Vertical and horizontal lines
        do 
            if ( RADAR_LINES ) then
                local top = -vOffset
                local bottom = vOffset
                local left = -hOffset
                local right = hOffset
                                
                local angleCos = mathCos(-camAngle)
                local angleSin = mathSin(-camAngle)
                
                local fixedTop    = radarPosition + newV2((top.X * angleSin)    - (top.Y * angleCos),    (top.X * angleCos)    + (top.Y * angleSin))
                local fixedBottom = radarPosition + newV2((bottom.X * angleSin) - (bottom.Y * angleCos), (bottom.X * angleCos) + (bottom.Y * angleSin))     
                local fixedLeft   = radarPosition + newV2((left.X * angleSin)   - (left.Y * angleCos),   (left.X * angleCos)   + (left.Y * angleSin))  
                local fixedRight  = radarPosition + newV2((right.X * angleSin)  - (right.Y * angleCos),  (right.X * angleCos)  + (right.Y * angleSin))  
                
                local hLine, vLine = radarObjects.horizontalLine, radarObjects.verticalLine
                
                hLine.From = fixedLeft
                hLine.To = fixedRight
                
                vLine.From = fixedTop
                vLine.To = fixedBottom

                if ( CARDINAL_DISPLAY ) then
                    radarObjects.directionN.Position = fixedRight - textOffset
                    radarObjects.directionS.Position = fixedLeft - textOffset
                    radarObjects.directionW.Position = fixedTop - textOffset
                    radarObjects.directionE.Position = fixedBottom - textOffset
                end
            end
        end
        
        -- Centermark
        do
            local localMark = radarObjects.localMark
            local localMarkStroke = radarObjects.localMarkStroke
            if ( USE_QUADS ) then
                -- For those of you who didn't pay attention in geometry (like me) this was pretty useful
                -- https://danceswithcode.net/engineeringnotes/rotations_in_2d/rotations_in_2d.html
                
                -- Get player LookVector
                local playerLookVec = clientRoot.CFrame.LookVector
                -- Convert it to an "angle" using atan2 and subtract the camera "angle" 
                local angle = (math.atan2(playerLookVec.X, playerLookVec.Z) - camAngle) - rad90

                local angleCos = mathCos(angle)
                local angleSin = mathSin(angle)
                
                -- Rotate quad points by angle using the sine and cosine calculated above
                local fixedA = radarPosition + newV2((quadPointA.X * angleSin) - (quadPointA.Y * angleCos), (quadPointA.X * angleCos) + (quadPointA.Y * angleSin))
                local fixedB = radarPosition + newV2((quadPointB.X * angleSin) - (quadPointB.Y * angleCos), (quadPointB.X * angleCos) + (quadPointB.Y * angleSin))
                local fixedC = radarPosition + newV2((quadPointC.X * angleSin) - (quadPointC.Y * angleCos), (quadPointC.X * angleCos) + (quadPointC.Y * angleSin))
                local fixedD = radarPosition + newV2((quadPointD.X * angleSin) - (quadPointD.Y * angleCos), (quadPointD.X * angleCos) + (quadPointD.Y * angleSin))
                
                -- Set points
                localMark.PointA = fixedA
                localMark.PointB = fixedB
                localMark.PointC = fixedC
                localMark.PointD = fixedD
                
                localMarkStroke.PointA = fixedA
                localMarkStroke.PointB = fixedB 
                localMarkStroke.PointC = fixedC 
                localMarkStroke.PointD = fixedD
            else
                localMark.Position = radarPosition
                localMark.Radius = markerScale * 3
                
                localMarkStroke.Position = radarPosition
                localMarkStroke.Radius = markerScale * 3
            end
        end
        
        -- Player marks
        do
            for thisName, thisManager in pairs(playerManagers) do 
                local thisMark = playerMarks[thisName]
                -- Safety marker check, in case the player hasnt finished loading in 
                if ( not thisMark ) then
                    continue
                end
                local main, stroke = thisMark.main, thisMark.stroke 
                
                -- Team check 
                if ( DISPLAY_TEAMMATES == false and thisManager.Team == clientTeam ) then 
                    if ( DISPLAY_TEAMMATES == false ) then
                        thisMark.main.Visible = false
                        thisMark.stroke.Visible = false 
                        continue
                    end
                end
                
                -- Character check
                local cframe = thisManager:GetCFrame()
                if ( not cframe ) then
                    continue
                end 
                local position = cframe.Position 
                
                -- Get this player's position relative to the localplayer position 
                local posDelta = position - selfPos
                
                local radius, angle = cartToPolar(posDelta.X, posDelta.Z)
                local fixedRadius = radius * RADAR_SCALE -- This makes the current zoom affect the marker position 
                
                -- Radius clamping 
                if ( fixedRadius > RADAR_RADIUS ) then
                    if ( DISPLAY_OFFSCREEN ) then 
                        main.Transparency = OFFSCREEN_TRANSPARENCY
                        stroke.Transparency = OFFSCREEN_TRANSPARENCY
                    else
                        main.Visible = false
                        stroke.Visible = false 
                        continue
                    end
                else
                    main.Visible = true
                    stroke.Visible = true 
                    
                    main.Transparency = 1
                    stroke.Transparency = 1 
                end
                
                radius = math.clamp(fixedRadius, 0, RADAR_RADIUS)
                angle += (camAngle + rad180) -- 180 degrees needs to be added to align things properly (there's probably a good reason but idk why)
                 
                local x, y = polarToCart(radius, angle)
                local finalPos = radarPosition + newV2(x, y)
                
                -- Marker positioning 
                if ( USE_QUADS ) then
                    -- Get player LookVector
                    local playerLookVec = cframe.LookVector
                    -- Convert it to an angle using atan2 and subtract the camera angle
                    local angle = (math.atan2(playerLookVec.X, playerLookVec.Z)) - rad90 - camAngle
                    
                    local angleCos = mathCos(angle)
                    local angleSin = mathSin(angle)
                    
                    -- Rotate quad points by angle using the sin and cosine calculated above
                    local fixedA = newV2((quadPointA.X * angleSin) - (quadPointA.Y * angleCos), (quadPointA.X * angleCos) + (quadPointA.Y * angleSin))
                    local fixedB = newV2((quadPointB.X * angleSin) - (quadPointB.Y * angleCos), (quadPointB.X * angleCos) + (quadPointB.Y * angleSin))                
                    local fixedC = newV2((quadPointC.X * angleSin) - (quadPointC.Y * angleCos), (quadPointC.X * angleCos) + (quadPointC.Y * angleSin))  
                    local fixedD = newV2((quadPointD.X * angleSin) - (quadPointD.Y * angleCos), (quadPointD.X * angleCos) + (quadPointD.Y * angleSin))  
                    if ( MARKER_FALLOFF ) then
                        local distance = posDelta.Magnitude
                        local scaleFalloff = math.clamp(MARKER_FALLOFF_AMNT / distance, 0.75, 1)
                        
                        fixedA *= scaleFalloff
                        fixedB *= scaleFalloff
                        fixedC *= scaleFalloff
                        fixedD *= scaleFalloff
                    end
                    fixedA += finalPos
                    fixedB += finalPos
                    fixedC += finalPos
                    fixedD += finalPos
                    -- Set points
                    
                    main.PointA = fixedA
                    main.PointB = fixedB
                    main.PointC = fixedC
                    main.PointD = fixedD
                    
                    stroke.PointA = fixedA
                    stroke.PointB = fixedB
                    stroke.PointC = fixedC
                    stroke.PointD = fixedD
                else                    
                    local dotRadius = markerScale * 3
                    
                    if ( MARKER_FALLOFF ) then
                        local distance = posDelta.Magnitude
                        local scaleFalloff = math.clamp(MARKER_FALLOFF_AMNT / distance, 0.75, 1)
                        dotRadius *= scaleFalloff
                    end
                    
                    main.Radius = dotRadius
                    main.Position = finalPos
                    
                    stroke.Radius = dotRadius
                    stroke.Position = finalPos
                end
                
                -- Hovertext display 
                if ( hoverPlayer == thisName ) then
                    local text = radarObjects.hoverText 
                    text.Text = string.format('%s\n(%d метров)', thisManager.Name, posDelta.Magnitude)
                    text.Size = math.clamp(16 * RADAR_SCALE, 16, 24)
                    text.Visible = true
                    
                    local textPosition = finalPos + textOffset
                    text.Position = text.Position:Lerp(textPosition, 1 - mathExp(-30 * deltaTime))
                end
                
                
                -- Test for visibility
                if ( VISIBLITY_CHECK ) then
                    local direction = ( position - cameraPos ).Unit * 12345
                    local raycast = workspace:Raycast(cameraPos, direction, rayParams)
                    
                    if ( raycast ) then
                        
                        if ( ( raycast.Position - position ).Magnitude > 4 ) then
                            main.Transparency /= 5
                            stroke.Transparency /= 5
                        end
                        
                    else
                        main.Transparency /= 5
                        stroke.Transparency /= 5
                    end 
                end
            end
        end
    end)
    
    if ( DISPLAY_RGB_COLORS ) then
        local hue = 0
        
        scriptCns.rgbLoop = runService.Heartbeat:Connect(function(deltaTime) 
            hue += deltaTime / 20
            if ( hue > 1 ) then
                hue -= 1 
            end
            
            local color = Color3.fromHSV(hue, 0.9, 0.9)
            
            for thisName, thisManager in pairs(playerManagers) do 
                local thisMark = playerMarks[thisName]
                
                if ( not thisMark ) then
                    continue
                end
                
                if ( DISPLAY_FRIEND_COLORS and thisManager.Friended ) then 
                    continue
                end
            
                thisMark.main.Color = color
                thisMark.stroke.Color = color 
            end
        end)
    end
    
    task.delay(10, function() 
        local lText = radarObjects.loadText
        if ( lText.Visible ) then 
            local origText = lText.Text
            local message = '\n\nIf this menu doesn\'t go away\neven after you spawn, \nyour game is likely \nunsupported '
            
            tweenQuad({ Delta = 0 }, 'Delta', #message, 1.5, function(delta) 
                lText.Text = origText .. message:sub(1, delta)
            end) -- this is kinda scuffedf but who cares
        end
    end)
end

--- Setup friend handling ---
do
    scriptCns.pm_friendAdd = starterGui:GetCore('PlayerFriendedEvent').Event:Connect(function(player)
        local name = player.Name
        local mark = playerMarks[name]
        local manager = playerManagers[name]
        
        if ( manager ) then -- funky safety check since this event is finnicky 
            manager.Friended = true 
            
            if ( mark and DISPLAY_FRIEND_COLORS ) then
                local mark = mark
                mark.main.Color = RADAR_THEME.Friend_Marker
                mark.stroke.Color = RADAR_THEME.Friend_Marker 
            end
        end
    end)
    
    scriptCns.pm_friendRemove = starterGui:GetCore('PlayerUnfriendedEvent').Event:Connect(function(player)
        local name = player.Name
        local mark = playerMarks[name]
        local manager = playerManagers[name]
        
        if ( manager ) then -- funky safety check since this event is finicky 
            manager.Friended = false 
            
            if ( mark ) then 
                local color
                
                if ( DISPLAY_TEAM_COLORS ) then  
                    if ( USE_TEAM_COLORS ) then
                        color = player.TeamColor.Color
                    elseif ( player.Team == clientTeam ) then
                        color = RADAR_THEME.Team_Marker
                    else
                        color = RADAR_THEME.Generic_Marker
                    end
                else
                    color = RADAR_THEME.Generic_Marker
                end
                
                mark.main.Color = color
                mark.stroke.Color = color
            end
        end
    end)
end

-- set _G.RadarKill, so this radar can be killed on re-execution 
_G.RadarKill = killScript
