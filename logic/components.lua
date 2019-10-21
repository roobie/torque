local components = {}


--- Define a new component. It assigns a new function to a table property on the
--- `components` table at the key `name`. The function creates a new table each
--- time it is invoked, and tags it with the name in the __name table property.
function components:define (name, def)
  self[name] = function (init)
    local result = {__name = name}
    for k, v in pairs(def) do
      result[k] = v
    end
    if init ~= nil then
      for k, v in pairs(init) do
        if result[k] ~= nil then
          result[k] = v
        end
      end
    end

    return result
  end
end


components:define(
  'physicalAttributes',
  {
    agility = 0;
    strength = 0;
    dexterity = 0;
    constitution = 0;
  }
)


components:define(
  'mentalAttributes',
  {
    memory = 0;
    insight = 0;
    toughness = 0;
    spirituality = 0;
  }
)


components:define(
  'characteristics',
  {
    courage = 0; -- cowardice
    guile = 0; -- ?
    wary = 0;
  }
)


components:define(
  'needs',
  {
    hunger = 0;
    thirst = 0;
    sleep = 0;
  }
)


return components
