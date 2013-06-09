require("util/resources")
require("util/gamestack")

require("states/main")
require("states/menu")
require("objects/hud")

resources = Resources("data/")

function reset()
    -- start game
    menu = Menu()
    main = Main()
    stack = GameStack()
    stack:push(menu)

    hud = Hud()
end

function love.load()
    math.randomseed(os.time())
    resources:addFont("normal", "DejaVuSans.ttf", 20)

    resources:addImage("hud_tile", "GuiTile.png")
    resources:addImage("hud_overlay", "TimerFrame.png")
    resources:addImage("hud_underlay", "TimerFace.png")
    resources:addImage("grass", "grass.png")
    resources:addImage("light_turret", "LightTurret.png")

    resources:load()
    reset()
end

function love.update(dt)
    stack:update(dt)

    hud:update(dt)
end

function love.draw()
    stack:draw()

    --love.graphics.setFont(resources.fonts.tiny)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 5, 5)

    hud:draw()
end

function love.keypressed(k, u)
    stack:keypressed(k, u)
end

function love.mousepressed( x, y, button )
    stack:mousepressed(x, y, button)
end

function love.quit()
end
