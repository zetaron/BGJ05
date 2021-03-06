function love.conf(t)
    t.title = "GAME TITLE"
    t.author = "AUTHOR"
    t.identity = "IDENTITY"
    t.version = "0.8.0" -- Löve version
    t.console = false
    t.release = false
    t.screen.width = 256*4
    t.screen.height = 256*4
    t.screen.fullscreen = false
    t.screen.vsync = true
    t.screen.fsaa = 0

    t.modules.joystick = false
    t.modules.audio = false
    t.modules.keyboard = true
    t.modules.event = true
    t.modules.image = true
    t.modules.graphics = true
    t.modules.timer = true
    t.modules.mouse = true
    t.modules.sound = false
    t.modules.physics = true
end

