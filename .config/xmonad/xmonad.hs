-- Data
import Data.Monoid
import Data.Tree
import System.Exit (exitSuccess)
import System.IO (hPutStrLn)
import XMonad
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.CycleWS (nextScreen, prevScreen)
import XMonad.Actions.MouseResize
import XMonad.Actions.WithAll (sinkAll)
import XMonad.Actions.UpdatePointer

-- Hooks
import XMonad.Hooks.DynamicLog (PP (..), dynamicLogWithPP, shorten, wrap, xmobarColor, xmobarPP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks (ToggleStruts (..), avoidStruts, docks, manageDocks)
import XMonad.Hooks.ManageHelpers (doFullFloat, isFullscreen, doCenterFloat, isDialog)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.InsertPosition
import XMonad.Layout.FocusTracking
import XMonad.Hooks.RefocusLast (refocusLastLayoutHook, refocusLastWhen, isFloat)

-- Layouts
import XMonad.Layout.GridVariants(Grid (Grid))
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows)
import XMonad.Layout.MultiToggle ((??), EOT (EOT), mkToggle, single)
import qualified XMonad.Layout.MultiToggle as MT (Toggle (..))
import XMonad.Layout.MultiToggle.Instances (StdTransformers (MIRROR, NBFULL, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (Rename (Replace), renamed)
import XMonad.Layout.ResizableTile
import XMonad.Layout.ShowWName
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import qualified XMonad.Layout.ToggleLayouts as T (ToggleLayout (Toggle), toggleLayouts)
import XMonad.Layout.WindowArranger (WindowArrangerMsg (..), windowArrange)
import qualified XMonad.StackSet as W

-- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- Startup hook

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "trayer --edge top --monitor 0 --widthtype request --width 30 --heighttype pixel --height 14 --align right --transparent true --alpha 0 --tint 0x111318 --iconspacing 4 --distance 7 --padding 4 &"
    setWMName "LG3D"

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Single window with no gaps
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- Layouts definition

tall = renamed [Replace "tall"]
    $ limitWindows 12
    $ mySpacing 4
    $ ResizableTall 1 (3 / 100) (1 / 2) []

monocle = renamed [Replace "monocle"] $ limitWindows 20 Full

grid = renamed [Replace "grid"]
    $ limitWindows 12
    $ mySpacing 4
    $ mkToggle (single MIRROR)
    $ Grid (16 / 10)

floats = renamed [Replace "floats"] $ limitWindows 20 simplestFloat

-- Layout hook

myLayoutHook = refocusLastLayoutHook . focusTracking
    $ avoidStruts
    $ smartBorders
    $ mouseResize
    $ windowArrange
    $ T.toggleLayouts floats
    $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
  where
    myDefaultLayout =
        noBorders monocle
        ||| tall
        ||| grid

xmobarEscape :: String -> String
xmobarEscape = concatMap doubleLts
  where
    doubleLts '<' = "<<"
    doubleLts x = [x]

myWorkspaces :: [String]
myWorkspaces = clickable . (map xmobarEscape)
    $ ["www", "dev", "term", "ref", "misc"]
  where
    clickable l = ["<action=xdotool key super+" ++ show (i) ++ "> " ++ ws ++ "</action>" | (i, ws) <- zip [1 .. 5] l]

myKeys :: [(String, X ())]
myKeys =
    [
    ------------------ Window configs ------------------

    -- Move focus to the next window
    ("M-j", windows W.focusDown),

    -- Move focus to the previous window
    ("M-k", windows W.focusUp),

    -- Swap focused window with next window
    ("M-S-j", windows W.swapDown),

    -- Swap focused window with prev window
    ("M-S-k", windows W.swapUp),

    -- Kill window
    ("M-c", kill1),

    -- Restart xmonad
    ("M-C-r", spawn "xmonad --restart"),

    -- Quit xmonad
    ("M-C-q", io exitSuccess),

    -- Logout options
    ("M-x", spawn "archlinux-logout"),

    ----------------- Floating windows -----------------

    -- Push floating window back to tile
    ("M-S-f", withFocused $ windows . W.sink),

    -- Push all floating windows to tile
    ("M-C-f", sinkAll),

    ---------------------- Layouts ---------------------

    -- Switch focus to next monitor
    ("M-.", nextScreen),

    -- Switch focus to prev monitor
    ("M-,", prevScreen),

    -- Switch to next layout
    ("M-<Tab>", sendMessage NextLayout),

    -- Switch to first layout
    ("M-S-<Tab>", sendMessage FirstLayout),

    -- Toggles noborder/full
    ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts),

    -- Shrink horizontal window width
    ("M-C-h", sendMessage Shrink),

    -- Expand horizontal window width
    ("M-C-l", sendMessage Expand),

    -- Shrink vertical window width
    ("M-C-j", sendMessage MirrorShrink),

    -- Exoand vertical window width
    ("M-C-k", sendMessage MirrorExpand),

    -------------------- App configs --------------------

    -- Menu
    ("M-m", spawn "rofi -show drun"),

    -- Window nav
    ("M-S-m", spawn "rofi -show"),

    -- Browser
    ("M-b", spawn "brave"),

    -- VSCode
    ("M-v", spawn "code"),

    -- Audio controller
    ("M-a", spawn "pavucontrol"),

    -- File explorer
    ("M-e", spawn "thunar"),

    -- Task manager
    ("M-h", spawn "alacritty -e htop"),

    -- Task manager
    ("M-l", spawn "feh -Z $CLIPMAN_IMG"),

    -- Terminal
    ("M-<Return>", spawn myTerminal),

    -- Screenshot options
    ("<Print>", spawn "flameshot screen -c"),
    ("M-<Print>", spawn "xfce4-screenshooter -w --no-border -c"),
    ("M-S-s", spawn "flameshot gui -c -r > $CLIPMAN_IMG"),

    --------------------- Hardware ---------------------

    -- Volume
    ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%"),
    ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%"),
    ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),

    -- Multimedia
    ("<XF86AudioPlay>", spawn "playerctl play-pause"),
    ("<XF86AudioNext>", spawn "playerctl next"),
    ("<XF86AudioPrev>", spawn "playerctl previous"),

    -- Brightness
    ("<XF86MonBrightnessUp>", spawn "brightnessctl set +10%"),
    ("<XF86MonBrightnessDown>", spawn "brightnessctl set 10%-")
    ]

