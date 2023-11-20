local wezterm = require("wezterm")
local utils = require("utils")

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utils.icons.solid_rigt_arrow
local THIN_RIGHT_ARROW = utils.icons.thin_right_arrow
local EDGE_BACKGROUND = "#0b0022"
local BACKGROUND_INACTIVE = "#292e42"
local FOREGROUND_INACTIVE = "#545c7e"
local BACKGROUND_ACTIVE = "#7aa2f7"
local FOREGROUND_ACTIVE = "#1f2335"

local function dir_description(tab_info)
   local dir = tab_info.active_pane.current_working_dir
   if utils.ends_with(dir, wezterm.home_dir) then
      return utils.icons.home
   end

   return utils.basename(dir)
end

local function tab_title(tab_info, max_width)
   local process_name = utils.basename(tab_info.active_pane.foreground_process_name)
   local dir = dir_description(tab_info)
   local icon = utils.icons[process_name] or utils.icons.bash
   process_name = wezterm.truncate_right(process_name, max_width)
   return " " .. icon .. " " .. process_name .. " at " .. dir .. " "
end

local function add_text_with_colors(bg_color, fg_color, text, table)
   table[#table + 1] = { Background = { Color = bg_color } }
   table[#table + 1] = { Foreground = { Color = fg_color } }
   table[#table + 1] = { Text = text }
end

-- this crazy function creates powerline style tabs
-- tab, tabs, pane, config, hover, max_width
local function render_tab_line(tab, tabs, _, _, _, max_width)
   local arrow_bg = BACKGROUND_INACTIVE
   local arrow_fb = EDGE_BACKGROUND
   local arrow_text = THIN_RIGHT_ARROW

   local background = BACKGROUND_INACTIVE
   local foreground = FOREGROUND_INACTIVE
   if tab.is_active then
      background = BACKGROUND_ACTIVE
      foreground = FOREGROUND_ACTIVE
      arrow_bg = BACKGROUND_ACTIVE
      arrow_fb = BACKGROUND_INACTIVE
      arrow_text = SOLID_RIGHT_ARROW
   end

   local title = tab_title(tab, max_width)

   -- ensure that the titles fit in the available space,
   -- and that we have room for the edges.
   local result = {}
   local is_not_first_tab = tab.tab_index > 0
   if is_not_first_tab then
      -- lua indexes are from 1 not 0, tab_index starts from 0!
      local previous_tab = tabs[tab.tab_index]
      if previous_tab and previous_tab.is_active then
         arrow_bg = BACKGROUND_INACTIVE
         arrow_fb = BACKGROUND_ACTIVE
         arrow_text = SOLID_RIGHT_ARROW
      end
      add_text_with_colors(arrow_bg, arrow_fb, arrow_text, result)
   end

   add_text_with_colors(background, foreground, title, result)

   if tab.tab_index == #tabs - 1 then
      add_text_with_colors(EDGE_BACKGROUND, background, SOLID_RIGHT_ARROW, result)
   end
   return result
end

local M = {}

function M.setup(config)
   config.enable_tab_bar = true
   config.hide_tab_bar_if_only_one_tab = false
   config.use_fancy_tab_bar = false
   config.tab_max_width = 35
   config.show_tab_index_in_tab_bar = false
   config.switch_to_last_active_tab_when_closing_tab = true

   wezterm.on("format-tab-title", render_tab_line)
end
return M
