vim.env.INACON_DIR = vim.env.HOME .. "/Desktop/Inacon/"
vim.env.INACON_VENV_ACTIVATE = vim.env.INACON_DIR .. "inacon_env/bin/activate"
vim.env.INACON_VENV_PYTHON = vim.env.INACON_DIR .. "inacon_env/bin"

-- Fixes wrong terminal colors when using tmux
vim.cmd([[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
]])

-- Load config files
require("utils")
require("autocmds")
require("options")
require("packerinit")
require("theme").init()

vim.cmd([[
runtime mappings.vim
" Faster keyboard movement
silent !xset r rate 205 35

augroup dotfiles

 autocmd!
 " Remove trailing whitespace on save (/e to hide errors)
 autocmd BufWritePre * %s/\s\+$//e
 " Enable highlight on yank
 autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout = 130 }
 " Equalize splits after resizing
 autocmd VimResized * wincmd =
 " Open help files in a vertical split
 autocmd FileType help wincmd L
 " Do not wrap text, only comments. This somehow does not work when set
 " as a global option (see https://vi.stackexchange.com/a/9366/37072)
 autocmd FileType * set formatoptions-=t
 " Automatically enter insert mode when in terminal mode
 " and change to current directory
 autocmd TermOpen * silent !lcd %:p:h
 autocmd TermOpen * startinsert

augroup end
]])

local function reload_dev_modules()
 for _, plugin in ipairs({
 "plugin_list",
 "plugin_settings",
 "live-command",
 "inc_rename",
 "snippet_converter",
 }) do
 package.loaded[plugin] = nil
 end
end

local function reload_config()
 reload_dev_modules()
 vim.cmd([[
 :luafile ~/.config/nvim/lua/plugin_settings.lua
:luafile ~/.config/nvim/lua/packerinit.lua
:luafile ~/.config/nvim/lua/colorschemes.lua
:luafile ~/.config/nvim/lua/options.lua
:runtime mappings.vim
:PackerCompile]])
end

vim.api.nvim_create_user_command("ReloadConfig", reload_config, {})

vim.api.nvim_create_autocmd("BufWritePost", {
 pattern = "*/nvim/*",
 callback = reload_config,
 desc = "Reload config on save",
})