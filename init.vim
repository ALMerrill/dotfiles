set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.local/share/nvim/plugged')
" color schemes
" http://vimcolors.com/
    Plug 'morhetz/gruvbox'
    Plug 'freeo/vim-kalisi'
    Plug 'w0ng/vim-hybrid'
    Plug 'bitterjug/vim-colors-bitterjug'
    Plug 'jonathanfilip/vim-lucius'
    Plug 'crusoexia/vim-monokai'
    Plug 'jacoborus/tender.vim'
    Plug 'pbrisbin/vim-colors-off'
    Plug 'muellan/am-colors'
    Plug 'blueshirts/darcula'
" setup vim-plug
    Plug 'davidhalter/jedi-vim'
" setup deoplete auto complete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" setup deoplete jedi (python)
    Plug 'zchee/deoplete-jedi'
" setup NerdTree
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
" vim airline status bar
    Plug 'vim-airline/vim-airline'
" auto pair quote and bracket
    Plug 'jiangmiao/auto-pairs'
" nerd commenter
    Plug 'scrooloose/nerdcommenter'
" auto format
    Plug 'sbdchd/neoformat'
" code compiling/linting
    Plug 'neomake/neomake'
" ctl-n to go through words, c to change
    Plug 'terryma/vim-multiple-cursors'
" highlight yank area
    Plug 'machakann/vim-highlightedyank'
" folding using zo, zO, zc and zC
    "Plug 'tmhedberg/SimpylFold'
call plug#end()

colorscheme gruvbox
set background=dark

" set
set nocompatible
let mapleader=";"

autocmd vimenter * set t_ut=

""""" Set
set hidden
set hlsearch
set ignorecase
set smartcase
set incsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set textwidth=130
set expandtab
set autoindent
set fileformat=unix
" Set relative number in command, absolute number in insert and on focus loss
set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set showcmd

"set foldmethod=indent
"set foldlevel=99
"set nu rnu

" Move cursor to where it was last time the file was open on file open
au BufReadPost *
     \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
               \ endif

" map escape to remove text highlights in addition to regular behavior
nnoremap <esc><esc> :noh<cr>
" ctrl j and k to move lines down and up
noremap <c-k> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-j> ddp

:hi Directory guifg=#00FF00 ctermfg=green
nnoremap <space> za


" auto complete
let g:deoplete#enable_at_startup = 1
"   close suggestion window on complete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" set splitbelow
"   navigate autocomplete with Tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


"Nerd Tree plugin

" Start nerd tree on vim start with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Start nerd tree on vim start with directory specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if nerd tree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" file highlighting by extension
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Sets ctrl n as the toggle for nerd tree
map <C-n> :NERDTreeToggle<CR>

"" Auto format
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


" vim-jedi go-to
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" set pylint as neomakes code checker
let g:neomake_python_enabled_makers = ['pylint']
" call neomake#configure#automake('nrwi', 500)
