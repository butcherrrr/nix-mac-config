{ ... }:

{
  home.file.".aerospace.toml".text = ''
    after-login-command = []
    after-startup-command = []
    start-at-login = true

    enable-normalization-flatten-containers = true
    enable-normalization-opposite-orientation-for-nested-containers = true

    accordion-padding = 0
    default-root-container-layout = 'tiles'
    default-root-container-orientation = 'auto'

    on-focused-monitor-changed = ['move-mouse monitor-lazy-center']
    automatically-unhide-macos-hidden-apps = false

    [key-mapping]
    preset = 'qwerty'

    [gaps]
    inner.horizontal = 12
    inner.vertical =   12
    outer.left =       12
    outer.bottom =     12
    outer.top =        12
    outer.right =      12

    [mode.main.binding]
    shift-ctrl-alt-cmd-p = 'layout tiles horizontal vertical'
    shift-ctrl-alt-cmd-s = 'layout accordion horizontal'

    alt-h = 'focus left'
    alt-j = 'focus down'
    alt-k = 'focus up'
    alt-l = 'focus right'

    alt-shift-h = 'move left'
    alt-shift-j = 'move down'
    alt-shift-k = 'move up'
    alt-shift-l = 'move right'

    alt-ctrl-h = 'join-with left'
    alt-ctrl-j = 'join-with down'
    alt-ctrl-k = 'join-with up'
    alt-ctrl-l = 'join-with right'

    shift-ctrl-alt-cmd-down = 'resize smart -50'
    shift-ctrl-alt-cmd-up = 'resize smart +50'

    shift-ctrl-alt-cmd-1 = 'workspace 1'
    shift-ctrl-alt-cmd-2 = 'workspace 2'
    shift-ctrl-alt-cmd-3 = 'workspace 3'
    shift-ctrl-alt-cmd-4 = 'workspace 4'
    shift-ctrl-alt-cmd-5 = 'workspace 5'
    shift-ctrl-alt-cmd-6 = 'workspace 6'
    shift-ctrl-alt-cmd-7 = 'workspace 7'
    shift-ctrl-alt-cmd-8 = 'workspace 8'
    shift-ctrl-alt-cmd-9 = 'workspace 9'

    alt-ctrl-1 = 'move-node-to-workspace 1'
    alt-ctrl-2 = 'move-node-to-workspace 2'
    alt-ctrl-3 = 'move-node-to-workspace 3'
    alt-ctrl-4 = 'move-node-to-workspace 4'
    alt-ctrl-5 = 'move-node-to-workspace 5'
    alt-ctrl-6 = 'move-node-to-workspace 6'
    alt-ctrl-7 = 'move-node-to-workspace 7'
    alt-ctrl-8 = 'move-node-to-workspace 8'
    alt-ctrl-9 = 'move-node-to-workspace 9'

    shift-ctrl-alt-cmd-l = 'workspace next --wrap-around'
    shift-ctrl-alt-cmd-h = 'workspace prev --wrap-around'
    alt-shift-tab = 'move-workspace-to-monitor --wrap-around next'

    alt-shift-space = 'mode service'

    [mode.service.binding]
    esc = ['reload-config', 'mode min']
    r = ['flatten-workspace-tree', 'mode main']
    f = ['layout floating tiling', 'mode main']
    backspace = ['close-all-windows-but-current', 'mode main']

    alt-shift-h = ['join-with left', 'mode main']
    alt-shift-j = ['join-with down', 'mode main']
    alt-shift-k = ['join-with up', 'mode main']
    alt-shift-l = ['join-with right', 'mode main']

    [[on-window-detected]]
    if.app-id = 'com.mitchellh.ghostty'
    run = 'move-node-to-workspace 1'

    [[on-window-detected]]
    if.app-id = 'com.github.wez.wezterm'
    run = 'move-node-to-workspace 1'

    [[on-window-detected]]
    if.app-id = 'com.google.Chrome'
    run = 'move-node-to-workspace 3'

    [[on-window-detected]]
    if.app-id = 'org.mozilla.firefox'
    run = 'move-node-to-workspace 3'

    [[on-window-detected]]
    if.app-id = 'app.zen-browser.zen'
    run = "move-node-to-workspace 3"

    [[on-window-detected]]
    if.app-id = 'dev.zed.Zed'
    run = 'move-node-to-workspace 2'

    [[on-window-detected]]
    if.app-id = 'com.tinyspeck.slackmacgap'
    run = 'move-node-to-workspace 4'

    [[on-window-detected]]
    if.app-id = 'com.electron.logseq'
    run = 'move-node-to-workspace 5'

    [[on-window-detected]]
    if.app-id = 'com.electron.dockerdesktop'
    run = 'move-node-to-workspace 5'

    [[on-window-detected]]
    if.app-id = 'com.spotify.client'
    run = 'move-node-to-workspace 9'
  '';
}
