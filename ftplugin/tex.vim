" Use `<localleader>c` to trigger continuous compilation
nmap <localleader>c <Plug>(vimtex-compile)

" Use `<localleader>s` to trigger stop continuous compilation
nmap <localleader>s <Plug>(vimtex-stop)

" Use `<localleader>x` to trigger clean compilation files
nmap <localleader>x <Plug>(vimtex-clean)

" Define a custom shortcut to trigger VimtexView
nmap <localleader>v <plug>(vimtex-view)

" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0  

" Filter out some compilation warning messages from QuickFix display
let g:vimtex_quickfix_ignore_filters = [
	\ 'Underfull \\hbox',
  \ 'Overfull \\hbox',
  \ 'LaTeX Warning: .\+ float specifier changed to',
  \ 'LaTeX hooks Warning',
  \ 'Package siunitx Warning: Detected the "physics" package:',
  \ 'Package hyperref Warning: Token not allowed in a PDF string',
  \]

" Use Zathura as the VimTeX PDF viewer
let g:vimtex_view_method = "zathura"
let g:vimtex_view_general_viewer = "okular"

" Get Vim's window ID for switching focus from Zathura to Vim using xdotool.
" Only set this variable once for the current Vim instance.
if !exists("g:vim_window_id")
  let g:vim_window_id = system("xdotool getactivewindow")
endif

function! s:TexFocusVim() abort
  sleep 300m  
  silent execute "!xdotool windowfocus " . expand(g:vim_window_id)
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  au User VimtexEventView call s:TexFocusVim()
augroup END
