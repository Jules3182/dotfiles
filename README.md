![Nobara Linux Badge](https://img.shields.io/badge/Nobara%20Linux-000?logo=nobaralinux&logoColor=fff&style=for-the-badge)![Hyprland Badge](https://img.shields.io/badge/Hyprland-58E1FF?logo=hyprland&logoColor=000&style=for-the-badge)![Ghostty Badge](https://img.shields.io/badge/Ghostty-3551F3?logo=ghostty&logoColor=fff&style=for-the-badge)![Starship Badge](https://img.shields.io/badge/Starship-DD0B78?logo=starship&logoColor=fff&style=for-the-badge)![Obsidian Badge](https://img.shields.io/badge/Obsidian-7C3AED?logo=obsidian&logoColor=fff&style=for-the-badge)![Unsplash Badge](https://img.shields.io/badge/Unsplash-000?logo=unsplash&logoColor=fff&style=for-the-badge)![Lua Badge](https://img.shields.io/badge/Lua-000080?logo=lua&logoColor=fff&style=for-the-badge)![CSS Badge](https://img.shields.io/badge/CSS-639?logo=css&logoColor=fff&style=for-the-badge)

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
My goal with this set up was to build something clean and visually appealing, without being over the top *ricy*. It's my first real venture outside of a prebuilt desktop environment (Or really a dedicated TM for that matter) and I've been absolutely loving it. Getting under the hood and having to set up parts of the system I had taken for granted my whole life, such as notifications or background tasks for example, has been really eye opening and exciting. It really puts you in the driver's seat. To be completely honest this started as a weekend project I just wanted to mess around with to see what the hype is all about, and I haven't booted back into gnome since.

With all that being said... I hope you enjoy! <3

*These are still a work in progress, while the set up works pretty well it isn't very organized yet so just keep that in mind if you are cloning it*


# Installation:

This repo is set up to use [GNU Stow](https://www.gnu.org/software/stow/) for easier and cleaner installation with symlinks. For a great explanation of what it is and how to use it check out [this](https://www.youtube.com/watch?v=NoFiYOqnC4o) video! He goes way more into depth than I am willing to do on a readme page.

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

# Features:

### Workspace Grid Movement

It's now a proper workspace grid! It's currently hard coded to a 5x3 grid, and can be navigated with 'CTRL + SHIFT + Arrow Keys', the waybar, or the overview. Check out how it's done in [grid.lua](https://github.com/Jules3182/dotfiles/blob/main/hyprland/.config/hypr/modules/grid.lua). I am debating starting up a new project and actually properly implementing this as a hyprland plugin...

### Night Mode
![Night Mode Empty](/Resources/Screenshots/Screenshot1.png)

![Night Mode Windows](/Resources/Screenshots/Screenshot2.png)

Background Photo by [Antonia Glaskova](https://unsplash.com/photos/a-group-of-pine-trees-covered-in-snow-OBOgT2CIhQM)

### Day Mode
![Day Mode Empty](/Resources/Screenshots/Screenshot3.png)

![Day Mode Windows](/Resources/Screenshots/Screenshot4.png)

Background Photo By [Zhaoli JIN](https://unsplash.com/photos/beige-and-black-lamp-on-green-tree-during-nighttime-e4I2ktXz5cA)

(The background switcher button is in the top left corner, script can be found [here](https://github.com/Jules3182/dotfiles/blob/main/hyprland/.config/hypr/scripts/toggle_wallpaper.sh). I didn't feel like a full theme switcher would be needed, and the theming I have done works great for both so this was the perfect inbetween for me)

### Custom Power Menu:

![Power Menu](/Resources/Screenshots/powermenu.gif)

### Custom Calander Dropdown:

![Calendar](/Resources/Screenshots/calendarWidgetSHORT.gif)

*Uses gnome calendar for it's better integration with apple and other calendars. Check out [this module](https://github.com/Jules3182/dotfiles/blob/main/hyprland/.config/hypr/modules/swsaswidgets.lua) for how I turned an app into a widget*

### Pomodoro Timer:

![Pomodoro](/Resources/Screenshots/pomodoro.png)

The TUI app I used can be found [here](https://github.com/sectore/timr-tui)!

### Wallpaper Switching Overlays:

![Night Overlay](/Resources/Screenshots/popupNight.png)

![Day Overlay](/Resources/Screenshots/popupDay.png)

### Custom Keybindings:

Check out my [Keybind Cheatsheet](https://github.com/Jules3182/dotfiles/blob/main/KeybindCheatsheet.md) for the full breakdown, it's expanded quite a bit since 0.55 to the point that it needed it's own page. The binds themselves are primarily found in [binds.lua](https://github.com/Jules3182/dotfiles/blob/main/hyprland/.config/hypr/modules/binds.lua), with some navigation specific ones split off into [grid.lua](https://github.com/Jules3182/dotfiles/blob/main/hyprland/.config/hypr/modules/grid.lua)

### Bars:

#### Top Bar:

**Day Mode:**
![Top Waybar Day](/Resources/Screenshots/TopBarDay.png)

**Night Mode:**
![Top Waybar Night](/Resources/Screenshots/TopBarNight.png)

*Contains my wallpaper switcher, active window title, Day-Time-Date, Quick Tool Bar, VPN activity button, Bluetooth Activity button, Volume, and Power Menu*

##### Quick Tools Section

![Quick Tools](/Resources/Screenshots/QuickTools.png)

*Has a quick obsidian note button, color picker, pomodoro timer, and counter for quick access*

To ensure the counter works run the following commands to set up the number tracking directory and file:
```
mkdir -p ~/.local/share/waybar
echo 0 > ~/.local/share/waybar/counter
```
*(or do it with your file explorer of choice)*

#### Bottom Bar:

**Day Mode:**
![Bottom Waybar Day](/Resources/Screenshots/BottomBarDay.png)

**Night Mode:**
![Bottom Waybar Night](/Resources/Screenshots/BottomBarNight.png)

*Contains my System Stats Button, Memory %, CPU %, GPU %, Network Up/Down, Workspaces, Media Player, System Tray, and Notifications*

### Special Workspaces as Widgets:

  I got tired of a couple different widgets not working the way I wanted (mostly due to GTK theming limitations) so I decided to just start up a couple different apps in the background at launch and hide them in special workspaces that show when you click their respective waybar buttons! Pretty simple idea, but I hadn't seen it be done before and I built it out to have different animations depending on which one you are using as well as a keybing to make ESC close them again.

*Check [this](https://github.com/Jules3182/dotfiles/blob/main/hyprland/.config/hypr/modules/swsaswidgets.lua) lua module for how it's done*

### VS Code Set Up:

![VS Code](/Resources/Screenshots/vscode.png)

I use the docker code server image as my main IDE, this allows me to code from my Ipad (and ocasionally my phone when I'm really desperate) over tailscale when I'm not at home.

My set up has it's own Starship.rs set up thats similar to my main one, but a bit more angular and has different directory replacements:

<img src="/Resources/Screenshots/VsStarship4.png" alt="VS Code Starship" width="45%">

It also has some theme color overrides to match my set up better, you can find that file [here!](https://github.com/Jules3182/dotfiles/blob/main/vscode/.vscode/settings.json)

### Zen Set Up:

![Bottom Waybar Night](/Resources/Screenshots/ZenNight.png)

![Bottom Waybar Night](/Resources/Screenshots/ZenDay.png)

I recently switched to Zen, which has been a really nice change. I use the transparent zen mod and zen internet extension to get it to be transparent and work with lots of different sites. Some need the dark reader extension on top of it to work perfectly, but for the majority of sites it's been great!

*Once I figure out a good way to export my set up I will put it in this repo as well*

# Tools Used:

### [Nobara](https://nobaraproject.org/)

My personal distro of choice, based on fedora and optimized for gaming and media creation with great nvidia support. 

### [Hyprland](https://hypr.land/)

![Hyprland](/Resources/Screenshots/Hyprland.png)

Everyone's favorite Tiling Window Manager. I was resistant at first, but after using it for about 10 minutes I fell in love and haven't looked back (sorry gnome)

### [Waybar](https://github.com/alexays/waybar)

*For the time being, you will have to build waybar from source or use waybar-git for the tray to work properly*

### [Wofi](https://github.com/SimplyCEO/wofi)

![Wofi](/Resources/Screenshots/Wofi.png)

The app launcher I've been using. Works perfectly fine, but I need to tune up the look and feel more. 

### [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)

![SwayNC](/Resources/Screenshots/Swaync.png)

My notification center. I settled on a clean and pretty empty set up as it fits what I use it for just fine.

### [eww](https://github.com/elkowar/eww)

Eww is a pretty interesting and powerful widget tool I came across while looking for a good way to create custom pop ups that weren't just notifications. I'm probably not using it to it's full potential, but I am very happy with what I was able to do with it so far.

### [Ghostty](https://ghostty.org/)

![Ghostty](/Resources/Screenshots/Ghostty.png)

My favorite terminal emulator! Works great on Linux and Mac, has all the features I want, and looks good while doing it. 

### [Starship.rs](https://starship.rs/)


<img src="/Resources/Screenshots/Starship.png" alt="Main Starship" width="100%">

The icing on my Ghostty cake. Just a fancy looking terminal prompt for me, though I'm sure there are better uses for it lol. 

Along with my main config I also have starship running in my Code Server docker container, and have set up it's own config. It is based on my main starship set up, but with a couple small changes and more custom directory replacements. You can check it out [here](https://github.com/Jules3182/dotfiles/blob/main/vscode/.config/starship.toml)!

<img src="/Resources/Screenshots/VsStarship1.png" alt="VS Code Starship" width="45%">
<img src="/Resources/Screenshots/VsStarship2.png" alt="VS Code Starship" width="45%">
<img src="/Resources/Screenshots/VsStarship3.png" alt="VS Code Starship" width="45%">
<img src="/Resources/Screenshots/VsStarship4.png" alt="VS Code Starship" width="45%">

### [Fastfetch](https://github.com/fastfetch-cli/fastfetch)

![Fastfetch](/Resources/Screenshots/FastFetch.png)

![Fastfetch](/Resources/Screenshots/FastFetchEvil.png)

I mean what's a rice without fastfetching? I threw togeather a custon nobara logo that fits the vibe a bit better, you can find it [here]()

## Whats Next?

- [x] Fix the waybar tray (could just be a hyprland update bug)
- [x] Fix the weird spacing in the calendar
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
