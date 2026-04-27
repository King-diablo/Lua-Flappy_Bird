TitleScreen = Class { __includes = Base }

function TitleScreen:update(dt)
    print("Play State")
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change("play")
    end
end

function TitleScreen:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf("Flappy Bird", 0, 64, VIRTUAL_WIDTH, "center")

    love.graphics.setFont(mediumFont)
    love.graphics.printf("Press Enter", 0, 100, VIRTUAL_WIDTH, "center")
end
