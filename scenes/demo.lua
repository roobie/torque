
local gr = love.graphics
local resourceManager = require('resource_manager')
local eventManager = require('event_manager')


local demoScene = {}


function demoScene.draw ()
  gr.printf(
    'DEMO',
    resourceManager.fonts.firaCode.regularBig,
    200, 200,
    300,
    'center'
  )
end


function demoScene.update (dt)
end


function demoScene.keypressed (key, scancode, isrepeat)
  return false
end


return demoScene
