--
-- ~/.config/awesome/rc.lua
--


--
-- LIBRARIES
--

-- Standard
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")


--
-- ERRORS
--

-- Startup error handling
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Some errors occurred during startup:",
        text = awesome.startup_errors
    })
end

-- Runtime error handling
do
    local in_error = false
    awesome.connect_signal(
        "debug::error",
        function (err)
            if in_error then return end
            in_error = true

            naughty.notify({
                preset = naughty.config.presets.critical,
                title = "An error just occurred:",
                text = tostring(err)
            })
            in_error = false
        end
    )
end


--
-- PREFERENCES
--

-- Load the theme
beautiful.init("~/.config/awesome/themes/muhrice/theme.lua")

-- Set default programs
terminal = "urxvtc"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor


--
-- BINDINGS
--

-- Modifier keys
altkey = "Mod1"
modkey = "Mod4"

-- Global mouse bindings
root.buttons(
    gears.table.join(
        awful.button(
            { }, 3,
            function()
                mymainmenu:toggle()
            end
        ),
        awful.button(
            { }, 4,
            awful.tag.viewnext
        ),
        awful.button(
            { }, 5,
            awful.tag.viewprev
        )
    )
)

-- Client mouse bindings
clientbuttons = gears.table.join(
    awful.button(
        { }, 1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end
    ),
    awful.button(
        { modkey }, 1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end),
    awful.button(
        { modkey }, 3,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end
    )
)

-- Global key bindings
globalkeys = gears.table.join(
    awful.key(
        { modkey }, "s",
        hotkeys_popup.show_help,
        { description="show help", group="awesome" }
    ),
    awful.key(
        { modkey }, "w",
        function()
            mymainmenu:toggle()
        end,
        { description="show main menu", group="awesome" }
    ),
    awful.key(
        { modkey }, "x",
        function()
            awful.prompt.run {
                prompt = "Run Lua code: ",
                textbox = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        { description="lua execute prompt", group="awesome" }
    ),
    awful.key(
        { modkey, "Control" }, "r",
        awesome.restart,
        { description="reload awesome", group="awesome" }
    ),
    awful.key(
        { modkey, "Control" }, "q",
        awesome.quit,
        { description="quit awesome", group="awesome" }
    ),
    awful.key(
        { modkey }, "j",
        function()
            awful.client.focus.byidx(1)
        end,
        { description="focus next by index", group="client" }
    ),
    awful.key(
        { modkey }, "k",
        function()
            awful.client.focus.byidx(-1)
        end,
        { description="focus previous by index", group="client" }
    ),
    awful.key(
        { modkey, "Shift" }, "j",
        function()
            awful.client.swap.byidx(1)
        end,
        { description="swap with next client by index", group="client" }
    ),
    awful.key(
        { modkey, "Shift" }, "k",
        function()
            awful.client.swap.byidx(-1)
        end,
        { description="swap with previous client by index", group="client" }
    ),
    awful.key(
        { modkey }, "u",
        awful.client.urgent.jumpto,
        { description="jump to urgent client", group="client" }
    ),
    awful.key(
        { modkey }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description="go back", group="client" }
    ),
    awful.key(
        { modkey, "Shift" }, "n",
        function()
            local c = awful.client.restore()
            if c then
                c:emit_signal("request::activate", "key.unminimize", {raise = true})
            end
        end,
        { description="restore minimized", group="client" }
    ),
    awful.key(
        { modkey }, "Return",
        function()
            awful.spawn(terminal)
        end,
        { description="open a terminal", group="launcher" }
    ),
    awful.key(
        { modkey }, "r",
        function()
            awful.screen.focused().mypromptbox:run()
        end,
        { description="run prompt", group="launcher" }
    ),
    awful.key(
        { modkey }, "p",
        function()
            menubar.show()
        end,
        { description="show the menubar", group="launcher" }
    ),
    awful.key(
        { modkey }, "l",
        function()
            awful.tag.incmwfact(0.05)
        end,
        { description="increase master width factor", group="layout" }
    ),
    awful.key(
        { modkey }, "h",
        function()
            awful.tag.incmwfact(-0.05)
        end,
        { description="decrease master width factor", group="layout" }
    ),
    awful.key(
        { modkey, "Shift" }, "h",
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        { description="increase the number of master clients", group="layout" }
    ),
    awful.key(
        { modkey, "Shift" }, "l",
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        { description="decrease the number of master clients", group="layout" }
    ),
    awful.key(
        { modkey, "Control" }, "h",
        function()
            awful.tag.incncol( 1, nil, true)
        end,
        { description="increase the number of columns", group="layout" }
    ),
    awful.key(
        { modkey, "Control" }, "l",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        { description="decrease the number of columns", group="layout" }
    ),
    awful.key(
        { modkey }, "space",
        function()
            awful.layout.inc(1)
        end,
        { description="select next", group="layout" }
    ),
    awful.key(
        { modkey, "Shift" }, "space",
        function()
            awful.layout.inc(-1)
        end,
        { description="select previous", group="layout" }
    ),
    awful.key(
        { modkey, "Control" }, "j",
        function()
            awful.screen.focus_relative(1)
        end,
        { description="focus the next screen", group="screen" }
    ),
    awful.key(
        { modkey, "Control" }, "k",
        function()
            awful.screen.focus_relative(-1)
        end,
        { description="focus the previous screen", group="screen" }
    ),
    awful.key(
        { modkey }, "Left", awful.tag.viewprev,
        { description="view previous", group="tag" }
    ),
    awful.key(
        { modkey }, "Right", awful.tag.viewnext,
        {description="view next", group="tag" }
    ),
    awful.key(
        { modkey }, "Escape", awful.tag.history.restore,
        { description="go back", group="tag" }
    )
)

