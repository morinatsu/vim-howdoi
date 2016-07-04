" ============================================================================
" vim-howdoi
" Description: vim howdoi plugin
" Maintainer:  Laurent Goudet <me at laurentgoudet dot com>
" Version:     1.0
" Last Change: Fri Dec 27 09:39:42 EST 2013
" License:     WTFPL (Do What the Fuck You Want to Public License) v2
" ============================================================================

" Section: Script init {{{1
" ===========================================================================

" Allow the user to disable the plugin & prevent multiple loads
if exists('g:howdoi')
    finish
endif

if !exists('g:howdoi_map') | let g:howdoi_map = '<c-h>' | en

let g:howdoi = 1

" Section: Functions definitions {{{1
" ===========================================================================

function! s:Howdoi()

    let howdoi_installed = executable('howdoi')
    if howdoi_installed ==? '0'
        echomsg 'Expected howdoi package to be installed'
    endif

    " identigy list for filetypes
    let filetypes = {
    \   'c' : 'c',
    \   'java' : 'java',
    \   'cpp' : 'c++',
    \   'cs' : 'c#',
    \   'python' : 'python',
    \   'php' : 'php',
    \   'javascript' : 'javascript',
    \   'ruby' : 'ruby',
    \ }

    let query = getline('.')

    " add filetype to query if not already present
    if (stridx(query, 'vim') < 0) && (stridx(query, &filetype) < 0)
        if has_key(filetypes, &filetype) > 0
	    let query += ' in ' . filetypes[&filetype]
	else
	    let query += ' in ' + &filetype
        endif
    endif

    " Call howdoi
    " TODO: error handling
    read! 'howdoi ' . query
    return system('howdoi ' . query)

endfunction


" Section: Create mapping & menu items {{{1
" ===========================================================================

" Create menu items for the specified modes.  If a:combo is not empty, then
" also define mappings and show a:combo in the menu items.
" Thanks NERDCommenter plugin
function! s:CreateMaps(target, desc, combo)

  "Internal mapping
  let plug = '<Plug>' . a:target
  execute 'noremap <unique> <script> ' . plug . ' :call <SID>' . a:target . '()<CR>'

  " Setup default combo
  if strlen(a:combo) && !exists('no_plugin_maps')
    if !hasmapto(plug)
      execute 'map ' . a:combo . ' ' . plug
    endif
  endif

  " Menu entry
  let menu_command = 'amenu <silent>' . '&Plugin.howdoi' . '.' . escape(a:desc, ' ')
  if strlen(a:combo)
    let menu_command .= '<Tab>' . a:combo . ' ' . plug
  else
    " Separator
    let menu_command .= ' :'
  endif
  execute menu_command

endfunction

" Function name / Menu entry / Default mapping
call s:CreateMaps('Howdoi', 'howdoi', g:howdoi_map)

function! howdoi#sid()  "{{{2
  return maparg('<SID>', 'n')
endfunction
nnoremap <SID>  <SID>
