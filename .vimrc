autocmd vimenter * set t_ut=

" Colorscheme
colorscheme gruvbox
set bg=dark
"let g:gruvbox_number_column = 'bg3'

syntax enable



""""" Nerd Tree plugin

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

"

" Sets ctrl n as the toggle for nerd tree
map <C-n> :NERDTreeToggle<CR>


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
set number relativenumber
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

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%120v.\+/

" map escape to remove text highlights in addition to regular behavior
nnoremap <silent> <esc> :noh<cr><esc>
" ctrl j and k to move lines down and up
noremap <c-k> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-j> ddp


:hi Directory guifg=#00FF00 ctermfg=green
"nnoremap <space> za

if $TERM =~ 'xterm-256color'
  set noek
endif

