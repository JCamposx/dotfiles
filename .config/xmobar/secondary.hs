-- http://projects.haskell.org/xmobar/

Config {
    font = "xft:UbuntuMono Nerd Font:weight=bold:pixelsize=14:antialias=true:hinting=true",
    bgColor = "#050505",
    fgColor = "#EF596F",
    lowerOnStart = True,
    hideOnStart = False,
    allDesktops = True,
    persistent = True,
    position = TopH 26,
    commands = [
        Run Date "  %d %b %Y %H:%M " "date" 600,
        Run Com "bash" ["-c", "checkupdates | wc -l"] "updates" 10,
        Run UnsafeStdinReader
    ],
    alignSep = "}{",
    template = "<fc=#D55FDE>   </fc>%UnsafeStdinReader% }{ \
        \<fc=#E5C078>  %updates% </fc>\
        \<fc=#C678DD> %date% </fc>"
}