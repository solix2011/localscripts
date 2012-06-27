" /etc/vimrc (configuration file for vim only)
" author: Klaus Franken     <kfr@suse.de>
" author: Werner Fink       <werner@suse.de> 
" author: Florian La Roche  <florian@suse.de> 
" version: 00/01/20
" commented lines start with `"'

" enable syntax highlighting
syntax on

" automatically indent lines (default)
" set noautoindent

" select case-insenitiv search (not default)
" set ignorecase

set showcmd

"set ts=4
" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" changes special characters in search patterns (default)
" set magic

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

" get easier to use and more user friendly vim defaults
" CAUTION: This option breaks some vi compatibility. 
"          Switch it off if you prefer real vi compatibility
set nocompatible

" allow backspacing over everything in insert mode 
set backspace=indent,eol,start

" Complete longest common string, then each full match
" enable this for bash compatible behaviour
" set wildmode=longest,full

" Try to get the correct main terminal type
if &term =~ "xterm"
    let myterm = "xterm"
else
    let myterm =  &term
endif
let myterm = substitute(myterm, "cons[0-9][0-9].*$",  "linux", "")
let myterm = substitute(myterm, "vt1[0-9][0-9].*$",   "vt100", "")
let myterm = substitute(myterm, "vt2[0-9][0-9].*$",   "vt220", "")
let myterm = substitute(myterm, "\\([^-]*\\)[_-].*$", "\\1",   "")

" Here we define the keys of the NumLock in keyboard transmit mode of xterm
" which misses or hasn't activated Alt/NumLock Modifiers.  Often not defined
" within termcap/terminfo and we should map the character printed on the keys.
if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
    " keys in insert/command mode.
    map! <ESC>Oo  :
    map! <ESC>Oj  *
    map! <ESC>Om  -
    map! <ESC>Ok  +
    map! <ESC>Ol  ,
    map! <ESC>OM  
    map! <ESC>Ow  7
    map! <ESC>Ox  8
    map! <ESC>Oy  9
    map! <ESC>Ot  4
    map! <ESC>Ou  5
    map! <ESC>Ov  6
    map! <ESC>Oq  1
    map! <ESC>Or  2
    map! <ESC>Os  3
    map! <ESC>Op  0
    map! <ESC>On  .
    " keys in normal mode
    map <ESC>Oo  :
    map <ESC>Oj  *
    map <ESC>Om  -
    map <ESC>Ok  +
    map <ESC>Ol  ,
    map <ESC>OM  
    map <ESC>Ow  7
    map <ESC>Ox  8
    map <ESC>Oy  9
    map <ESC>Ot  4
    map <ESC>Ou  5
    map <ESC>Ov  6
    map <ESC>Oq  1
    map <ESC>Or  2
    map <ESC>Os  3
    map <ESC>Op  0
    map <ESC>On  .
endif

