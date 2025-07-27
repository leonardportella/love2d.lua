pontos = {}

local myfont = love.graphics.newFont('fonts/font.ttf', 15)

function pontos:load()
    erros = {}
    erros.value = 0
    pontos.value = 0
end

function pontos:update(dt)
end

function pontos:draw()
    love.graphics.setFont(myfont)
    love.graphics.print("Points: " .. pontos.value, 200, 20)
    love.graphics.print("Goals: " .. erros.value, 500, 20)
end