call plug#begin('~/.config/nvim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'fatih/vim-go'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme solarized
set background=dark

set listchars=tab:——,nbsp:⋅,eol:¬,trail:⋅
set list
" Fix for listchars background
highlight SpecialKey cterm=none ctermfg=0 guifg=#073642 ctermbg=8 guibg=#002b36
highlight NonText cterm=none ctermfg=0 guifg=#073642

set relativenumber
set number
set cc=80
set modeline


" easier indentation in visual mode
vmap > >gv
vmap < <gv





let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1



func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
noremap <leader>w :call DeleteTrailingWS()<CR>
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.yml :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()


" Tab completion settings
set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups
