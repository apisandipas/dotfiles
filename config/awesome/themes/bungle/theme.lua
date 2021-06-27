--[[

	Bungle Awesome Wm theme 1.0
	github.com/apisandipas

---]]
local theme_name = "bungle"

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local bungle_table = awful.util.table or gears.table -- 4.{0,1} compatibility


local theme = {}
theme.dir   = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name
theme.font  = "Terminus 10.5"
theme.taglist_font = "Icons 10"
