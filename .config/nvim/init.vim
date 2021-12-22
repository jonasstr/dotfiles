let $INACON_DIR = $HOME . '/Desktop/Inacon/'
let $INACON_VENV_ACTIVATE = $INACON_DIR . 'inacon_env/bin/activate'
let $INACON_VENV_PYTHON = $INACON_DIR . 'inacon_env/bin'

" Fixes wrong terminal colors when using tmux
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

lua << EOF
-- Load config files from ~/.config/nvim/lua/
require("utils") -- load global util functions
require("options")
require("packerinit")
EOF

runtime mappings.vim

augroup my_auto_group
  autocmd!
  " Run on startup for faster keyboard movement
  autocmd VimEnter * silent !xset r rate 215 33

  " Remove trailing whitespace on save (/e to hide errors)
  autocmd BufWritePre * %s/\s\+$//e

  " Enable highlight on yank
  if exists('##TextYankPost') && has('nvim-0.5')
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout = 130 } " higroup = "DiffAdd",
  endif

  " Equalize splits after resizing
  autocmd VimResized * wincmd =

  " Do not wrap text, only comments. This somehow does not work when set
  " as a global option (see https://vi.stackexchange.com/a/9367/37072)
  autocmd FileType * set formatoptions-=t

  " automatically enter insert mode when in terminal mode
  " and change to current directory
  autocmd TermOpen * silent !lcd %:p:h
  autocmd TermOpen * startinsert

  autocmd BufWritePost *.snippets :CmpUltisnipsReloadSnippets
augroup end

augroup packer_user_config
  autocmd!
  autocmd BufWritePost */nvim/*.lua PackerCompile
augroup end