-- Client keybindings
clientkeys = gears.table.join(
    awful.key(
        { modkey }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description="toggle fullscreen", group="client"}
    ),
    awful.key(
        { modkey, "Shift" }, "c",
        function(c)
            c:kill()
        end,
        { description="close", group="client" }
    ),
    awful.key(
        { modkey, "Control" }, "space",
        awful.client.floating.toggle,
        { description="toggle floating", group="client" }
    ),
    awful.key(
        { modkey, "Control" }, "Return",
        function(c)
            c:swap(awful.client.getmaster())
        end,
        { description="move to master", group="client" }
    ),
    awful.key(
        { modkey }, "o",
        function(c)
            c:move_to_screen()
        end,
        { description="move to screen", group="client" }
    ),
    awful.key(
        { modkey }, "t",
        function(c)
            c.ontop = not c.ontop
        end,
        { description="toggle keep on top", group="client" }
    ),
    awful.key(
        { modkey }, "n",
        function(c)
            c.minimized = true
        end,
        { description="minimize", group="client" }
    ),
    awful.key(
        { modkey }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description="(un)maximize", group="client" }
    ),
    awful.key(
        { modkey, "Control" }, "m",
        function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        { description="(un)maximize vertically", group="client" }
    ),
    awful.key(
        { modkey, "Shift" }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        { description="(un)maximize horizontally", group="client" }
    )
)

-- Tag keybindings
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        awful.key(
            { modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description="view tag #"..i, group="tag" }
        ),
        awful.key(
            { modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description="toggle tag #" .. i, group="tag" }
        ),
        awful.key(
            { modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description="move focused client to tag #"..i, group="tag" }
        ),
        awful.key(
            { modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description="toggle focused client on tag #" .. i, group="tag" }
        )
    )
end

-- Set keys
root.keys(globalkeys)


--
-- MENU
--

-- Apps sub-menu
menuapps = {
    { "Audacity", "flatpak run org.audacityteam.Audacity" },
    { "Discord", "flatpak run com.discordapp.Discord" },
    { "GIMP", "flatpak run org.gimp.GIMP" },
    { "LibreOffice", "flatpak run org.libreoffice.LibreOffice" },
    { "Minecraft", "flatpak run com.mojang.Minecraft" },
    { "OpenShot", "flatpak run org.openshot.OpenShot" },
    { "RetroArch", "flatpak run org.libretro.RetroArch" },
    { "Steam", "flatpak run com.valvesoftware.Steam" },
    { "VS Code", "flatpak run com.visualstudio.code.oss" }
}

