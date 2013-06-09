require("util/gamestate")
require("util/resources")

require("external/AnAL")


Player = class("Player", Entity)

function Player:__init()
    self.sepeed = 1

    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()

    self.x = windowWidth / 2
    self.y = windowHeight / 2

    self.anim = newAnimation(resources.images.player, 16, 16, 0.3, 0)
    self.walking = false
    self.walk_angle = 0
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

    	--love.graphics.rectangle("fill", self.x, self.y, 10, 10)
        self.anim:draw(self.x - 16/2, self.y - 16/2, self.walk_angle, 2, 2, 8, 8)
    end
end

function Player:update(dt)
	if not isDay then
		self.x = self.physicsObject.body:getX()
	    self.y = self.physicsObject.body:getY()
        self.walking = false

        local walksUp = false
        local walksDown = false
        local walksRight = false
        local walksLeft = false

		if love.keyboard.isDown("up", "w") then
	    	self.y = self.y - self.sepeed
            self.walk_angle = math.rad(180)
            walksUp = true
            self.walking = true

            self.walk_angle = math.rad(180)
	    elseif love.keyboard.isDown("down", "s") then
	    	self.y = self.y + self.sepeed
            self.walk_angle = math.rad(0)
            walksDown = true
            self.walking = true
	    end

	    if love.keyboard.isDown("right", "d") then
	    	self.x = self.x + self.sepeed
            self.walk_angle = math.rad(270)
            walksLeft = true
            self.walking = true
	    elseif love.keyboard.isDown("left", "a") then
	    	self.x = self.x - self.sepeed
            self.walk_angle = math.rad(90)
            walksRight = true
            self.walking = true
	    end

        if walksUp and walksRight then
            self.walk_angle = math.rad(180 - 45)
        end

        if walksUp and walksLeft then
            self.walk_angle = math.rad(180 + 45)
        end

        if walksDown and walksRight then
            self.walk_angle = math.rad(45)
        end

        if walksDown and walksLeft then
            self.walk_angle = math.rad(-45)
        end

        if not self.walking then
            self.anim:stop()
            self.anim:seek(2)

        else
            self.anim:play()
        end


	    self.physicsObject.body:setX(self.x)
	    self.physicsObject.body:setY(self.y)
	end

    self.anim:update(dt)
end

function Player:attack()
	-- some awesome attack move
end

function Player:keypressed(k, u)
    if k == "space" or k == "return" then
    	self.attack()
    end
end

