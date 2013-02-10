"""
" vimrc config
" v 1.0
" 2012-05-11
" for use in Python and JavaScript
"
" http://github.com/nathanleiby
" Nathan Leiby
"""

" JavaScript Settings

" Turn on line numbering. Turn it off with "set nonu" 
set number " set nu

" Set syntax on
syntax on
set pastetoggle=<F2>

" Indent automatically depending on filetype
set filetype=on
filetype indent on
""filetype plugin on

set ai
set ts=4
set sts=4
set et
set sw=4
" set textwidth=79 "

" Incremental search, case insensitive search
set incsearch
set ignorecase smartcase
set nohlsearch

" OVERRIDES by language
" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
""autocmd FileType html set textwidth=0
" Python (tab width 4 chr, wrap at 79th char)
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
""autocmd FileType python set textwidth=79
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
""autocmd FileType css set textwidth=79
" JavaScript (tab width 4 chr, wrap at 79th)
autocmd FileType javascript set sw=4
autocmd FileType javascript set ts=4
autocmd FileType javascript set sts=4
""autocmd FileType javascript set textwidth=79

" Autocompletion
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal omnifunc=pysmell#Complete  " Pysmell http://code.google.com/p/pysmell/
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" POWER USER TIPS
" http://www.ukuug.org/events/linux2004/programme/paper-SMyers/Linux_2004_slides/vim_tips/
" Insert words from dictionary
set dictionary=~/.ispell_british,/usr/share/dict/words
set complete=.,w,k

" Check meanings
set keywordprg=dict

" Reflow text in paragraph with 'Q'
nnoremap Q gqap
vnoremap Q gq

" END POWER USER TIPS

" Make help searchable
:helptags ~/.vim/doc

" Higlhight search
"set hls

" Wrap text instead of being on one line
"set lbr

" Change colorscheme from default to delek
" colorscheme delek
""colorscheme morning 
colorscheme koehler

"Map NERDTree to \p
""nmap <silent> <Leader>p :NERDTreeToggle<CR>

"Higlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

"Highlight cursor
highlight CursorLine ctermbg=8 cterm=NONE

" Show command, e.g. the <leader> key (backslash by default)
set showcmd

" Pydiction "
let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'

" JS Beautify
" https://github.com/maksimr/vim-jsbeautify
let g:jsbeautify = {'indent_size': 4, 'indent_char': '\t'}
let g:htmlbeautify = {'indent_size': 4, 'indent_char': ' ', 'max_char': 78, 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u']}
let g:cssbeautify = {'indent_size': 4, 'indent_char': ' '}

map <c-f> :call JsBeautify()<cr>
" or for automatic behavior
""autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
""autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
""autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
