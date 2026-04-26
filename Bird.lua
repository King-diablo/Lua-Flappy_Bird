Bird = Class {}

local GRAVITY = 980
local JUMP_ROTATION = 0;
local fallSpeed = 60
function Bird:init()
    self.image = love.graphics.newImage("bird.png")
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    -- position the bird in the middle of the screen
    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)
    self.dy = 0
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt

    if love.keyboard.wasPressed("space") then
        self.dy = -300
        JUMP_ROTATION = -30
    end

    self.y = self.y + self.dy * dt

    -- this returns the rotation to 0 after the jump
    if JUMP_ROTATION < 0 then
        JUMP_ROTATION = JUMP_ROTATION + fallSpeed * dt
    end
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y, math.rad(JUMP_ROTATION))
end
