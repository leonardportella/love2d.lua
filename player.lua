player = {}

function player:load()
    player.x = 0
    player.y = 250
    player.width = 20
    player.height = 100
    player.speed = 500
end

function player:update(dt)
    if love.keyboard.isDown("w") and player.y > 0 then
        player.y = player.y - player.speed * dt
    end

    if love.keyboard.isDown("s") and player.y + player.height < love.graphics.getHeight() then
        player.y = player.y + player.speed * dt
    end
end

function player:draw()
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end
