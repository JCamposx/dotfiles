# Qtile workspaces

from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod, keys


# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons: 
# nf-dev-firefox, 
# nf-dev-python, 
# nf-dev-terminal, 
# nf-mdi-server, 
# nf-dev-database, 
# nf-mdi-file_document, 

groups = [Group(i) for i in [
    "  ", "  ", "  ", " 力 " ,"  ", "  ",
    ]
]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name)),
        # Send window and go to workspace N
        Key([mod, "control"], actual_key, lazy.window.togroup(group.name), lazy.group[group.name].toscreen())
    ])
