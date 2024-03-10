local status_ok, vimtex = pcall(require, "vimtex")

if not status_ok then
    return
end

vimtex.setup {}
