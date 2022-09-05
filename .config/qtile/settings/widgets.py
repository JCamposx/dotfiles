from libqtile import widget
from .theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(
        **base(),
        linewidth=0,
        padding=5
    )


def icon(fg='text', bg='dark', fontsize=19, text='?'):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg='light', bg='dark', fontsize=37, padding=-3):
    return widget.TextBox(
        **base(fg, bg),
        text='', # Icon: nf-oct-triangle_left
        fontsize=fontsize,
        padding=padding
    )


def workspaces(icon_fontsize=19, window_name_font_size=16):
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=icon_fontsize,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=3,
            borderwidth=3,
            active=colors['active'],
            inactive=colors['inactive'],
            block_highlight_text_color=colors['color4'],
            urgent_alert_method='text',
            urgent_text=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True,
            use_mouse_wheel=False
        ),
        separator(),
        widget.WindowName(**base(fg='focus'), fontsize=window_name_font_size, padding=5),
        separator(),
    ]


def primary_widgets():
    return [
        *workspaces(),

        separator(),

        powerline('dark', 'dark'),

        icon(fg='color5', bg='dark', text=' '), # Icon: nf-fa-download

        widget.CheckUpdates(
            background=colors['dark'],
            colour_have_updates=colors['color5'],
            colour_no_updates=colors['color5'],
            no_update_string='N/A',
            display_format='{updates}',
            update_interval=1800,
            custom_command='checkupdates',
        ),

        separator(),

        powerline('dark', 'dark'),

        icon(fg='color4', bg='dark', text='﨎'), # nf-mdi-thermometer

        widget.NvidiaSensors(
            **base(fg='color4', bg='dark'),
            format='{temp}°C',
        ),

        separator(),

        powerline('dark', 'dark'),

        icon(fg='color3', bg='dark', text=' '),  # Icon: nf-fa-feed

        widget.Net(
            **base(fg='color3', bg='dark'),
            interface='eno1',
            format='{down}' #Icon: nf-fa-arrow_circle_o_down
        ),

        icon(fg='color3', bg='dark', text='  '),  # Icon: nf-fa-feed

        widget.Net(
            **base(fg='color3', bg='dark'),
            interface='eno1',
            format='{up}' #Icon: nf-fa-arrow_circle_o_up
        ),

        separator(),

        powerline('dark', 'dark'),

        widget.CurrentLayoutIcon(
            **base(fg='color2', bg='dark'),
            scale=0.55,
        ),

        widget.CurrentLayout(
            **base(fg='color2', bg='dark'),
        ),

        separator(),

        powerline('dark', 'dark'),

        icon(fg='color1', bg='dark', text=' '), # Icon: nf-mdi-calendar_clock

        widget.Clock(
            **base(fg='color1', bg='dark'),
            format='%d %b %Y %H:%M',
        ),

        separator(),

        widget.Systray(
            background=colors['dark'],
            padding=5
        ),

        separator(),
        separator(),
    ]


def secondary_widgets():
    return [
        *workspaces(),

        separator(),

        powerline('dark', 'dark'),

        widget.CurrentLayoutIcon(
            **base(fg='color2', bg='dark'),
            scale=0.65,
            fontsize=14
        ),

        widget.CurrentLayout(
            **base(fg='color2', bg='dark'),
            fontsize=14
         ),

        separator(),

        powerline('dark', 'dark'),

        icon(fg='color1', bg='dark', text=' '), # Icon: nf-mdi-calendar_clock

		widget.Clock(
            **base(fg='color1', bg='dark'),
            format='%d %b %Y %H:%M',
            fontsize=14
        ),

        separator(),
        separator(),
    ]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 17,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