-- Manage hook

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
  [ className =? "confirm"          --> doCenterFloat
  , className =? "file_progress"    --> doCenterFloat
  , className =? "dialog"           --> doCenterFloat
  , className =? "download"         --> doCenterFloat
  , className =? "error"            --> doCenterFloat
  , className =? "Gimp"             --> doCenterFloat
  , className =? "notification"     --> doCenterFloat
  , className =? "pinentry-gtk-2"   --> doCenterFloat
  , className =? "splash"           --> doCenterFloat
  , className =? "toolbar"          --> doCenterFloat
  , className =? "Yad"              --> doCenterFloat

  , className =? "Arandr"           --> doCenterFloat
  , className =? "feh"              --> doCenterFloat
  , className =? "Thunar"           --> doCenterFloat
  , className =? "Gwe"              --> doCenterFloat
  , className =? "Cpupower-gui"     --> doCenterFloat
  , className =? "Nvidia-settings"  --> doCenterFloat
  , className =? "Galculator"       --> doCenterFloat
  , className =? "Pavucontrol"      --> doCenterFloat

  , title =? "Open Folder"          --> doCenterFloat
  , title =? "Picture in picture"   --> doFloat
  , title =? "zoom"                 --> doCenterFloat

  , isFullscreen                    -->  doFullFloat
  , isDialog                        -->  doCenterFloat <+> insertPosition Master Newer
  , className =? "polkit-gnome-authentication-agent-1" --> doCenterFloat <+> insertPosition Master Newer
  ]

myModMask = mod4Mask :: KeyMask

myTerminal = "alacritty" :: String

myBorderWidth = 1 :: Dimension

myNormColor = "#111318" :: String

myFocusColor = "#61AFEF" :: String

main :: IO ()
main = do
    -- Xmobar
    xmobarMonitor1 <- spawnPipe "xmobar -x 0 ~/.config/xmobar/primary.hs"
    xmobarMonitor2 <- spawnPipe "xmobar -x 1 ~/.config/xmobar/secondary.hs"
    -- Xmonad
    xmonad $ docks . ewmh $ def {
        manageHook = myManageHook <+> manageDocks <+> insertPosition Below Newer,
        modMask = myModMask,
        terminal = myTerminal,
        startupHook = myStartupHook,
        layoutHook = myLayoutHook,
        workspaces = myWorkspaces,
        borderWidth = myBorderWidth,
        normalBorderColor = myNormColor,
        focusedBorderColor = myFocusColor,
        -- Log hook
        logHook = workspaceHistoryHook <+> dynamicLogWithPP xmobarPP {
            ppOutput = \x -> hPutStrLn xmobarMonitor1 x >> hPutStrLn xmobarMonitor2 x,
            -- Current workspace in xmobar
            ppCurrent = xmobarColor "#98C379" "" . wrap "[" " ]",
            -- Visible but not current workspace
            ppVisible = xmobarColor "#98C379" "",
            -- Hidden workspaces in xmobar
            ppHidden = xmobarColor "#E9E9E9" "",
            -- Hidden workspaces (no windows)
            ppHiddenNoWindows = xmobarColor "#677590" "",
            -- Title of active window in xmobar
            ppTitle = xmobarColor "#61AFEF" "" . shorten 300,
            -- Separators in xmobar
            ppSep = "<fc=#666666> | </fc>",
            -- Urgent workspace
            ppUrgent = xmobarColor "#EF596F" "" . wrap "" "!",
            -- Number of windows in current workspace
            ppExtras = [windowCount],
            ppOrder = \(ws : l : t : ex) -> [ws, l] ++ ex ++ [t]
        } >> updatePointer (0.5, 0.5) (0.5, 0.5)
} `additionalKeysP` myKeys
