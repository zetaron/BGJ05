require("states/main")
require("states/menu")
require("util/resources")
require("util/gamestack")

resources = Resources("data/")

function reset()
    -- start game
    menu = Menu()
    main = Main()
    stack = GameStack()
    stack:push(menu)
end

function love.load()
    math.randomseed(os.time())
    resources:addFont("normal", "DejaVuSans.ttf", 20)
    resources:load()
    reset()
end

function love.update(dt)
    stack:update(dt)
end

function love.draw()
    stack:draw()

    --love.graphics.setFont(resources.fonts.tiny)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 5, 5)
end

function love.keypressed(k, u)
    stack:keypressed(k, u)
end

function love.mousepressed( x, y, button )
    stack:mousepressed(x, y, button)
end

function love.quit()
end
