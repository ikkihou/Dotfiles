local present, notify = pcall(require, "notify")

if not present then
	return
end

local function on_open()
	if vim.g.last_notification_id then
		require("notify").dismiss(vim.g.last_notification_id)
	end
end

notify.setup({
	---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
	stages = "fade_in_slide_out",
	---@usage Function called when a new window is opened, use for changing win settings/config
	on_open = on_open,
	---@usage Function called when a window is closed
	on_close = nil,
	---@usage timeout for notifications in ms, default 5000
	timeout = 2000,
	-- @usage User render fps value
	fps = 30,
	-- Render function for notifications. See notify-render() Options:["default", "minimal", "simple", "compact"]
	render = "default",
	---@usage highlight behind the window for stages that change opacity
	background_colour = "Normal",
	---@usage minimum width for notification windows
	minimum_width = 80,
	---@usage notifications with level lower than this would be ignored. [ERROR > WARN > INFO > DEBUG > TRACE]
	level = "INFO",
})

-- vim.notify = notify
vim.notify = function(msg, level, ...)
	if level == vim.log.levels.INFO and msg:find("vim.lsp") then
		return
	end
	require("notify")(msg, level, ...)
end
