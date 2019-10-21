local function reload (name)
  package.loaded[name] = nil
  return _G.require(name)
end

local sys = require('sys')
local resourceManager = require('resource_manager')
local inputManager = nil
local sceneManager = nil
local stateManager = nil

local log = sys.Log.new('game.log', 'debug')

local gr = love.graphics
local kb = love.keyboard

local hasFocus = false

function love.load ()
  resourceManager.load()
  gr.setFont(resourceManager.fonts.firaCode.regular)

  log:debug('Starting game')
end

function love.draw ()
  sys.drawDebugInfo()
end

function love.update (dt)
end

function love.keypressed (key, scancode, isrepeat)
  if kb.isDown('lalt') then
    if scancode == 'q' then
      love.event.quit()
    elseif scancode == 'r' then
      reload()
    end
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
