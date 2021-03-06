" ----- Initialize Plugins -----

call plug#begin('~/.vim/plugged')

" Syntax
Plug 'tpope/vim-git'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/html5.vim'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'gavocanov/vim-js-indent'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'StanAngeloff/php.vim'
Plug 'pearofducks/ansible-vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'jwalton512/vim-blade'
Plug 'wizicer/vim-jison'

" Actual Plugins
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'gorkunov/smartpairs.vim'
Plug 'thinca/vim-visualstar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sleuth'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/syntastic'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'shuber/vim-promiscuous'
Plug 'justinmk/vim-sneak'
Plug 'kurkale6ka/vim-pairs'
Plug 'suan/vim-instant-markdown'
Plug 'christoomey/vim-sort-motion'
Plug 'shawncplus/phpcomplete.vim'
Plug 'Olical/vim-enmasse'
Plug 'ervandew/supertab'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'chrisbra/Colorizer'

call plug#end()


" ----- General Config -----

autocmd!
filetype off

" Enable per-file indenting and highlighting
filetype plugin indent on
syntax on
set background=dark

" Stop vim dying with long lines
set synmaxcol=250

" Show relative line numbers
set number
set relativenumber

" Linebreaking options
set linebreak
set textwidth=100
set backspace=indent,eol,start

" Highlight matching bracket when closing
set showmatch

" Flash screen instead of audible error bell
set visualbell

" Options for searching in files
set nohlsearch
set smartcase
set ignorecase
set incsearch
set gdefault

" Indenting options
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set shiftround

" Automatically write and read
set autowriteall
set autoread

" Show cursor position in statusbar
set ruler

" Highlight current line
set cursorline

" Don't redraw in the middle of macros
set lazyredraw

" Undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undodir/
  set undolevels=500
  set undoreload=500
endif

" Show status bar at all times
set laststatus=2

" Use system clipboard by default
set clipboard^=unnamed

" Rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Enable spellcheck
set spelllang=en_us
syntax spell toplevel

" Disable backups and swap
set nobackup
set nowritebackup
set noswapfile

" Reset cursor position on files if it's remembered
autocmd BufReadPost * if &filetype != "gitcommit" && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ----- Filetype-Specific Config -----

" Automatically set marks for certain files and filetypes
autocmd BufLeave *.scss normal! mS
autocmd BufLeave *.html normal! mH
autocmd BufLeave *.js normal! mJ
autocmd BufLeave *Controller.php normal! mC
autocmd BufLeave *Repo*.php normal! mR
autocmd BufLeave *Transform.php normal! mT
autocmd BufLeave routes.php normal! mE

" Remove trailing spaces automatically on save
autocmd BufWritePre *.js,*.php,*.html,*.css,*.scss :%s/\s\+$//e


" ----- Custom mappings -----

" Disable ex mode
nnoremap Q <Nop>

" Make Y consistent with C and D
nnoremap Y y$

" Pinky savers
let mapleader = ","
noremap ; :
noremap ' `

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resizing
nnoremap <Leader>k <C-w>=
nnoremap K <C-w>5><C-w>5+

" Line nagivation
nnoremap H ^
nnoremap L $

" Store relative line number jumps in the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Save easily
nnoremap <Leader>s :w<Cr>
nnoremap <Leader>S :windo w<Cr>

" Save with sudo
cnoremap w!! w !sudo tee % > /dev/null

" File navigation
cnoremap %% <C-R>=expand('%:h').'/'<Cr>

" Use jk to esc out of insert/command mode
inoremap jk <Esc>
cnoremap jk <C-U><BS>

" Range commands while searching
cnoremap $t <Cr>:t''<Cr>
cnoremap $m <Cr>:m''<Cr>
cnoremap $d <Cr>:d<Cr>``

" Run phpcbf
nnoremap <Leader>cp :%! phpcbf --standard=~/.elite50-phpcs-ruleset.xml<Cr><Cr>:w<Cr>

" Magic regex
noremap :s/ :s/\V
noremap :g/ :g/\V
noremap :%s/ :%s/\V
noremap :%g/ :%g/\V
noremap :sv/ :s/\v
noremap :gv/ :g/\v
noremap :%sv/ :%s/\v
noremap :%gv/ :%g//
noremap :s// :s//
noremap :g// :g//
noremap :%s// :%s//
noremap :%g// :%g//

" Toggle spellcheck
nnoremap <Leader>cs :setlocal spell!<Cr>


" ----- Custom Commands -----

" Run commands silently with screen redraw
command! -nargs=1 Silent
\ | execute ':silent '.<q-args>
\ | execute ':redraw!'

" Quickly source vimrc
command! SourceVimrc source $MYVIMRC

" Project shortcuts
command! Build Silent !./build.sh
command! Migrate Silent !./migrate.sh
command! Release Silent !./release.sh

" Command to re-run grunt commands
command! Grunt Silent !screen -S cs-front-grunt -p 0 -X stuff "grunt dev:watch$(printf \\r)"
command! GruntBuild Silent !screen -S cs-front-grunt -p 0 -X stuff "grunt dev$(printf \\r)"

" Run macro on all lines of visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


" ----- Plugins -----

