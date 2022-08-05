-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local sharedtags = require("sharedtags")

local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Key bindings

function _M.get(globalkeys)
  -- Bind all key numbers to tags.
  -- Be careful: we use keycodes to make it work on any keyboard layout.
  -- This should map on the top row of your keyboard, usually 1 to 9.
  for i = 1, 3 do
    globalkeys = gears.table.join(globalkeys,
      awful.key({modkey}, "#" .. i + 9,
        function ()
          local tag = RC.tags[i]
          if tag then
            sharedtags.viewonly(tag, screen[2])
          end
        end
      )
    )
  end

  for i = 4, 7 do
    globalkeys = gears.table.join(globalkeys,
      awful.key({modkey}, "#" .. i + 9,
        function ()
          local tag = RC.tags[i]
          if tag then
            sharedtags.viewonly(tag, screen[1])
          end
        end
      ),

      awful.key({modkey, "Shift"}, "#" .. i + 9,
        function ()
          local tag = RC.tags[i]
          if tag then
            sharedtags.viewonly(tag, screen[2])
          end
        end
      )
    )
  end
  for i = 8, 9 do
    globalkeys = gears.table.join(globalkeys,
      awful.key({modkey, "Shift"}, "#" .. i + 9,
        function ()
          local tag = RC.tags[i]
          if tag then
            sharedtags.viewonly(tag, screen[3])
          end
        end
      ),

      awful.key({modkey, "Shift"}, "#" .. i + 9,
        function ()
          local tag = RC.tags[i]
          if tag then
            sharedtags.viewonly(tag, screen[2])
          end
        end
      )
    )
  end
  for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
      -- Move client to tag.
      awful.key({ modkey, "Shift" }, "#" .. i + 9,
        function ()
          if client.focus then
            local tag = RC.tags[i]
            if tag then
              client.focus:move_to_tag(tag)
            end
          end
        end,
        {description = "move focused client to tag #"..i, group = "tag"})
    )
  end

  return globalkeys
end
-- }}}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
