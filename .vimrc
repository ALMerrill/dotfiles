"##### Colors #####
" Colorscheme
colorscheme badwolf
" enable syntax processing
syntax enable

"##### Spaces and Tabs #####
" Make tabs spaces
set expandtab
" 4 spaces shown on a tab
set tabstop=4
" 4 spaces inserted on a tab
set softtabstop=4
" auto tab
set autoindent


"##### UI Config  #####
" Show last command in bottom right
set showcmd
" highlight current line
set cursorline
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to
set lazyredraw
" highlight matching [{()}]
set showmatch
" Always have numbered lines
set number

"##### Search #####
" search as characters are entered
set incsearch
" highlight matches
set hlsearch


" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"##### Movement #####
" move vertically by visual line (move next line even when wrapped)
nnoremap j gj
nnoremap k gk
" highlight last inserted text in insert mode
nnoremap gV `[v`]

"##### Commands #####
" Exit insert with jk
:imap jk <Esc>





" ##### Nerd tree stuff

" open nerd tree when no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open nerd tree when a directory is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" map ctrl n to open nerd tree
map <C-n> :NERDTreeToggle<CR>

" close vim is nerd tree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


