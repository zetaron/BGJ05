require("util/gamestate")
require("util/resources")
require("objects/player")
require("objects/selector")
require("objects/tower")


Main = class("Main", GameState)

function Main:start()
    entities = {}
    isDay = true
    forceTime = false
    worldMeter = 32

    love.physics.setMeter(worldMeter)
    world = love.physics.newWorld(0, 0, true) -- 9.81*worldMeter

    player = Player()
    selector = Selector()
end

function Main:draw()
    love.graphics.setBackgroundColor(17, 17, 17)
    love.graphics.setColor(255, 255, 255)

    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()

    local grass = resources.images.grass
    local grassWidth = grass:getWidth()
    local grassHeight = grass:getHeight()

    local grassBatch = love.graphics.newSpriteBatch(grass, 2000)
    for x = 0, (windowWidth / grassWidth) do
        for y = 0, (windowHeight / grassHeight) do
            grassBatch:add(x * grassWidth, y * grassHeight)
        end
    end
    love.graphics.draw(grassBatch)

    for key,value in pairs(entities) do
        if value ~= nil and value.body ~= nil then
            value.fixture:getUserData():draw()
        end
    end

    if not isDay then
        love.graphics.setColor(0,0,0,20)
        love.graphics.rectangle("fill", 0, 0, windowWidth, windowHeight)
         love.graphics.setColor(255,255,255,255)
    end

    hud:draw()
end

function Main:update(dt)
    hud:update()
    for key,value in pairs(entities) do
        if value ~= nil and value.body ~= nil then
            value.fixture:getUserData():update(dt)
        end
    end
end

function Main:keypressed(k, u)
    if k == "escape" then
        stack:pop()
    else
        if isDay then
            if k == "return" or k == " " then
                Tower(selector.x, selector.y)
            end    

            selector:keypressed(k, u)
        else
            player:keypressed(k, u)
        end
    end
end

function Main:drawDebugGrid()
    local cellSize = 32


    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    local timesX = width / cellSize
    local timesY = height / cellSize


    for x = 0,timesX do
        love.graphics.line(x*cellSize, 0, x*cellSize, height)
    end

    for y = 0,timesY do
        love.graphics.line(0, y*cellSize, width, y*cellSize)
    end

    love.graphics.setColor(255, 255, 255)
    
end