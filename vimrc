" ----------------------------
" vimrc for Vim
" ----------------------------

let mapleader =" "

" ----------------------------
" PLUGINS
" ----------------------------

if ! filereadable(expand('~/.vim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.vim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

if filereadable(expand('~/.vim/autoload/plug.vim'))
    call plug#begin('~/.vim/plugged')
    Plug 'artanikin/vim-synthwave84'
    Plug 'ayu-theme/ayu-vim'
    Plug 'connorholyday/vim-snazzy'
    Plug 'donaldttt/fuzzyy'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'itsjunetime/rose-pine-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'joshdick/onedark.vim'
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'mbbill/undotree'
    Plug 'morhetz/gruvbox'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'raphamorim/lucario'
    Plug 'rose-pine/vim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'thedenisnikulin/vim-cyberpunk'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'vimwiki/vimwiki'
    call plug#end()
endif

" ----------------------------
" COLORSCHEME
" ----------------------------

if filereadable(expand('~/.vim/plugged/vim-airline/autoload/airline/themes/dark.vim'))
    colorscheme gruvbox
    let g:airline_theme='dark'
endif

" ----------------------------
" OPTIONS
" ----------------------------

filetype off
filetype plugin indent on " enable file type detection
syntax on " enable syntax highlighting

" colors and background settings
set background=dark
set termguicolors

set backspace=start,eol,indent " allow backspacing over everything
set encoding=utf-8 " set default encoding
set expandtab " convert tabs to spaces
set guifont=Source\ Code\ Pro:h20
"set guioptions-=r " do not always show the right scroll bar
set incsearch " set incremental search
"set mouse=a " enable mouse mode
set nocompatible " use vim, rather than vi, settings
set noruler
set number relativenumber " enable line numbers and relative line numbers
"set ruler " show cursor position
set scrolloff=9 " set minimum line buffer during scroll to "n" lines
set shiftwidth=4 " the number of spaces inserted for each indentation
"set showcmd " display incomplete commands
set smartindent " make indenting smarter again
set softtabstop=4 " number of spaces that a tab counts for while performing editing operations
set splitbelow splitright " splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set tabstop=4 " insert 'n' spaces for a tab
set title " set title to be file name, rather than 'vim'
set wildmenu " display completion matches in a status line

" cursor settings
let &t_SI = "\e[6 q" " SI = cursor for "insert mode" = 6 = bar cursor
let &t_EI = "\e[2 q" " EI = cursor for "everything else" = 2 = block cursor

" options for cursor:
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).

" ----------------------------
" REMAPS
" ----------------------------

" Replace all is aliased to S.
nnoremap S :%s//gc<Left><Left><Left>

" map leader+pv to open Ex
map <leader>pv :Ex<CR>

" map leader+leader to save current file in normal mode
nnoremap <leader><leader> :w<CR>

" lets you SHOUTOUT a file real easy
map <leader><CR> :so %<CR>

" the cursor stays at 'zz' when using ctrl+u and ctrl+d
map <C-d> <C-d>zz
map <C-u> <C-u>zz

" the cursor stays at 'zz' when using G
map G Gzz

" the cursor stays at 'zz' when using search
map n nzzzv
map N Nzzzv

" navigational remaps
" need 4 harpoons for now, with a copy for familiarity
map <leader>a mJ
map <leader>j mJ
map <leader>k mK
map <leader>l mL
map <leader>; mO

" instead of UI, return to mark 'H', which are the maps for 'jkl'
map <C-h> 'H

" marks
map <C-j> 'J
map <C-k> 'K
map <C-l> 'L
map <C-;> 'O

" ----------------------------
" Luke Smith copypasta
" ----------------------------

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e " add trailing newline for ANSI C standard
autocmd BufWritePre *neomutt* %s/^--$/-- /e " dash-dash-space signature delimiter in emails
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" ----------------------------
" new additions
" ----------------------------

" enable/disable transparent background
hi Normal guibg=NONE ctermbg=NONE
let t:is_transparent = 1
function! Toggle_transparent_background()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        hi Normal guibg=#282828 ctermbg=black
        let t:is_transparent = 0
    endif
endfunction
nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>

" maps for fuzzyy - a telescope-like plugin for Vim
" there may be a delay with <Leader>f after fresh install of fuzzyy.vim
" use `:verbose map <Leader>f` to find other remaps
" hint: delay is because of remaps in 'plugged/fuzzyy/plugin/fuzzyy.vim'
" just comment these out with '#'; using '"' causes error message
map <Leader>f :FuzzyFiles<CR>
map <Leader>g :FuzzyColors<CR>
map <C-f> :FuzzyFiles<CR>
map <C-p> :FuzzyGitFiles<CR>

" fixing unsupported characters in vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' C:'
let g:airline_symbols.linenr = ' L:'
let g:airline_symbols.maxlinenr = '☰ '
