# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy


mod = "mod4"
alt = "mod1"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([alt], "Tab", lazy.layout.down()),
    ([alt, "shift"], "Tab", lazy.layout.up()),

    # Change window sizes (MonadTall)
    ([mod], "l", lazy.layout.grow()),
    ([mod], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([alt], "w", lazy.layout.shuffle_down()),
    ([alt], "q", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "c", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "k", lazy.next_screen()),
    ([mod], "j", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),
    ([mod, "control"], "q", lazy.shutdown()),
    ([mod], "x", lazy.spawn("archlinux-logout")),


    # ------------ App Configs ------------

    # Menu
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn("chromium")),

    # PDF Reader
    ([mod], "p", lazy.spawn("okular")),

    # Audio controller
    ([mod], "a", lazy.spawn("pavucontrol")),

    # File Explorer
    ([mod], "e", lazy.spawn("pcmanfm")),

    # Terminal
    ([mod], "Return", lazy.spawn("alacritty")),

    # Screenshot
    ([], "Print", lazy.spawn("xfce4-screenshooter -f -c")),
    ([alt], "Print", lazy.spawn("xfce4-screenshooter -w --no-border -c")),
    ([mod, "shift"], "s", lazy.spawn("xfce4-screenshooter -r -c")),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Multimedia    
    ([], "XF86AudioPlay", lazy.spawn(
        "playerctl play-pause"
    )),
    ([], "XF86AudioNext", lazy.spawn(
        "playerctl next"
    )),
    ([], "XF86AudioPrev", lazy.spawn(
        "playerctl previous"
    )),

    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]
