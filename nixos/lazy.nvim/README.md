### wezterm.luaの設定
```
$ vi ~/.wezterm.lua
```
```
local wezterm = require("wezterm")
local act = wezterm.action

local config = {
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		"Noto Sans Mono CJK JP",
		"Source Han Sans",
	}),
	font_size = 12,
}

config.window_background_opacity = 1.00
config.check_for_updates = false

config.keys = {
	{
		key = "f",
		mods = "SHIFT|META",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "t",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "d",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "¥",
		mods = "OPT",
		action = wezterm.action({ SendString = "\\" }),
	},
	-- {
	--   key='c',
	--   mods='CTRL',
	--   action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
	-- },
	{
		key = "LeftArrow",
		mods = "SHIFT|CTRL",
		action = wezterm.action({ ActivateTabRelative = -1 }),
	},
	{
		key = "RightArrow",
		mods = "SHIFT|CTRL",
		action = wezterm.action({ ActivateTabRelative = 1 }),
	},
	{
		key = '"',
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
```

### tmuxの設定
```
$ vi ~/.tmux.conf
```

```
# プレフィックスキーをctrl+aに変更
set -g prefix C-a

# デフォルトのプレフィックスキーctrl+bを解除
unbind C-b

# プレフィックスキー+^でペインを垂直分割する
bind ^ split-window -h

# プレフィックスキー+-でペインを水平分割する
bind - split-window -v

# 256色モードを有効化
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'

# ステータスラインの文字色、背景色を変更
setw -g status-style fg=colour255,bg=colour234

# マウス操作を有効化
set-option -g mouse on

# 画面サイズ変更
bind -r h resize-pane -L 5
bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5

# paneの文字色と背景色
set -g pane-border-style fg=colour45

# アクティブpaneの文字色と背景色
set -g pane-active-border-style fg=colour45
```

#### tmuxのコマンド

```
# ペインを垂直分割
プレフィックスキー + ^

# ペインを水平分割
プレフィックスキー + -

# ペインの破棄
プレフィックスキー + x

# 画面サイズ変更
プレフィックスキー + h
プレフィックスキー + j
プレフィックスキー + k
プレフィックスキー + l
```
