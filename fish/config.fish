source ~/.config/fish/abbreviations.fish
source ~/.config/fish/user_variables.fish

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

setss

fish_add_path /Users/baoyihui/.spicetify
