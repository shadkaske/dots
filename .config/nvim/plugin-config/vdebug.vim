" VDebug
hi default DbgBreakptLine term=reverse ctermfg=Black ctermbg=Cyan guifg=#4A4A4A guibg=#89DDFF
hi default DbgBreakptSign term=reverse ctermfg=White ctermbg=Red guifg=#ffffff guibg=#F07178

if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif

let vdebug_options.break_on_open = 0
