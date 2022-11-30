-- Set up the game window & collect libraries

love.window.setTitle("Educational Game")
Gamestate = require "Libraries.hump.gamestate"

local menu = {}
local game = {}
local map2 = {
}

--[[ 'window' variable used to change the size of the
window depending on which main menu button is clicked --]]

local window = "changeWindow"

-- Set various settings to default values

function love.load()
    -- Setup the main menu window, collect fonts & create the map variable for the maze --
    Gamestate.registerEvents()
    love.window.setMode(350,500)
    Gamestate.switch(menu)
    font1 = love.graphics.newFont("fonts/Amatic-Bold.ttf", 50)
    font2 = love.graphics.newFont("fonts/AmaticSC-Regular.ttf", 36)

    map = {
        
    }

    --[[ Create a template for the maze to be made on (a full grid) ]]--
    for i=0, 17, 1 do
        table.insert(map, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ,1 ,1})
    end

    math.randomseed(os.time())

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

-- Setup the window for the game --

function changeWindowSize()
    love.window.setMode(640,640)
    generateMaze()
    window = "windowChanged"
end

-- Generate the maze --

function generateMaze()
    local stack = {}
    table.insert(stack, {math.random(2,17), 1})
    map[stack[1][1]][1] = 0
end

-- Draw the game graphics --

function game:draw()
    if window == "changeWindow" then
        changeWindowSize()
    end
    
    for y=1, #map do
        for x=1, #map[y] do
            if map[y][x] == 1 then
                love.graphics.rectangle("fill", x * 32, y * 32, 32, 32)
            end
        end
    end

end



