Bird = Class {}

function Bird:init()
    self.image = love.graphics.newImage("bird.png")
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)
    self.time = 0;
    self.scaleX = 1;
    self.canAnimate = true; -- not necessary (but a nice touch) for the idle animation to stop when the bird dies
end

function Bird:update(dt)
    self:PlayIdleAnimation(dt)
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y, 0, self.scaleX)
end

function Bird:collides(pipe)
    if (self.x + 2) + (self.width - 4) >= pipe.x and self.x + 2 <= pipe.x + PIPE_WIDTH then
        if (self.y + 2) + (self.height - 4) >= pipe.y and self.y + 2 <= pipe.y + PIPE_HEIGHT then
            return true
        end
    end
    return false
end

--[[
    This function creates a simple idle animation for the bird by oscillating its scale on the x-axis using a sine wave. The animation will continue as long as `canAnimate` is true, allowing for the possibility to stop the animation when the bird dies or when certain game events occur.
]]
--- @param dt number
function Bird:PlayIdleAnimation(dt)
    if self.canAnimate then
        self.time = self.time + dt

        local originalScale = 1
        local amplitude = 0.1
        local frequency = 1

        self.scaleX = originalScale + amplitude * math.sin(self.time * frequency)
    end
end
