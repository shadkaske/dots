" Remove file names from Ag searches
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

let g:fzf_preview_window = []

" Popup Layout
" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse --no-preview'
let $FZF_DEFAULT_OPTS.=' --border --margin=0,2'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
    " creates a scratch, unlisted, new, empty, unnamed buffer
    " to be used in the floating window
    let buf = nvim_create_buf(v:false, v:true)

    " 30% of the height
    let height = float2nr(&lines * 0.25)
    " 60% of the height
    let width = float2nr(&columns * 0.7)
    " horizontal position (centralized)
    let horizontal = float2nr((&columns - width) / 2)
    " vertical position (one line down of the top)
    let vertical = 0

    " Pass the options we created and strip styling
    let opts = {
                \ 'relative': 'editor',
                \ 'row': vertical,
                \ 'col': horizontal,
                \ 'width': width,
                \ 'height': height,
                \ 'style': 'minimal'
                \ }

    " open the new window, floating, and enter to it
    call nvim_open_win(buf, v:true, opts)
endfunction

nnoremap <silent> <C-p> :GFiles<CR>
