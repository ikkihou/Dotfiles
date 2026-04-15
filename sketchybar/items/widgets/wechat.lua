local colors = require("colors")
local settings = require("settings")
local sbar = require("sketchybar")

local wechat = sbar.add("item", "WeChat", {
	position = "right",
	update_freq = 1,
	updates = "on",
	background = {
		height = 22,
		color = { alpha = 0 },
		border_color = { alpha = 0 },
		drawing = true,
	},
	icon = {
		font = "sketchybar-app-font:Regular:18.0",
		string = settings.icons["微信"],
	},
	label = {
		drawing = false,
	},
})

sbar.add("bracket", "wechat.bracket", { wechat.name }, {
	background = { color = colors.with_alpha(colors.black, 0.7), border_color = colors.transparent },
})

wechat:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a WeChat")
end)

wechat:subscribe("routine", function()
	sbar.exec("/usr/bin/pgrep -x WeChat", function(pid)
		if pid == "" or pid == nil then
			-- WeChat is not running, hide the item and bracket
			wechat:set({ drawing = false })
			sbar.set("wechat.bracket", { drawing = false })
		else
			-- WeChat is running, show the item and bracket
			wechat:set({ drawing = true })
			sbar.set("wechat.bracket", { drawing = true })

			-- Now, get the status label
			local status_command =
				'/usr/bin/lsappinfo -all list | /usr/bin/grep WeChat | /usr/bin/egrep -o \'"StatusLabel"=\\{ "label"="?(.*?)"? \\}\' | /usr/bin/sed \'s/\\"StatusLabel\\"={ \\"label\\"=\\(.*\\) }/\\1/g\''
			sbar.exec(status_command, function(statusLabel)
				-- Remove quotes and whitespace
				statusLabel = statusLabel:gsub('"', ""):gsub("%s+", "")

				local icon_color
				local new_label

				if tonumber(statusLabel) ~= nil and tonumber(statusLabel) > 0 then
					icon_color = colors.green
					new_label = statusLabel
				else
					new_label = ""
				end

				if new_label == "" then
					wechat:set({
						icon = { color = colors.white },
						label = { drawing = false },
					})
				else
					wechat:set({
						icon = { color = icon_color, padding_right = 2 },
						label = {
							string = new_label,
							padding_right = 5,
							padding_left = 3,
							y_offset = 1,
							drawing = true,
						},
					})
				end
			end)
		end
	end)
end)
