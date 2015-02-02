""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:                                                                  "
"   00. Package Management ...... Vundle package config                      "
"   01. General ................. General Vim behavior                       "
"   02. Events .................. General autocmd events                     "
"   03. Theme/Colors ............ Colors, fonts, etc.                        "
"   04. Vim UI .................. User interface behavior                    "
"   05. Text Formatting/Layout .. Text, tab, indentation related             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 00. Package Management (Vundle)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" VUNDLE PLUGINS GO HERE:
" GoLang
Bundle 'fatih/vim-go'
" CoffeeScript
Bundle 'kchmck/vim-coffee-script'
" Clojure
Bundle 'tpope/vim-fireplace'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-leiningen'
Plugin 'vim-scripts/VimClojure'
" Rust language
Bundle 'wting/rust.vim'

" Toml syntax highlighting
Bundle 'cespare/vim-toml'

" Git Gutter - show git diff in gutter (on left)
Plugin 'airblade/vim-gitgutter'

" NerdCommenter
" <leader>cc - comment a line
" <leader>cu - uncomment a line
Plugin 'scrooloose/nerdcommenter'

" NerdTree - navigate directories and files
Plugin 'scrooloose/nerdtree'

" vim-surround: easily toggle among quote types, e.g.
" > cs"' -> changes " surrounded word to be surrounded by ' instead
" > cst' -> changes tag surround word (say, <p>hello</p>) to be ' surrounded
Plugin 'tpope/vim-surround'

" rainbow-parentheses: make parens more readable by having multiple colors
Bundle 'kien/rainbow_parentheses.vim'

" airline - status bar
Bundle 'bling/vim-airline'

" Ctrlp - press <c-p> to navigate files via fuzzy matching search
Bundle 'kien/ctrlp.vim'

" Autoformat - code formatting
Plugin 'Chiel92/vim-autoformat'

" Salt-Vim: syntax highlighting for Salt .sls files
Plugin 'saltstack/salt-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " TODO: understand

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" hidden - current buffer can be put to background without saving. remembers
"   marks and history when it is re-opened.
set hidden

" flip ` and ' -> used in jumping to marks
nnoremap ' `
nnoremap ` '

" history - remember last X vim commands
set history=1000

" allow % to not just match brackets - also if blocks, tags, and more
runtime macros/matchit.vim

" change <leader> key to ','
let mapleader=","

" wildmenu - make <TAB> completion in command more useful (see more options)
set wildmenu

" autoreload vimrc on save - useful for validating changes in vimrc
" http://www.bestofvim.com/tip/auto-reload-your-vimrc/
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" ignore case in searches unless a capital letter is inputted
set ignorecase
set smartcase

" update terminal title to show vim is running and on what file
set title

" start scrolling before you hit edge of window
set scrolloff=3

" scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" intuitive backspacing in insert mode
set backspace=indent,eol,start

" hide annoying prompts
set shortmess=atI " read more with :help shortmess

" ctrl-p
" launch it with ctrl+p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" set search path (nearest dir with .git etc, near current file)
let g:ctrlp_working_path_mode = 'ra'
" Hide some files/folders in ctrl-p search
" https://github.com/kien/ctrlp.vim#basic-options
set wildignore+=*.pyc

" NerdTree
" start it via ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Autoformat
" Customize python auto-formatting to use Clever standards
let g:formatprg_python="autopep8"
let g:formatprg_args_python="- -a --experimental --max-line-length=100 --indent-size 2"

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" no bell sound
set visualbell

" Formatting for Git commit messages
" TODO

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
"autocmd FileType ruby setlocal sw=2 ts=2 sts=2

" Automatically strip whitespace at EOL
autocmd BufWritePre * :%s/\s\+$//e

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme molokai       " set colorscheme

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
" autocmd Syntax json sou ~/.vim/syntax/json.vim

" Prettify Vagrantfile
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Highlight characters that go over 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " show line numbers
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set paste                 " Allow copy-paste into vim without adding tabs
