let mapleader=" "
syntax on
set number
set cursorline
set wrap
set showcmd
set wildmenu
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set laststatus=2
set clipboard=unnamed
set scrolloff=5

set autoindent
set smartindent
set cindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

let g:rehash256 = 1

"Youcompleteme
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<C-z>'
set completeopt=menu,menuone
noremap <C-z> <NOP>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'] }

"ctags
set tags=./.tags;,.tags

"vim-gutentags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" LeaderF
let g:Lf_ShortcutF = '<C-p>'
let g:Lf_ShortcutB = '<LEADER>n'
noremap <C-n> :LeaderfMru<cr>
noremap <LEADER>p :LeaderfFunction!<cr>
noremap <LEADER>n :LeaderfBuffer<cr>
noremap <LEADER>m :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" terminal
noremap ss :set splitbelow<CR>:split<CR>:res 5 <CR>:terminal<CR>i
tnoremap <ESC> <C-\><C-n>

noremap j h
noremap k j
noremap i k
noremap K 5j
noremap I 5k
noremap J 10h
noremap L 10l
noremap h i
noremap H I
noremap <LEADER><CR> K
noremap n nzz
noremap N Nzz
noremap U <C-r>

noremap ; :
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source ~/.vim/vimrc<CR>
map ? :nohlsearch<CR>
map <LEADER>] <C-w>]
map <C-f> @q

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
map <LEADER>l <C-w>l
map <LEADER>j <C-w>h
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <up> :res +2<CR>
map <down> :res -2<CR>
map <left> :vertical resize -2<CR>
map <right> :vertical resize +2<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map tt :tabe<CR>
map tj :tabp<CR>
map tl :tabn<CR>

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'ycm-core/YouCompleteMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

call plug#end()

colorscheme molokai
highlight Normal ctermfg=none ctermbg=none
highlight NonText ctermfg=none ctermbg=none
