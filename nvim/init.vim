" set leader key
let g:mapleader = "\<Space>"

syntax on                           " Enables syntax highlighing
set noswapfile
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set scrolloff=5
set backspace=indent,eol,start

"Setup Python support 
let g:python3_host_prog = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python'
let g:python_highlight_all = 1

"Setup for Linting and fixers
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': [], 'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
let g:ale_python_black_options= '--line-length 88'

"Setup for snipits
let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



"Setup for KITE
"
"NOTE: Had to add the Plugin 'skywind3000/asyncrun.vim' so that the Kite Co
"pilot can be opened with the KiteCo command that is defined below. What a
"PITA kite ... please fix this!
"
" Python, JavaScript, Go
"let g:kite_supported_languages = ['python', 'javascript', 'go']

" All the languages Kite supports
let g:kite_supported_languages = ['*']
let g:kite_tab_complete=1
"let g:kite_documentation_continual=1
"set completeopt+=menuone
"set completeopt+=menuone
"set completeopt+=noinsert
"command Cop :silent !~/.local/share/kite/kite-v2.20210527.0/linux-unpacked/kite --no-sandbox kite://home
command Cop :AsyncRun ~/.local/share/kite/kite-v2.20210527.0/linux-unpacked/kite --no-sandbox kite://home
 
"NOTE: The below works but I seem to get weird errors and an incomplete source of
" init.vim. Come back to this later 
"au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC


"-------------------------------------------------------------------------------
"---- Plugins 
"-------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
                               
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'dense-analysis/ale'
    Plugin 'vim-python/python-syntax'
    Plugin 'norcalli/nvim-colorizer.lua'
    Plugin 'cocopon/iceberg.vim'
    Plugin 'vim-airline/vim-airline' 
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'preservim/nerdcommenter'
    Plugin 'preservim/nerdtree'      
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'matze/vim-move'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'skywind3000/asyncrun.vim'
    Plugin 'ryanoasis/vim-devicons'
    " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if (has('termguicolors'))
    set termguicolors
endif

"init the colorizer plugin
lua require 'colorizer'.setup()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ:



"-------------------------------------------------------------------------------
"---- External Files 
"-------------------------------------------------------------------------------
source $HOME/.config/nvim/bindings.vim
source $HOME/.config/nvim/themes.vim

