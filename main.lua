push = require "push"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

Class = require "class"

require "Bird"
require "Pipe"
require "PipePair"
local backgroundScroll = 0

local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

local BACKGROUND_LOOPING_POINT = 413

local pipePairs = {}
local spawnTimer = 0
local lastY = -PIPE_HEIGHT + math.random(80) + 20
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
        local y = math.max(-PIPE_HEIGHT + 10, math.min(lastY + math.random(-20, 20), VIRTUAL_HEIGHT - 90 - PIPE_HEIGHT))
        lastY = y

        table.insert(pipePairs, PipePair(y))
        -- print('Added new pipe!')
        spawnTimer = 0
    end

    for k, pair in pairs(pipePairs) do
        pair:update(dt)
    end

    for k, pair in pairs(pipePairs) do
        if pair.remove then
            table.remove(pipePairs, k)
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

    for k, pair in pairs(pipePairs) do
        pair:render()
    end
    bird:render()

    push.finish()
end
