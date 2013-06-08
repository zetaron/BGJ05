require("util/gamestate")
require("util/resources")
require("objects/player")

Main = class("Main", GameState)

function Main:start()
    player = Player()
end

function Main:draw()
    love.graphics.setBackgroundColor(17, 17, 17)
    love.graphics.setColor(255, 255, 255)

    player:draw()





end

function Main:update(dt)
    player:update(dt)
end

function Main:keypressed(k, u)
    if k == "escape" then
        stack:pop()
    else
        player:keypressed(k, u)
    end
end
