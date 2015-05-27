" keyword.vim - Temporary keyword highlighting
" Author:       Rich Russon (flatcap) <rich@flatcap.org>
" Website:      https://flatcap.org
" Copyright:    2014-2015 Richard Russon
" License:      GPLv3 <http://fsf.org/>
" Version:      1.0

" if (exists ('g:loaded_keyword') || &cp || (v:version < 700))
" 	finish
" endif
" let g:loaded_keyword = 1

" Set default values
let g:keyword_group     = get (g:, 'keyword_group',     'keyword_group')
let g:keyword_highlight = get (g:, 'keyword_highlight', 'ctermbg=blue')

function! s:clear_syntax()
	silent! execute 'syntax clear ' g:keyword_group
endfunction

function! s:highlight()
	call s:clear_syntax()
	for l:item in b:keyword_list
		execute 'syntax keyword ' g:keyword_group l:item ' containedin=ALL'
	endfor
	execute 'highlight ' g:keyword_group g:keyword_highlight
endfunction

function! s:prep()
	if (!exists ('b:keyword_list'))
		let b:keyword_list = []
	endif
endfunction


function! KeywordClear()
	call s:clear_syntax()
	let b:keyword_list = []
endfunction

function! KeywordAdd (name)
	call s:prep()
	let l:index = index (b:keyword_list, a:name)
	if (l:index < 0)
		call add (b:keyword_list, a:name)
	endif
	call s:highlight()
endfunction

function! KeywordRemove (name)
	call s:prep()
	let l:index = index (b:keyword_list, a:name)
	if (l:index >= 0)
		unlet b:keyword_list[l:index]
		if (@/ == a:name)
			let @/ = ''
		endif
	endif
	call s:highlight()
endfunction

function! KeywordToggle (name)
	" Only accepts keywords (see 'iskeyword')
	if (a:name !~ '^\v\k+$')
		echoerr '"' . a:name . '" is not a valid keyword'
		return
	endif

	call s:prep()
	let l:index = index (b:keyword_list, a:name)
	if (l:index < 0)
		call KeywordAdd (a:name)
		let @/=a:name
	else
		call KeywordRemove (a:name)
	endif
endfunction

function! KeywordList()
	call s:prep()
	echo 'Keywords:' sort(b:keyword_list)
endfunction


nnoremap <silent> <script> <Plug>KeywordToggle :call KeywordToggle (expand ('<cword>'))<CR>

