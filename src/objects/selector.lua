require("objects/object")
require("util/resources")

Selector = class("Selector", Object)

function Selector:__init()
    self.cellsize = 32
    self.x = 0
    self.y = 0
    self.canPlaceObject = true

    self.physicsObject = {}
    self.physicsObject.body = love.physics.newBody(world, self.x, self.y, "dynamic")
    self.physicsObject.shape = love.physics.newCircleShape(24)
    self.physicsObject.fixture = love.physics.newFixture(self.physicsObject.body, self.physicsObject.shape, 1)
    self.physicsObject.fixture:setUserData(self)

    table.insert(entities, self.physicsObject)
end

function Selector:draw()
    if isDay then
        if self.canPlaceObject then
            love.graphics.setColor(255, 255, 0)
            love.graphics.print("PLACE", 50, 50)
        else
            love.graphics.setColor(255, 0, 0)
            love.graphics.print("NO PLACE", 50, 50)
        end
        love.graphics.rectangle("fill", self.x, self.y, 32, 32)
        love.graphics.setColor(255, 255, 255)
    end
end

function Selector:update(dt)
    if isDay then
    end
end

function Selector:keypressed(k, u)
    if k == "up" or k == "w" then
        self.y = self.y - self.cellsize
    elseif k == "down" or k == "s" then
        self.y = self.y + self.cellsize
    elseif k == "left" or k == "a" then
        self.x = self.x - self.cellsize
    elseif k == "right" or k == "d" then
        self.x = self.x + self.cellsize
    end

    self.physicsObject.body:setX(self.x)
    self.physicsObject.body:setY(self.y)

    local width = love.graphics.getWidth() - self.cellsize
    local height = love.graphics.getHeight() - self.cellsize

    if self.x > width then
        self.x = width
    elseif self.x < 0 then
        self.x = 0
    end

    if self.y > height then
        self.y = height
    elseif self.y < 0 then
        self.y = 0
    end
end

