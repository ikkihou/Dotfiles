local present, venv = pcall(require, "venv-selector")

if not present then
	return
end

venv.setup({
	settings = {
		search = {
			anaconda_base = {
				command = "fd '/python$' /opt/miniconda3/bin/ --full-path --color never -E /proc",
				type = "anaconda",
			},
			anaconda_envs = {
				command = "fd '/bin/python$' /home/paul/.conda/envs/ --full-path --color never -E /proc",
				type = "anaconda",
			},
		},
	},
})
