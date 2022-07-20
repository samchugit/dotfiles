" map leader and local leader
let mapleader = ' '
let g:mapleader = ' '
let maplocalleader = ';'
let g:maplocalleader = ';'

" auto load vimrc
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" resume last cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" quit all for last editable window
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

set guifont=FiraCode\ Nerd\ Font\ Mono:h22

" ---------------
" Indent Settings
" ---------------
set expandtab
set smarttab
set autoindent
set smartindent
set shiftround
set tabstop=4
set shiftwidth=4
set softtabstop=4


" ----------------
" Display Settings
" ----------------
set cursorcolumn
set cursorline
set number
set relativenumber
set nowrap
set showmatch
set hidden
set matchtime=2
set scrolloff=10
set shortmess+=c


" ---------------
" Search Settings
" ---------------
set hlsearch
set incsearch
set ignorecase
set smartcase


" -----------------
" Filetype Settings
" -----------------
filetype on
filetype plugin on
filetype indent on


" ----
" MISC
" ----
set nocompatible
set autoread
set mouse=a
set magic
set title
set updatetime=300
set timeoutlen=500
set spelllang=en_us,cjk
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


" ------------
" Key Maps
" ------------
" disable default 's' key
map s <nop>
map S <nop>

" basic operations
map <silent><leader>w :<C-u>w<CR>
map <silent><leader>W :<C-u>wa<CR>
map <silent><leader>q :<C-u>q<CR>
map <silent><leader>Q :<C-u>qa!<CR>
map <silent><leader>WQ :<C-u>wa<CR>:<C-u>qa<CR>
map U <C-r>

" cursor move in normal/visual/operator mode
map <C-a> <home>
map <C-e> <end>
map j gj
map k gk
map J 5gj
map K 5gk
map W 5w
map B 5b

" cursor move in insert/command mode
map! <C-h> <left>
map! <C-j> <down>
map! <C-k> <up>
map! <C-l> <right>
map! <C-a> <home>
map! <C-e> <end>

" windows management
map <silent><leader>sh <C-w>h
map <silent><leader>sj <C-w>j
map <silent><leader>sk <C-w>k
map <silent><leader>sl <C-w>l
map <silent><leader>sH <C-w>5<
map <silent><leader>sJ :<C-u>resize +5<CR>
map <silent><leader>sK :<C-u>resize -5<CR>
map <silent><leader>sL <C-w>5>
map <silent><leader>ss <C-w>s<C-w>j
map <silent><leader>sv <C-w>v<C-w>l
map <silent><leader>sS <C-w>b<C-w>K
map <silent><leader>sV <C-w>b<C-w>H
map <silent><leader>s= <C-w>=
map <silent><leader>sc :<C-u>close<CR>

" toggles
nmap <silent><leader>tw :<C-u>setl nowrap!<CR>
nmap <silent><leader>tp :<C-u>setl paste!<CR>
nmap <silent><leader>tc :<C-u>setl cursorcolumn!<CR>
nmap <silent><leader>tr :<C-u>setl relativenumber!<CR>
nmap <silent><leader>tl :<C-u>setl spell!<CR>
nmap <silent><leader>th :<C-u>setl nohlsearch!<CR>
nmap <silent><expr><leader>tm &colorcolumn ? ':<C-u>setl colorcolumn=<CR>' : ':<C-u>setl colorcolumn=80<CR>'
nmap <silent><expr><leader>ts exists("g:syntax_on") ? ':<C-u>syntax off<CR>' : ':<C-u>syntax on<CR>'
nmap <silent><leader>ti :<C-u>IndentLinesToggle<CR>

" create a terminal window
nmap <silent><leader>/ :<C-u>set splitbelow<CR>:<C-u>split<CR>:<C-u>resize -10<CR>:<C-u>term<CR>