" --- Solarized ---
colorscheme solarized

" --- Airline ---
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{fugitive#head()}'

" -- Netrw ---
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
noremap <Leader>fnn :Explore<Cr>
noremap <Leader>fns :Sexplore<Cr>
noremap <Leader>fnv :Vexplore<Cr>

" --- FZF ---
nnoremap <Leader>ff :Files<Cr>
nnoremap <Leader>fb :Buffers<Cr>
nnoremap <Leader>f/ :Ag<Space>
nnoremap <Leader>fl :Lines<Cr>
nnoremap <Leader>fs :Snippets<Cr>
nnoremap <Leader>fc :Commits<Cr>
nmap <Leader><Tab> <Plug>(fzf-maps-n)
xmap <Leader><Tab> <Plug>(fzf-maps-x)
omap <Leader><Tab> <Plug>(fzf-maps-o)
imap <C-x><C-k> <Plug>(fzf-complete-word)
imap <C-x><C-f> <Plug>(fzf-complete-path)
imap <C-x><C-j> <Plug>(fzf-complete-file-ag)
imap <C-x><C-l> <Plug>(fzf-complete-line)

" --- Sneak ---
" Make nN behave like ;, when sneaking
function! SmartFEnable()
  map n <Plug>SneakNext
  map N <Plug>SneakPrevious
endfun
" Make nN behave normally
function! SmartFDisable()
  silent! unmap n
  silent! unmap N
endfun
" Make sneaking enable smart nN
nmap f :call SmartFEnable()<Cr><Plug>Sneak_f
nmap F :call SmartFEnable()<Cr><Plug>Sneak_F
nmap t :call SmartFEnable()<Cr><Plug>Sneak_t
nmap T :call SmartFEnable()<Cr><Plug>Sneak_T
nmap s :call SmartFEnable()<Cr><Plug>Sneak_s
nmap S :call SmartFEnable()<Cr><Plug>Sneak_S
" Make searching return nN to normal
noremap / :call SmartFDisable()<Cr>/\V
noremap ? :call SmartFDisable()<Cr>?\V

" --- Syntastic ---
let g:syntastic_enable_signs = 1
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_html_checkers = []
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--report=csv --standard=~/.elite50-phpcs-ruleset.xml"

" --- Javascript Libraries Syntax ---
let g:used_javascript_libs = 'jquery,angularjs,angularui,angularuirouter,requirejs'

" --- Snippets ---
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

" --- Fugitive ---
nnoremap <Leader>ga :Silent Git add %:p<Cr>
nnoremap <Leader>gA :Silent Git add -A<Cr>
nnoremap <Leader>gs :Gstatus<Cr>
nnoremap <Leader>gc :Gcommit<Cr>
nnoremap <Leader>gC :Gcommit -a<Cr>
nnoremap <Leader>gd :Gdiff<Cr>
nnoremap <Leader>ge :Gedit<Cr>
nnoremap <Leader>gr :Gread<Cr>
nnoremap <Leader>gw :Gwrite<Cr>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gm :Gmerge<Space>
nnoremap <Leader>gf :Gfetch --prune --tags<Cr>
nnoremap <Leader>gt :Git tag<Space>
nnoremap <Leader>gpl :Gfetch --prune --tags<Cr>:Gpull<Cr>
nnoremap <Leader>gpb :Gfetch --prune --tags<Cr>:Gpull<Cr>:Build<Cr>:Migrate<Cr>
nnoremap <Leader>gps :Gpush --follow-tags<Cr>
nnoremap <Leader>gpt :Gpush --tags<Cr>
nnoremap <Leader>gpu :execute "Silent Gpush -u origin" fugitive#head()<Cr>
nnoremap <Leader>gpo :Gpush origin<Space>
nnoremap <Leader>gnl :execute "Silent !git branch --merged \| tr -d '*' \| grep -v 'feature/components\\\|master\\\|review/' \| xargs -n1 git branch -d"<Cr>
nnoremap <Leader>gnr :execute "Silent !git branch -r --merged \| sed -e 's/origin\\///' \| grep -v 'feature/components\\\|master\\\|review' \| xargs -n1 git push origin --delete"<Cr>
nnoremap <Leader>gnn :call GitFreshenRepo()<Cr>
function! GitFreshenRepo()
  Silent Git checkout master
  normal ,gpl
  normal ,gnl
  normal ,gnr
endfun

" -- Promiscuous --
nnoremap <Leader>gO :Promiscuous<Space>
nnoremap <Leader>gB :Promiscuous -<Cr>

" --- GitGutter ---
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_map_keys = 0
nnoremap <Leader>gg :GitGutterToggle<Cr>

" --- DelimitMate ---
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
imap <Leader>, <Plug>delimitMateJumpMany

" --- Undotree ---
nnoremap <Leader>u :UndotreeToggle<Cr>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 3
let g:undotree_SplitWidth = 50

" --- Emmet ---
let g:use_emmet_complete_tag = 1

" --- Instant Markdown ---
let g:instant_markdown_slow = 1

" -- PHP Syntax ---
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction
autocmd FileType php call PhpSyntaxOverride()

" -- PHPComplete --
let g:phpcomplete_parse_docblock_comments = 1
