# Color Sets
color_green="#5fd700"
color_red="#d70000"

color_purple_main="#5f00ff"
color_yellow_bright="#ffff00"
color_orange="#ff5f00"

color_white="#ffffff"

## set status bar
tmux set -g status-justify left # windows show at left hand side
tmux set -g status-style "fg=$color_white bg=$color_purple_main"

## pane border and colors
tmux set -g pane-active-border-style "bg=default fg=$color_yellow_bright"
tmux set -g pane-border-style "bg=default fg=$color_purple_main"

# clock mode
tmux set -g clock-mode-colour "$color_yellow_bright"
tmux set -g clock-mode-style 24

# message bar or "prompt"
tmux set -g message-style "fg=$color_white,bg=$color_purple_main"

# right side of status bar
tmux set -g @prefix_highlight_output_prefix '['
tmux set -g @prefix_highlight_output_suffix ']'
tmux set -g @prefix_highlight_fg "$color_purple_main"
tmux set -g @prefix_highlight_bg "$color_orange"
tmux set -g @prefix_highlight_show_copy_mode 'on'
tmux set -g @prefix_highlight_copy_mode_attr "fg=$color_purple_main,bg=$color_orange"
tmux set -g @online_icon "#[fg=$color_green]●#[default]"
tmux set -g @offline_icon "#[fg=$color_red]●#[default]"
wg_date="#[fg=$color_purple_main,bg=$color_yellow_bright] %h %d %H:%M #[default]"
wg_is_zoomed="#[fg=$color_purple_main,bg=$color_orange]#{?window_zoomed_flag,Zoomed,}#[default]"
wg_is_sync="#[fg=$color_purple_main,bg=$color_orange]#{?pane_synchronized,Sync,}#[default]"
wg_user_host="#[fg=$color_orange,bold]#(whoami)#[default]@#H"
tmux set -g status-right-length 200
tmux set -g status-right "#{prefix_highlight} $wg_is_zoomed $wg_is_sync | $wg_user_host | $wg_date #{online_status} "

# #powerline char
# powerline_l=""
# powerline_r=""

#left side of status bar
wg_session="#[fg=$color_yellow_bright,bg=$color_purple_main] #S #[default]"
tmux set -g status-left-length 200
tmux set -g status-left "$wg_session"

# make background window look like white tab
tmux set -g window-status-separator ""
tmux set-window-option -g window-status-format " #I: #W (#F) "
tmux set-window-option -g window-status-style "bg=$color_purple_main,fg=$color_yellow_bright"
tmux set-window-option -g window-status-current-format " #I: #W (#F) "
tmux set-window-option -g window-status-current-style "bg=$color_yellow_bright,fg=$color_purple_main,bold"