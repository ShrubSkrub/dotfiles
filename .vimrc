"--- VUNDLE ---------------------------"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"--- START PLUGINS ----------"
"""" Core \/
Plugin 'raimondi/delimitmate'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'rhysd/vim-clang-format'

"""" Statusline! \/
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"""" Will remove if lag \/
" Change surrounding chars
Plugin 'tpope/vim-surround'
" Easy motion
Plugin 'easymotion/vim-easymotion'

"""" Testing \/
" Autocomplete
Plugin 'exvim/ex-autocomplpop'
Plugin 'ervandew/supertab'
" Parenthesis Colors
Plugin 'luochen1990/rainbow'
" Writng Plugin
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

"--- END PLUGINS ------------"
call vundle#end()
filetype plugin indent on
" non-Plugin stuff after this line
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"------- REMAPPINGS -------------------"

" type jk quickly for Escape
imap jk <Esc>
" Quick :w
nnoremap ;; :w<CR>
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
" Show 80 chars with \l
fun! ToggleCC()
    if &cc == ''
        set cc=80
    else
        set cc=
    endif
endfun
nmap <Leader>l :call ToggleCC()<CR>
" Quick column show
nmap <Leader>L :set cursorcolumn!<CR>
" For syntastic
nmap <Leader>n :lprev<Enter>
nmap <Leader>N :lnext<Enter>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"------- PLUGIN SETTINGS --------------"

"""" Statusline Settings
set laststatus=2
set noshowmode
let g:airline_theme='badcat'

"""" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3

"""" Commentary.vim Settings
" set commenting /* */ to //
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

"""" Clang Format Settings
nmap <Leader>f :ClangFormat<Enter>

"""" Easy Motion Keybindings
map <Space><Space> <Plug>(easymotion-prefix)
" <leader>f{char} to move to {char}
map  <Space><Space>f <Plug>(easymotion-bd-f)
nmap <Space><Space>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Space><Space>s <Plug>(easymotion-overwin-f2)
" Move to line
map <Space><Space>L <Plug>(easymotion-bd-jk)
nmap <Space><Space>L <Plug>(easymotion-overwin-line)
" Move to word
" map  <Space><Space>w <Plug>(easymotion-bd-w)
" nmap <Space><Space>w <Plug>(easymotion-overwin-w)
map  <Space>w <Plug>(easymotion-bd-w)
nmap <Space>w <Plug>(easymotion-overwin-w)

"""" Supertab/ex-autocomplete
let g:SuperTabDefaultCompletionType = '<c-n>'

"""" Rainbow
let g:rainbow_active = 1
nmap <Leader>R :RainbowToggle<CR>

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"------- REGULAR .VIMRC STUFF ---------"
"--- CORE -------------------"
" Visual autocomplete
set wildmenu
" Show last command on the bottom
set showcmd
" Show line numbers
set number
set relativenumber
" Highlight syntax
syntax on
" Enable mouse support
set mouse=a
" Clipboard!
set clipboard=unnamedplus
" Search instant go
set is
" Better search case-handling
set ignorecase
set smartcase
" Tab = 4 spaces | set expandtab to get spaces
set tabstop=4
set shiftwidth=4
set expandtab
" Faster drawing
set ttyfast

" persistant undo
if has('persistent_undo')      "check if your vim version supports it
set undofile                 "turn on the feature
set undolevels=5000          "save lots of history
set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

"--- VISUAL/HIGHLIGHT ------"
" Show whitespace characters
set list
set listchars=tab:>-,trail:¬,extends:»,precedes:«,nbsp:§

" Highlighting
set t_Co=256
set cursorline
hi CursorLine cterm=reverse
hi CursorLineNr cterm=reverse
hi CursorColumn cterm=reverse

" Cursor stuff
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;DarkOrange2\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;firebrick2\x7"
  silent !echo -ne "\033]12;firebrick2\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

"--- FUNCTIONS -------------"
" Directory/File Browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" F2 to open directory tree
map <F2> :Lexplore <Enter>
nmap <Leader>b :Lexplore <Enter>

" Word Processor Mode!
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

" Compile c++
autocmd filetype cpp nnoremap <Leader>c :w <CR>:!g++ % -o %:r && ./%:r<CR>
" Run c++
autocmd filetype cpp nnoremap <Leader>C :!./%:r<CR>
" Run python
autocmd filetype python nnoremap <Leader>c :w<CR>:!python3 %<CR>