-- Programs sub-menu
menuprograms = {
    { "Chromium", "chromium" },
    { "Firefox", "firefox" },
    { "Htop", "urxvtc -e htop" },
    { "KeepassXC", "keepassxc" },
    { "Maim", "sh -c 'maim -s | xclip -selection clipboard -t image/png'" },
    { "MPV", "mpv" },
    { "Ncmpcpp", terminal .. " -e ncmpcpp" },
    { "Neovim", terminal .. " -e nvim" },
    { "Ranger", terminal .. " -e ranger" },
    { "URxvt", "urxvt" },
    { "Virt-Manager", "virt-manager" },
    { "Xournal++", "xournalpp" },
    { "Zathura", "zathura" }
}

-- Settings sub-menu
menusettings = {
    { "Display", "xfce4-display-settings" },
    { "GTK", "xfce4-appearance-settings" }, { "Keyboard", "xfce4-keyboard-settings" },
    { "Mouse", "xfce4-mouse-settings" },
    { "Power", "xfce4-power-manager-settings" },
    { "QT", "qt5ct" },
    { "Startup", "xfce4-session-settings" }
}

-- User sub-menu
menuuser = {
    { "Lock Screen", "dm-tool lock && sudo chvt 8" },
    { "Log Out", function() awesome.quit() end }
}

-- Power sub-menu
menupower = {
    { "Suspend", "sh -c 'sleep 3s && sudo systemctl suspend'" },
    { "Hibernate", "sh -c 'sleep 3s && sudo systemctl hibernate'" },
    { "Restart", "sh -c 'sleep 3s && sudo systemctl restart'" },
    { "Poweroff", "sh -c 'sleep 3s && sudo systemctl poweroff'" }
}

-- Main menu containing the sub menus
mymainmenu = awful.menu({
    items = {
        { "Apps", menuapps },
        { "Programs", menuprograms },
        { "Settings", menusettings },
        { "User", menuuser },
        { "Power", menupower }
    }
})

-- Add the main menu to the launcher
mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mymainmenu
})


--
-- WIBAR
--

-- Keyboard widget
mykeyboardlayout = awful.widget.keyboardlayout()

-- Clock widget
mytextclock = wibox.widget.textclock()

-- Taglist buttons
local taglist_buttons = gears.table.join(
    awful.button(
        {}, 1,
        function(t)
            t:view_only()
        end
    ),
    awful.button(
        { modkey }, 1,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),
    awful.button(
        {}, 3,
        awful.tag.viewtoggle
    ),
    awful.button(
        { modkey }, 3,
        function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    ),
    awful.button(
        {}, 4,
        function(t)
            awful.tag.viewnext(t.screen)
        end
    ),
    awful.button(
        {}, 5,
        function(t)
            awful.tag.viewprev(t.screen)
        end
    )
)

-- Tasklist buttons
local tasklist_buttons = gears.table.join(
    awful.button(
        {}, 1,
        function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    { raise = true }
                )
            end
        end
    ),
    awful.button(
        { }, 3,
        function()
            awful.menu.client_list({ theme = { width = 250 } })
        end
    ),
    awful.button(
        { }, 4,
        function ()
           awful.client.focus.byidx(1)
        end
    ),
    awful.button(
        { }, 5,
        function ()
            awful.client.focus.byidx(-1)
        end
    )
)


--
-- SCREENS
--

-- Define available layouts
awful.layout.layouts = {
    awful.layout.suit.tile.left,
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen
}

-- Set the wallpaper
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Reset when display settings change
screen.connect_signal("property::geometry", set_wallpaper)

