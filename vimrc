set runtimepath+=$GOROOT/misc/vim
execute pathogen#infect()
syntax on
set number
set rnu
filetype plugin indent on
set hlsearch
set incsearch
set magic
set smarttab
set autoindent
set tabstop=4
set shiftwidth=4
map <Esc>[B <Down>]

let g:CSApprox_verbose_level = 0
map <F8> :NERDTreeToggle<cr>
map <F9> :TagbarToggle<cr>
" let g:NERDTreeDirArrows=0

"Set a nice Omnifunc - <CTRL>X <CTRL>O
set ofu=syntaxcomplete#Complete

 
" Make vim popup behave more like an IDE POPUP
set completeopt=longest,menuone

" Make enter finish the completion popup menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap gp `[v`] 
nmap <C-?> gcc 
set backspace=indent,eol,start
colorscheme desert256

" Move lines
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set laststatus=2

if &t_Co == 256
    colorscheme Tomorrow-Night-Eighties
endif

"Display whitespace characters
set listchars=tab:│\ ,trail:·
set list

"Fold Methods
set foldmethod=indent
set nofoldenable    "Stop from folding at load

if has('mouse')
  set mouse=a
endif

"Disable Arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Buffer Mappings
nmap <C-e> :b#<CR>
nmap <C-PageUp> :bnext<CR>
nmap <C-PageDown> :bprev<CR>

"Functions
function Opaq()
	set t_Co=256
	colorscheme Tomorrow-Night-Eighties
endfunction

function Transp()
	set t_Co=128
endfunction

"Smart Home (VimTip315)
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>
