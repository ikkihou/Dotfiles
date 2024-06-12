# XDG Directories
set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_CACHE_HOME $HOME/.cache
set -xg XDG_DATA_HOME $HOME/.local/share
set -xg XDG_STATE_HOME $HOME/.local/state
set -xg XDG_BIN_HOME $HOME/.local/bin

# Respect XDG Specification
set -xg CONAN_USER_HOME $XDG_CONFIG_HOME
set -xg GOPATH $XDG_DATA_HOME/go
set -xg GOMODCACHE $XDG_CACHE_HOME/go/mod
set -xg RUSTUP_HOME $XDG_DATA_HOME/rustup
set -xg RIPGREP_CONFIG_PATH $HOME/.config/rg/.ripgreprc
set -xg CARGO_HOME $XDG_DATA_HOME/cargo
set -xg STARSHIP_CONFIG $HOME/.config/starship/starship.toml
set -xg ZSH $XDG_DATA_HOME/oh-my-zsh
#set -xg LLVM /opt/homebrew/opt/llvm/
#set -xg LDFLAGS -L/opt/homebrew/opt/llvm/lib
#set -xg CPPFLAGS -L/opt/homebrew/opt/llvm/lib -Wl -rpath /opt/homebrew/opt/llvm/lib
set -xg BUN_INSTALL $HOME/.bun


# Path
fish_add_path $LLVM/bin
fish_add_path $XDG_BIN_HOME
fish_add_path $GOPATH/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /usr/local/bin
fish_add_path /usr/bin
fish_add_path /usr/sbin
fish_add_path /bin
fish_add_path /sbin
fish_add_path /usr/lib/rustup/bin
fish_add_path /usr/lib/go/bin
fish_add_path $HOME/.dotnet/tools
fish_add_path $XDG_DATA_HOME/bob/nvim-bin
fish_add_path $XDG_DATA_HOME/nvim/mason/bin
fish_add_path $BUN_INSTALL/bin

# Editor
set -xg EDITOR nvim
set -xg VISUAL $EDITOR
set -xg SUDO_EDITOR $EDITOR

# Zellij Runner
set -xg ZELLIJ_RUNNER_ROOT_DIR Repos
set -xg ZELLIJ_RUNNER_IGNORE_DIRS node_modules,target
set -xg ZELLIJ_RUNNER_MAX_DIRS_DEPTH 3
set -xg ZELLIJ_RUNNER_LAYOUTS_DIR .config/zellij/layouts
set -xg ZELLIJ_RUNNER_BANNERS_DIR .config/zellij/banners

# GPG/LANG
set -xg GPG_TTY (tty)

# FZF
set -xg FZF_DEFAULT_COMMAND fd
set -xg FZF_DEFAULT_OPTS "--height=60% --layout=reverse --info=inline --border rounded --margin=1 --padding=1 \
--bind 'ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)'"
#--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
#--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
#--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
set -xg _ZO_FZF_OPTS $FZF_DEFAULT_OPTS
set -xg fzf_preview_dir_cmd eza --long --header --icons --all --color=always --group-directories-first --hyperlink
set -xg fzf_fd_opts --hidden --color=always

# Other
set -x THEFUCK_OVERRIDDEN_ALIASES 'vi, yarn, eza, vim, neofetch, onefetch, cat, tty-clock, dua i'
set -xg LS_COLORS (vivid generate nord)
set -xg BAT_THEME Catppuccin-macchiato
set -xg STARSHIP_LOG error
