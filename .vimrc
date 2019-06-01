"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
"""""""""
  set autoindent                 " 'ai'     take indent for new line FROM previous line
  set autoread                   " 'ar'     autom. read file when changed outside of Vim
  set backspace=indent,eol,start " 'bs'     how backspace works at start of line
 "set belloff=all                " 'bo'     do not ring the bell for these reasons
  set cmdheight=1                " 'ch'     number of lines to use for the command-line
  set copyindent                 " 'ci'     make 'autoindent' use existing indent structure
  set encoding=utf-8             " 'enc'    encoding used internally
  set expandtab                  " 'et'     use spaces when <Tab> is inserted
  set fileformats=mac,unix,dos   " 'ffs'    automatically detected values for 'fileformat'
  set fillchars+=vert:\`         " 'fcs'    characters to use for displaying special items
  set gdefault                   " 'gd'     the ':substitute' flag 'g' is default on
  set history=1000               " 'hi'     number of command-lines that are remembered
  set hlsearch                   " 'hls'    highlight matches with last search pattern
  set ignorecase                 " 'ic'     ignore case in search patterns
  set incsearch                  " 'is'     highlight match while typing search pattern
  set lazyredraw                 " 'lz'     don't redraw while executing macros
  set matchtime=5                " 'mat'    tenths of a second to show matching paren
  set mouse=a                    "          enable the use of mouse clicks
  set mousefocus                 " 'mousef' keyboard focus follows the mouse
  set mousehide                  " 'mh'     hide mouse pointer while typing
  set nobackup                   " 'bk'	    DON'T keep backup file after overwriting a file
  set noswapfile                 " 'swf'    DON'T use a swapfile for buffers
  set nowrap                     "          long lines wrap and continue on the next line
  set nowritebackup              " 'wb'	    DON'T make a backup before overwriting a file
  set number                     " 'nu'	    print the line number in front of each line
  set numberwidth=2              " 'nuw'    number of columns used for the line number
  set relativenumber             " 'rnu'    show relative line number in front of each line
  set ruler                      " 'ru'     show cursor line and column in the status line
  set shellpipe=&>               " 'sp'     string to put output of ':make' in error file
  set shiftwidth=2               " 'sw'     number of spaces to use for (auto)indent step
  set showmatch                  " 'sm'     briefly jump to matching bracket if INSERT one
  set showmode                   " 'smd'    message on status line to show current mode
  set smartcase                  " 'scs'    no ignore case when pattern has uppercase
  set smartindent                " 'si'	    smart autoindenting for C programs
  set smarttab                   " 'sta'    use 'shiftwidth' when inserting <Tab>
  set softtabstop=2              " 'sts'    number of spaces that <Tab> uses while editing
  set splitbelow                 " 'sb'     new window FROM split is below the current one
  set splitright                 " 'spr'    new window is put right of the current one
  set tabstop=2                  " 'ts'     number of spaces that <Tab> in file uses
  set undolevels=1000            " 'ul'     maximum number of changes that can be undone
  set viminfo^=%                 " 'vi'	    use .viminfo file upon startup and exiting
  set visualbell                 " 'vb'     use visual bell instead of beeping
  set wrapscan                   " 'ws'     searches wrap around the end of the file
  set autowriteall	             " 'awa'     as 'autowrite', but works with more commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                 " be iMproved, required
filetype off                     " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugins
"""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/tpope-vim-abolish'
Plugin 'godlygeek/tabular'         " Easy code formatting to make code look crisp
Plugin 'vim-scripts/dbext.vim'     " Vim database integration
Plugin 'easymotion/vim-easymotion' " Motion movement around file
Plugin 'ctrlpvim/ctrlp.vim'        " File system searches (good for bigger projects to jump FROM file to file)
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/gv.vim'
"Plugin 'davidhalter/jedi-vim'      " Python code completion
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Leader
"""""""""""""""
let mapleader = ' '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Mappings
"""""""""
  nnoremap <leader>rcc :%s/\<\u\|\l\u/\=len(submatch(0)) == 1 ? tolower(submatch(0)) : submatch(0)[0].'_'.tolower(submatch(0)[1])/gc<cr>
"Saving and sourcing
  nnoremap <leader><leader>s :source ~/vim/vimsetup/.vimrc<cr>
  nnoremap <leader>s :w<cr>
