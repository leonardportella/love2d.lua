require("player")
require("player2")
require("bola")
require("pontos")
paused = false

function love.load()
    love.window.setTitle("PONG!")
    love.window.setVSync(0)
    love.window.setFullscreen(false)

    pontos:load()
    player:load()
    player2:load()
    bola:load()
end

function love.keypressed(key)
    if key == "escape" then
        paused = not paused
    end
end

function love.update(dt)
    if paused then return end -- Se pausado, não atualiza nada

    player:update(dt)
    player2:update(dt)
    bola:update(dt)
    pontos:update(dt)
end



function love.draw()
    local fps = love.timer.getFPS()
    love.graphics.print(fps, 10, 10)
    if paused then
        love.graphics.print("PAUSED", love.graphics.getWidth() / 2 - 50, love.graphics.getHeight() / 2)
    end

    player:draw()
    player2:draw()
    bola:draw()
    pontos:draw()
end

