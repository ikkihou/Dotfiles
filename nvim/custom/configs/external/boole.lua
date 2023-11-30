local present, boole = pcall(require, "boole")

if not present then
  return
end

boole.setup {
  mappings = {
    increment = "<C-a>",
    decrement = "<C-x>",
  },
  -- User defined loops
  additions = {
    { "Foo", "Bar" },
    { "tic", "tac", "toe" },
  },
  allow_caps_additions = {
    { "enable", "disable" },
    -- enable → disable
    -- Enable → Disable
    -- ENABLE → DISABLE
  },
}