-- Setup each screen
awful.screen.connect_for_each_screen(
    function(s)
        -- Wallpaper
        set_wallpaper(s)
        -- Tags
        awful.tag({ "Default", "Web", "I", "II", "III", "Game" }, s, awful.layout.layouts[1])
        -- Prompt
        s.mypromptbox = awful.widget.prompt()
        -- Layout
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(
            gears.table.join(
                awful.button({}, 1, function() awful.layout.inc(1) end),
                awful.button({}, 3, function() awful.layout.inc(-1) end),
                awful.button({}, 4, function() awful.layout.inc(1) end),
                awful.button({}, 5, function() awful.layout.inc(-1) end)
            )
        )
        -- Taglist
        s.mytaglist = awful.widget.taglist {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            buttons = taglist_buttons
        }
        -- Tasklist
        s.mytasklist = awful.widget.tasklist {
            screen = s,
            filter = awful.widget.tasklist.filter.currenttags,
            buttons = tasklist_buttons
        }
        -- Wibox
        s.mywibox = awful.wibar({ position = "top", screen = s })
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left
                layout = wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mypromptbox
            },
            s.mytasklist,
            { -- Right
                layout = wibox.layout.fixed.horizontal,
                mykeyboardlayout,
                wibox.widget.systray(),
                mytextclock,
                s.mylayoutbox
            },
        }
    end
)


--
-- CLIENTS
--

-- Define rules
awful.rules.rules = {
    -- Rules for all clients
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            size_hints_honor = false
        }
    },
    -- Add titlebars to most clients
    {
        rule_any = {
            type = {
                "normal",
                "dialog"
            }
        },
        properties = {
            titlebars_enabled = true
        }
    },
    -- Make some clients always float
    {
        rule_any = {
            instance = {
                "copyq",
                "pinentry"
            },
            type = {
                "dialog"
            },
            role = {
                "pop-up"
            }
        },
        properties = {
            floating = true
        }
    },
    -- Start some clients on a specific tag
    {
        rule = { class = "Firefox" },
        properties = { tag = "Web" }
    },
    {
        rule = { class = "Google Chrome" },
        properties = { tag = "Web" }
    },
    {
        rule = { class = "Steam" },
        properties = { tag = "Games" }
    },
    {
        rule = { class = "RetroArch" },
        properties = { tag = "Games" }
    }
}

-- Position new clients
client.connect_signal(
    "manage",
    function(c)
        if awesome.startup
            and not c.size_hints.user_position
            and not c.size_hints.program_position
        then
            awful.placement.no_offscreen(c)
        end
    end
)

-- Draw titlebars
client.connect_signal(
    "request::titlebars",
    function(c)
        -- Mouse actions
        local buttons = gears.table.join(
            awful.button(
                { }, 1,
                function()
                    c:emit_signal("request::activate", "titlebar", {raise = true})
                    awful.mouse.client.move(c)
                end
            ),
            awful.button(
                { }, 3,
                function()
                    c:emit_signal("request::activate", "titlebar", {raise = true})
                    awful.mouse.client.resize(c)
                end
            )
        )
        -- Button layout
        awful.titlebar(c) : setup {
            { -- Left
                awful.titlebar.widget.iconwidget(c),
                buttons = buttons,
                layout  = wibox.layout.fixed.horizontal
            },
            { -- Middle
                {
                    align = "center",
                    widget = awful.titlebar.widget.titlewidget(c)
                },
                buttons = buttons,
                layout  = wibox.layout.flex.horizontal
            },
            { -- Right
                awful.titlebar.widget.floatingbutton(c),
                awful.titlebar.widget.stickybutton(c),
                awful.titlebar.widget.ontopbutton(c),
                awful.titlebar.widget.minimizebutton(c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.closebutton(c),
                layout = wibox.layout.fixed.horizontal
            },
            layout = wibox.layout.align.horizontal
        }
    end
)

-- Draw borders
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Fill empty space
size_hints_honor = false

-- Sloppy focus
client.connect_signal(
    "mouse::enter",
    function(c)
        c:emit_signal("request::activate", "mouse_enter", {raise = false})
    end
)
