require("util/gamestate")
require("util/resources")
require("objects/player")
require("objects/selector")
require("objects/tower")


Main = class("Main", GameState)

function Main:start()
    entities = {}
    isDay = true
    worldMeter = 64

    love.physics.setMeter(worldMeter)
    world = love.physics.newWorld(0, 0, true) -- 9.81*worldMeter
    world:setCallbacks(function(a,b,coll) self:beginContact(a,b,coll) end, 
        function(a,b,coll) self:endContact(a,b,coll) end, 
        function(a,b,coll) self:preSolve(a,b,coll) end, 
        function(a,b,coll) self:postSolve(a,b,coll) end)

    player = Player()
    selector = Selector()

    Tower(10, 10)

    text = ""
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

    love.graphics.print(text, 40, 40)

end

function Main:update(dt)
    world:update(dt)

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
            if selector.canPlaceObject then
                if k == "return" or k == " " then
                    Tower(selector.x, selector.y)
                end
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


function Main:beginContact(a, b, coll)
    --a:getUserData():beginContact(b, coll)

    local tower

    local isTower = false
    local isSelector = false
    local isPlayer = false

    if a:getUserData().__name == "Player" then
        isPlayer = true
    elseif b:getUserData().__name == "Player" then
        isPlayer = true
    end

    if a:getUserData().__name == "Selector" then
        isSelector = true
    elseif b:getUserData().__name == "Selector" then
        isSelector = true
    end

    if a:getUserData().__name == "Tower" then
        tower = a:getUserData()
        isTower = true
    elseif b:getUserData().__name == "Tower" then
        tower = b:getUserData()
        isTower = true
    end


    -- collision rules
    if isSelector and isTower then
        selector.canPlaceObject = false
    end

    print("begin: "..a:getUserData().__name)
    print("begin: "..b:getUserData().__name)
end

function Main:endContact(a, b, coll)
    --a:getUserData():endContact(b, coll)

    local isTower = false
    local isSelector = false
    local isPlayer = false

    if a:getUserData().__name == "Player" then
        isPlayer = true
    elseif b:getUserData().__name == "Player" then
        isPlayer = true
    end

    if a:getUserData().__name == "Selector" then
        isSelector = true
    elseif b:getUserData().__name == "Selector" then
        isSelector = true
    end

    if a:getUserData().__name == "Tower" then
        isTower = true
    elseif b:getUserData().__name == "Tower" then
        isTower = true
    end


    -- collision rules

    if isSelector and isTower then
        selector.canPlaceObject = true
        
    end

    print("end: "..a:getUserData().__name)
    print("end: "..b:getUserData().__name)
end

function Main:preSolve(a, b, coll)
    --a:getUserData():preSolve(b, coll)
end

function Main:postSolve(a, b, coll)
    --a:getUserData():postSolve(b, coll)
end