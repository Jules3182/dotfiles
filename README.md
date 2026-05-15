[![Nobara Linux](https://img.shields.io/badge/Nobara%20Linux-000?logo=nobaralinux&logoColor=fff)](#)[![Ghostty](https://custom-icon-badges.demolab.com/badge/Ghostty-0000ff?logo=ghostty_term)](#)[![CSS](https://img.shields.io/badge/CSS-639?logo=css&logoColor=fff)](#)[![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnubash&logoColor=fff)](#)

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
# My personal config files for my set up!
### Now updated for Hyprland 0.55 (Lua)!

<video src="https://github.com/user-attachments/assets/e6688c99-f86b-4c10-a202-ef359d5a28ad" width="320" height="240" controls></video>

<hr>
My goal with this set up was to build something clean and visually appealing, without being over the top *ricy*. It's my first real venture outside of a prebuilt desktop envirnment (Or really a dedicated TM for that matter) and I've been absolutely loving it. Getting under the hood and having to set up parts of the system I had taken for granted my whole life, such as notifications or background tasks for example, has been really eye opening and exciting. It really puts you in the drivers seat. To be completely honest this started as a weekend project I just wanted to mess around with to see what the hype is all about, and I haven't booted back into gnome since.

With all that being said... I hope you enjoy! <3

*These are still a work in progress, while the set up works pretty well it isn't very organized yet so just keep that in mind if you are cloning it*


# Instalation:

This repo is set up to use [GNU Stow](https://www.gnu.org/software/stow/) for easier and cleaner instalation with symlinks. For a great explaination of what it is and how to use it check out [this](https://www.youtube.com/watch?v=NoFiYOqnC4o) video! He goes way more into depth than I am willing to do on a readme page.

My config relies on the following programs to work properly:
- hyprland
- waybar
- wofi
- swaync
- eww

It also uses the following programs, but these are up to personal preferance so feel free to change them to whatever you prefer (you will need to update them in the configs!):
- ghostty
- nautilus
- gnome-clocks
- hyprshot
- hyprpicker

Because I run nobara (Fedora based) I have to add [this](https://copr.fedorainfracloud.org/coprs/lionheartp/Hyprland) repository to DNF to be able to install Hyprland. If you aren't on a Fedora based system then the following commands are more of a guideline than anything else.

#### Example full install command:

```
sudo dnf copr enable lionheartp/Hyprland

sudo dnf update

sudo dnf install -y hyprland waybar wofi swaync eww ghostty nautilus gnome-clocks hyprshot hyprpicker
```

# Screenshots/Features:

### Night Mode
![Screenshot 1](/Resources/Screenshots/Screenshot1.png)

![Screenshot 2](/Resources/Screenshots/Screenshot2.png)

Background Photo by [Antonia Glaskova](https://unsplash.com/photos/a-group-of-pine-trees-covered-in-snow-OBOgT2CIhQM)

### Day Mode
![Screenshot 1](/Resources/Screenshots/Screenshot3.png)

![Screenshot 2](/Resources/Screenshots/Screenshot4.png)

Background Photo By [Zhaoli JIN](https://unsplash.com/photos/beige-and-black-lamp-on-green-tree-during-nighttime-e4I2ktXz5cA)

(The background switcher button is in the top left corner, script can be found [here](https://github.com/Jules3182/dotfiles/blob/main/hyprland/.config/hypr/scripts/toggle_wallpaper.sh). I didn't feel like a full theme switcher would be needed, and the theming I have done works great for both so this was the perfect inbetween for me)

## Main Tools Used:

### [Nobara](https://nobaraproject.org/)

My personal distro of choice, based on fedora and optimized for gaming and media creation with great nvidia support. 

### [Hyprland](https://hypr.land/)

![Hyprland](/Resources/Screenshots/Hyprland.png)

Everyone's favorite Tiling Window Manager. I was resistant at first, but after using it for about 10 minutes I fell in love and haven't looked back (sorry gnome)

#### Custom "grid" workspace scrolling:

<video src="https://github.com/user-attachments/assets/e7938ba6-eb80-4bcc-a9ef-27f6bfd5c645" width="320" height="240" controls></video>

Although it doesn't actually set up workspaces in a grid it definetly feels like they are, and frankly is just pretty fun to mess around with. You can check how I set it up in the [Binds](https://github.com/Jules3182/dotfiles/blob/main/hyprland/.config/hypr/modules/binds.lua) module of my hyprland config.

### [Waybar](https://github.com/alexays/waybar)

*For the time being, you will have to build waybar from source or use waybar-git for it to work properly*

#### Top Bar:

**Day Mode:**
![Top Waybar Day](/Resources/Screenshots/TopBarDay.png)

**Night Mode:**
![Top Waybar Night](/Resources/Screenshots/TopBarNight.png)

*Contains my wallpaper switcher, active window, Day-Time-Date, Network up/down, memory %, CPU %, volume, and power menu*

#### Bottom Bar:

**Day Mode:**
![Bottom Waybar Day](/Resources/Screenshots/BottomBarDay.png)

**Night Mode:**
![Bottom Waybar Night](/Resources/Screenshots/BottomBarNight.png)

*Contains background tasks, persistent workspace switcher, and notifications button*

A taskbar for Hyprland, super customizable in both look and utility. i was able to create the "pills" that I like, and have a main bar at the top runnjng as well as a bottom bar for worksace switching, tasks, and notifications. 

### [Wofi](https://github.com/SimplyCEO/wofi)

![Wofi](/Resources/Screenshots/Wofi.png)

The app launcher I've been using. honestly I'm not completely sold on it though. Works perfectly fine, but I need to tune the look and feel more. 

### [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)

![SwayNC](/Resources/Screenshots/Swaync.png)

My notification center. This one needs the most work to be honest, it was my most recent addition to the set up abd is the lease customized (for now)

### [eww](https://github.com/elkowar/eww)

Eww is a pretty interesting and powerful widget tool I came across while looking for a good way to create custom pop ups that weren't just notifications. I'm probably not using it to it's full potential, but I am very happy with what I was able to do with it so far.

#### Custom Power Menu:

![Calendar](/Resources/Screenshots/powermenu.gif)

#### Custom Calander Dropdown:

![Calendar](/Resources/Screenshots/ewwCal.png)

#### Wallpaper Switching Overlays:

![Calendar](/Resources/Screenshots/popupNight.png)

![Calendar](/Resources/Screenshots/popupDay.png)


### [Ghostty](https://ghostty.org/)

![Ghostty](/Resources/Screenshots/Ghostty.png)

My favorite terminal! Works great on Linux and Mac, has all the features I would want and looks good while doing it. 

### [Starship.rs](https://starship.rs/)

![Starship](/Resources/Screenshots/Starship.png)

The icing on my Ghostty cake. Just a fancy looking terminal prompt for me, though I'm sure there are better uses for it lol. 

### [Fastfetch](https://github.com/fastfetch-cli/fastfetch)

![Fastfetch](/Resources/Screenshots/FastFetch.png)

I mean what's a rice without fastfetching? I have a custom logo for it in the repo, but haven't been using it lately. 

## Custom Additional Keybindings:

```
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/reload.sh")) -- Reload Script
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave-browser")) -- Browser Shortcut
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("killall -SIGUSR1 waybar")) -- Hide/unhide waybars
hl.bind(mainMod .. " + page_down", hl.dsp.exec_cmd("hyprshot -m output -o $HOME/Pictures/Screenshots")) -- Full Page Screenshot
hl.bind(mainMod .. " + page_up", hl.dsp.exec_cmd("hyprshot -m region output -o $HOME/Pictures/Screenshots")) -- Region Screenshot
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw")) -- Show/hide Notifications
hl.bind("CTRL + SHIFT + insert", hl.dsp.exec_cmd("eww active-windows | grep powermenu  && eww close powermenu  || eww open powermenu && killall -SIGUSR1 waybar")) -- Show/Hide powermenu
```

## Whats Next?

- [ ] Fix the waybar tray (could just be a hyprland update bug)
- [ ] Fix the weird spacing in the calendar
- [x] Clicking waybar workspaces should do popin instead of the last slide direction
- [x] Clean up notifications center (it's mostly unfinished)
  - [x] Load in animation
- [x] Animations for wofi start (And maybe theme it more like spotlight search)
- [x] Background change animation? (Not nessesary but would be nice)
- [x] Power menu

### Misc Tools/links:

[Hyprshot](https://github.com/Gustash/Hyprshot)

[Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)

[Bezier Curve](https://cubic-bezier.vercel.app/)

[Nerd Font](https://www.nerdfonts.com/)

[ASCII Art Generator](https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type+Something+&x=none&v=4&h=4&w=80&we=false)

[Ghostty Theming Helper](https://ghostty.zerebos.com/)

[Obsidian](https://obsidian.md/)

[Obsidian Theme](https://github.com/abrahambahez/Brutalism)

[Code Server](https://github.com/coder/code-server)

[VS Code Theme](https://open-vsx.org/extension/sndst00m/starfall-visual-studio-code)

[cmatrix](https://github.com/abishekvashok/cmatrix)
