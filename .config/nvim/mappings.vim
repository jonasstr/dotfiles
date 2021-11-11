let mapleader = " "

nno ii <Esc>
xno ii <Esc>gV
ono ii <Esc>
ino ii <Esc>`^
cno ii <C-C><Esc>
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
nno <silent> <C-k> <cmd>move-2<cr>==
nno <silent> <C-j> <cmd>move+<cr>==
nno <silent> <C-l> >>
nno <silent> <C-h> <<
xno <silent> <C-k> :move-2<cr>gv
xno <silent> <C-j> :move'>+<cr>gv
xno <silent> <C-h> <gv
xno <silent> <C-l> >gv
" ino <silent> <C-k> <cmd>move-2<cr>
" ino <silent> <C-j> <cmd>move+<cr>
" ino <silent> <C-h> <cmd>norm<<cr>
" ino <silent> <C-l> <cmd>norm>><cr>

" Managing tabs
nno <C-left>  <cmd>tabprev<cr>
nno <C-right> <cmd>tabnext<cr>
nno <C-up> <cmd>tabnew<cr>
nno <C-down> <cmd>tabclose<cr>

" Insert new line below and above without entering insert mode
nno <leader>o o<Esc>0"_D
nno <leader>O O<Esc>0"_D

" Line break in normal mode
nno <cr> myi<cr><Esc>g`y

" Use black hole register
nno <leader>d "_d
nno <leader>D "_D
nno c "_c
nno C "_C
nno x "_x

nno J J$
nno Y y$

" Enable copying to system clipboard; simply changing vim.o.clipboard to include
" unnamedplus would paste from system clipboard with p which I want to use Alt-v for instead
nno y "+y
xno y "+y
nno Y "+Y
xno Y "+Y

" Duplicate paragraph and insert one new line below
nno cp vip:copy'>+1<cr>o<esc><up>
" Duplicate tag and insert new line above
nno cg vat:copy'><cr>vato<esc>O<esc><down>
" Duplicate selection in visual mode
xmap <leader>p y'>p

" Insert from clipboard in paste mode
nno <A-v> <cmd>set paste<cr>a<C-r>+<Esc><cmd>set nopaste<cr>
ino <A-v> <cmd>set paste<cr><C-r>+<cmd>set nopaste<cr>
xno <A-v> <cmd>set paste<cr>"+p<cmd>set nopaste<cr>

" Avoids accidentally recording a macro
nno q <nop>
nno Q q

" Do not move by accident
nno <space> <nop>

" Keep it centered (zv to open folds if necessary)
nno n nzzzv
nno N Nzzzv

" Go to previous / next buffers
nno gn <cmd>bp<cr>zz
nno gm <cmd>bn<cr>zz
" Go to previous file and center
nno <C-^> <C-^>zz
nno <bs>  <C-^>

" More centering
nno g; g;zz
nno g, g,zz
nno { {zz
nno } }zz

" Easier incrementing / decrementing
nno + g<C-a>
nno - g<C-x>
xno + g<C-a>
xno - g<C-x>

" Format whole file
nno <leader>= gg=G''

" Repeat last command in visual mode
xno . :norm .<cr>

" Better undo break points
ino , ,<C-g>u
ino . .<C-g>u
ino _ _<C-g>u

" Jumplist mutations (O works as expected)
nno <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nno <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

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
nno <tab>   <C-w>w
nno <S-tab> <C-w>W

" Open new horizontal split (consistent with Ctrl-W + v)
nno <C-w><C-h> <cmd>split<cr>
" Split the alternate buffer vertically; don't know if this is a Vim bug or not
" but this is a workaround since somehow 'splitright' is not respected by Vim
nno <C-w><C-^> <C-w><C-^><C-w>t<C-w>H

" Faster file saving and exiting
nno <leader>w <cmd>w<cr>
nno <leader>q <cmd>q<cr>

" Tab completion in autocomplete (for default completion and coq)
" ino <expr><tab>   pumvisible() ? "<C-n>" : "<tab>"
" Go back using Shift+Tab instead of Ctrl+p
" ino <expr><S-tab> pumvisible() ? "<C-p>" : "<S-tab>"

" Open current file in browser
nno <F3> <cmd>exe ':silent !sensible-browser %'<cr>

function! SynGroup()
    let l:s = synID(line('.'), col('.'), -1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
" Print highlight group under cursor
" nno <leader>sg <cmd>call SynGroup()<cr>

" Open vim.init
nno <leader>rc <cmd>e $MYVIMRC<cr>
nno <leader>RC <cmd>e! $MYVIMRC<cr>
" Open lua config files
let nvim_config_root = stdpath('config')
nno <leader>rp <cmd>execute 'e ' . nvim_config_root . '/lua/packerinit.lua'<cr>
nno <leader>ro <cmd>execute 'e ' . nvim_config_root . '/lua/options.lua'<cr>
nno <leader>ru <cmd>execute 'e ' . nvim_config_root . '/lua/utils.lua'<cr>
nno <leader>rm <cmd>execute 'e ' . nvim_config_root . '/mappings.vim'<cr>
nno <leader>rs <cmd>execute 'e ' . nvim_config_root . '/UltiSnips/html.snippets'<cr>

" Email settings
nno <leader>re <cmd>execute 'e ' . $HOME . '/.config/himalaya/config.toml'<cr>
" Haskell
nno <leader>rh <cmd>execute 'e /media/jonas/Volume/KIT/ProPa/Übungsblätter/WS_2122/'<cr>

" Reload plugins module, save and resource vim files (except init.vim)
nno <leader>so <cmd>lua require("plenary.reload").reload_module("plugins")<cr>
            \<cmd>lua require("plenary.reload").reload_module("options")<cr>
            \<cmd>w<cr><cmd>runtime mappings.vim<cr>

" Open terminal in new window to the right
nno <leader>to <cmd>vsplit<cr><cmd>term<cr>