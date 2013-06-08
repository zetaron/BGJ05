require("util/gamestate")
require("util/resources")

Player = class("Player", Object)

function Player:__init()
    self.sepeed = 1
    self.x = 0
    self.y = 0

    -- resources.addImage("someImageName", "someImagePathAndNameWithFileExtension")
end

function Player:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", self.x, self.y, 10, 10)
end

function Player:update(dt)
	if love.keyboard.isDown("up", "w") then
    	self.y = self.y - self.sepeed
    elseif love.keyboard.isDown("down", "s") then
    	self.y = self.y + self.sepeed
    end

    if love.keyboard.isDown("right", "d") then
    	self.x = self.x + self.sepeed
    elseif love.keyboard.isDown("left", "a") then
    	self.x = self.x - self.sepeed
    end
end

function Player:attack()
	-- some awesome attack move
end

function Player:keypressed(k, u)
    if k == "space" or k == "return" then
    	self.attack()
    end
end

