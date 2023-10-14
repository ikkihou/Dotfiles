local status_ok, dressing = pcall(require, "dressing")

if not status_ok then
    require "notify" "dressing fails loading"
end

dressing.setup {}
