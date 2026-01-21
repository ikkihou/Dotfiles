local present, notify = pcall(require, "notify")

if not present then
	return
end

notify.setup({
	---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
	stages = "fade_in_slide_out",
	---@usage Function called when a window is closed
	on_close = nil,
	---@usage timeout for notifications in ms, default 5000
	timeout = 2000,
	-- @usage User render fps value
	fps = 30,
	-- Render function for notifications. See notify-render() Options:["default", "minimal", "simple", "compact"]
	render = "default",
	---@usage highlight behind the window for stages that change opacity
	background_colour = "#000000",
	---@usage minimum width for notification windows
	minimum_width = 80,
	---@usage notifications with level lower than this would be ignored. [ERROR > WARN > INFO > DEBUG > TRACE]
	level = "INFO",
})
