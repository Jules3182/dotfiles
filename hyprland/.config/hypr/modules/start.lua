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
  hl.exec_cmd("waybar -c ~/.config/waybar/config-bottom.jsonc &")
  hl.exec_cmd("hyprpaper & swaync")
  hl.exec_cmd("nm-applet --indicator") -- Should have fixed the tray,, doesn't seem to lol
end)