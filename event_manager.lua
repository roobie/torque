
local lute = require('lute')
local Pubsub = lute.pubsub


local eventManager = {
  -- mouseMoved = Pubsub.new {name = 'mouse moved'}
  changeScene = Pubsub.new {name = 'Change scene'}
}


return eventManager
