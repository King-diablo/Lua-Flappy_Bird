push = require "push"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288


function love.load()
    -- Load assets, initialize variables, etc.
    love.graphics.setDefaultFilter("nearest", "nearest")
    Background = love.graphics.newImage("background.png")
    Ground = love.graphics.newImage("ground.png")

    love.window.setTitle("Flappy Bird")

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = "normal" })
end

function love.resize(w, h)
    push.resize(w, h)
end

function love.update(dt)
    -- Update game state, handle input, etc.
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    -- Draw game objects, UI, etc.
    push.start()

    love.graphics.draw(Background, 0, 0)

    love.graphics.draw(Ground, 0, VIRTUAL_HEIGHT - 16)

    push.finish()
end
