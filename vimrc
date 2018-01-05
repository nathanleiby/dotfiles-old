"*****************************************************************************
"" Plugins
"*****************************************************************************

" Required:
call plug#begin(expand('~/.vim/plugged'))

" ctrl-p file search
Plug 'ctrlpvim/ctrlp.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color
Plug 'tomasr/molokai'

" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" fzf - fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Salt
Plug 'saltstack/salt-vim'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " NeoVim
Plug 'zchee/deoplete-go', { 'do': 'make'}

" tmux
Plug 'christoomey/vim-tmux-navigator'

" gist (github)
Plug 'mattn/webapi-vim' " Required for mattn/gist-vim
Plug 'mattn/gist-vim'

" show git changes
Plug 'airblade/vim-gitgutter'

Plug 'mhartington/nvim-typescript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ianks/vim-tsx'

Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" Comments
" <leader>c<space> |NERDComToggleComment|
Plug 'scrooloose/nerdcommenter'

""** TODO: DEACTIVATED **
"Plug 'mxw/vim-jsx'
"Plug 'hashivim/vim-terraform'
"Plug 'cespare/vim-toml'
"Plug 'stephpy/vim-yaml'

"" Typescript
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'
Plug 'mhartington/nvim-typescript'

call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
filetype plugin indent on

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

""" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Map leader to ,
let mapleader=" "

""" Enable hidden buffers
"set hidden

""" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

""" Directories for swp files
set nobackup
set noswapfile

"set fileformats=unix,dos,mac
"set showcmd
set shell=/bin/zsh
"set shell=bash\ -i

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
colorscheme molokai

""" Status bar
"set laststatus=2

""" Use modeline overrides
"set modeline
"set modelines=10

"" vim-airline
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

""*****************************************************************************
""" Autocmd Rules
""*****************************************************************************
""" The PC is fast enough, do syntax highlight syncing from start
"augroup vimrc-sync-fromstart
"  autocmd!
"  autocmd BufEnter * :syntax sync fromstart
"augroup END

""" Remember cursor position
"augroup vimrc-remember-cursor-position
"  autocmd!
"  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" Automatically strip whitespace at EOL
autocmd BufWritePre * :%s/\s\+$//e

"" Prettify Vagrantfile
"autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby


"
"" autoreload vimrc on save - useful for validating changes in vimrc
"" http://www.bestofvim.com/tip/auto-reload-your-vimrc/
"augroup reload_vimrc " {
"    autocmd!
"    autocmd! bufwritepost '~/.vimrc' source %
"augroup END " }

"" Typescript
"" autocmd Filetype typescript setlocal ts=2 sts=2 sw=2


" Automatically re-read file in vim if it has been edited outside of Vim
set autoread

""*****************************************************************************
""" Mappings
""*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" ctrlp.vim
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<leader>e'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
noremap <leader>b :CtrlPBuffer<CR>

"" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

""" Copy/paste (is the bane of vim/tmux)
"set clipboard=unnamed
"
"" Yank to clipboard
"noremap YY "+y<CR>
"" Paste from clipboard
"noremap <leader>p "+gP<CR>
"noremap XX "+x<CR>

"if has('macunix')
"  " pbcopy for OSX copy/paste
"  vmap <C-x> :!pbcopy<CR>
"  vmap <C-c> :w !pbcopy<CR><CR>
"endif

"" Copy/paste with system clipboard with <Leader>p and <Leader>y
"vmap <Leader>y "+y
"vmap <Leader>d "+d
"nmap <Leader>p "+p
"nmap <Leader>P "+P

""" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>x :bd<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

""" Open current line on GitHub
"nnoremap <Leader>o :.Gbrowse<CR>

""*****************************************************************************
""" Custom configs
""*****************************************************************************

"" go
"let g:tagbar_type_go = {
"    \ 'ctagstype' : 'go',
"    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
"        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
"        \ 'r:constructor', 'f:functions' ],
"    \ 'sro' : '.',
"    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
"    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
"    \ 'ctagsbin'  : 'gotags',
"    \ 'ctagsargs' : '-sort -silent'
"    \ }

" vim-go
" TODO: Continue adding improvements from here:
" https://github.com/fatih/vim-go-tutorial
augroup FileType go
  au!
  au FileType go nmap gd <Plug>(go-def)
"  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)

"  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
"  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

"  au FileType go nmap <Leader>gi <Plug>(go-info)

"  au FileType go nmap <leader>gr <Plug>(go-run)
"  au FileType go nmap <leader>rb <Plug>(go-build)
"  au FileType go nmap <leader>gt <Plug>(go-test)
augroup END
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
set updatetime=100

"" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

""" Run FZF fuzzy finder
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

"command! ProjectFiles execute 'Files' s:find_git_root()
noremap <leader>e :ProjectFiles<CR>

command! JSONFormat execute ':%!python -m json.tool'

"*****************************************************************************
"*****************************************************************************

"" start scrolling before you hit edge of window
"set scrolloff=3

"" scroll viewport faster
"nnoremap <C-e> 3<C-e>
"nnoremap <C-y> 3<C-y>

"" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Simpler movement in Vim Splits
" e.g. Instead of ctrl-w then j, it’s just ctrl-j:
noremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



""" Find-and-replace shortcut
"" TODO: How to escape the highlighted region correctly?
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"" Gist-Vim
let g:gist_post_private = 1 " Post gists privately by default

"" Enable Deoplete (autocompletion)
let g:deoplete#enable_at_startup = 1
