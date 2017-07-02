
if exists("loaded_check_file_type_script")
  finish 
endif

let loaded_check_file_type_script=1 

function CheckFileType() 
  if exists("b:countCheck") == 0 
    let b:countCheck = 0 
  endif 
  let b:countCheck += 1
  " Don't start detecting until approx. 20 chars. 
  if &filetype == "" && b:countCheck > 20 
    filetype detect 
  endif
endfunction

" vim: set et sts=2 ts=2 sw=2 nospell:
