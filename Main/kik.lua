-- Создаем GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KickPlayerGui"
gui.Parent = game.StarterGui

-- Создаем текстовое поле для ввода ника игрока
local textBox = Instance.new("TextBox")
textBox.Name = "NickTextBox"
textBox.Parent = gui
textBox.PlaceholderText = "Введите ник игрока"

-- Создаем кнопку для подтверждения удаления игрока
local button = Instance.new("Button")
button.Name = "KickButton"
button.Parent = gui
button.Text = "Удалить игрока"

-- Обработчик нажатия кнопки
button.MouseButton1Click:Connect(function()
    -- Получаем текст из текстового поля
    local nick = textBox.Text
    
    -- Проверяем, существует ли игрок с введенным ником
    local player = game.Players:FindFirstChild(nick)
    if player then
        -- Удаляем игрока с сервера
        player:Kick("I'm here..")
    else
        -- Выводим сообщение об ошибке
        print("Игрок не найден")
    end
end)