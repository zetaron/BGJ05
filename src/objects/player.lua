require("util/gamestate")
require("util/resources")

Player = class("Player", Entity)

function Player:__init()
    self.sepeed = 1

    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()

    self.x = windowWidth / 2
    self.y = windowHeight / 2

    -- resources.addImage("someImageName", "someImagePathAndNameWithFileExtension")

    self.physicsObject = {}
	self.physicsObject.body = love.physics.newBody(world, self.x, self.y, "dynamic")
    self.physicsObject.shape = love.physics.newCircleShape(24)
    self.physicsObject.fixture = love.physics.newFixture(self.physicsObject.body, self.physicsObject.shape, 1)
    self.physicsObject.fixture:setUserData(self)

	table.insert(entities, self.physicsObject)
end

function Player:draw()
	if not isDay then
    	love.graphics.setColor(255, 255, 255)
        
    	love.graphics.rectangle("fill", self.x, self.y, 10, 10)
    end
end

function Player:update(dt)
	if not isDay then
		self.x = self.physicsObject.body:getX()
	    self.y = self.physicsObject.body:getY()

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

	    self.physicsObject.body:setX(self.x)
	    self.physicsObject.body:setY(self.y)
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

