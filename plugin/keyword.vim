" keyword.vim - Temporary keyword highlighting
" Author:       Rich Russon (flatcap) <rich@flatcap.org>
" Website:      https://flatcap.org
" Copyright:    2014-2015 Richard Russon
" License:      GPLv3 <http://fsf.org/>
" Version:      1.0

if (exists ('g:loaded_keyword') || &cp || (v:version < 700))
	finish
endif
let g:loaded_keyword = 1

" Set default values
if (!exists ('g:keywordgroup'))     | let g:keywordgroup     = 'keywordgroup' | endif
if (!exists ('g:keywordhighlight')) | let g:keywordhighlight = 'ctermbg=blue' | endif

let s:key_list = []
let s:key_init = 0

function! s:KeywordClear()
	if (s:key_init == 1)
		execute 'syntax clear ' g:keywordgroup
	endif
endfunction

function! s:KeywordHighlight()
	call s:KeywordClear()
	for l:item in s:key_list
		execute 'syntax keyword ' g:keywordgroup l:item ' containedin=ALL'
	endfor
	if (!empty (s:key_list))
		let s:key_init = 1
	endif
	execute 'highlight ' g:keywordgroup g:keywordhighlight
endfunction

function! s:KeywordAdd (name)
	let l:i = index (s:key_list, a:name)
	if (l:i < 0)
		call add (s:key_list, a:name)
	endif
	call s:KeywordHighlight()
endfunction

function! s:KeywordRemove (name)
	let l:i = index (s:key_list, a:name)
	if (l:i >= 0)
		unlet s:key_list[l:i]
		if (@/ == a:name)
			let @/ = ''
		endif
	endif
	call s:KeywordHighlight()
endfunction

function! s:KeywordToggle (name)
	if (a:name == '')
		return
	endif

	let l:i = index (s:key_list, a:name)
	if (l:i < 0)
		call s:KeywordAdd (a:name)
		let @/=a:name
	else
		call s:KeywordRemove (a:name)
	endif
endfunction

function! g:KeywordExport()
	let l:klist = join (s:key_list, ',')
	echo 'Keywords: ' . l:klist
	return l:klist
endfunction


call s:KeywordClear()

nnoremap <silent> <script> <Plug>KeywordToggle :call <SID>KeywordToggle (expand ('<cword>'))<CR>

" vim:set noet ts=8 sw=8:
