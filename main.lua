push = require "push"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

Class = require "class"

require "Bird"
require "Pipe"
local backgroundScroll = 0

local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

local BACKGROUND_LOOPING_POINT = 413

local pipes = {}
local spawnTimer = 0
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
    bird = Bird()
end

function love.resize(w, h)
    push.resize(w, h)
end

function love.update(dt)
    -- Update game state, handle input, etc.
    -- scroll the background by the set speed * dt, looping back to 0 after the looping point
    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT

    -- scroll the ground by the set speed * dt, looping back to 0 after the width of the texture
    groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH
    spawnTimer = spawnTimer + dt

    if spawnTimer > 2 then
        table.insert(pipes, Pipe())
        print('Added new pipe!')
        spawnTimer = 0
    end

    for key, pipe in pairs(pipes) do
        pipe:update(dt)

        if pipe.x < -pipe.width then
            table.remove(pipes, key)
        end
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    -- Draw game objects, UI, etc.
    push.start()

    love.graphics.draw(Background, -backgroundScroll, 0)

    love.graphics.draw(Ground, -groundScroll, VIRTUAL_HEIGHT - 16)

    bird:render()
    for key, pipe in pairs(pipes) do
        pipe:render()
    end
    push.finish()
end
