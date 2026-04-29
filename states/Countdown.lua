Countdown = Class { __includes = Base }

COUNTDOWN_TIME = 0.75

function Countdown:init()
    self.count = 3
    self.timer = 0
end

function Countdown:update(dt)
    self.timer = self.timer + dt
    if self.timer > COUNTDOWN_TIME then
        self.timer = self.timer % COUNTDOWN_TIME
        self.count = self.count - 1

        if self.count == 0 then
            gStateMachine:change("play")
            isPlaying = true;
        end
    end
end

function Countdown:render()
    love.graphics.setFont(hugeFont)
    love.graphics.printf(tostring(self.count), 0, 120, VIRTUAL_WIDTH, "center")
end
