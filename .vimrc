set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Goyo Vim | :Goyo for writing | Don't really need, turn on when needed
Plugin 'junegunn/goyo.vim'

" Gcc Commentor
Plugin 'tpope/vim-commentary'

" Syntastic for Code Checking
Plugin 'vim-syntastic/syntastic'

" Gitgutter for version control
Plugin 'airblade/vim-gitgutter'

" Autoclose " ( { | too laggy
" Plugin 'Townk/vim-autoclose'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3

" commentary.vim settings
" set commenting /* */ to //
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" Actual regularish .vimrc stuff
" type jk quickly for Escape
imap jk <Esc>
" Visual up and down. This makes multi (visual) lines easier to navigate
nnoremap j gj
nnoremap k gk
" Visual autocomplete
set wildmenu
" Show last command on the bottom
set showcmd
" Show line numbers
set number
" Highlight syntax
syntax on
" Enable mouse support
set mouse=a

" Tab = 4 spaces | set expandtab to get spaces
set tabstop=4
set shiftwidth=4
set expandtab

set list
set listchars=tab:>-,trail:$,extends:>,precedes:<,nbsp:%

" Quick :w
nnoremap ;; :w<CR>
" Search instant go
set is
" Highlight stuff
set t_Co=256
set cursorline
hi CursorLine cterm=reverse 
hi CursorLineNr cterm=reverse

" Spaces higlight
" set listchars=space:.
" highlight WhiteSpaceBol ctermfg=blue
" highlight WhiteSpaceMol ctermfg=white
" match WhiteSpaceMol / /
" match WhiteSpaceBol /^ \+/

" Cursor stuff
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

" Directory/File Browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
" F2 to open directory tree
map <F2> :Lexplore <Enter>
