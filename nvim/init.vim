" *****************************************************************************
" BEGIN VUNDLE STUFF
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" The following are examples of different formats supported.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'derekwyatt/vim-scala'
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'JamshedVesuna/vim-markdown-preview'
"Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Plugin 'chrisbra/histwin.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" END VUNDLE STUFF
"
" BEGIN PLUGIN DESCRIPTIONS
" *****************************************************************************
" vim-gitgutter
" keymap for moving in hunks
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" handle grep alias (for color auto)
let g:gitgutter_escape_grep = 1
" *****************************************************************************
" NERDTree
" open/close with Ctrl-e
map <C-e> :NERDTreeToggle<CR>

" open NERDTree when starting vim without a file
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" when opening a file, close NERDTree
let NERDTreeQuitOnOpen = 1
" *****************************************************************************
" vim-buffergator
" browse through buffers with NERDTree like interface
" open with Ctrl-b
map <C-b> :BuffergatorToggle<CR>
" *****************************************************************************
" ctrlp
" use ctrlp to search for filenames
" *****************************************************************************
" ag
" search all files for pattern
" :ag {pattern} [{directory}]
" *****************************************************************************
" splitjoin
" gS to split a one line if statement into multiline
" gJ it join a multiline if statement into one line
" *****************************************************************************
" solarized
" molokai
" colorschemes
" *****************************************************************************
" vim-scala
" hilight scala file syntax
" *****************************************************************************
" vim-airline
" use powerline font
let g:airline_powerline_fonts = 1
" quickly leave insert mode
set timeoutlen=50
" only show the swanky mode indicator
set noshowmode
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" *****************************************************************************
" vim-markdown-preview
" ctrl-m opens a preview in the browser or refresh current preview
let vim_markdown_preview_hotkey='<C-m>'
" Display images and refresh on buffer write
" let vim_markdown_preview_toggle=2
" Use chrome for the preview
let vim_markdown_preview_browser='Google Chrome'
" clean up the html file after showing it
" let vim_markdown_preview_temp_file=0
" use grip to generate github style markdown
let vim_markdown_preview_github=1
" *****************************************************************************
" vim-flake8
" use <F7> to call manually
" auto call Flake8 on python file save
" autocmd BufWritePost *.py call Flake8()
" *****************************************************************************
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_ruby_checkers = ['rubocop']
" *****************************************************************************
" vim-unimpaired
" *****************************************************************************
" gist-vim
" set gists to private by default
let g:gist_post_private = 1

" use GitHub enterprise
let g:gist_api_url = 'https://git.innova-partners.com/api/v3'
" *****************************************************************************
" histwin
" *****************************************************************************
" use crtl-u to open history browser
map <C-u> :Histwin<CR>
" *****************************************************************************
" END PLUGIN DESCRIPTIONS

filetype indent on " load filetype-specific indent files

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
" one second timeout for leader+key combos
set timeout timeoutlen=1000 ttimeoutlen=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" number lines
set number

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Show last command in bottom right corner
set showcmd

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" clear search highlighting
nnoremap <leader>c :nohlsearch<CR>

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
"
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set background=dark
colorscheme solarized

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Show a highlighted color bar at 100 characters
set colorcolumn=100
" Or 80 in a ruby file
autocmd BufRead,BufNewFile *.rb set colorcolumn=80
" and 72 in a gitcommmit
autocmd FileType gitcommit set colorcolumn=72

" Show trailing whitespaces
set list listchars=tab:»\ ,trail:•,nbsp:+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim/backup,/tmp
set directory=~/.vim/backup,/tmp
set undodir=~/.vim/backup,/tmp

" turn on persistent undo
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
" except in py and php files
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4 tabstop=4
au Filetype php set shiftwidth=4 tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space with ,w
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
map <leader>w :call DeleteTrailingWS()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

autocmd FileType gitcommit setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.md  setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" preload the p yank buffer with binding.pry line
let @p="Orequire 'pry'; binding.pry"

if !has('nvim')
  set clipboard=unnamed
else
  set clipboard+=unnamedplus
endif
