local present, notify = pcall(require, "notify")

if not present then
    return
end

notify.setup {
    ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
    stages = "fade",
    ---@usage Function called when a new window is opened, use for changing win settings/config
    on_open = nil,
    ---@usage Function called when a window is closed
    on_close = nil,
    ---@usage timeout for notifications in ms, default 5000
    timeout = 2000,
    -- @usage User render fps value
    fps = 30,
    -- Render function for notifications. See notify-render() Options:["default", "minimal", "simple", "compact"]
    render = "compact",
    ---@usage highlight behind the window for stages that change opacity
    background_colour = "Normal",
    ---@usage minimum width for notification windows
    minimum_width = 50,
    ---@usage notifications with level lower than this would be ignored. [ERROR > WARN > INFO > DEBUG > TRACE]
    level = "TRACE",
}

vim.notify = notify
