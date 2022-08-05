-- Standard awesome library
local awful = require("awful")
local sharedtags = require("sharedtags")
local layouts = RC.layouts
local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
    -- local tags = {}
    local tags = sharedtags({
        { name = "1", screen = 2, layout = layouts[1] },
        { name = "2", screen = 2, layout = layouts[1] },
        { name = "3", screen = 2, layout = layouts[1] },
        { name = "4", screen = 1 ,layout = layouts[1] },
        { name = "5", screen = 1, layout = layouts[1] },
        { name = "6", screen = 1, layout = layouts[1] },
        { name = "7", screen = 1, layout = layouts[1] },
        { name = "8", screen = 3, layout = layouts[1] },
        { name = "9", screen = 3, layout = layouts[1] },
    })
    -- awful.screen.connect_for_each_screen(
    --     function(s)
    --         -- Each screen has its own tag table.
    --         tags[s] = awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s, RC.layouts[1])
    --     end
    -- )

    return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
    {},
    {__call = function(_, ...)
            return _M.get(...)
        end}
)
