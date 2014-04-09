" Sample vimrc file.
" by Jakub Glazik zytek<at>nuxi.pl
" http://zytek.nuxi.pl
" November 2006
filetype plugin on
filetype indent on

set spelllang=en,pl

"set background=dark	" nicer colors	

set nocp		" nocompatibile yeah
set ai			" autoindent
set si			" smartindent 
"set ic			" ignore case when searching
set incsearch		" go to pattern when you type it in searches
set hlsearch
syntax on		" guess
set scrolloff=10	" keep 10 lines visible aroung the cursor when scrolling
set ruler		" always show cursor position
set showcmd		" show command in status line
set showmatch		" show matching brackets
set tabpagemax=150 "max 50 tabs

set bs=2		" backspace over everything in insert mode
set backup
set backupdir=~/.vim-backup
set history=200


" KEYBINDINGS - I hope these will be usefull for you too
map	<F3>	:set list!<Return>
imap	<F3>	<ESC>:set list!<Return>li
set	pastetoggle=<F4>
map	<F8>	dd
imap	<F8>	<Esc>ddi

" Meta+Arrows for OS X Terminal
imap <ESC>f <C-O>w
imap <ESC>b <C-O>b
map <ESC>f w
map <ESC>b b

" easily move through wrapped lines
:map <Up> gk
:map <Down> gj


" nice formatting of 'set list' - try pressing F3 ;-)
set listchars=tab:>_,trail:^

" I prefer this color for comments because I use background=light
" on a dark background ;-)
hi Comment ctermfg=darkcyan 

set titlestring=%f

" restore cursor location
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	exe "normal g`\"" |
	\ endif

au BufRead,BufNewFile *.md set filetype=markdown


set modeline

set expandtab
set tabstop=4
set shiftwidth=4
"set cc=80

execute pathogen#infect()

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
noremap <leader>w :call DeleteTrailingWS()<CR>
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.yml :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()
