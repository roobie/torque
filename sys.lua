local sys = {}

local lute = require('lute')
local prototype = lute.prototype

local timer = love.timer
local gr = love.graphics


local Log = prototype {}
sys.Log = Log

function Log.new (filename, level)
  local file = io.open(filename, 'w+')
  local instance = Log {
    file = file;
    level = 'debug';
    levels = {
      debug = 1,
      verbose = 2,
      info = 3,
      warning = 4,
      error = 5,
    }
  }
  instance:setLevel(level)
  return instance
end

function Log.write (self, fmt, ...)
  local msg = string.format(fmt..'\n', ...)
  io.write(msg)
  io.flush()
  self.file:write(msg)
  self.file:flush()
end

function Log.debug (self, fmt, ...)
  if self:isEnabled('debug') then
    self:write(string.format('[DBG]: %s', fmt), ...)
  end
end

function Log.verbose (self, fmt, ...)
  if self:isEnabled('verbose') then
    self:write(string.format('[VRB]: %s', fmt), ...)
  end
end

function Log.info (self, fmt, ...)
  if self:isEnabled('info') then
    self:write(string.format('[INF]: %s', fmt), ...)
  end
end

function Log.warning (self, fmt, ...)
  if self:isEnabled('warning') then
    self:write(string.format('[WRN]: %s', fmt), ...)
  end
end

function Log.error (self, fmt, ...)
  if self:isEnabled('error') then
    self:write(string.format('[ERR]: %s', fmt), ...)
  end
end

function Log.setLevel (self, level)
  if self.levels[level] then
    self.level = level
  else
    error(string.format('Invalid level: [%s]', tostring(level)))
  end
end

function Log.getLevelValue (self, level)
  return self.levels[level]
end

function Log.isEnabled (self, level)
  return self:getLevelValue(level) >= self:getLevelValue(self.level)
end

function Log.close (self)
  self.file:close()
end


function sys.drawDebugInfo ()
  local fps = timer.getFPS()
  gr.setColor(1, 1, 1, 1)
  gr.printf(string.format('FPS: %f', fps), 0, 0, 200, 'left')
end


return sys
