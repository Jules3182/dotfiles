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
end)