" tabs
  nnoremap <leader>tn :tabnew<cr>
  nnoremap <leader>to :tabonly<cr>
  nnoremap <leader>tc :tabclose<cr>
  nnoremap <leader>tm :tabmove<space>
" open new tab with the current buffer's path
  nnoremap <leader>tt :tabedit <c-r>=expand("%:p:h")<cr>/
" buffers
  nnoremap <leader>b<leader> :bnext<cr>
  nnoremap <leader><leader>b :bprevious<cr>
  nnoremap <leader>bs :ls<cr>
" open new buffer with the current buffer's path
  nnoremap <leader>bb :e <c-r>=expand("%:p:h")<cr>/
  nnoremap <leader>bn :e <c-r>=expand("%:p:h")<cr>/
" close all the buffers
  nnoremap <leader>ba :%bd<cr>i
"-----------
" Tabularize 
"-----------
  vnoremap <leader>, :Tabularize /,<cr>
"-------------
" fugitive.vim
"-------------
  nnoremap <silent> <leader>gg :Gstatus<cr> :winc L<cr>
  nnoremap <silent> <leader>gd :Gdiff<cr>
  nnoremap <silent> <leader>gw :Gblame<cr>
  nnoremap <silent> <leader>gp :Git pull<cr>
  nnoremap <silent> <leader>gP :Git push<cr>
  nnoremap <silent> <leader>gr :Gread<cr>
  nnoremap <silent> <leader>gw :Gwrite<cr>
  nnoremap <silent> <leader>ge :Gedit<cr>
  nnoremap <silent> <leader>ga :Git add -p %<cr>
  nnoremap <silent> <leader>gh :help fugitive<cr>
  nnoremap <silent> <leader>gb :Git checkout<space>
  nnoremap <silent> <leader>gB :Git checkout -b<space>
"-------
" gv.vim
"-------
  nnoremap <silent> <leader>gl :GV<cr>
"-------
" splits
"-------
" database
  nnoremap <leader>dbq :DBExecSQLUnderCursor<cr>
  nnoremap <leader>db :DBPromptForBufferParameters<cr>
" opening/closing splits
  nnoremap <leader>ss :vnew<cr>
  nnoremap <leader>sT :vsp<cr>
  nnoremap <leader>sS :sp<cr>
  nnoremap <leader>sb :new<cr>
  nnoremap <leader>sq :q!<cr>
  nnoremap <leader>sc :close<cr>
" easy split sizing
  nnoremap <leader>sf :winc \|<cr>
  nnoremap <leader>se :winc =<cr>
  nnoremap <leader>so :winc o<cr>
  nnoremap <leader>st :winc T<cr>
  nnoremap <leader>sp :vertical resize +20<cr>
  nnoremap <leader>sm :vertical resize -20<cr>
" easy split movement
  nnoremap <leader>sJ :winc J<cr>
  nnoremap <leader>sK :winc K<cr>
  nnoremap <leader>sH :winc H<cr>
  nnoremap <leader>sL :winc L<cr>
" easy way to navigate between windows
  nnoremap <leader>sj :winc j<cr>
  nnoremap <leader>sk :winc k<cr>
  nnoremap <leader>sh :winc h<cr>
  nnoremap <leader>sl :winc l<cr>
  nnoremap <leader>sn :winc l<cr>:winc \|<cr>
  nnoremap <leader>sN :winc h<cr>:winc \|<cr>
"open ~/.vimrc in new tab
  nnoremap <leader>rc :tabedit ~/vim/vimsetup/.vimrc<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Functions
"""""""""""""""
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")
   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif
   if bufnr("%") == l:currentBufNum
     new
   endif
   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
" Enable syntax highlighting in result buffer
  function! DBextPostResult(db_type, buf_nr)
    if a:db_type == 'PGSQL'
      :SQLSetType postgresql
    endif
  endfunction
"--------------------
" syntax highlighting
"--------------------
  syntax enable
  set background=dark
  try
    colorscheme gruvbox
  catch
  endtry
" set root directory
  let g:repoRoot = '~/vim/vimsetup/'
" source private configuration
  for file in split(glob(g:repoRoot . 'omit/*.vim'), '\n')
  	    exe 'source' file
  endfor
