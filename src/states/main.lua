require("util/gamestate")
require("util/resources")

Main = class("Main", GameState)

function Main:draw()
    love.graphics.setBackgroundColor(17, 17, 17)
    love.graphics.setColor(255, 255, 255)


    player = Player()

    


end

function Main:keypressed(k, u)
    stack:pop()
end
