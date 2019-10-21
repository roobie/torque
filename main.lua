local function reload (name)
  package.loaded[name] = nil
  return _G.require(name)
end

local sys = require('sys')
local resourceManager = require('resource_manager')
local globalInputManager = require('global_input_manager')
local eventManager = require('event_manager')
local sceneManager = require('scene_manager')
local stateManager = nil

local log = sys.Log.new('game.log', 'debug')

local gr = love.graphics
local kb = love.keyboard

local hasFocus = false

function love.load ()
  resourceManager.load()
  gr.setFont(resourceManager.fonts.firaCode.regular)

  sceneManager.load()
  globalInputManager.load()

  log:debug('Starting game')
end

function love.draw ()
  gr.clear(0.1, 0.0, 0.3, 0.4)
  sceneManager.draw()
  sys.drawDebugInfo()
end

function love.update (dt)
  sceneManager.update(dt)
  globalInputManager.update(dt)
end

function love.keypressed (key, scancode, isrepeat)
  if not sceneManager.keypressed(key, scancode, isrepeat) then
    globalInputManager.keypressed(key, scancode, isrepeat)
  end
end

function love.keyreleased (key, scancode) end
function love.mousepressed (x, y, button, istouch, presses) end
function love.mousereleased (x, y, button, istouch, presses) end
function love.mousemoved (x, y, dx, dy, istouch) end
function love.wheelmoved (x, y) end

function love.focus (isfocused)
  hasFocus = isfocused
end

function love.threaderror(thread, errorstr)
  log:error("Thread error! %s", errorstr)
end
