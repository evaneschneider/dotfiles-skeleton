set cursorline
set number
set confirm
set mouse=a

"tab stuff"
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2

"no backup files"
set nobackup
set nowritebackup
set noswapfile

syntax enable
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized

"turn off error bells"
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
