local status_ok, venv_sel = pcall(require, "venv-selector")

if not status_ok then
	return
end

venv_sel.setup({
	anaconda_base_path = "/opt/miniconda3",
	anaconda_envs_path = "/home/paul/.conda/envs",
})
