# keyword.vim

Temporary keyword highlighting

With this plugin you can temporarily highlight any words you like.

## Mapping

```viml
map <F3> <plug>KeywordToggle
```

## Configuration

Two global variables control the syntax highlight group and the colour.

```viml
let g:keyword_group = 'keyword_group'
let g:keyword_highlight = 'ctermbg=blue'
```

## Export

To get the list of the key call KeywordExport()
e.g. Put the list in a register:

```viml
let @k = KeywordExport()
```

## License

Copyright &copy; Richard Russon (flatcap).
Distributed under the GPLv3 <http://fsf.org/>

## See also

- [flatcap.org](https://flatcap.org)
- [GitHub](https://github.com/flatcap/vim-keyword)

