-- Set up the game window & collect libraries

love.window.setMode(350,500)
love.window.setTitle("Educational Game")
Gamestate = require "Libraries.hump.gamestate"

local menu = {}
local game = {}

-- Set various settings to default values

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
    font1 = love.graphics.newFont("fonts/Amatic-Bold.ttf", 50)
    font2 = love.graphics.newFont("fonts/AmaticSC-Regular.ttf", 36)
end

-- Draw the main menu graphics --

function menu:draw()

    -- Background settings & title --

    love.graphics.setBackgroundColor(255,255,255)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Educational Game", font1, 0, 25, 350, "center")

    -- Buttons --

    love.graphics.rectangle("line", 100, 150, 150, 50)
    love.graphics.printf("Play", font2, 0, 150, 350, "center")

    love.graphics.rectangle("line", 100, 250, 150, 50)
    love.graphics.printf("How to Play", font2, 0, 250, 350, "center")

    love.graphics.rectangle("line", 100, 350, 150, 50)
    love.graphics.printf("Exit", font2, 0, 350, 350, "center")

end

--[[ If left mouse button clicked whilst on the main menu, check the 
coordinates of the mouse when clicked and if it is within a button, 
complete the action that the button is meant to do. --]]

function menu:mousepressed(x, y, button, istouch)
    if button == 1 then
        if x >= 100 and x <= 250 and y >= 150 and y <= 200 then
            Gamestate.switch(game)
        end
    end
end

-- Draw the game graphics --

function game:draw()

end



