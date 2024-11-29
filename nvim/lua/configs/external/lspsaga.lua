local present, lspsaga = pcall(require, "lspsaga")

if not present then
  return
end

local icons = {
  cmp = require("configs.utils.icons").get("cmp", true),
  diagnostic = require("configs.utils.icons").get("diagnostics", true),
  kind = require("configs.utils.icons").get("kind", true),
  type = require("configs.utils.icons").get("type", true),
  ui = require("configs.utils.icons").get("ui", true),
}

lspsaga.setup {
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  definition = {
    edit = "<C-c>o",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
    close = "<Esc>",
  },
  code_action = {
    num_shortcut = true,
    keys = {
      -- string |table type
      quit = "<ESC>",
      exec = "<CR>",
    },
  },
  request_timeout = 2000,
  layout = "float",
  finder = {
    -- default = "def",
    max_height = 0.5,
    min_width = 15,
    keys = {
      edit = { "o", "<CR>" },
      vsplit = "s",
      split = "i",
      tabe = "t",
      quit = { "q", "<ESC>" },
    },
  },
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  diagnostic = {
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g",
    },
    theme = {},
  },
  symbol_in_winbar = {
    enable = true,
    separator = " ",
    hide_keyword = false,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  ui = {
    -- currently only round theme
    theme = "round",
    -- this option only work in neovim 0.9
    title = true,
    -- border type can be single,double,rounded,solid,shadow.
    border = "single",
    winblend = 0,
    expand = "",
    collapse = "",
    preview = " ",
    code_action = "💡",
    diagnostic = "🐞",
    kind = {
      Class = { icons.kind.Class, "LspKindClass" },
      Constant = { icons.kind.Constant, "LspKindConstant" },
      Constructor = { icons.kind.Constructor, "LspKindConstructor" },
      Enum = { icons.kind.Enum, "LspKindEnum" },
      EnumMember = { icons.kind.EnumMember, "LspKindEnumMember" },
      Event = { icons.kind.Event, "LspKindEvent" },
      Field = { icons.kind.Field, "LspKindField" },
      File = { icons.kind.File, "LspKindFile" },
      Function = { icons.kind.Function, "LspKindFunction" },
      Interface = { icons.kind.Interface, "LspKindInterface" },
      Key = { icons.kind.Keyword, "LspKindKey" },
      Method = { icons.kind.Method, "LspKindMethod" },
      Module = { icons.kind.Module, "LspKindModule" },
      Namespace = { icons.kind.Namespace, "LspKindNamespace" },
      Number = { icons.kind.Number, "LspKindNumber" },
      Operator = { icons.kind.Operator, "LspKindOperator" },
      Package = { icons.kind.Package, "LspKindPackage" },
      Property = { icons.kind.Property, "LspKindProperty" },
      Struct = { icons.kind.Struct, "LspKindStruct" },
      TypeParameter = { icons.kind.TypeParameter, "LspKindTypeParameter" },
      Variable = { icons.kind.Variable, "LspKindVariable" },
      -- Type
      Array = { icons.type.Array, "LspKindArray" },
      Boolean = { icons.type.Boolean, "LspKindBoolean" },
      Null = { icons.type.Null, "LspKindNull" },
      Object = { icons.type.Object, "LspKindObject" },
      String = { icons.type.String, "LspKindString" },
      -- ccls-specific icons.
      TypeAlias = { icons.kind.TypeAlias, "LspKindTypeAlias" },
      Parameter = { icons.kind.Parameter, "LspKindParameter" },
      StaticMethod = { icons.kind.StaticMethod, "LspKindStaticMethod" },
      -- Microsoft-specific icons.
      Text = { icons.kind.Text, "LspKindText" },
      Snippet = { icons.kind.Snippet, "LspKindSnippet" },
      Folder = { icons.kind.Folder, "LspKindFolder" },
      Unit = { icons.kind.Unit, "LspKindUnit" },
      Value = { icons.kind.Value, "LspKindValue" },
    },
  },
}
