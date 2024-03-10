local status_ok, fidget = pcall(require, "fidget")

if not status_ok then
  return
end

fidget.setup {
  tag = "legacy",
  window = { blend = 1000 },
  fmt = {
    max_messages = 3,
  },
}
