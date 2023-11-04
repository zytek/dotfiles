" Sample vimrc file.
" by Jakub Glazik zytek<at>nuxi.pl
" http://zytek.nuxi.pl
" November 2006

"execute pathogen#infect()

filetype plugin on
filetype indent on

set spelllang=en,pl

set background=dark
"colorscheme solarized

set nocp		" nocompatibile yeah
"set ai			" autoindent
"set si			" smartindent
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

" easier indentation in visual mode
vmap > >gv
vmap < <gv

cnoreabbrev W w
cnoreabbrev Wa wa
noreabbrev Wqa wqa

" nice formatting of 'set list' - try pressing F3 ;-)
set listchars=tab:>_,trail:^

"hi Comment ctermfg=darkcyan

set titlestring=%f

" restore cursor location
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	exe "normal g`\"" |
	\ endif

au BufRead,BufNewFile *.md set filetype=markdown

set modeline

set expandtab
set tabstop=2
set shiftwidth=2
"set cc=80


func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

au BufWritePre * :%s/\s\+$//e
noremap <leader>w :call DeleteTrailingWS()<CR>
"autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.yml :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()


set completeopt-=preview " Close preview window on auto completion

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>v <Plug>(go-vet)
au FileType go nmap gd <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
