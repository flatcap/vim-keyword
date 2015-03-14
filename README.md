# vim-keyword.vim

vim-keyword: Temporary keyword highlighting

With this plugin you can temporarily highlight any words you like.

## Mapping

    map <F3> <plug>Keyword_Toggle

# Configuration

Two global variables control the syntax highlight group and the colour.

    let g:keyword_group = 'keyword_group'
    let g:keyword_highlight = 'ctermbg=blue'

Simply set them before the call to pathogen.

## License

Copyright (c) Richard Russon (flatcap).
Distributed under the same terms as Vim itself.
See `:help license`.

## See also

- [flatcap.org](https://flatcap.org)
- [GitHub](https://github.com/flatcap/vim-keyword)

