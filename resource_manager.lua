
local gr = love.graphics
local im = love.image
local mo = love.mouse

local resourceManager = {
  fonts = {};
  cursors = {};
  sprites = {};
  audio = {};
}

local function loadCursor (name, filename, hotx, hoty)
  local imageData = im.newImageData(filename)
  local cursor = mo.newCursor(imageData, hotx, hoty)
  resourceManager.cursors[name] = {
    imageData = imageData;
    cursor = cursor;
  }
end

function resourceManager.load ()
  local firaCode = {}
  firaCode.regular = gr.newFont('resources/FiraCode-Regular.ttf')
  firaCode.regularBig = gr.newFont('resources/FiraCode-Regular.ttf', 32)
  resourceManager.fonts.firaCode = firaCode

  loadCursor('crosshair1', 'resources/crosshair-1.png', 16, 16)
  mo.setCursor(resourceManager.cursors.crosshair1.cursor)
end

return resourceManager
