
" Append modeline after last line in buffer.
function! AppendModeline()
  let l:modeline = " vim: set ts=2 sw=2 tw=120 noet :"
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

nnoremap <silent> ,ml :call AppendModeline()<CR>

" vim: textwidth=120 wrap ts=2 sw=2 noexpandtab nospell
" vim: foldmethod=marker
