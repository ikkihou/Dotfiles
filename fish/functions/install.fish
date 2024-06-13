function install --wraps='yay -S ' --description 'alias install=yay -S '
    paru -S $argv
end
