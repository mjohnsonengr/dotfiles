" Neovim config
set nocompatible              " be iMproved, required
filetype off                  " required

" Python provider configuration for faster loading per :h nvim-python
let g:python3_host_prog = '/usr/bin/python3'  " Python 3 path
let g:loaded_python_provider = 1              " Disable Python 2

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" ---- Plugins ----

Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle, required

Plugin 'altercation/vim-colors-solarized'   " Color theme
Plugin 'vim-airline/vim-airline'            " Airline status bar
Plugin 'vim-airline/vim-airline-themes'     " Airline themes

" Plugin dependencies
Plugin 'roxma/nvim-yarp'                " Required for ncm2/ncm2

" General plugins
Plugin 'roxma/vim-tmux-clipboard'       " tmux clipboard integration

" Plugins for writing
Plugin 'junegunn/goyo.vim'              " Full screen writing mode
Plugin 'junegunn/limelight.vim'         " Highlight only active paragraph
Plugin 'reedes/vim-pencil'              " Super-powered writing things
Plugin 'reedes/vim-lexical'             " Better spellcheck mappings
Plugin 'reedes/vim-litecorrect'         " Better autocorrections
Plugin 'reedes/vim-textobj-sentence'    " Treat sentences as text objects
Plugin 'reedes/vim-wordy'               " Weasel words and passive voice
Plugin 'tpope/vim-abolish'              " Abbreviation, Substitution, Coercion

" Plugins for coding
Plugin 'godlygeek/tabular'              " Vertical text alignment (:Tab)
Plugin 'scrooloose/nerdcommenter'       " Comment functions
Plugin 'ntpeters/vim-better-whitespace' " Highlight and remove trailing whitespace
" TODO: Get ale non-annoying in Java
" TODO: Get these 3 to not slow vim way down for JavaScript.
" Plugin 'w0rp/ale'                       " Asynchronous Linting Engine
" Plugin 'ncm2/ncm2'                      " Neovim Completion Manager
" Plugin 'autozimu/LanguageClient-neovim' " LSP integration

" Plugins for markdown
Plugin 'plasticboy/vim-markdown'        " Markdown syntax highlighting, extensions

" Plugins for Haskell/Cabal
Plugin 'neovimhaskell/haskell-vim'      " Syntax highlighting and indentation

" ---- Plugin settings ----

" airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1  " tab line

" Limelight
let g:limelight_conceal_ctermfg = 'darkgray'  " Needed w/ custom color scheme
let g:limelight_default_coefficient = 0.8     " (default: 0.5)
let g:limelight_paragraph_span = 0            " (default: 0)
let g:limelight_priority = -1                 " -1 to not overrule hlsearch

" ale
let g:ale_linters = {}

" LanguageClient-neovim
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}

" vim-markdown
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 2

" Enable any local modifications
if filereadable($HOME . '/.local_config/local.vim')
  source ~/.local_config/local.vim
endif

" All Plugins must be added before the following block
call vundle#end()
filetype plugin indent on
syntax on

" ---- Settings ----
colorscheme solarized
set background=dark
set backspace=indent,start,eol  " Can backspace over indent, start of insert, or eol
set completeopt=noinsert,menuone,noselect,preview " Options needed for ncm2
set expandtab               " Tab key inserts spaces instead of tab characters.
set hidden                  " Don't unload abandoned buffers, but allow them to hide.
set hlsearch                " Highlight search results
set ignorecase              " Make search patterns case-insensitive.
set incsearch               " Highlight search results while typing
set number                  " Hybrid line numbers when used in combination with relativenumber
set relativenumber          " Relative line numbers
set scrolloff=10            " Leave 10 lines of room on top/bottom when cursor is near
set shiftround              " Tab inserts spaces to nearest softtabstop
set shiftwidth=2            " Indent is two spaces.
set showmatch               " When a bracket is inserted, briefly jump to matching one.
set smartcase               " Ignore ignorecase when an uppercase letter is used in search
set smartindent             " Smart auto indent
set smarttab                " Tab key inserts spaces to line up with tab stops.
set softtabstop=2           " Tab key inserts two spaces.
set tabstop=8               " Tabs are 8 characters wide.
set textwidth=100           " Caps lines at 100 chars
set visualbell              " Use visual bell instead of beeping.
set wildmode=list:longest   " Complete longest common cmd, then list alternatives.

" ---- Key mappings ----

" jk/kj for <ESC>
inoremap jk <ESC>

" Disable all Ctrl-A; too easy to accidentally hit in tmux.
map <C-a> <Nop>
map! <C-a> <Nop>

" LanguageClient-neovim keybindings
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Make Y yank till end (yy yanks whole line) -- similar to D
noremap Y y$

" Easier copy/paste
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>y "+y
noremap <leader>Y "+Y

" ---- autocmds ----
augroup myvimrc
autocmd!

" Start ncm2
"autocmd BufEnter * call ncm2#enable_for_buffer()
"autocmd TextChangedI * call ncm2#auto_trigger()


" markdown options: Use Pencil, lexical and litecorrect.
autocmd filetype markdown,mkd call pencil#init({'autoformat': 0})
  \ | call lexical#init()
  \ | call litecorrect#init()
  \ | setlocal spell spelllang=en_us foldlevel=4
  \ | setlocal foldopen+=search
  \ | setlocal formatoptions-=t

" No text-wrapping formatting for hgcommit
autocmd filetype hgcommit setlocal formatoptions-=t

" Goyo + Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" insert mode indicators (current line underline and cursor shape
" https://stackoverflow.com/a/6489348/1405720
highlight CursorLine gui=underline cterm=underline   " Retain underline cursorline in NeoVim
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
" https://stackoverflow.com/a/42118416/1405720
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
"autocmd VimEnter * silent !echo -ne "\e[2 q"

" TODO/wishlist:
" * H and L for begin/end line? what about top/bottom of screen?  J and K? or
"     top/bottom of file?
" * C-j and C-k for scrolling and keeping the cursor at the same position on
"     the screen
" * status line

" This should remain the last line.
augroup END
