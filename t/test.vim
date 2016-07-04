filetype plugin on
source plugin/howdoi.vim
call vspec#hint({'sid': 'howdoi#sid()'})

describe 'Howdoi'
  before
    new
  end

  after
    close!
  end

  it 'replaces current line by result of howdoi'
    normal! gg
    put! = 'shebang in bash'
    call setpos('.', [0, 1, 1, 0, 1])
    Expect vspec#call('s:Howdoi',) == "### start test of vim-howdoi ###\nshebang in bash\n### end test of vim-howdoi ###\n"
"    Expect getline(2) == '### start of test ###'
"    Expect getline(3) == 'shebang in bash'
"    Expect getline(4) == '### end of test ###'
  end

  "it 'use filetype when it is omitted'
  "  TODO
  "end
end
