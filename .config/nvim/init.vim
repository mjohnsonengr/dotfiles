" Neovim config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')


Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle, required

Plugin 'altercation/vim-colors-solarized'  " Color theme

" Plugins for writing 
Plugin 'junegunn/goyo.vim'      " Full screen writing mode
Plugin 'junegunn/limelight.vim' " Highlight only active paragraph
Plugin 'reedes/vim-pencil'      " Super-powered writing things
Plugin 'reedes/vim-lexical'     " Better spellcheck mappings
Plugin 'reedes/vim-litecorrect' " Better autocorrections
Plugin 'reedes/vim-textobj-sentence'    " Treat sentences as text objects
Plugin 'reedes/vim-wordy'       " Weasel words and passive voice

" Plugins for Haskell/Cabal
Plugin 'neovimhaskell/haskell-vim'  " Syntax highlighting and indentation

" Plugin settings 

" Limelight
let g:limelight_conceal_ctermfg = 'darkgray'  " Needed w/ custom color scheme
let g:limelight_default_coefficient = 0.8     " (default: 0.5)
let g:limelight_paragraph_span = 0            " (default: 0)
let g:limelight_priority = -1        " -1 to not overrule hlsearch (default: 10) (???)

" Enable any local modifications
if filereadable($HOME . '/.local_config/local.vim')
  source ~/.local_config/local.vim
endif

" All Plugins must be added before the following block
call vundle#end()
filetype plugin indent on
syntax on

" Put all my autocmds in the same group
" DO NOT source anything after this point!
augroup myvimrc
autocmd!

" Turn off highlighting when starting
nohlsearch

colorscheme solarized

set background=dark
set expandtab       " Tab key inserts spaces instead of tab characters.
set hlsearch        " Highlight search results
set incsearch       " Highlight search results while typing
set scrolloff=10    " Leave 10 lines of room on top/bottom when cursor is near
set shiftround      " Tab inserts spaces to nearest softtabstop
set shiftwidth=2    " Indent is two spaces.
set smarttab        " Tab key inserts spaces to line up with tab stops.
set softtabstop=2   " Tab key inserts two spaces.
set tabstop=8       " Tabs are 8 characters wide.

" Use Pencil for text/markdown files
autocmd filetype markdown,mkd call pencil#init()
  \ | call lexical#init()
  \ | call litecorrect#init()
  \ | setl spell spl=en_us fdl=4 noru nonu nornu
  \ | setl fdo+=search

" Goyo + Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" insert mode indicators (current line underline and cursor shape
" https://stackoverflow.com/a/6489348/1405720
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
" https://stackoverflow.com/a/42118416/1405720
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
autocmd VimEnter * silent !echo -ne "\e[2 q"

" TODO/wishlist:
" * H and L for begin/end line? what about top/bottom of screen?  J and K? or
"     top/bottom of file?
" * C-j and C-k for scrolling and keeping the cursor at the same position on
"     the screen
" * status line

" This should remain the last line.
augroup END
