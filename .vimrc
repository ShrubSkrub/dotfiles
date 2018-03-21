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
" Plugin 'junegunn/goyo.vim'

" Gcc Commentor
Plugin 'tpope/vim-commentary'

" Syntastic for Code Checking
Plugin 'vim-syntastic/syntastic'

" Gitgutter for version control
Plugin 'airblade/vim-gitgutter'

" Format c++, java, js with :ClangFormat
Plugin 'rhysd/vim-clang-format'

" Autoclose " ( { | too laggy
" Plugin 'Townk/vim-autoclose'

" An autoclose that works? | Lol nope flashes screen a lot
" Plugin 'jiangmiao/auto-pairs'

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

nmap <Leader>n :lprev<Enter>
nmap <Leader>N :lnext<Enter>

" commentary.vim settings
" set commenting /* */ to //
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" clang format settings
nmap <Leader>f :ClangFormat<Enter>

" Actual regularish .vimrc stuff
" type jk quickly for Escape
imap jk <Esc>

" Visual up and down. This makes multi (visual) lines easier to navigate
" nnoremap j gj
" nnoremap k gk

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

" Clipboard!
set clipboard=unnamedplus

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
" colorscheme fresh

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
nmap <Leader>b :Lexplore <Enter>

" Compile c++
autocmd filetype cpp nnoremap <Leader>c :w <CR>:!g++ % -o %:r && ./%:r<CR>

" Run c++
autocmd filetype cpp nnoremap <Leader>C :!./%:r<CR>

" Run python
autocmd filetype python nnoremap <Leader>c :w<CR>:!python3 %<CR>

" Show 80 chars with \l
fun! ToggleCC()
    if &cc == ''
        set cc=80
    else
        set cc=
    endif
endfun
nmap <Leader>l :call ToggleCC()<CR>

func! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal spell spelllang=en_us
  set complete+=s
  setlocal wrap
  setlocal linebreak
    hi CursorLine cterm=NONE
    hi CursorLineNr cterm=reverse
endfu
com! WP call WordProcessorMode()

" Map leader to space
map <Space> <Leader>

" leader write
nmap <Leader>; :w<CR>
nmap <Leader>z ZZ
nmap <Leader>q ZQ

" Remove all trailing whitespace
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Toggle character wrap quickly
nmap <Leader>W :set wrap!<CR>
