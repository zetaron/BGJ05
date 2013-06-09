require("objects/object")
require("util/resources")

Tower = class("Tower", Object)

function Tower:__init(x, y)
    self.health = 100
    self.x = x
    self.y = y

    self.physicsObject = {}
	self.physicsObject.body = love.physics.newBody(world, self.x, self.y, "static")
    self.physicsObject.shape = love.physics.newRectangleShape(1, 1)
    self.physicsObject.fixture = love.physics.newFixture(self.physicsObject.body, self.physicsObject.shape, 1)
    self.physicsObject.fixture:setUserData(self)

	table.insert(entities, self.physicsObject)
end

function Tower:draw()
    love.graphics.draw(resources.images.light_turret, self.x, self.y)
end

function Tower:update(dt)
	-- body
end