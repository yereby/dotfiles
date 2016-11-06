" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
filetype off

" #######
" Plugins
" #######

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' " NERDTree
Plugin 'scrooloose/syntastic' " Syntax checking
Plugin 'kien/ctrlp.vim' " Search file in project
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'morhetz/gruvbox' " Theme Gruvbox
Plugin 'groenewege/vim-less' " Coloration for less files
Plugin 'digitaltoad/vim-jade' " Coloration for jade/pug templates
Plugin 'kchmck/vim-coffee-script' " Coloration for coffee script
Plugin 'wavded/vim-stylus' " Coloration for stylus
Plugin 'xolox/vim-misc' " Extended library needed by plugins like vim-session
Plugin 'xolox/vim-session' " Record layout sessions

call vundle#end()

" #############
" Configuration
" #############

" Filetype auto-detection + plugin + indent on
filetype plugin indent on

" Mapleader keys
let mapleader = ','
let maplocalleader = '\\'

" General
set autowrite " Automatically :write before running commands
set autochdir " Change to the current working directory to the file which was opened or selected
set autoread " Update the buffer if file change elsewhere
set backspace=indent,eol,start " Backspace deletes like most programs in insert mode
set history=50 " Number of commands history
set ignorecase " Ignore case in patterns
set lazyredraw " Does not redraw sreen. To for use ':redraw'
set showcmd " display incomplete commands
set wildmenu " Enhance file opening completion

" Numbers
set number " Display current number line
set relativenumber " Active relative numbers
set numberwidth=5 " Set number width

" Layout
set nowrap " Disable wrapping
set ruler " Show the line and column number of the cursor position
set laststatus=2 " Always display the status line
set textwidth=80 " Display a line at 80 characters
set colorcolumn=+1 "Width of the line
set splitbelow " Open split to bottom
set splitright " Open split to right
set diffopt+=vertical " Always use vertical diffs

" Matching parenthesis
set showmatch " Show the matching bracket at insert
set matchtime=3 " Tenths of a second to show the matching paren

" Indentation
set autoindent " Auto indenting
set shiftround " Active shift rounding for indentation
set tabstop=2 " Number of space characters for a tabulation
set shiftwidth=2 " Number of space characters inserted for indentation
set softtabstop=2 " Makes the indentation spaces feel like real tabs
set smarttab " Inserts indentation according to shiftwidth
set expandtab " Tabs as spaces
" set noexpandtab " Tabs as tabs

" Temporary files
set nobackup " Do not make a backup file before overwriting file and doesn't not leave it after
set nowritebackup " Do not make a backup file before overwriting file
set noswapfile " Do not use swapfile for the buffer

" Search
set hlsearch " Highlight search
set incsearch " Highlight search while typing

" Display extra whitespace
set list listchars=tab:\-\ ,trail:·

" Undoing
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload

" #####################
" Font and color scheme
" #####################

if has('gui_running')
  colorscheme gruvbox
  set background=dark
  set guioptions-=T  " no toolbar
  set lines=1024 columns=860
  set guifont=Consolas:h11:cANSI
else
  colorscheme desert
endif

" ####################
" Text transformations
" ####################

" Convert current word in uppercase in insert mode
inoremap <leader>u <esc>viw U ea
" Convert current word in uppercase in normal mode
nnoremap <leader>u viw U e
" Convert current word in lowercase in insert mode
inoremap <leader>l <esc>viw u ea
" Convert current word in lowercase in normal mode
nnoremap <leader>l viw u e

" Surround word with double quotes in normal mode
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" Surround word with single quotes in normal mode
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" Surround word with double quotes in visual mode
vnoremap <leader>" <esc>`<i"<esc> `>la"<esc>
" Surround word with single quotes in visual mode
vnoremap <leader>' <esc>`<i'<esc> `>la'<esc>

" Abbreviations in insert mode
iabbrev info console.info(
iabbrev debug console.debug(

" #########
" Movements
" #########

" Go to the begining of the line (non blank character)
nnoremap H ^
" Go to the end of the line
nnoremap L $

" Disable esc key
" and map 'jk' instead
inoremap <esc> <nop>
inoremap jk <esc>

" Remap arrow keys
nnoremap <Left> :echoe 'Use h'<CR>
nnoremap <Right> :echoe 'Use l'<CR>
nnoremap <Up> :echoe 'Use k'<CR>
nnoremap <Down> :echoe 'Use j'<CR>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" Quicker buffer movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Go to the next tab
nnoremap <leader>t :tabnext<cr>
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" #################
" General remapping
" #################

" Editing vimrc file
nnoremap <leader>ev :split $MYVIMRC<cr>
" Sourcing vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" turn off search highlight
nnoremap <leader>h :nohlsearch<CR>
" Open NERDTree
nnoremap <leader>n :NERDTree<CR>

" #####################################
" Sessions recording plugin vim-session
" #####################################

let g:session_autoload = 'yes' " Autoload session on start
let g:session_autosave = 'yes' " Autosave session on quit
let g:session_lock_enabled = 0 " Disable session locking
" let g:session_directory = '~/.vim/sessions' " Where to save sessions. This is the default on unix

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
endif

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" ###############
" Plugin NERDTree
" ###############

let NERDTreeShowHidden = 1

" ############
" Plugin ctrlp
" ############

" Use the nearest .git directory as the cwd
" it also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|data\|coverage' " Ignore some directories

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ##############
" Tab completion
" ##############

" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ "\k"
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Indentation
" Treat those tags like the block tags they are
let g:html_indent_tags += '\|li\|p\|article\|aside\|audio\|bdi\|canvas\|command\|datalist\|details\|figcaption\|figure\|footer\|header\|hgroup\|mark\|meter\|nav\|output\|progress\|rp\|rt\|ruby\|section\|summary\|time\|video'

" ################
" Plugin syntastic
" ################

" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers = ['eslint'] " Linter used
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1 " Check on open and on save
let g:syntastic_check_on_wq = 0 " Doesnt check on write and quit
let g:syntastic_enable_signs=0

" ########
" Encoding
" ########

" Encode in utf8
if has('multi_byte')
  if &termencoding == ''
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" ############
" Local config
" ############

if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
