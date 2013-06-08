require("util/gamestate")
require("util/resources")

Player = class("Player", Object)

function Player:__init()
    self.x = 0
    self.y = 0
end

function Player:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", self.x, self.y, 10, 10)
end

function Player:update(dt)

end


function Player:keypressed(k, u)

end

