require("objects/object")
require("util/resources")

Selector = class("Selector", Object)

function Selector:__init()
    self.cellsize = 32
    self.x = 0
    self.y = 0
end

function Selector:draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y, 32, 32)
end

function Selector:update(dt)

end


function Selector:keypressed(k, u)
    if k == "up" then
        self.y = self.y - self.cellsize
    elseif k == "down" then
        self.y = self.y + self.cellsize
    elseif k == "left" then
        self.x = self.x - self.cellsize

    elseif k == "right" then
        self.x = self.x + self.cellsize
    end

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

