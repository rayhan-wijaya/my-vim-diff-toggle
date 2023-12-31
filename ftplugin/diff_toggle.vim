" Author: Odin Dutton <odindutton AT gmail DOT com>
" Homepage: http://github.com/twe4ked/vim-diff-toggle

function! s:ToggleDiff( count )
  let lnum = line('.')
  for i in range(a:count)
    let line = getline(lnum)
    let first_character = strpart(line, 0, 1)

    if first_character == '-'
      call setline(lnum, substitute(line, '^-', ' ', ''))
      let lnum += 1
    elseif first_character == ' '
      call setline(lnum, substitute(line, '^ ', '-', ''))
      let lnum += 1
    elseif first_character == '+'
      execute lnum . 'delete _'
    else
      execute 'normal! \<Esc>'
      break
    endif
  endfor
endfunction

nnoremap <silent> <buffer> <leader>d :<C-u>call <SID>ToggleDiff(v:count1)<CR>
nnoremap <silent> <buffer> <leader>D :<C-u>call <SID>ToggleDiff(v:count1)<CR>
vnoremap <silent> <buffer> <leader>d :<C-u>call <SID>ToggleDiff(line("'>") - line("'<") + 1)<CR>
vnoremap <silent> <buffer> <leader>D :<C-u>call <SID>ToggleDiff(line("'>") - line("'<") + 1)<CR>
