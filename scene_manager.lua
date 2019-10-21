
local gr = love.graphics
local kb = love.keyboard

local eventManager = require('event_manager')


local sceneManager = {
  currentScene = nil;
}


function sceneManager.loadScene (name)
  sceneManager.currentScene = require(name)
end


eventManager.changeScene:subscribe(function (cfg)
    sceneManager.loadScene(cfg.sceneName)
end)


function sceneManager.load ()
  sceneManager.loadScene('scenes/splash')
end


function sceneManager.draw ()
  sceneManager.currentScene.draw()
end


function sceneManager.update (dt)
  sceneManager.currentScene.update(dt)
end


function sceneManager.keypressed (key, scancode, isrepeat)
  return sceneManager.currentScene.keypressed(key, scancode, isrepeat)
end


return sceneManager
