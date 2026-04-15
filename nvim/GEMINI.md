# Neovim Configuration (NvChad v2.5)

This is a highly customized Neovim configuration based on the **NvChad** framework (v2.5), using **lazy.nvim** as the plugin manager. It is optimized for productivity with a focus on LSP, formatting, debugging, and advanced UI enhancements.

## Project Overview

- **Framework:** [NvChad v2.5](https://nvchad.com/)
- **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Primary Language:** Lua
- **Core Features:**
  - **LSP:** Managed via `nvim-lspconfig` and `mason.nvim`. Supports Python (Delance/Pyright), C/C++ (clangd), Rust (rustaceanvim), LaTeX (texlab), Go, Bash, and more.
  - **Formatting:** Handled by `conform.nvim` with format-on-save.
  - **Completion:** `nvim-cmp` (with `blink.cmp` support optionally available).
  - **Debugger:** `nvim-dap` with `nvim-dap-ui` and language-specific adapters (Python, C++).
  - **UI/UX:** `noice.nvim` for command line/messages, `nvim-notify` for notifications, `fidget.nvim` for LSP progress, and `alpha-nvim` for the dashboard.
  - **Navigation:** `flash.nvim` for quick jumping, `accelerated-jk.nvim` for fast movement, and `telescope.nvim` with multiple extensions.

## Directory Structure

- `init.lua`: Main entry point and bootstrap for `lazy.nvim`.
- `lua/chadrc.lua`: NvChad-specific overrides and theme configuration.
- `lua/options.lua`: Standard Neovim options.
- `lua/mappings.lua`: Custom keybindings and mapping logic.
- `lua/myinit.lua`: Custom initialization code run at startup.
- `lua/configs/`: Configuration for major plugins.
  - `lspconfig.lua`: LSP server setups and attachments.
  - `conform.lua`: Formatting rules per filetype.
  - `lazy.lua`: UI and performance settings for the plugin manager.
- `lua/plugins/init.lua`: Main plugin specification file.
- `lua/configs/external/`: Modular configurations for individual plugins (e.g., `noice`, `dap`, `telescope`).

## Key Commands

- **Open Neovim:** `nvim`
- **Plugin Management:**
  - `:Lazy` - Open lazy.nvim UI.
  - `:Lazy sync` - Sync and install plugins.
  - `:Lazy update` - Update plugins.
- **External Tools (LSP/DAP/Linters):**
  - `:Mason` - Manage external tool installations.
- **Specific Tools:**
  - `:VenvSelect` - Choose Python virtual environment.
  - `:DapToggleBreakpoint` - Toggle breakpoint.
  - `:DapContinue` - Start/Continue debugging.
  - `:Telescope frecency` - Find files by frequency.

## Development Conventions

### Mappings (Commonly Used)
- `<leader>fm`: Format current file (via `conform.nvim`).
- `<S-l>` / `<S-h>`: Jump to end/beginning of line in Normal mode.
- `jk`: Escape Insert mode (via `better-escape.nvim`).
- `gd`: Go to definition.
- `gn`: LSP Rename.
- `<leader>k`: LSP Hover.
- `<leader>fr`: Telescope frecency search.
- `<leader>fp`: Telescope project search.
- `<leader>tf`: Toggle floating terminal.

### Formatting & Linting
- Formatting is automatically applied on save for most filetypes (Lua, JS, TS, Python, C++, etc.).
- Default formatters include `stylua`, `black`, `clang-format`, and `prettier`.

### LSP Configuration
- LSP servers should be added to the `servers` table in `lua/configs/lspconfig.lua`.
- Specific server overrides (like `clangd` or `pyright`) are also located in `lua/configs/lspconfig.lua`.

## Testing & Validation
- For Python, use `dap-python` commands like `<leader>dpr` to debug methods.
- For C++, `clangd` is configured with detailed completion and header insertion.
