-- http://projects.haskell.org/xmobar/

Config {
    font = "UbuntuMono Nerd Font Bold 10",
    bgColor = "#111318",
    fgColor = "#EF596F",
    lowerOnStart = True,
    hideOnStart = False,
    allDesktops = True,
    persistent = True,
    position = TopH 28,
    commands = [
        Run Date "󰃰  %d %b %Y %H:%M" "date" 600,
        Run Network "eno1" ["-t", "  <rx>kb   <tx>kb"] 10,
        Run Cpu ["-t", "  <total>%"] 10,
        Run Memory ["-t", " <used>M"] 10,
        Run Com "bash" ["-c", "checkupdates | wc -l"] "updates" 10,
        Run Com "/home/jesus/.config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 10,
        Run UnsafeStdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "<fc=#D55FDE>   </fc> %UnsafeStdinReader% }{ \
        \<fc=#E5C078> 󱑢 %updates% </fc>\
        \<fc=#98C379> %cpu% </fc>\
        \<fc=#EF596F> %memory% </fc>\
        \<fc=#61AFEF> %eno1% </fc>\
        \<fc=#C678DD> %date% </fc>\
        \%trayerpad%"
}
