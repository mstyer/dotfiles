" Michael Styer _vimrc file
" date: 2008-08-28
" learning vim all over again

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Only for Mac OS
if has("mac")
  set noanti
end

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" no bell
set visualbell

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
"set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " For C files, set C indent options
  autocmd FileType c setlocal cino=>4,{2,n-2,^-2

  autocmd FileType cpp setlocal cino=>2,g1,p1
  autocmd Filetype cpp setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  augroup json_autocmd
    autocmd! 
    autocmd FileType json set autoindent 
    autocmd FileType json set formatoptions=tcq2l 
    autocmd FileType json set textwidth=78 shiftwidth=2 
    autocmd FileType json set softtabstop=2 tabstop=8 
    autocmd FileType json set expandtab 
    autocmd FileType json set foldmethod=syntax 
  augroup END

  au FileType crontab set nobackup nowritebackup

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" set color scheme
colorscheme darkblue

" set font
set guifont=Bitstream\ Vera\ Sans\ Mono:h12

" set guioptions
set guioptions-=m " turn off menu bar
set guioptions-=T " turn off toolbar

" set tabstops
set ts=2
set sts=2
set sw=2
set expandtab

" set printer options
set printoptions=paper:letter,duplex:long,number:y,syntax:n

" set programs for Latex-Suite
set grepprg=grep\ -nH\ $*
let g:Tex_ViewRule_pdf='acroread'
let g:Tex_ViewRule_dvi='evince'
let g:Tex_ViewRule_ps='evince'

" set filetype of tex files
let g:tex_flavor='latex'
let g:Tex_CompileRule_dvi = 'pdflatex --interaction=nonstopmode $*'

" set tag file options
set tags=./tags,tags
set tags+=~/tags/cpp
set tags+=~/tags/gl
set tags+=~/tags/boost
" build tags of your own project with CTRL+F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" OpenGL Shader Language highlighting
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

" Coffeescript
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" R-plugin maps
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Showmarks customizations
let marksCloseWhenSelected = 0
let showmarks_include = "abcdefghijklmnopqrstuvwxyz"

" Pathogen
call pathogen#infect()

" Allow w!! to write root-owned files via sudo
cmap w!! w !sudo tee % >/dev/null


