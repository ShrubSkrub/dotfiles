" GVIM Specific Settings
" Set colorscheme
colorscheme gotham
" Remove scrollbar and toolbar
set guioptions-=r
set guioptions-=T
" I think this was to set text buffer to windows clipboard?
set clipboard=unnamed
" Set gvim font of choice
if has("gui_running")
  set guifont=Share_Tech_Mono:h12
endif


" Non GVIM Specific Settings
set nocompatible
" type jk quickly for Escape
imap jk <Esc>
" Visual up and down. This makes multi (visual) lines easier to navigate
nnoremap j gj
nnoremap k gk
" quick :w
nnoremap ;; :w<CR>
" directory
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
map <F2> :Lexplore <Enter>
" Visual autocomplete
set wildmenu
" Highlight the current line of the cursor
set cursorline
hi CursorLine cterm=reverse
set guicursor+=a:blinkon0
" Show last command on the bottom
set showcmd
" Show line numbers
set number
" Highlight syntax
syntax on
" Vertical line at 80 characters
set colorcolumn=80
" Custom word processing mode
func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu
" Type :WP to enter Word Processing Mode
com! WP call WordProcessorMode()
