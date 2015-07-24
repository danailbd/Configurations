set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

filetype plugin indent on
Plugin 'gmarik/Vundle.vim'
"Plugin 'reedes/vim-thematic'
Plugin 'bling/vim-airline'
Plugin 'sickill/vim-monokai'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

filetype plugin indent on

" User defined config


let g:thematic#themes = {
			\ 'bubblegum'  : { 'typeface': 'Menlo',
			\                  'font-size': 18,
			\                  'transparency': 10,
			\                  'linespace': 2,
			\                },
			\ 'pencil_dark' :{ 'colorscheme': 'pencil',
			\                  'background': 'dark',
			\                  'airline-theme': 'badwolf',
			\                  'ruler': 1,
			\                  'laststatus': 0,
			\                  'typeface': 'Source Code Pro Light',
			\                  'font-size': 20,
			\                  'transparency': 10,
			\                  'linespace': 8,
			\                },
			\ 'pencil_lite' :{ 'colorscheme': 'pencil',
			\                  'background': 'light',
			\                  'airline-theme': 'light',
			\                  'laststatus': 0,
			\                  'ruler': 1,
			\                  'typeface': 'Source Code Pro',
			\                  'fullscreen': 1,
			\                  'transparency': 0,
			\                  'font-size': 20,
			\                  'linespace': 6,
			\                },
			\ }

let g:thematic#theme_name = 'pencil_dark'

colorscheme monokai
set laststatus=2

set spell
set mouse=a

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
