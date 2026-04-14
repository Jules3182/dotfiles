```                                           
      ▄▄▄▄▄▄              ▄▄  ▄▄             
     █▀██▀▀██        █▄  ██    ██            
       ██   ██      ▄██▄▄██▄▀▀ ██            
       ██   ██ ▄███▄ ██  ██ ██ ██ ▄█▀█▄ ▄██▀█
     ▄ ██   ██ ██ ██ ██  ██ ██ ██ ██▄█▀ ▀███▄
 ██  ▀██▀███▀  ▀███▀▄██ ▄██▄██▄██▄▀█▄▄▄█▄▄██▀
                         ██                  
                        ▀▀                   
```
## My personal config files for my set up!

<hr>

*These are still a work in progress, while the set up works pretty well it isn't very organized yet so just keep that in mind if you are cloning it*

<hr>

## Screenshots:

### Night Mode
![Screenshot 1](/Resources/Screenshots/Screenshot1.png)

![Screenshot 2](/Resources/Screenshots/Screenshot2.png)

### Day Mode
![Screenshot 1](/Resources/Screenshots/Screenshot3.png)

![Screenshot 2](/Resources/Screenshots/Screenshot4.png)

## Main Tools Used:

### [Nobara](https://nobaraproject.org/)

My personal distro of choice, based on fedora and optimized for gaming and media creation with great nvidia support. 

### [Hyprland](https://hypr.land/)

![Hyprland](/Resources/Screenshots/Hyprland.png)

Everyone's favorite Tiling Window Manager. I was resistant at first, but after using it for about 10 minutes I fell in love and havent looked back (sorry gnome)

### [Waybar](https://github.com/alexays/waybar)

![Top Waybar](/Resources/Screenshots/TopWaybar.png)

![Bottom Waybar](/Resources/Screenshots/BottomWaybar.png)

A taskbar for Hyprland, super customizable in both look and utility. i was able to create the "pills" that I like, and have a main bar at the top runnjng as well as a bottom bar for worksace switching, tasks, and notifications. 

### [Wofi](https://github.com/SimplyCEO/wofi)

![Wofi](/Resources/Screenshots/Wofi.png)

The app launcher I've been using. honestly I'm not completely sold on it though. Works perfectly fine, but I need to tune the look and feel more. 

### [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)

![SwawNC](/Resources/Screenshots/Swaync.png)

My notification center. This one needs the most work to be honest, it was my most recent addition to the set up abd is the lease customized (for now)

### [Ghostty](https://ghostty.org/)

My favorite terminal! Works great on Linux and Mac, has all the features I would want and looks good while doing it. 

### [Starship.rs](https://starship.rs/)

![Starship](/Resources/Screenshots/Starship.png)

The icing on my Ghostty cake. Just a fancy looking terminal prompt for me, though I'm sure there are better uses for it lol. 

### [Fastfetch](https://github.com/fastfetch-cli/fastfetch)

![Fastfetch](/Resources/Screenshots/FastFetch.png)

I mean what's a rice without fastfetching? I have a custom logo for it in the repo but haven't been using it lately. 

## Keybindings:

```
bind = $mainMod, B, exec, brave-browser # Browser Shortcut
bind = $mainMod, R, exec, ~/.config/hypr/scripts/reload.sh # Relaods waybar, hyprpaper, and swaync
bind = $mainMod, f, fullscreen # Fullscreen
bind = $mainMod, H, exec, killall -SIGUSR1 waybar # Hide waybar
bind = CTRL SHIFT, page_down, exec, hyprshot -m output -o $HOME/Pictures/Screenshots # Screenshots window
bind = CTRL SHIFT, page_up, exec, hyprshot -m region output -o $HOME/Pictures/Screenshots # Screenshot region
bind = $mainMod, N, exec, swaync-client -t -sw # Open notifications
```

### Misc Tools:

[Obsidian]()

[Code Server]()

[cmatrix]()
