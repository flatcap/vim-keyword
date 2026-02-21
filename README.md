# keyword.vim

Temporary keyword highlighting

With this plugin you can temporarily highlight any words you like.
The words are defined by the 'iskeyword' variable.

The highlights are buffer-local, i.e. different for each file.

After highlighting, the search pattern is set to the work, so you can skip
between matches with 'n' or 'N'.

## Mapping

To enable the plugin, simply create a mapping in your '.vimrc'
e.g.

```viml
map <F3> <plug>KeywordToggle
```

## Configuration

Two global variables control the syntax highlight group and the colour.

```viml
let g:keyword_group     = 'keyword_group'
let g:keyword_highlight = 'ctermbg=blue'
```

## List

The list of keywords is kept in the variable "b:keyword_list".
You can display the list by typing either:

```viml
:call keyword#KeywordList()

echo b:keyword_list
```

## Functions

The plugin exports five autoload functions (their names are self-explanatory).
You can call them directly from a script.  

```viml
call keyword#KeywordClear()
call keyword#KeywordAdd ('my_keyword')
call keyword#KeywordRemove ('my_keyword')
call keyword#KeywordToggle ('my_keyword')
call keyword#KeywordList()
```

## License

Copyright &copy; 2014-2026 Richard Russon (flatcap).
Distributed under the GPLv3 <http://fsf.org/>

## See also

- [flatcap.org](https://flatcap.org)
- [GitHub](https://github.com/flatcap/vim-keyword)

