local status_ok, swenv = pcall(require, "swenv")

if status_ok then
  return vim.notify "wtf.............status_ok"
end