" xterm but without activated keyboard transmit mode
" and therefore not defined in termcap/terminfo.
if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
    " keys in insert/command mode.
    map! <Esc>[H  <Home>
    map! <Esc>[F  <End>
    " Home/End: older xterms do not fit termcap/terminfo.
    map! <Esc>[1~ <Home>
    map! <Esc>[4~ <End>
    " Up/Down/Right/Left
    map! <Esc>[A  <Up>
    map! <Esc>[B  <Down>
    map! <Esc>[C  <Right>
    map! <Esc>[D  <Left>
    " KP_5 (NumLock off)
    map! <Esc>[E  <Insert>
    " PageUp/PageDown
    map <ESC>[5~ <PageUp>
    map <ESC>[6~ <PageDown>
    map <ESC>[5;2~ <PageUp>
    map <ESC>[6;2~ <PageDown>
    map <ESC>[5;5~ <PageUp>
    map <ESC>[6;5~ <PageDown>
    " keys in normal mode
    map <ESC>[H  0
    map <ESC>[F  $
    " Home/End: older xterms do not fit termcap/terminfo.
    map <ESC>[1~ 0
    map <ESC>[4~ $
    " Up/Down/Right/Left
    map <ESC>[A  k
    map <ESC>[B  j
    map <ESC>[C  l
    map <ESC>[D  h
    " KP_5 (NumLock off)
    map <ESC>[E  i
    " PageUp/PageDown
    map <ESC>[5~ 
    map <ESC>[6~ 
    map <ESC>[5;2~ 
    map <ESC>[6;2~ 
    map <ESC>[5;5~ 
    map <ESC>[6;5~ 
endif

" xterm/kvt but with activated keyboard transmit mode.
" Sometimes not or wrong defined within termcap/terminfo.
if myterm == "xterm" || myterm == "kvt" || myterm == "gnome"
    " keys in insert/command mode.
    map! <Esc>OH <Home>
    map! <Esc>OF <End>
    map! <ESC>O2H <Home>
    map! <ESC>O2F <End>
    map! <ESC>O5H <Home>
    map! <ESC>O5F <End>
    " Cursor keys which works mostly
    " map! <Esc>OA <Up>
    " map! <Esc>OB <Down>
    " map! <Esc>OC <Right>
    " map! <Esc>OD <Left>
    map! <Esc>[2;2~ <Insert>
    map! <Esc>[3;2~ <Delete>
    map! <Esc>[2;5~ <Insert>
    map! <Esc>[3;5~ <Delete>
    map! <Esc>O2A <PageUp>
    map! <Esc>O2B <PageDown>
    map! <Esc>O2C <S-Right>
    map! <Esc>O2D <S-Left>
    map! <Esc>O5A <PageUp>
    map! <Esc>O5B <PageDown>
    map! <Esc>O5C <S-Right>
    map! <Esc>O5D <S-Left>
    " KP_5 (NumLock off)
    map! <Esc>OE <Insert>
    " keys in normal mode
    map <ESC>OH  0
    map <ESC>OF  $
    map <ESC>O2H  0
    map <ESC>O2F  $
    map <ESC>O5H  0
    map <ESC>O5F  $
    " Cursor keys which works mostly
    " map <ESC>OA  k
    " map <ESC>OB  j
    " map <ESC>OD  h
    " map <ESC>OC  l
    map <Esc>[2;2~ i
    map <Esc>[3;2~ x
    map <Esc>[2;5~ i
    map <Esc>[3;5~ x
    map <ESC>O2A  ^B
    map <ESC>O2B  ^F
    map <ESC>O2D  b
    map <ESC>O2C  w
    map <ESC>O5A  ^B
    map <ESC>O5B  ^F
    map <ESC>O5D  b
    map <ESC>O5C  w
    " KP_5 (NumLock off)
    map <ESC>OE  i
endif

if myterm == "linux"
    " keys in insert/command mode.
    map! <Esc>[G  <Insert>
    " KP_5 (NumLock off)
    " keys in normal mode
    " KP_5 (NumLock off)
    map <ESC>[G  i
endif

" This escape sequence is the well known ANSI sequence for
" Remove Character Under The Cursor (RCUTC[tm])
map! <Esc>[3~ <Delete>
map  <ESC>[3~    x

" Only do this part when compiled with support for autocommands. 
if has("autocmd") 
  " When editing a file, always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside an event handler 
  " (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 
 
endif " has("autocmd")

" Changed default required by SuSE security team--be aware if enabling this
" that it potentially can open for malicious users to do harmful things.
set modelines=0

" get easier to use and more user friendly vim defaults
" /etc/vimrc ends here
"set sw=4

filetype plugin on

set cinwords=if,else,while,do,for,switch,case	" Which keywords should indent
set cindent
"==============================================================================
" Function
"==============================================================================

function! PublicCopy()
        if g:xcopy == "priv"
                "copy the current visual selection to ~/.vbuf
                vmap <C-c> :w! ~/.vbuf<CR>
                "copy the current line to the buffer file if no visual selection
                nmap <C-c> :.w! ~/.vbuf<CR>
                "paste the contents of the buffer file
                nmap <C-v> :r ~/.vbuf<CR>
                vmap <C-v> :r ~/.vbuf<CR>
                let g:xcopy = "pub"
        else
                vnoremap <C-c> y<Esc>i
                imap <C-c> <Esc>yi
                imap <C-v> <Esc>p
                nmap <C-c> <Esc>yy
                nmap <C-v> p
                let g:xcopy = "priv"
        endif
        call SetStatus()
endfunction

function! ToggleHLSearch()
        if &hls
                set nohls
        else
                set hls
        endif
endfunction

function! VimMode()
        if g:xcode == "ncode"
                set cindent
                set autoindent
                set smartindent
                let g:xcode = "ccode"
        else   
                set nocindent
                set noautoindent
                set nosmartindent
        	call SetStatus()
                let g:xcode = "ncode"
        endif
        call SetStatus()
endfunction

let g:xcopenmode=0
"function! COpenF4(par)
function! COpenF4()
	let x = g:xcopenmode
	if (x == 0)
		let g:xcopenmode = 1
		exec "copen"
	else
		let g:xcopenmode = 0		
		exec "cclose"
	endif
endfunction

let g:v_tlist=0
function! FT_Tlist()
	if (g:v_tlist == 0)
		let g:v_tlist = 1
		exec "TlistToggle"
		exec "TlistOpen"
	else
		exec "TlistToggle"
		let g:v_tlist = 0
	endif
endfunction
"==============================================================================
" Re-map key
"==============================================================================
nmap <silent> <C-A> <Esc>:call VimMode()<CR>
vmap <silent> <C-A> <Esc>:call VimMode()<CR>

nmap <silent> <C-W> <Esc>:call ToggleHLSearch()<CR>

nmap <silent> <C-X> <Esc>:call PublicCopy()<CR>
vmap <silent> <C-X> <Esc>:call PublicCopy<CR>


nnoremap <silent> <F3> :Grep<CR>
"nnoremap <silent> <F4> :copen<CR>
nnoremap <silent> <F4> <Esc>:call COpenF4()<CR>
"nmap <F2> :grep <C-R><C-W> *<CR>
nmap <F2> :q!<CR>

"taglist	
"nnoremap <silent> <F5> :TlistToggle<CR>
nnoremap <silent> <F5> <Esc>:call FT_Tlist()<CR>
"nnoremap <silent> <F6> :TlistOpen<CR>

nnoremap <silent> <F6> :NERDTreeToggle<CR>
"nnoremap <silent> <F8> :NERDTreeFind<CR>

nnoremap <silent> <F7> :tabprevious<CR>
nnoremap <silent> <F8> :tabnext<CR>

nmap 1 :tabprevious<CR>
nmap 2 :tabnext<CR>
"==============================================================================
" Status
"==============================================================================
function! SetStatus()
        if g:xcopy == "pub"
                if g:xcode == "ncode"
                        set statusline=%<\%n:%F\ %m%r%y%=%-35.([vbuf][_N_][%b]\ [%{&ff}]\ [%L]\ [%l,%v]\ [%p%%]%)
                else
                        set statusline=%<\%n:%F\ %m%r%y%=%-35.([vbuf][_C_][%b]\ [%{&ff}]\ [%L]\ [%l,%v]\ [%p%%]%)
                endif
        else
                if g:xcode == "ncode"
                        set statusline=%<\%n:%F\ %m%r%y%=%-35.([nvbuf][_N_][%b]\ [%{&ff}]\ [%L]\ [%l,%v]\ [%p%%]%)
                else
                        set statusline=%<\%n:%F\ %m%r%y%=%-35.([nvbuf][_C_][%b]\ [%{&ff}]\ [%L]\ [%l,%v]\ [%p%%]%)
                endif
        endif
endfunction

"==============================================================================
"Default setting
"==============================================================================
" always show the status line
set laststatus=2

set showmode
set ruler
set wildmenu
set wildcharm=<C-Z>
	
let g:xcopy="priv"
let g:xcode = "ccode"

call PublicCopy()
call VimMode()
call SetStatus()
"set statusline=\ (%{bufnr('%')})%f%m%r%h\ %w\ #%{expand('#:t')}\ (%{bufnr('#')})%=CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%l,%v][CODE:%b]
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v][F8:MODE]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

