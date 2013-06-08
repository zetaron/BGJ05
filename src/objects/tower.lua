require("objects/object")
require("util/resources")

Tower = class("Tower", Object)

function Tower:__init()
    self.health = 100
    self.x = 0
    self.y = 0

    --resources.addImage("tower" ,"")
end

function Tower:draw()
    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle("fill", self.x, self.y, 32, 32)
end