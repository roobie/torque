
local gr = love.graphics
local resourceManager = require('resource_manager')
local eventManager = require('event_manager')


local splashScene = {}


function splashScene.draw ()
  gr.printf(
    'Torque',
    resourceManager.fonts.firaCode.regularBig,
    100, 100,
    300,
    'center'
  )
end


function splashScene.update (dt)
end


function splashScene.keypressed (key, scancode, isrepeat)
  if scancode == 'return' then
    eventManager.changeScene {
      sceneName = 'demo'
    }
    return true
  end
  return false
end


return splashScene
