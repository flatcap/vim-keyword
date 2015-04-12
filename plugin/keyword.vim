" keyword.vim - Temporary keyword highlighting
" Author:       Rich Russon (flatcap) <rich@flatcap.org>
" Website:      https://flatcap.org
" Copyright:    2014-2015 Richard Russon
" License:      GPLv3 <http://fsf.org/>
" Version:      1.0

if exists("g:loaded_keyword_highlighter") || &cp || v:version < 700
	finish
endif
let g:loaded_keyword_highlighter = 1

let s:key_list = []
let s:key_init = 0

if !exists("g:keyword_group")
	let g:keyword_group = 'keyword_group'
endif

if !exists("g:keyword_highlight")
	let g:keyword_highlight = 'ctermbg=blue'
endif

function! s:Keyword_Clear()
	if (s:key_init == 1)
		execute 'syntax clear ' g:keyword_group
	endif
endfunction

function! s:Keyword_Highlight()
	call s:Keyword_Clear()
	for item in s:key_list
		execute 'syntax keyword ' g:keyword_group item ' containedin=ALL'
	endfor
	if (!empty (s:key_list))
		let s:key_init = 1
	endif
	execute 'highlight ' g:keyword_group g:keyword_highlight
endfunction

function! s:Keyword_Add(name)
	let i = index(s:key_list, a:name)
	if (i < 0)
		call add (s:key_list, a:name)
	endif
	call s:Keyword_Highlight()
endfunction

function! s:Keyword_Remove(name)
	let i = index(s:key_list, a:name)
	if (i >= 0)
		unlet s:key_list[i]
		if (@/ == a:name)
			let @/ = ""
		endif
	endif
	call s:Keyword_Highlight()
endfunction

function! s:Keyword_Toggle(name)
	if (a:name == '')
		return
	endif

	let i = index(s:key_list, a:name)
	if (i < 0)
		call s:Keyword_Add(a:name)
		let @/=a:name
	else
		call s:Keyword_Remove(a:name)
	endif
endfunction


function! Keyword_Export()
	let klist = join(s:key_list, ',')
	echo 'Keywords: ' . klist
	return klist
endfunction


call s:Keyword_Clear()

nnoremap <silent> <script> <plug>Keyword_Toggle	:call <SID>Keyword_Toggle(expand('<cword>'))<CR>

" vim:set noet ts=8 sw=8:
