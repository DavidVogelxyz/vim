let t:ColorMyPencils_flag = 1

function! ColorMyPencils()
    if t:ColorMyPencils_flag == 0
        colorscheme gruvbox
        hi Normal guibg=NONE ctermbg=NONE
        let g:airline_theme='dark'
        let t:is_transparent = 1
        let t:ColorMyPencils_flag = 1
    else
        colorscheme rosepine_moon
        hi Normal guibg=NONE ctermbg=NONE
        let g:airline_theme='dark'
        let t:is_transparent = 1
        let t:ColorMyPencils_flag = 0
    "else
        "colorscheme rose-pine-dark
        "hi Normal guibg=#282828 ctermbg=black
        "AirlineTheme dark
        "let t:is_transparent = 0
        "let t:ColorMyPencils_flag = 0
    endif
endfunction

nnoremap <Leader>v :call ColorMyPencils()<CR>
