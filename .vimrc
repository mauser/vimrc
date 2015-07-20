" -----------------------------------------------------------------------------
" | VIM Settings |
" | (see gvimrc for gui vim settings) |
" | |
" | Some highlights: |
" | jj = <esc> Very useful for keeping your hands on the home row |
" | ,n = toggle NERDTree off and on |
" | |
" | ,f = fuzzy find all files |
" | ,b = fuzzy find in all buffers |
" | |
" | hh = inserts '=>' |
" | aa = inserts '@' |
" | |
" | ,h = new horizontal window |
" | ,v = new vertical window |
" | |
" | ,i = toggle invisibles |
" | |
" | enter and shift-enter = adds a new line after/before the current line |
" | |
" | :call Tabstyle_tabs = set tab to real tabs |
" | :call Tabstyle_spaces = set tab to 2 spaces |
" | |
" | Put machine/user specific settings in ~/.vimrc.local |
" -----------------------------------------------------------------------------
 
" initialise pathogen
" see
" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


set nocompatible
 
"hydrogen style indentation 
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab  
 
 
" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright
 
"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>
 
" Cursor highlights ***********************************************************
set cursorline
 
" Searching *******************************************************************
set hlsearch " highlight search
set incsearch " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
 
 
" Colors **********************************************************************
:colorscheme molokai_mauser
syntax on " syntax highlighting
 
 
" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
 
 
" Line Wrapping ***************************************************************
set nowrap
set linebreak " Wrap at word
 
 
map tp <Esc> :tabp<Return> 
map tn <Esc> :tabn<Return> 
"imap <S-left> <Esc> :tabp<Return> 
"imap <S-right> <Esc> :tabn<Return> 



"Use tagbar for c and c++
autocmd FileType cpp call SetCOptions()
autocmd FileType h call SetCOptions()
autocmd FileType c call SetCOptions()
function! SetCOptions()
setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
    :call tagbar#autoopen(0)
endfunction

 
" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype
 
"autocmd FileType html :set filetype=xhtml
 
" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
 
 
" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how
 
 
" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars
 
" | Plug-ins |
" -----------------------------------------------------------------------------
 
" NERDTree ********************************************************************
:noremap ,n :NERDTreeToggle<CR>
 
" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1
 
" Single click for everything
let NERDTreeMouseMode=1
 
 
" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2
 
 
" -----------------------------------------------------------------------------
" | Startup |
" -----------------------------------------------------------------------------
" Open NERDTree on start
"autocmd VimEnter * exe 'NERDTree' | wincmd l
 


nmap <C-T> :enew<cr>

" Move to the next buffer
nmap <C-M> :bnext<CR>
"
" " Move to the previous buffer
nmap <C-N> :bprevious<CR>
nmap <C-X> :bp <BAR> bd #<CR>

 
" -----------------------------------------------------------------------------
" | Host specific |
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
 
"if hostname() == "foo"
  " do something
"endif
"
"airline
set encoding=utf-8
"set guifont=Source\ Code\ Pro\ for\ Powerline
set guifont=Inconsolata-dz\ for\ Powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'powerlineish'
set laststatus=2


set guioptions-=T
set guioptions-=r

