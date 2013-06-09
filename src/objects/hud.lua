require("objects/object")
require("util/resources")

Hud = class("Hud", Object)

function Hud:__init()
	self.x = (love.graphics.getWidth() / 2) - (128 / 2)
	self.y = 0
	self.underlayRotation = math.rad(180)
	self.lastTime = love.timer.getTime()
end

function Hud:draw()
	local tile = resources.images.hud_tile
	tile:setWrap("repeat", "clamp")

	local windowWidth = love.graphics.getWidth()
	local tileWidth = tile:getWidth()

	local spriteBatch = love.graphics.newSpriteBatch(tile, 2000)
	for x = 0, (windowWidth / tileWidth) do
		spriteBatch:add(x * tileWidth, 0)
	end

	local underlay = resources.images.hud_underlay
	local underlayWidth = underlay:getWidth() / 2
	local underlayHeight = underlay:getHeight() / 2

	local overlay = resources.images.hud_overlay
	local overlayWidth = overlay:getWidth() / 2

	love.graphics.draw(spriteBatch, 0, 0)
	love.graphics.draw(underlay, self.x + underlayWidth + overlayWidth, self.y + underlayHeight, self.underlayRotation, 1, 1, underlayWidth, underlayHeight)
	love.graphics.draw(overlay, self.x + overlayWidth, self.y)

	love.graphics.print("TIME: " .. love.timer.getTime() - self.lastTime, 20, 30)
	love.graphics.print("LAST TIME: " .. self.lastTime, 20, 60)
end

function Hud:update(dt)
	local somePasedTime = (love.timer.getTime() - self.lastTime) 
	local percentPerSecond = 180 / 60
	local timePercent = percentPerSecond * somePasedTime

	self.underlayRotation = math.rad(timePercent)

	if somePasedTime <= 60 then
		isDay = true
	elseif somePasedTime >= 60 then
		isDay = false
	end

	if self.underlayRotation >= math.rad(360) then
		self.underlayRotation = math.rad(0)
		self.lastTime = love.timer.getTime()
	end
end


function Hud:keypressed(k, u)
end

