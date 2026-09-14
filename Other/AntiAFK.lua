task.wait(0.5)

-- Создание GUI элементов
local screenGui = Instance.new("ScreenGui")
local titleLabel = Instance.new("TextLabel")
local mainFrame = Instance.new("Frame")
local statusLabel = Instance.new("TextLabel")

-- Настройка основного ScreenGui
screenGui.Parent = game.CoreGui
screenGui.Name = "AntiAFK"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Настройка заголовка (перетаскиваемый)
titleLabel.Parent = screenGui
titleLabel.Active = true
titleLabel.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
titleLabel.Draggable = true
titleLabel.Position = UDim2.new(0.698610067, 0, 0.098096624, 0)
titleLabel.Size = UDim2.new(0, 370, 0, 52)
titleLabel.Font = Enum.Font.SourceSansSemibold
titleLabel.Text = "Anti AFK Script"
titleLabel.TextColor3 = Color3.new(0, 1, 1)
titleLabel.TextSize = 22

-- Настройка основного фрейма
mainFrame.Parent = titleLabel
mainFrame.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
mainFrame.Position = UDim2.new(0, 0, 1.0192306, 0)
mainFrame.Size = UDim2.new(0, 370, 0, 107)

-- Настройка лейбла статуса
statusLabel.Parent = mainFrame
statusLabel.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
statusLabel.Position = UDim2.new(0, 0, 0.16, -17)
statusLabel.Size = UDim2.new(0, 370, 0, 107)
statusLabel.Font = Enum.Font.ArialBold
statusLabel.Text = "Статус: Активен"
statusLabel.TextColor3 = Color3.new(0, 1, 1)
statusLabel.TextSize = 20

-- Кнопка скрытия/показа
local toggleButton = Instance.new("TextButton")
toggleButton.Parent = titleLabel -- Привязываем к заголовку
toggleButton.BackgroundColor3 = Color3.new(0.7, 0.7, 0.4) -- Серо-жёлтый цвет
toggleButton.Position = UDim2.new(1, -30, 0, 5) -- Правый верхний угол меню
toggleButton.Size = UDim2.new(0, 25, 0, 25)
toggleButton.Font = Enum.Font.ArialBold
toggleButton.Text = "-"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.TextSize = 18
toggleButton.BorderSizePixel = 1
toggleButton.BorderColor3 = Color3.new(0, 0, 0)

-- Переменная для отслеживания состояния
local isHidden = false

-- Обработчик клика по кнопке
toggleButton.MouseButton1Click:Connect(function()
    if isHidden then
        -- Показываем интерфейс
        -- Вычисляем новую позицию меню на основе позиции кнопки
        local buttonPos = toggleButton.AbsolutePosition
        local newMenuX = buttonPos.X - 340 -- Меню слева от кнопки (ширина меню 370, кнопка справа на 30 пикселей)
        local newMenuY = buttonPos.Y - 5 -- Меню на уровне кнопки (минус отступ)
        
        -- Проверяем чтобы меню не вышло за пределы экрана
        if newMenuX < 0 then newMenuX = 0 end
        if newMenuY < 0 then newMenuY = 0 end
        
        -- Позиционируем меню
        titleLabel.Position = UDim2.new(0, newMenuX, 0, newMenuY)
        
        titleLabel.Visible = true
        mainFrame.Visible = true
        toggleButton.Parent = titleLabel -- Возвращаем кнопку к заголовку
        toggleButton.Position = UDim2.new(1, -30, 0, 5) -- Сбрасываем позицию к относительной
        toggleButton.Active = false -- Отключаем активность
        toggleButton.Draggable = false -- Отключаем перетаскивание
        toggleButton.BackgroundColor3 = Color3.new(0.7, 0.7, 0.4) -- Серо-жёлтый
        toggleButton.Text = "-"
        isHidden = false
    else
        -- Скрываем интерфейс
        -- Вычисляем абсолютную позицию кнопки на экране
        local absolutePosition = titleLabel.AbsolutePosition
        local buttonX = absolutePosition.X + titleLabel.AbsoluteSize.X - 30
        local buttonY = absolutePosition.Y + 5
        
        toggleButton.Parent = screenGui -- Переносим кнопку на экран
        toggleButton.Position = UDim2.new(0, buttonX, 0, buttonY) -- Устанавливаем точную позицию
        toggleButton.Active = true -- Делаем кнопку активной
        toggleButton.Draggable = true -- Делаем кнопку перетаскиваемой
        titleLabel.Visible = false
        mainFrame.Visible = false
        toggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Зелёный
        toggleButton.Text = "+"
        isHidden = true
    end
end)

-- Основная логика Anti AFK
local virtualUser = game:GetService('VirtualUser')

-- Подключение к событию простоя игрока
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    -- Имитация активности пользователя
    virtualUser:CaptureController()
    virtualUser:ClickButton2(Vector2.new())
    
    -- Обновление статуса
    statusLabel.Text = "Roblox пытался кикнуть вас"
    wait(2)
    statusLabel.Text = "Статус: Активен"
end)
