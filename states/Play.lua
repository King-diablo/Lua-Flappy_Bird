Play = Class { __includes = Base }

PIPE_SPEED = 100
PIPE_WIDTH = 70
PIPE_HEIGHT = 288

BIRD_WIDTH = 38
BIRD_HEIGHT = 24

function Play:init()
    self.bird = Bird()
    self.pipePairs = {}
    self.timer = 0

    self.lastY = -PIPE_HEIGHT + math.random(80) + 20
    self.score = 0;
end

function Play:update(dt)
    self.timer = self.timer + dt

    if self.timer > 2 then
        local y = math.max(-PIPE_HEIGHT + 10, math.min(self.lastY + math.random(-20, 20), -90))
        self.lastY = y

        table.insert(self.pipePairs, PipePair(y))
        self.timer = 0
    end

    for k, pair in pairs(self.pipePairs) do
        if not pair.scored then
            if pair.x + PIPE_WIDTH < self.bird.x then
                self.score = self.score + 1
                pair.scored = true
            end
        end
        pair:update(dt)
    end

    for k, pair in pairs(self.pipePairs) do
        if pair.remove then
            table.remove(self.pipePairs, k)
        end
    end

    self.bird:update(dt)

    for k in pairs(self.pipePairs) do
        for l, pipe in pairs(self.pipePairs[k].pipes) do
            if self.bird:collision(pipe) then
                gStateMachine:change("score", {
                    score = self.score
                })
            end
        end
    end

    if self.bird.y > VIRTUAL_HEIGHT - 15 then
        gStateMachine:change("score", {
            score = self.score
        })
    end
end

function Play:render()
    for k, pair in pairs(self.pipePairs) do
        pair:render()
    end
    self.bird:display()
end
