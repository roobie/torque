
local gr = love.graphics
local kb = love.keyboard


local globalInputManager = {
}


function globalInputManager.load ()
end


function globalInputManager.update (dt)
end


function globalInputManager.keypressed (key, scancode, isrepeat)
  if kb.isDown('lalt') then
    if scancode == 'q' then
      love.event.quit()
    elseif scancode == 'r' then
      reload()
    end
  end
end


return globalInputManager
