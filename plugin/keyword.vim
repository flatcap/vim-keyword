" keyword.vim - Temporary keyword highlighting
" Author:       Rich Russon (flatcap) <rich@flatcap.org>
" Website:      https://flatcap.org
" Copyright:    2014-2015 Richard Russon
" License:      GPLv3 <http://fsf.org/>
" Version:      1.1

if (exists ('g:loaded_keyword') || &cp || (v:version < 700))
	finish
endif
let g:loaded_keyword = 1

nnoremap <silent> <script> <Plug>KeywordToggle :call keyword#KeywordToggle (expand ('<cword>'))<CR>

