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
  end

  it 'use filetype when it is omitted'
    normal! gg
    put! = 'shebang'
    setlocal filetype=python
    call setpos('.', [0, 1, 1, 0, 1])
    Expect vspec#call('s:Howdoi',) == "### start test of vim-howdoi ###\nshebang in python\n### end test of vim-howdoi ###\n"
  end

  it 'normalize filetype when it is in list'
    normal! gg
    put! = 'shebang'
    setlocal filetype=cpp
    call setpos('.', [0, 1, 1, 0, 1])
    Expect vspec#call('s:Howdoi',) == "### start test of vim-howdoi ###\nshebang in c++\n### end test of vim-howdoi ###\n"
  end

  it 'use filetype if it is not in list'
    normal! gg
    put! = 'shebang'
    setlocal filetype=perl
    call setpos('.', [0, 1, 1, 0, 1])
    Expect vspec#call('s:Howdoi',) == "### start test of vim-howdoi ###\nshebang in perl\n### end test of vim-howdoi ###\n"
  end
end
