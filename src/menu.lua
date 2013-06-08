-- menu

require("util/gamestate")
require("util/resources")

Menu = class("Menu", GameState)

function Menu:draw()
    love.graphics.setBackgroundColor(17, 17, 17)
    love.graphics.setColor(255, 255, 255)

    love.graphics.clear()
    love.graphics.setFont(resources.fonts.normal)
    love.graphics.print("Press Escape to skip menu", 10, 10)
end

function Menu:keypressed(k, u)
    stack:pop()
end
