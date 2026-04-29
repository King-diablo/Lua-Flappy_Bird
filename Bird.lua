Bird = Class {}

local GRAVITY = 850
local JUMP_ROTATION = 0;
local fallSpeed = 60

function Bird:init()
    self.image = love.graphics.newImage("bird.png")
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    -- position the bird in the middle of the screen
    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)
    self.time = 0;
    self.scaleX = 1;
    self.canAnimate = true --false  -- not necessary (but a nice touch) for the idle animation to stop when the bird dies
    self.dy = 0
end



function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt

    if love.keyboard.wasPressed("space") or love.mouse.wasPressed(1) then
        self.dy = -200
        gSounds["jump"]:play()
        if self.canAnimate then
            JUMP_ROTATION = -30
        end
    end

    self:IdleAnimation(dt)

    self.y = self.y + self.dy * dt

    -- this returns the rotation to 0 after the jump
    if self.canAnimate and JUMP_ROTATION < 0 then
        JUMP_ROTATION = JUMP_ROTATION + fallSpeed * dt
    else
        JUMP_ROTATION = 0
    end

end

function Bird:collision(pipe)
    if (self.x + 2) + (self.width - 4) >= pipe.x and self.x + 2 <= pipe.x + PIPE_WIDTH then
        if (self.y + 2) + (self.height - 4) >= pipe.y and self.y + 2 <= pipe.y + PIPE_HEIGHT then
            return true
        end
    end
    return false
end

function Bird:IdleAnimation(dt)
    if self.canAnimate then
        self.time = self.time + dt

        local originalScale = 1
        local amplitude = 0.1
        local frequency = 1

        self.scaleX = originalScale + amplitude * math.sin(self.time * frequency)
    end

end

function Bird:display()
    love.graphics.draw(self.image, self.x, self.y, math.rad(JUMP_ROTATION))
end
