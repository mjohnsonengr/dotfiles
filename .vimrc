set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'	" let Vundle manage Vundle, required

Plugin 'morhetz/gruvbox'	" Color theme

" Plugins for writing 
Plugin 'reedes/vim-pencil'	" Super-powered writing things
Plugin 'junegunn/limelight.vim' " Highlights only active paragraph
Plugin 'junegunn/goyo.vim' 	" Full screen writing mode
Plugin 'reedes/vim-lexical'	" Better spellcheck mappings
Plugin 'reedes/vim-litecorrect'	" Better autocorrections
Plugin 'reedes/vim-textobj-sentence'	" Treat sentences as text objects
Plugin 'reedes/vim-wordy'	" Weasel words and passive voice

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntax highlighting
syntax on

" gruvbox: use dark theme
set background=dark

" Use Pencil for text/markdown files
augroup pencil
    autocmd!
    autocmd filetype markdown,mkd call pencil#init()
        \ | call lexical#init()
        \ | call litecorrect#init()
        \ | setl spell spl=en_us fdl=4 noru nonu nornu
        \ | setl fdo+=search
augroup END

" Goyo + Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Limelight config
let g:limelight_conceal_ctermfg = 'darkgray'	" Needed w/ custom color scheme
let g:limelight_default_coefficient = 0.8	" (default: 0.5)
let g:limelight_paragraph_span = 0		" (default: 0)
let g:limelight_priority = -10	" -1 to not overrule hlsearch (default: 10)

" Use Pencil for text/markdown files

" TODO/wishlist:
" * H and L for begin/end line? what about top/bottom of screen?  J and K? or
"     top/bottom of file?
" * C-j and C-k for scrolling and keeping the cursor at the same position on
"     the screen
" * status line
