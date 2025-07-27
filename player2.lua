player2 = {}

function player2:load()
    player2.width = 20
    player2.height = 100
    player2.x = love.graphics.getWidth() - player2.width
    player2.y = 250
    player2.speed = 500
end

function player2:update(dt)
    if love.keyboard.isDown("up") and player2.y > 0 then
        player2.y = player2.y - player2.speed * dt
    end

    if love.keyboard.isDown("down") and player2.y + player2.height < love.graphics.getHeight() then
        player2.y = player2.y + player2.speed * dt
    end
end

function player2:draw()
    love.graphics.rectangle("fill", player2.x, player2.y, player2.width, player2.height)
end
