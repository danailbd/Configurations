set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

filetype plugin indent on
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar' 
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

""""""""""
"  Some  "
""""""""""
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'scrooloose/nerdcommenter'

"Plugin 'Shougo/unite.vim'
"Plugin 'reedes/vim-thematic'
"Plugin 'adimit/prolog.vim'
" Plugin 'ervandew/supertab'

Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-bufferline'

Plugin 'godlygeek/tabular'

" snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Plugin 'garbas/vim-snipmate'

" THEMES "
Plugin 'flazz/vim-colorschemes'
Plugin 'sickill/vim-monokai'
" Plugin 'mikefarmer/pastelsondark-vim'

"Syntax"
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
" Plugin 'davidhalter/jedi-vim' " python only
" Plugin 'scrooloose/syntastic'

" Node
Plugin 'moll/vim-node'

" JS
Plugin 'Shutnik/jshint2.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'othree/html5.vim'

" C++ "

" Python "
" Plugin 'andviro/flake8-vim'
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'

" WEB "
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'



call vundle#end()

" User defined config
 "


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

""" --- Ide options --- """
"set background=dark

colorscheme monokai
colorscheme zenburn
"
" if has('gui_running')
" 	else
" 	  colorscheme monokai
" endif
" "
set laststatus=2

set mouse=a
syntax on
set nospell


filetype plugin indent on
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

set cursorline
" set cursorcolumn
" " Set automatic indentation
" set autoindent
" set smartindent
" Show matching [] and {}
set showmatch

set nowrap

" Spell check on
set spell spelllang=en_us
setlocal spell spelllang=en_us

" Toggle spelling with the F7 key
nn :setlocal spell! spelllang=en_us
imap :setlocal spell! spelllang=en_us
"
" Spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

 " where it should get the dictionary files
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

" Set title of window to file name
set title
"
 " Toggle paste
set pastetoggle=

" " Set shell to bash
 set shell=/bin/zsh

" Search while typing
 set incsearch

" With both ignorecase and smartcase turned on, a search is case-insensitive
" if you enter the search string in ALL lower case
set ignorecase
set smartcase


"""""""""""""""""""""
"  Lines numbering  "
"""""""""""""""""""""
set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

:au FocusLost * :set number
:au FocusGained * :set relativenumber

" --- " More natural split
set splitbelow
set splitright

setlocal spell spelllang=en_us,bg

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

augroup project
   	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END



set makeprg=make\ -C\ ../build\ -j9

nnoremap <F4> :make!<cr>

set exrc
set secure

" set .pl files to be prolog syntax
autocmd FileType pl set syntax=prolog
" auto save on lost focus

autocmd BufLeave,FocusLost * silent! wall

" Enable the list of buffers
 let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
 let g:airline#extensions#tabline#fnamemod = ':t'


let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  MAPPINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" JS
nnoremap <leader>jt :! jsctags -o tags server test admin<CR>

""
imap jk <Esc>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

inoremap <F7> :setlocal spelllang=en_us,bg spell! spell?<CR>
nnoremap <F7> :setlocal spelllang=en_us,bg spell! spell?<CR>

" Splitting
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>


nnoremap <F6> :NERDTreeToggle<CR>

" Enable folding with the spacebar
nnoremap <space> za

nnoremap <F8> :TagbarToggle<CR>

"""""""""""""
"  Tabular  "
"""""""""""""
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
let mapleader=','
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>aa :Tabularize /=<CR>:Tabularize /:<CR>
  vmap <Leader>aa :Tabularize /=<CR>:Tabularize /:<CR>


"" Change word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"" rename js variable
nnoremap <Leader>r :YcmCompleter RefactorRename 


"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
"function! s:align()
"  let p = '^\s*|\s.*\s|\s*$'
"  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"    Tabularize/|/l1
"    normal! 0
"    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"  endif
"endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   PLUGINS SETTTINGS                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if has("autocmd")
	  au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_UNDERLINE/' ~/.config/xfce4/terminal/terminalrc"                                                                                          
	    au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"                                                                                          
		  au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"  
	  endif

" --- GUI options --- "
set guifont=DejaVu\ Sans\ Mono\ 16
set guioptions-=T

" Enable folding
set foldmethod=indent
set foldlevel=99

" SOME "
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let vim_markdown_preview_use_xdg_open=1

" PYTHON "
let g:PyFlakeOnWrite = 1
let g:PyFlakeForceVersion = 3
let g:PyFlakeCWindow = 0

 let g:NERDTreeIndicatorMapCustom = {
     \ "Modified"  : "✹",
     \ "Staged"    : "✚",
     \ "Untracked" : "✭",
     \ "Renamed"   : "➜",
     \ "Unmerged"  : "═",
     \ "Deleted"   : "✖",
     \ "Dirty"     : "✗",
     \ "Clean"     : "✔︎",
     \ "Unknown"   : "?"
     \}

"let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
"let g:javascript_conceal_this           = "@"
"let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" Python version to use
let g:UltiSnipsUsePythonVersion = 3


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"

let g:ultisnips_python_style="google"

let g:used_javascript_libs = 'underscore'

""""""""""""""
"  Syntatic  "
""""""""""""""
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
""
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0
""
""let g:syntastic_python_checkers = ['flake8', 'pylint']
""
""let g:syntastic_error_symbol = "✗"
""let g:syntastic_warning_symbol = "⚠"
""""""""""""""""
"  IndentLine  "
""""""""""""""""
" "GVim
 let g:indentLine_color_gui = '#A4E57E'
" " none X terminal
 let g:indentLine_color_tty_light = 7 " (default: 4)
 let g:indentLine_color_dark = 1 " (default: 2)
 let g:indentLine_char = '┊'
 let g:indentLine_enabled = 1
 let g:indentLine_color_term = 239
 let g:indentLine_leadingSpaceChar = '·'
 let g:indentLine_leadingSpaceEnabled = 0
 let g:indentLine_faster = 1

let python_highlight_all=1
syntax on

let g:ctrlp_custom_ignore='\v[\/](\.git|\.hg|\.svn|node_modules)$'

let g:SimpylFold_docstring_preview=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  AUTORUNS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""
"  load temple on filetype  "
"""""""""""""""""""""""""""""

au BufNewFile *.js 0r ~/.vim/js.skel | let IndentStyle = "js"


" Load local config
if (filereadable(".vimrc.local"))
    so .vimrc.local
endif
