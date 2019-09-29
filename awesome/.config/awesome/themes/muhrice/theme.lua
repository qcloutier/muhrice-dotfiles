--
-- ~/.config/awesome/themes/muhrice/theme.lua
--

-- Basic stuff

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/"

-- Colours and styles

theme.font = "DejaVu Sans 9"

theme.wallpaper = themes_path .. "muhrice/wallpaper.jpeg"

theme.icon_dir  = themes_path .. "muhrice/icons/"

theme.icon_theme = "/usr/share/icons/Numix-Circle"

theme.fg_focus    = "#e6e6e6"
theme.fg_normal   = "#ffffff"
theme.fg_urgent   = theme.fg_focus
theme.fg_minimize = theme.fg_normal

theme.bg_focus    = "#000000CC"
theme.bg_normal   = "#1a1a1aCC"
theme.bg_urgent   = theme.bg_focus
theme.bg_minimize = theme.bg_normal

theme.border_normal = theme.bg_normal
theme.border_focus  = theme.bg_focus
theme.border_width  = dpi(1)

theme.tooltip_border_color = theme.fg_focus
theme.tooltip_border_width = theme.border_width

theme.useless_gap = dpi(5)

-- Layout icons

theme.layout_tileleft   = theme.icon_dir .. "tileleft.png"
theme.layout_tile       = theme.icon_dir .. "tileright.png"
theme.layout_tilebottom = theme.icon_dir .. "tilebottom.png"
theme.layout_tiletop    = theme.icon_dir .. "tiletop.png"
theme.layout_fairh      = theme.icon_dir .. "fairh.png"
theme.layout_fairv      = theme.icon_dir .. "fairv.png"
theme.layout_floating   = theme.icon_dir .. "floating.png"
theme.layout_max        = theme.icon_dir .. "max.png"
theme.layout_fullscreen = theme.icon_dir .. "fullscreen.png"

-- Menu theming
theme.menu_height = dpi(24)
theme.menu_width  = dpi(150)
theme.awesome_icon = theme_assets.awesome_icon(
	theme.menu_height, theme.bg_focus, theme.fg_focus
)
theme.menu_submenu_icon = theme.icon_dir .. "submenu.png"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Titlebar icons

theme.titlebar_close_button_focus  = theme.icon_dir .. "close_focus.png"
theme.titlebar_close_button_normal = theme.icon_dir .. "close_normal.png"

theme.titlebar_maximized_button_focus_active    = theme.icon_dir .. "maximized_focus_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.icon_dir .. "maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.icon_dir .. "maximized_normal_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.icon_dir .. "maximized_normal_inactive.png"

theme.titlebar_minimize_button_focus  = theme.icon_dir .. "minimize_focus.png"
theme.titlebar_minimize_button_normal = theme.icon_dir .. "minimize_normal.png"

theme.titlebar_ontop_button_focus_active    = theme.icon_dir .. "ontop_focus_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme.icon_dir .. "ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active   = theme.icon_dir .. "ontop_normal_active.png"
theme.titlebar_ontop_button_normal_inactive = theme.icon_dir .. "ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active    = theme.icon_dir .. "sticky_focus_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme.icon_dir .. "sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active   = theme.icon_dir .. "sticky_normal_active.png"
theme.titlebar_sticky_button_normal_inactive = theme.icon_dir .. "sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active    = theme.icon_dir .. "floating_focus_active.png"
theme.titlebar_floating_button_focus_inactive  = theme.icon_dir .. "floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active   = theme.icon_dir .. "floating_normal_active.png"
theme.titlebar_floating_button_normal_inactive = theme.icon_dir .. "floating_normal_inactive.png"

return theme