imap <C-c> <C-g>u<esc>[s1z=`]a<C-g>u

" -------
" Plugins
" -------
" install vim-plug if it's not installed
" this works only for neovim, see https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let plug_path = stdpath('data') . '/site/autoload/plug.vim'
if empty(glob(plug_path))
    silent execute '!curl -fL --create-dirs -o '.plug_path.
                \ ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    execute 'source '.plug_path
endif
unlet plug_path

" plug plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vista.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
" +vim-visual-multi
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi'
Plug 'lambdalisue/suda.vim'
" +formatter
Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
Plug 'lilydjwg/fcitx.vim', { 'branch': 'fcitx5' }
Plug 'wakatime/vim-wakatime'
call plug#end()

" run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" ---------------
" Plugin Settings
" ---------------
" +gruvbox
"let g:gruvbox_contrast_dark = 'hard'
autocmd VimEnter * ++nested colorscheme gruvbox


" +vim-startify
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Recently used']                 },
    \ { 'type': 'dir',       'header': ['   Recently used in '. getcwd()]   },
    \ { 'type': 'sessions',  'header': ['   Sessions']                      },
    \ { 'type': 'bookmarks', 'header': ['   Favorites']                     },
    \ { 'type': 'commands',  'header': ['   Commands']                      },
    \ ]
let g:startify_bookmarks = [
    \ { 'v' : '~/.config/nvim/init.vim' },
    \ { 'c' : '~/.config/nvim/coc-settings.json' },
    \ { 'z' : '~/.zshrc'},
    \ ]


" +vim-airline
let g:airline_filetype_overrides = {
    \ 'vista' : [ 'Vista', ''],
\ }
if !exists('g:airline_symbols')
    let g:airline_symbols = {
                \ 'linenr'      : ' :',
                \ 'maxlinenr'   : '',
                \ 'colnr'       : ' :',
                \ 'whitespace'  : 'Ξ',
                \ 'branch'      : '⎇',
                \ 'paste'       : 'Ⓟ',
                \ 'spell'       : 'Ⓢ'
                \ }
endif
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#buf_label_first = 1
let g:airline#extensions#tabline#buffers_label = 'BUFFER'
let g:airline#extensions#tabline#tabs_label = 'TAB'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab


" +vim-which-key
" register the descriptions using the on-demand load feature
autocmd! User vim-which-key call which_key#register(' ', 'g:which_key_map_leader')

let g:which_key_hspace = 3
let g:which_key_use_floating_win = 1

nmap <silent><leader> :<c-u>WhichKey ' '<CR>
vmap <silent><leader> :<c-u>WhichKeyVisual ' '<CR>
nmap <silent><localleader> :<c-u>WhichKey ';'<CR>
vmap <silent><localleader> :<c-u>WhichKeyVisual ';'<CR>

" define leader key maps
let g:which_key_map_leader = {
    \ 'w' : 'write',
    \ 'q' : 'quit',
    \ 'W' : 'write all',
    \ 'Q' : 'quit all',
    \ 'WQ' : 'write all and quit',
    \ 'h' : 'vim help',
    \ '/' : 'open terminal',
    \ '1' : 'which_key_ignore',
    \ '2' : 'which_key_ignore',
    \ '3' : 'which_key_ignore',
    \ '4' : 'which_key_ignore',
    \ '5' : 'which_key_ignore',
    \ '6' : 'which_key_ignore',
    \ '7' : 'which_key_ignore',
    \ '8' : 'which_key_ignore',
    \ '9' : 'which_key_ignore',
    \ '0' : 'which_key_ignore',
    \ '-' : 'which_key_ignore',
    \ '=' : 'which_key_ignore',
    \ }
let g:which_key_map_leader.s = {
    \ 'name' : 'Windows...',
    \ 'h' : 'window left',
    \ 'j' : 'window below',
    \ 'k' : 'window up',
    \ 'l' : 'window right',
    \ 'H' : 'expand left',
    \ 'J' : 'expand below',
    \ 'K' : 'expand up',
    \ 'L' : 'expand right',
    \ 's' : 'splite below',
    \ 'v' : 'splite right',
    \ 'S' : 'place all vertically',
    \ 'V' : 'place all horizontally',
    \ '=' : 'balance all',
    \ }
let g:which_key_map_leader.t = {
    \ 'name' : 'Toggles...',
    \ 'w' : 'warp',
    \ 'p' : 'paste',
    \ 'c' : 'cursor column',
    \ 'r' : 'relative number',
    \ 'm' : 'highlight max column',
    \ 's' : 'syntax',
    \ 'h' : 'highlight search',
    \ 'i' : 'indent line',
    \ 'l' : 'spell check',
    \ }
let g:which_key_map_leader.e = {
    \ 'name' : 'Explorer...',
    \ 'f' : 'files',
    \ 't' : 'tags',
    \ }
let g:which_key_map_leader.f = {
    \ 'name' : 'Find...',
    \ 'f' : 'files',
    \ 'b' : 'buffers',
    \ 't' : 'tags',
    \ 'r' : 'recently used files',
    \ 'l' : 'lines',
    \ 'h' : 'helps',
    \ }
let g:which_key_map_leader.g = {
    \ 'name' : 'Goto...',
    \ 'd' : 'definition',
    \ 'y' : 'type definition',
    \ 'i' : 'implementation',
    \ 'r' : 'references',
    \ }
let g:which_key_map_leader.l = {
    \ 'name' : 'LSP...',
    \ 'r' : 'rename',
    \ 'f' : 'format',
    \ 'a' : 'actions',
    \ }
let g:which_key_map_leader.c = {
    \ 'name' : 'Comments...',
    \ 'c' : 'comment',
    \ 'u' : 'uncomment',
    \ 'n' : 'nest comment',
    \ 't' : 'toggle comment',
    \ 'p' : 'pretty comment',
    \ 'y' : 'yank before comment',
    \ 'e' : 'comment from here',
    \ 'a' : 'comment from end',
    \ }
let g:which_key_map_leader.o = {
    \ 'name' : 'Operations...',
    \ 'R' : [ 'SudaRead' , 'reopen with sudo' ],
    \ 'W' : [ 'SudaWrite' , 'write with sudo' ],
    \ }
let g:which_key_map_leader.b = {
    \ 'name' : 'Buffers...',
    \ 'd' : [ 'bd', 'delete buffer' ],
    \ 's' : [ 'Startify', 'Startify buffer' ],
    \ 'h' : [ 'bfirst' , 'first buffer' ],
    \ 'l' : [ 'blast', 'last buffer' ],
    \ 'j' : [ 'bprevious', 'previous buffer' ],
    \ 'k' : [ 'bnext', 'next buffer' ],
    \ }


" +coc.nvim
"  coc global extensions
let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-explorer',
    \ 'coc-pairs',
    "\ 'coc-snippets',
    \ 'coc-vimlsp',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-markdownlint',
    \ 'coc-pyright',
    \ 'coc-vimtex',
    \ 'coc-clangd',
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
imap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_space_tab() ? "\<TAB>" :
    \ coc#refresh()
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_space_tab() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-f> to trigger completion.
imap <silent><expr> <c-f> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"  `[g` and `]g` to navigate diagnostics
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)

"  code navigation
nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gy <Plug>(coc-type-definition)
nmap <silent><leader>gi <Plug>(coc-implementation)
nmap <silent><leader>gr <Plug>(coc-references)

"  <leader>h to show documentations
nmap <silent> <leader>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

"  <leader>rn to rename symbols
nmap <silent><leader>lr <Plug>(coc-rename)

"  <leader>f to format selected code
xmap <silent><leader>lf <Plug>(coc-format-selected)
nmap <silent><leader>lf <Plug>(coc-format-selected)

augroup coc_group
    autocmd!
    " setup formatexpr specified filetype(s)
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <silent><leader>la <Plug>(coc-codeaction-selected)
nmap <silent><leader>la <Plug>(coc-codeaction-selected)

"  coc-explorer settings
nmap <silent><leader>ef :<C-u>CocCommand explorer<CR>

"  coc-snippets settings
"imap <silent> <C-i> <Plug>(coc-snippets-expand)
"vmap <silent> <C-j> <Plug>(coc-snippets-select)
"let g:snips_author = 'Sam Chu'


" +ultisnips
let g:UltiSnipsExpandTrigger = '<nop>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'


" +vista.vim
let g:vista_cursor_delay = 200
let g:vista_stay_on_open = 0
let g:vista_disable_statusline = 1
let g:vista_executive_for = {
    \ 'vimwiki' : 'markdown',
    \ 'pandoc' : 'markdown',
    \ 'markdown' : 'toc',
    \ }
nmap <silent><leader>et :<C-u>Vista!!<CR>


" +LeaderF
let g:Lf_HideHelp = 1
let g:Lf_PopupColorscheme = 'gruvbox_default'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_WildIgnore = {
    \ 'dir' : ['.svn','.git','.hg'],
    \ 'file' : ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]'],
    \ }
"  key maps
let g:Lf_ShortcutF = '<nop>'
let g:Lf_ShortcutB = '<nop>'
nmap <silent><leader>ff :<C-u>Leaderf file<CR>
nmap <silent><leader>fb :<C-u>Leaderf buffer<CR>
nmap <silent><leader>ft :<C-u>Leaderf bufTag<CR>
nmap <silent><leader>fr :<C-u>Leaderf mru<CR>
nmap <silent><leader>fl :<C-u>Leaderf line<CR>
nmap <silent><leader>fh :<C-u>Leaderf help<CR>


" +indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = ''
let g:indentLine_conceallever = 2
let g:indentLine_fileTypeExclude = [
    \ 'coc-explorer',
    \ ]
let g:indentLine_bufTypeExclude = [
    \ 'help',
    \ 'terminal',
    \ ]


" +vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" +nerdcommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 0
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
map <silent><leader>cc <plug>NERDCommenterComment
map <silent><leader>cu <plug>NERDCommenterUncomment
map <silent><leader>cn <plug>NERDCommenterNested
map <silent><leader>ct <plug>NERDCommenterToggle
map <silent><leader>cp <plug>NERDCommenterSexy
map <silent><leader>cy <plug>NERDCommenterYank
map <silent><leader>ce <plug>NERDCommenterToEOL
map <silent><leader>ca <plug>NERDCommenterAppend


" vim-easymotion
map <leader><leader> <Plug>(easymotion-prefix)


" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

