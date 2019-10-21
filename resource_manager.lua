
local gr = love.graphics

local resourceManager = {
  fonts = {};
  sprites = {};
  audio = {};
}

function resourceManager.load ()
  local firaCode = {}
  firaCode.regular = gr.newFont('resources/FiraCode-Regular.ttf')
  resourceManager.fonts.firaCode = firaCode
end

return resourceManager
