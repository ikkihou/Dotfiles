function up --wraps='paru -Syu' --description 'alias up=paru -Syu'
    paru -Syu $argv
end
