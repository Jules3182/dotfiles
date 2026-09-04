--   ▄▄▄▄▄                                
--  ██▀▀▀▀█▄ █▄             █▄            
--  ▀██▄  ▄▀▄██▄      ▄    ▄██▄           
--    ▀██▄▄  ██ ▄▀▀█▄ ████▄ ██ ██ ██ ████▄
--  ▄   ▀██▄ ██ ▄█▀██ ██    ██ ██ ██ ██ ██
--  ▀██████▀▄██▄▀█▄██▄█▀   ▄██▄▀██▀█▄████▀
--                                   ██   
--                                   ▀    

hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar")
  -- hl.exec_cmd("waybar -c ~/.config/waybar/config-bottom.jsonc &") Removed for the dynamic bottom bar toggle
  hl.exec_cmd("~/.config/hypr/scripts/sidebar.sh") -- Watcher script for the pop up side bar
  hl.exec_cmd("hyprpaper & swaync")
  hl.exec_cmd("nm-applet --indicator") -- Should have fixed the tray,, doesn't seem to lol
  hl.exec_cmd("~/Documents/scripts/startUp.sh") -- My start up script for a couple things
  hl.exec_cmd("gnome-calendar &") -- Starts up calendar in background on special workspace
  hl.exec_cmd("ghostty +new-window --title=pomodoro -e ~/.cargo/bin/timr-tui -m pomodoro &") -- Starts up the pomodoro timer on special workspace like the calendar
  hl.exec_cmd("btop &") -- Starts up btop in background on special workspace
  hl.exec_cmd("hyprpm reload -n") -- Loads in plugins 
  -- Resets the wallpaper and state for it on start up (Fixes no bg when first loading up)
  -- hl.exec_cmd("hyprctl hyprpaper wallpaper \"DP-3, ~/wallpapers/snow.jpg\"")
  -- hl.exec_cmd("echo \"snow\" > \"~/.config/hypr/.wallpaper_state\"")
  -- BROKEN ^
end)