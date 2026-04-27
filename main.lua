push = require "push"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

Class = require "class"

require "Bird"
require "Pipe"
require "PipePair"
require "StateMachine"
require "states.Base"
require "states.Play"
require "states.TitleScreen"
local backgroundScroll = 0

local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

local BACKGROUND_LOOPING_POINT = 413

function love.load()
    -- Load assets, initialize variables, etc.
    love.graphics.setDefaultFilter("nearest", "nearest")

    Background = love.graphics.newImage("background.png")
    Ground = love.graphics.newImage("ground.png")
    
    smallFont = love.graphics.newFont("font.ttf", 8)
    flappyFont = love.graphics.newFont("flappy.ttf", 28)
    mediumFont = love.graphics.newFont("flappy.ttf", 14)
    hugeFont = love.graphics.newFont("flappy.ttf", 56)

    love.graphics.setFont(flappyFont)
    love.window.setTitle("Flappy Bird")

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = "normal" })
    gStateMachine = StateMachine {
        ["title"] = function() return TitleScreen() end,
        ["play"] = function() return Play() end,
    }

    gStateMachine:change("title")

    -- initialize input table
    love.keyboard.keysPressed = {}
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
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

--[[
    New function used to check our global input table for keys we activated during
    this frame, looked up by their string value.
]]
function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
    love.keyboard.keysPressed[key] = true
end

function love.draw()
    -- Draw game objects, UI, etc.
    push.start()

    love.graphics.draw(Background, -backgroundScroll, 0)

    gStateMachine:render()
    love.graphics.draw(Ground, -groundScroll, VIRTUAL_HEIGHT - 16)

    push.finish()
end
