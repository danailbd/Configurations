" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/YouCompleteMe
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' " show modified files in NERDTree
Plug 'jistr/vim-nerdtree-tabs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'embear/vim-localvimrc'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' "used to show branch in airline

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Syntax
Plug 'Chiel92/vim-autoformat'
Plug 'w0rp/ale'
Plug 'mustache/vim-mustache-handlebars'

" Color Schemes
Plug 'trevordmiller/nova-vim'
Plug 'jnurmine/Zenburn'
Plug 'rafi/awesome-vim-colorschemes'

" Python Plugins
Plug 'nvie/vim-flake8'
Plug 'hdima/python-syntax' "better Python syntax


" JS Plugins
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'heavenshell/vim-jsdoc'
Plug 'Valloric/YouCompleteMe'
"Plug 'marijnh/tern_for_vim'

call plug#end()            " required

let python_highlight_all=1

"" gitgutter config
let g:gitgutter_highlight_lines = 0

"" Ctrlp config
set wildignore+=*/tmp/*,*/node_modules/*,*/bower_components/*,*/dist/*,*.so,*.swp,*.zip,*.pyc,*.sql

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|.git|.pyc'
let g:ctrlp_types = ['mru', 'fil']

"" 'w0rp/ale' config
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \}
let g:ale_fixers = {
            \   'javascript': ['prettier-eslint'],
            \}
let g:ale_sign_error = '✖'
" ✒ ✓ ✔ ✕ ✖ ✗ ✘ ✙ ✚ ✛ ✜ ✝ ✞ ✟
" ✠ ✡ ✢ ✣ ✤ ✥ ✦ ✧ ✨ ✩ ✪ ✫ ✬ ✭ ✮ ✯ ✰ ✱ ✲ ✳ ✴ ✵ ✶ ✷ ✸ ✹ ✺ ✻ ✼ ✽ ✾ ✿
let g:ale_sign_warning = '⚡'


"" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vim-localvimrc
let g:localvimrc_ask='0'
let g:localvimrc_sandbox='0'


"" Airline
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#current_first = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#show_splits = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#close_symbol = '×'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_symbols.branch = ''

" or copy paste the following into your vimrc for shortform text
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }

"
" Custom configurations
"
set relativenumber
set number
set colorcolumn=120

set cursorline
set cursorcolumn
set hlsearch
set incsearch
set ic
set smartcase

set splitbelow
set splitright

set encoding=utf-8
let mapleader=" " " map <Leader> to <Space>

" Enable folding
set foldmethod=indent
set foldlevel=99

set spell

" enable local vimrc config
set exrc


""""""""""""""
"  Mappings  "
""""""""""""""
"
" split navigations
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>

" Autoformat
noremap - :Autoformat<CR>

nmap oo <Esc>k " insert new line under without leaving normal mode
nmap OO  <Esc>j " insert new line above  without leaving normal mode
nmap nf  :NERDTreeFind<CR>
nmap mf  :NERDTreeToggle<CR>
nmap ff  :Ack<Space>
inoremap jk <Esc>

" Commentary
nmap <leader>c <Plug>Commentary
xmap <leader>c <Plug>Commentary
omap <leader>c <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine

""" Clipboard
"
vnoremap <C-S-X> "+x

vnoremap <C-S-c> "+y

inoremap <C-S-v> <ESC>"+pa


""" CTRL-P
nmap <F6> :ClearAllCtrlPCaches<CR>

" set keymap=bulgarian-phonetic
imap <C-c> <CR><Esc>O
"set tabs
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set t_Co=256
syntax on

colorscheme zenburn

" GUI configuration
if has("gui_running")
    let g:seoul256_background = 237
    colorscheme seoul256
    set guioptions=*
    set guifont=DejaVu\ Sans\ Mono\ 16
endif

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
""map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_show_diagnostics_ui = 0

" NERDTree
"
"" if !empty($CLROOT)
"" endif
let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" JavaScript congifugration

"""""""""""""
"  AUTOCMD  "
"""""""""""""
if isdirectory($HOME . "/workspace/psp/gpii-app")
    autocmd VimEnter * cd $HOME/workspace/psp/gpii-app
endif
" autocmd BufWrite * lw 1 " show messages (errors or warnings)


" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview
