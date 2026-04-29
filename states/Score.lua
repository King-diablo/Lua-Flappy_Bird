Score = Class { __includes = Base }

function Score:enter(params)
    self.score = params.score
end

function Score:update(dt)
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change("countdown")
    end
end

function Score:render()
    love.graphics.setFont(flappyFont)

    love.graphics.printf("Oof! you lost!", 0, 64, VIRTUAL_WIDTH, "center")

    love.graphics.setFont(mediumFont)
    love.graphics.printf("Score: " .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, "center")


    love.graphics.printf("Press Enter to play again", 0, 160, VIRTUAL_WIDTH, "center")
end
