let mapleader = " "

" Using better-escape.nvim instead
" nno ii <Esc>
" xno ii <Esc>gV
" ono ii <Esc>
" ino ii <Esc>`^
" cno ii <C-C><Esc>

" Remap exiting terminal mode
tno ii <C-\><C-n>

" Basic movement in insert mode
ino <C-h> <left>
ino <C-l> <right>
ino <C-j> <down>
ino <C-k> <up>

" Movement when wrap option is enabled
nno j gj
nno k gk

" Faster moving to start / end of line
nno H ^
nno L $

" Indenting lines
nno <silent> <A-k> <cmd>move-2<cr>==
nno <silent> <A-j> <cmd>move+<cr>==
nno <silent> <A-h> <<
nno <silent> <A-l> >>
xno <silent> <A-k> :move-2<cr>gv
xno <silent> <A-j> :move'>+<cr>gv
xno <silent> <A-h> <gv
xno <silent> <A-l> >gv
ino <silent> <A-k> <cmd>move-2<cr>==
ino <silent> <A-j> <cmd>move+<cr>==
ino <silent> <A-h> <cmd>norm<<<cr>
ino <silent> <A-l> <cmd>norm>><cr>

" Managing tabs
nno <C-left>  <cmd>tabprev<cr>
nno <C-right> <cmd>tabnext<cr>
nno <C-up>    <cmd>tabnew<cr>
nno <C-down>  <cmd>tabclose<cr>

" Insert new line below and above without entering insert mode
nno <leader>o o<Esc>0"_D
nno <leader>O O<Esc>0"_D

" Line break in normal mode
nno <cr> mxi<cr><Esc>g`x

" Use black hole register
nno <leader>d "_d
nno <leader>D "_D
nno c "_c
nno C "_C
nno x "_x
" To use default behavior of x
nno <leader>z x

nno J J$

" Enable copying to system clipboard; simply changing vim.o.clipboard to include
" unnamedplus would paste from system clipboard with p which I want to use <leader>p for instead
nno y "+y
xno y "+y
nno Y "+y$
xno Y "+y$

" Yank entire buffer
nmap <leader>Y mxggyG`xzz

" Insert from clipboard in paste mode
nno <leader>p <cmd>set paste<cr>a<C-r>+<Esc><cmd>set nopaste<cr>
ino <A-b> <cmd>set paste<cr><C-r>+<cmd>set nopaste<cr>
xno <leader>p <cmd>set paste<cr>"+p<cmd>set nopaste<cr>
vno <leader>p <cmd>set paste<cr>"+p<cmd>set nopaste<cr>

" Duplicate selection in visual mode
xmap cv y'>p
" Duplicate paragraph and insert one new line below
nno cp vip:copy'>+1<cr>o<esc><up>
" Duplicate tag and insert new line above
nno cg vat:copy'><cr>vato<esc>O<esc><down>

" Visually select last pasted text
nno gp `[v`]

" For usage with vim-ReplaceWithRegister: replace from clipboard
nmap gR "+gr

" Avoids accidentally recording a macro
nno Q q
nno q nop
" Go to previous / next buffers
nno qj <cmd>bp<cr>zz
nno qk <cmd>bn<cr>zz

" Do not move by accident
nno <space> <nop>

" Go to previous file and center
nno  <C-^> <C-^>zz
nmap <bs>  <C-^>

" Keep it centered (zv to open folds if necessary)
nno n nzzzv
nno N Nzzzv

" More centering
nno g; g;zz
nno g, g,zz
nno { {zz
nno } }zz

nno <C-u> <C-u>zz
nno <C-d> <C-d>zz
nno <C-o> <C-o>zz

" Easier incrementing / decrementing
nno + g<C-a>
nno - g<C-x>
xno + g<C-a>
xno - g<C-x>

" Format whole file
nno <leader>= gg=G""

" Repeat last command in visual mode
xno . :norm .<cr>

" Better undo break points
ino , ,<C-g>u
ino . .<C-g>u
ino _ _<C-g>u

" Jumplist mutations
nno <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nno <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Copy word from line above (word-wise <C-y>)
inoremap <expr> <C-z> pumvisible() ? "\<C-y>" : matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

" Better mappings to go back to a mark
nno ' `
nno ` '

" Search and replace
nno <leader><F2> :%s///gc<left><left><left><left>
xno <F2> :s/\%V//g<left><left><left>

" Quickfix list mappings
function! ToggleQfList()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
nno <silent> <C-q> <cmd>call ToggleQfList()<cr>
nno <leader>j <cmd>cprev<cr>
nno <leader>k <cmd>cnext<cr>

" Circular window movements
nno <Tab>   <C-w>w
nno <S-Tab> <C-w>W

" Open new horizontal split (consistent with Ctrl-W + v)
nno <C-w><C-h> <cmd>split<cr>
" Split the alternate buffer vertically; don't know if this is a Vim bug or not
" but this is a workaround since somehow 'splitright' is not respected by Vim
nno <C-w><C-^> <C-w><C-^><C-w>t<C-w>H

" Faster file saving and exiting
nno <leader>w <cmd>w<cr>
nno <leader>q <cmd>q<cr>

" Open current file in browser
nno <silent> <F3> <cmd>!sensible-browser %<cr>

" Open vim.init
nno <leader>rc <cmd>e $MYVIMRC<cr>
" Open lua config files
let nvim_config_root = stdpath('config')
nno <leader>rp <cmd>execute 'e ' . nvim_config_root . '/lua/packerinit.lua'<cr>
nno <leader>ro <cmd>execute 'e ' . nvim_config_root . '/lua/options.lua'<cr>
nno <leader>ru <cmd>execute 'e ' . nvim_config_root . '/lua/utils.lua'<cr>
nno <leader>rm <cmd>execute 'e ' . nvim_config_root . '/mappings.vim'<cr>

" Reload packerinit file, save and resource vim files (except init.vim)
" This is used in .vimrc to reload the config when a file in the config folder was saved.
nno <Plug>reload_my_config <cmd>luafile ~/.config/nvim/lua/packerinit.lua<cr>
      \<cmd>luafile ~/.config/nvim/lua/options.lua<cr>
      \<cmd>w<cr><cmd>runtime mappings.vim<cr>
      \<cmd>PackerCompile<cr>

" Open terminal in new window to the right
nno <leader>to <cmd>vsplit<cr><cmd>term<cr>
