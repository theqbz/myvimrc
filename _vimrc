" ------------------------
"
"   QBZ Vim beallitasok
"
" frissitve: 2022. 09. 24.
"
" ------------------------



" ----------------
" ALAP BEALLITASOK
syntax on
filetype on
set encoding=utf-8

set number
set relativenumber
set cmdheight=1
set showmode
set mousehide
set scrolloff=8
set colorcolumn=81

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab
set cindent
set shiftround

set ignorecase
set smartcase
set incsearch
set cursorline

set wrap
set nocompatible
set autochdir

set background=dark
"set termguicolors


" --------------------------
" SAJAT BILLENTYUKOMBINACIOK

" sorok mozgatása
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" NERDTree indítása
nnoremap <C-S-n> :NERDTree<CR>



" ----------
" STATUSZSOR
set laststatus=2
set statusline=
set statusline+=%{mode()}\              " aktualis mod kijelzese
set statusline+=│
set statusline+=\ B%n\                  " buffer sorszama
set statusline+=│
set statusline+=\ %<%f\ %h%m%r          " aktualis file: eleres, help, modositva, csak olvashato
set statusline+=│
"set statusline+=\ %{kite#statusline()}  " Kite allapot * * * hasznalaton kivül
set statusline+=%=                      " Kepernyo jobb oldala
set statusline+=%-14.(%2l/%L\ │\ %c%V%) " 14 egyseg behúzassa: aktualis sor / összes sor | oszlop
set statusline+=\ (%3P)                 " Kurzor helye a dokumentumban (szazalek)



" ---------------------
" PLUG plugin futtatasa
call plug#begin()
    Plug 'altercation/vim-colors-solarized'     " szinsema
    Plug 'morhetz/gruvbox'                      " szinsema
    Plug 'NLKNguyen/papercolor-theme'           " szinsema
    Plug 'lifepillar/vim-solarized8'            " szinsema
    Plug 'sheerun/vim-polyglot'                 " language pack
    Plug 'jacquesbh/vim-showmarks'              " plugin: markerek mutatasa
    Plug 'tpope/vim-surround'                   " plugin: hatarolo jelek es tagek editalasa
    Plug 'vim-airline/vim-airline'              " plugin: statuszsor
    Plug 'vim-airline/vim-airline-themes'       " plugin: statuszsor szinsemak
    Plug 'scrooloose/nerdtree'                  " plugin: könyvtar tallozo
    Plug 'tpope/vim-fugitive'                   " plugin: GitHub kiegeszito
call plug#end()



" ------------------------
" FELULETFUGGO BEALLITASOK
" (ennek a Plug hivas utan kell lennie, a szinsema betoltese miatt)
if has("gui")
    set guifont=Hack:h9:cEASTEUROPE:qDRAFT
    let g:airline_powerline_fonts = 1       " meno nyilacskas megjelenes az airline statuszbaron
    colorscheme papercolor
    set lines=35 columns=140
else
    set t_Co=256
    "colorscheme delek
    colorscheme papercolor
endif

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" ------------------------------
" FAJLTIPUSTOL FUGGO BEALLITASOK
" C++
autocmd FileType cpp set autowrite
autocmd FileType cpp set makeprg=g++\ -o\ %:p:r\ %\ -Wall
autocmd FileType cpp noremap <F5> :make<CR> :copen<CR>



" ---------------------------
" A SHOWMARKS PLUGIN INDÍTASA
autocmd VimEnter * DoShowMarks!



" -----------------------------
" NERDTree AUTOMATIKUS INDITASA
" autocmd VimEnter * NERDTree



" -------
" AIRLINE
" let g:airline#extensions#tabline#enabled = 1  " lapok es bufferek a kepernyo tetejen



" ----
" KITE
" let g:kite_supported_languages = ['*']



" let c_no_curly_error=1



" ---------------------
" FRISSITESI ELOZMENYEK
" ---------------------
"
"
" 2021.10.31.: Kite modositasok:
"              - set statusline elso verzioja
"              - Kite tamogatott nyelvek: *
"              - Status Line hozzaadasa
" 2021.10.16.: 'set ignorecase' hozaadva
" 2021.03.05.: ha GUI fut, akkor mas a colorscheme
" 2022.07.06.: Automatikus behuzas es NERDTree
"              - Az automatikus behuzas beallitasai pontositva
"              - A NERDTree automatikusan indul a VIM indulasakor
" 2022.07.20.: Statuszsor es új szinsema
"              - Az Airline statuszsor telepitese
"              - A Papercolor szinsema telepitese
"              - Az aktualis sor kijemelese
" 2022.07.30.: Sormozgató billentyűparancsok
" 2022.08.09.: Fajltipusfuggo beallitasok:
"              - C++: autowrite, makeprg, <F5>
" 2022.09.11.: NERDTree inditasa billentyuparanccsal
" 2022.09.23.: A 'set autochdir' hozzaadasa
" 2022.09.24.: gVim ablak indulasi merete (:set lines...)
