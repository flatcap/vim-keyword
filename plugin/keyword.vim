" keyword.vim - Temporary keyword highlighting
" Author:       Rich Russon (flatcap) <rich@flatcap.org>
" Website:      https://flatcap.org
" Copyright:    2014-2026 Richard Russon
" License:      GPLv3 <http://fsf.org/>
" Version:      1.2

if exists('g:loaded_keyword') || &cp || v:version < 700
	finish
endif
let g:loaded_keyword = 1

nnoremap <silent> <Plug>(keyword-toggle) :<C-u>call keyword#KeywordToggle(expand('<cword>'))<CR>
nmap <Plug>KeywordToggle <Plug>(keyword-toggle)

command! KeywordToggle call keyword#KeywordToggle(expand('<cword>'))
command! KeywordClear  call keyword#KeywordClear()
command! KeywordList   call keyword#KeywordList()
