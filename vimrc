" -----------------------------------------------
" vimrc for Vim
" -----------------------------------------------

let mapleader =" "

" favorites from neovim
set expandtab
"set mouse=a
set noruler
set number relativenumber
set scrolloff=9
set smartindent
set splitbelow splitright
set title

set shiftwidth=4
set softtabstop=4
set tabstop=4

set termguicolors
set background=dark
colorscheme gruvbox
"colorscheme synthwave84
set guifont=Source\ Code\ Pro:h20

" Pathogen plugin manager
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

" -----------------------------------------------
" REMAPS
" -----------------------------------------------

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" map leader+pv to open Ex
map <leader>pv :Ex<CR>

" map leader+leader to save current file in normal mode
nnoremap <leader><leader> :w<CR>

" lets you SHOUTOUT .vimrc real easy
map <leader><CR> :so %<CR>

" the cursor stays at 'zz' using ctrl+u and ctrl+d
map <C-d> <C-d>zz
map <C-u> <C-u>zz

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

" -----------------------------------------------
" Luke Smith copypasta
" -----------------------------------------------

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

" -----------------------------------------------
" what follows comes from the guy who made iVim
" -----------------------------------------------

" System vimrc file for iVim

" use vim, rather than vi, settings
set nocompatible

" set default encoding to UTF-8
set encoding=utf-8

" enable syntax highlighting
syntax on
" enable file type detection
filetype plugin indent on

" do not always show the right scroll bar
"set guioptions-=r
" allow backspacing over everything
set backspace=start,eol,indent

" show cursor position
"set ruler
" display incomplete commands
"set showcmd
" display completion matches in a status line
set wildmenu

" -----------------------------------------------
" new additions
" -----------------------------------------------

" enable/disable transparent background (works on Linux, not on iVim/iPad)
let t:is_transparent = 0

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
