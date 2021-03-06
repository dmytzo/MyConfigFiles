set nocompatible
set ruler
set showcmd
set incsearch
set backspace=indent,eol,start " make backspace a more flexible

let g:pymode_python = 'python3'
let g:jedi#force_py_version=3

call pathogen#infect()

set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set previewheight=2

set clipboard+=unnamedplus " share windows clipboard
set fileformats=unix,dos,mac " support all three, in this order

set mouse=n

if &t_Co > 2 || has("gui_running")
  syntax on
  set background=dark
  let g:solarized_diffmode="high"
  set hlsearch
endif

filetype plugin indent on
set ofu=syntaxcomplete#Complete
set completeopt+=longest

nnoremap * *N

function! <SID>SetMainDefaults()
  set softtabstop=4
  set tabstop=4
  set shiftwidth=4
  set expandtab
endfunction
      
call <SID>SetMainDefaults() 

call vimprj#init()

function! g:vimprj#dHooks['SetDefaultOptions']['main_options'](dParams)
  call <SID>SetMainDefaults()
endfunction

let g:plantuml_executable_script='java -jar ~/bin/plantuml.jar'

let NERDTreeIgnore = ['\.pyc$', 'egg', '__pycache__']

let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 1

autocmd FileType qf wincmd J

cmap Q q
nmap <silent> <A-Left> :BufSurfBack<CR>
nmap <silent> <A-Right> :BufSurfForward<CR>
nmap <silent> <C-p> :NERDTreeToggle<CR>
nmap <silent> <F8> :TagbarToggle<CR>
nmap <silent> <C-f>o :FufFile<CR>
nmap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vmap <Space> zf

let g:syntastic_python_checkers=['flake8', 'python3']

let g:rustfmt_autosave = 1
let g:syntastic_rust_checkers = ['cargo']
let g:lsc_server_commands = {'rust': 'rls'}
" Use all the defaults (recommended):
let g:lsc_auto_map = {'defaults': v:true, 'Completion': 'omnifunc'}
autocmd CompleteDone * silent! pclose
