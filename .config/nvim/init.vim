" First install vim-plug cf. https://github.com/junegunn/vim-plug#installation
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then run :PlugInstall

" #############
" Configuration
" #############

" Mapleader keys
let mapleader = ','
let maplocalleader = '\\'

" General
set ignorecase " Ignore case in patterns
set smartcase " Ignore case unless Upper in search
set clipboard=unnamedplus " Use default system clipboard
set mouse=a
" set autowrite " Automatically :write before running commands
" set autochdir " Change to the current working directory to the file which was opened or selected
" set lazyredraw " Does not redraw sreen while executing macros. To for use ':redraw'

" Changes
set autoread " Detect file changes elsewhere
au FocusGained,BufEnter * :checktime " When to detect changes

" Numbers
set number " Display current number line
set relativenumber " Active relative numbers
set numberwidth=5 " Set number width

" Layout
set textwidth=80 " Display a line at 80 characters
set colorcolumn=+1 "Width of the line
set splitbelow " Open split to bottom
set splitright " Open split to right
set nowrap " Disable wrapping
" set diffopt+=vertical " Always use vertical diffs

" Indentation
set shiftround " Active shift rounding for indentation
set tabstop=2 " Number of space characters for a tabulation
set shiftwidth=2 " Number of space characters inserted for indentation
set softtabstop=2 " Makes the indentation spaces feel like real tabs
set expandtab " Tabs as spaces
" set noexpandtab " Tabs as tabs

" Undoing
set undofile
set undolevels=1000 " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload

" Temporary files
set nobackup " Do not make a backup file before overwriting file and doesn't not leave it after
set nowritebackup " Do not make a backup file before overwriting file
set noswapfile " Do not use swapfile for the buffer

" Display extra whitespace
set list listchars=tab:\-\ ,trail:·

" Completion
set wildmode=longest,full
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" #########
" Movements
" #########

" Disable esc key and map 'jk' instead
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

" Go to the begining of the line (non blank character)
nnoremap H ^
" Go to the end of the line
nnoremap L $

" Quicker buffer movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Go to the next tab
nnoremap <leader>t :tabnext<cr>
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" terminal
tnoremap <ESC> <C-\><C-n><C-w><C-p>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" #################
" General remapping
" #################

" Editing vimrc file
nnoremap <leader>ev :split $MYVIMRC<cr>
" Sourcing vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" show next matched string in the center of screen
nnoremap n nzz
nnoremap N Nzz
" turn off search highlight
nnoremap <leader>h :nohlsearch<CR>
" Open NERDTree
nnoremap <leader>n :NERDTree<CR>
" Open a splitted vim grep
map <F4> <ESC>:vs<CR><ESC> :execute "lvimgrep /" . expand("<cword>") . "./**"<CR><ESC>:lw<CR>

" Maximise split (expand)
nnoremap <leader>z <C-w>_<CR><C-w><Bar>
" Minimize split (reduce)
nnoremap <leader>r <C-w>=

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

" #######
" Plugins
" #######

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree' " NERDTree
Plug 'scrooloose/syntastic' " Syntax checking
" Plug 'kien/ctrlp.vim' " Search file in project
Plug 'ctrlpvim/ctrlp.vim' " Replace kien plugin
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'morhetz/gruvbox' " Theme Gruvbox
Plug 'groenewege/vim-less' " Coloration for less files
Plug 'digitaltoad/vim-jade' " Coloration for jade/pug templates
Plug 'kchmck/vim-coffee-script' " Coloration for coffee script
Plug 'wavded/vim-stylus' " Coloration for stylus
Plug 'xolox/vim-misc' " Extended library needed by plugins like vim-session
Plug 'xolox/vim-session' " Record layout sessions
Plug 'editorconfig/editorconfig-vim' " Editor config

call plug#end()

" ###############
" Plugin NERDTree
" ###############

let NERDTreeShowHidden = 1

" #####################
" Font and color scheme
" #####################

colorscheme gruvbox
set background=dark
" set lines=1024 columns=860

" ############
" Plugin ctrlp
" ############

" Use the nearest .git directory as the cwd
" it also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
" Ignore some directories
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|data\|coverage'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" #############
" Configuration
" #############

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
  " autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  " autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  " autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  " autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Automatically wrap at 80 characters for Markdown
  " autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Allow stylesheets to autocomplete hyphenated words
  " autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" ##############
" Tab completion
" ##############

" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper(direction)
  let char_before = col('.') - 1
  if !char_before || getline('.')[char_before - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("backward")<cr>

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



" " Matching parenthesis
" set showmatch " Show the matching bracket at insert
" set matchtime=3 " Tenths of a second to show the matching paren
"
"
"
"
" " Airline Theme
" let g:airline_theme='tomorrow'
"
" " #####################################
" " Sessions recording plugin vim-session
" " #####################################
"
" let g:session_autoload = 'yes' " Autoload session on start
" let g:session_autosave = 'yes' " Autosave session on quit
" let g:session_lock_enabled = 0 " Disable session locking
" " let g:session_directory = '~/.vim/sessions' " Where to save sessions. This is the default on unix
"
" " Indentation
" " Treat those tags like the block tags they are
" let g:html_indent_tags = '\|li\|p\|article\|aside\|audio\|bdi\|canvas\|command\|datalist\|details\|figcaption\|figure\|footer\|header\|hgroup\|mark\|meter\|nav\|output\|progress\|rp\|rt\|ruby\|section\|summary\|time\|video'
"

" ################
" Plugin syntastic
" ################

" let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 " Does not update list buffer
let g:syntastic_check_on_open = 0 " Does not check on open and on save
let g:syntastic_check_on_wq = 1 " Check on write and quit
let g:syntastic_enable_signs = 0

let g:syntastic_javascript_checkers = ['eslint'] " Linter used
