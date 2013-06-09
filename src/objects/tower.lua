require("objects/object")
require("util/resources")

Tower = class("Tower", Object)

function Tower:__init(x, y)
    self.health = 100
    self.x = x
    self.y = y

    self.physicsObject = {}
	self.physicsObject.body = love.physics.newBody(world, self.x, self.y, "dynamic")
    self.physicsObject.shape = love.physics.newCircleShape(24)
    self.physicsObject.fixture = love.physics.newFixture(self.physicsObject.body, self.physicsObject.shape, 1)
    self.physicsObject.fixture:setUserData(self)

	table.insert(entities, self.physicsObject)
end

function Tower:draw()
    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle("fill", self.x, self.y, 32, 32)
    love.graphics.setColor(255, 255, 255)
end

function Tower:update(dt)
	-- body
end