local wezterm = require("wezterm")
local tmux = {}
if wezterm.target_triple == "aarch64-apple-darwin" then
  tmux = { "/opt/homebrew/bin/tmux", "new", "-As0" }
else
  tmux = { "tmux", "new", "-As0" }
end
return {
  color_scheme = "Catppuccin Mocha",
  default_prog = tmux,
  enable_tab_bar = false,
  font_size = 14.0,
  font = wezterm.font("MonaspiceNe Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),
  harfbuzz_features = { "calt", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "ss09", "liga" }, -- enabling all the ligatures and fonts that wezterm will use
  window_decorations = "RESIZE",                                                                                 -- removes the window title bar and allows resize
  native_macos_fullscreen_mode = true,
  keys = {                                                                                                       -- keybinding modifiers
    { key = "f",          mods = "OPT", action = wezterm.action.ToggleFullScreen },                              -- might remove
    { key = "k",          mods = "CMD", action = wezterm.action.SendString("\x0c") },                            -- to clear scrollback from view
    { key = "LeftArrow",  mods = "OPT", action = wezterm.action.SendString("\x1bb") },                           -- for alt left to move word left
    { key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\x1bf") },                           -- for alt right move word right
  },
  mouse_bindings = {                                                                                             -- mouse bindings
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.OpenLinkAtMouseCursor,
    }, -- ctrl-click will open the link under the mouse cursor
  },
}
