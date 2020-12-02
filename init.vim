if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set clipboard=unnamedplus
let &t_ut=''
set autochdir
set number
set cursorline
set hidden
set autoindent
set smartindent
set cindent
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set signcolumn=yes
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set visualbell
set updatetime=100
set virtualedit=block
syntax on
set hlsearch
exec "nohlsearch"
set incsearch
set mouse=a
set encoding=utf-8

let mapleader=" "
noremap j h
noremap k j
noremap i k
noremap K 5j
noremap I 5k
noremap J 10h
noremap L 10l
noremap h i
noremap H I
noremap ; :
noremap n nzz
noremap N Nzz
noremap U <C-r>
nnoremap < <<
nnoremap > >>
nnoremap D d$
nnoremap Y y$
nnoremap C c$
nnoremap <LEADER><CR> K

map <C-q> <ESC>
map! <C-q> <ESC>
tnoremap <C-q> <C-\><C-N>

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>
map ss :set splitright<CR>:vsplit<CR>:terminal<CR>h
map ? :nohlsearch<CR>
nmap <C-a> @q

nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap sj :set nosplitright<CR>:vsplit<CR>
nnoremap si :set nosplitbelow<CR>:split<CR>
nnoremap sk :set splitbelow<CR>:split<CR>
nnoremap <LEADER>l <C-w>l
nnoremap <LEADER>j <C-w>h
nnoremap <LEADER>i <C-w>k
nnoremap <LEADER>k <C-w>j
nnoremap <up> :res +2<CR>
nnoremap <down> :res -2<CR>
nnoremap <left> :vertical resize -2<CR>
nnoremap <right> :vertical resize +2<CR>
nnoremap sv <C-w>t<C-w>H
nnoremap sh <C-w>t<C-w>K
nnoremap srh <C-w>b<C-w>K
nnoremap srv <C-w>b<C-w>H
nnoremap st <C-w>T
nnoremap tt :tabe<CR>
nnoremap tj :tabp<CR>
nnoremap tl :tabn<CR>

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

call plug#end()

"coc.nvim
let g:coc_global_extensions = [
  \ 'coc-cmake',
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-actions',
  \ 'coc-snippets']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-r> coc#refresh()

" Use `g-` and `g=` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g- <plug>(coc-diagnostic-prev)
nmap <silent> g= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open '.visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" defx
" 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
nnoremap <silent> <leader>d :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()` <CR>
nnoremap <silent> <leader>f :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
	nnoremap <silent><buffer><expr> J
	  \ defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> L
	  \ defx#do_action('drop')
	nnoremap <silent><buffer><expr> p
	  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> C
                \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> M
                \ defx#do_action('move')
  nnoremap <silent><buffer><expr> P
                \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> <CR>
                \ defx#is_directory() ? 
                \ defx#do_action('open_or_close_tree') : 
                \ defx#do_action('multi', ['drop'])
  nnoremap <silent><buffer><expr> D
                \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> F
                \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> <C-d>
                \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> R
                \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy
               \ defx#do_action('yank_path')
endfunction

call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 35,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions,.netrwhist'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

" LeaderF
let g:Lf_ShortcutF = '<C-p>'
noremap <C-n> :LeaderfMru<cr>
"noremap <C-f> :LeaderfFunction!<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.config/nvim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#tabs_label = ''

set termguicolors
colorscheme molokai
highlight Normal  guibg=none ctermbg=none
highlight NonText guibg=none ctermbg=none
highlight LineNr  guibg=none ctermbg=none
highlight SignColumn guibg=none ctermbg=none
