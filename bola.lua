require("pontos")
bola = {}

function bola:load()
    bola.x = 400
    bola.y = 300
    bola.speedX = 500
    bola.speedY = 500
    bola.accel = 1
    

end

function bola:update(dt)
    bola.x = bola.x + bola.speedX * bola.accel * dt
    bola.y = bola.y + bola.speedY * bola.accel * dt

    -- colisão com player (esquerda)
    if bola.x < player.x + player.width and
       bola.y > player.y and
       bola.y < player.y + player.height then
        bola.speedX = -bola.speedX
        bola.x = player.x + player.width -- evita grudar
        pontos.value = pontos.value + 1
        bola.accel = bola.accel + 0.1 -- aumenta a velocidade
    end

    -- colisão com player2 (direita)
    if bola.x + 10 > player2.x and
       bola.y > player2.y and
       bola.y < player2.y + player2.height then
        bola.speedX = -bola.speedX
        bola.x = player2.x - 10 -- evita grudar
        pontos.value = pontos.value + 1
        bola.accel = bola.accel + 0.1 -- aumenta a velocidade
    end

    -- reseta se passar da tela (erro)
    if bola.x < 0 or bola.x > love.graphics.getWidth() then
        bola:reset()
    end
    if bola.y < 0 or bola.y > love.graphics.getHeight() then
        bola.speedY = -bola.speedY
    end
end

function bola:reset()
    bola.x = love.graphics.getWidth() / 2
    bola.y = love.graphics.getHeight() / 2

    -- inverte a direção horizontal aleatoriamente
    if love.math.random() < 0.5 then
        bola.speedX = -500
    else
        bola.speedX = 500
    end

    if love.math.random() < 0.5 then
        bola.speedY = -100
    else
        bola.speedY = 100
    end

    erros.value = erros.value + 1
    bola.accel = 1 -- reseta a aceleração
end


function bola:draw()
    love.graphics.circle("fill", bola.x, bola.y, 10)
end
