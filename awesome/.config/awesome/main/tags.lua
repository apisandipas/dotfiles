-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
    local tags = {}

    awful.screen.connect_for_each_screen(
        function(s)
            -- if s == 1 then
            --   tags[s] = awful.tag({"1", "2", "3"}, s, RC.layouts[1])
            -- end

            -- if s == 3 then
            --   tags[s] = awful.tag({"4", "5", "6", "7"}, s, RC.layouts[1])
            -- end

            -- if s == 2 then
            --   tags[s] = awful.tag({"8", "9"}, s, RC.layouts[1])
            -- end
            -- Each screen has its own tag table.
            tags[s] = awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s, RC.layouts[1])
        end
    )

    return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
    {},
    {__call = function(_, ...)
            return _M.get(...)
        end}
)
