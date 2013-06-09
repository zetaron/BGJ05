require("util/gamestate")
require("util/resources")

Object = class("Object")

function Object:__init()
end

function Object:draw()
end

function Object:update(dt)
end

function Object:keypressed(k, u)
end

function Object:beginContact(b, coll)
end

function Object:endContact(b, coll)
end

function Object:preSolve(b, coll)
end

function Object:postSolve(b, coll)
end