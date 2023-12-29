" -----------------------------------------------------------------------------
"
"   QBZ Vim beállítások
"
"       [ Windows ]
"
" frissítve: 2023. 11. 30.
"
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" ALAP BEÁLLÍTÁSOK

filetype on
filetype indent on
filetype plugin on
syntax on
set encoding=utf-8
"set spell
set spelllang=hu

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
set linebreak
set nocompatible
set autochdir

set termguicolors



" -----------------------------------------------------------------------------
" SAJÁT BILLENTYŰKOMBINÁCIÓK

" sorok mozgatása
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
"
" NERDTree indítása
nnoremap <C-S-n> :NERDTree<CR>
"
" nyílbillentyűk működése
nnoremap <Up> gk
nnoremap <Down> gj
"
" váltás a bufferek között
nnoremap <F9> :bp<CR>
nnoremap <F10> :bn<CR>
"
" buffer bezárása
nnoremap <F12> :bd<CR>



" -----------------------------------------------------------------------------
" STÁTUSZSOR
"
set laststatus=2
set statusline=
"
" aktuális mód kijelzése:
set statusline+=%{mode()}\              
set statusline+=│
"
" buffer sorszáma:
set statusline+=\ B%n\                  
set statusline+=│
"
" aktuális fájl: [elérési út], [help], [módosítva], [csak olvasható]
set statusline+=\ %<%f\ %h%m%r          
set statusline+=│
"
" Képernyő jobb oldala:
set statusline+=%=                      
"
" 14 egység behúzassa: [aktuális sor] / [összes sor] | [oszlop]
set statusline+=%-14.(%2l/%L\ │\ %c%V%) 
"
" Kurzor helye a dokumentumban (a teljes dokumentum százalékában):
set statusline+=\ (%3P)                 



" -----------------------------------------------------------------------------
" PLUG
"
call plug#begin()
    "
    " programozás, programnyelvek
    "
    Plug 'ycm-core/YouCompleteMe'           " kódkiegészítő és analizáló motor
    Plug 'sheerun/vim-polyglot'             " language pack
    Plug 'octol/vim-cpp-enhanced-highlight' " cpp language pack
    Plug 'bfrg/vim-cpp-modern'              " cpp language pack
    Plug 'pprovost/vim-ps1'                 " PowerShell script language pack
    "
    " szerkesztő eszközök
    "
    Plug 'scrooloose/nerdtree'              " NERDTree filrendszer tallózó
    Plug 'tpope/vim-surround'               " zárójelek és tagek szerkesztése
    Plug 'jacquesbh/vim-showmarks'          " markerek mutatása az oldalsávon
    Plug 'tpope/vim-fugitive'               " GitHub kiegészítő
    "
    " kinézet
    "
    Plug 'vim-airline/vim-airline'          " státuszsor
    Plug 'vim-airline/vim-airline-themes'   " státuszsor színsémák
    Plug 'kien/rainbow_parentheses.vim'     " színes zárójelek
    Plug 'morhetz/gruvbox'                  " színséma
    Plug 'altercation/vim-colors-solarized' " színséma
    Plug 'NLKNguyen/papercolor-theme'       " színséma
    Plug 'hzchirs/vim-material'             " színséma
    Plug 'mg979/vim-studio-dark'            " színséma
call plug#end()



" -----------------------------------------------------------------------------
" FELÜLETFÜGGŐ BEÁLLÍTÁSOK
" (ennek a Plug hívás után kell lennie, a színséma betöltése miatt)
"
if has("gui")
    set guifont=Hack:h9:cEASTEUROPE:qDRAFT
    colorscheme gruvbox
    set background=light
    "
    " nyilas megjelenés az airline státuszsoron:
    let g:airline_powerline_fonts = 1       
"
    " kezdőképernyő méretének beállítása:
    " set lines=35 columns=140
else
    set t_Co=256
    colorscheme gruvbox
    "
    " sima ASCII karakterek az airline státuszbáron:
    let g:airline_symbols_ascii = 1         
    "
    " a Solarized színsémához szükséges beállítás:
    let g:solarized_termcolors=256          
endif
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:gruvbox_contrast_light='hard'



" -----------------------------------------------------------------------------
" FÁJLTÍPUSTÓL FÜGGŐ BEÁLLÍTÁSOK
" C++
"
autocmd FileType cpp set autowrite
"
" fordítás a build.bat scripttel:
autocmd FileType cpp set makeprg=d:\repos\csvvalidator\src\build.bat
"
" az aktuális fájl fordítása gcc-vel egy ugyanolyan nevű exe-re
" (egyfájlos projekt esetén):
" autocmd FileType cpp set makeprg=g++\ -std=c++20\ -o\ %:p:r\ %\ -Wall      
"
" Build (and run) funkció az <F5> billentyűre:
autocmd FileType cpp noremap <F5> :make<CR> :copen<CR>
autocmd FileType cpp inoremap <F5> <ESC>:make<CR> :copen<CR>



" -----------------------------------------------------------------------------
" YOUCCOMPLETEME
" 
let g:ycm_enable_semantic_highlighting=1
" let g:ycm_auto_hover=""
let g:ycm_enable_inlay_hints=1



" -----------------------------------------------------------------------------
" A SHOWMARKS PLUGIN INDÍTÁSA
"
autocmd VimEnter * DoShowMarks!



" -----------------------------------------------------------------------------
" NERDTree AUTOMATIKUS INDÍTÁSA
"
" autocmd VimEnter * NERDTree



" -----------------------------------------------------------------------------
" A VIM-CPP-ENCHANTED HIGHLIGHT ÉS VIM-CPP-MODERN SYNTAX FÁJLOK BEÁLLÍTÁSAI
"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
"
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
"
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
"
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1



" -----------------------------------------------------------------------------
" AIRLINE BEÁLLÍTÁSOK
" 
let g:airline#extensions#tabline#enabled = 1    " lapok és bufferek a képernyő tetején
let g:airline_inactive_alt_sep = 1              " másféle státussor az inaktív ablakokban
" let g:airline_mode_map = {}                     " minimál, egy betűs mód kijelzés



" Indítási hibaüzenetek elmaszkolása
" let c_no_curly_error=1



" -----------------------------------------------------------------------------
" FRISSÍTÉSI ELŐZMÉNYEK
" -----------------------------------------------------------------------------
"
" 2021.10.31.: Kite módosítások:
"              - set statusline első verziója
"              - Kite támogatott nyelvek: *
"              - Status Line hozzáadása
" 2021.10.16.: 'set ignorecase' hozzáadva
" 2021.03.05.: ha GUI fut, akkor más a colorscheme
" 2022.07.06.: Automatikus behúzás és NERDTree
"              - Az automatikus behúzás beállításai pontosítva
"              - A NERDTree automatikusan indul a VIM indulásakor
" 2022.07.20.: státuszsor és új színséma
"              - Az Airline státuszsor telepítése
"              - A Papercolor színséma telepítése
"              - Az aktuális sor kiemelése
" 2022.07.30.: Sormozgató billentyűparancsok
" 2022.08.09.: Fájltípusfüggő beállítások:
"              - C++: autowrite, makeprg, <F5>
" 2022.09.11.: NERDTree indítása billentyűparanccsal
" 2022.09.23.: A 'set autochdir' hozzáadása
" 2022.09.24.: gVim ablak indulási mérete (:set lines...)
" 2022.09.28.: Nyílbillentyűk működésének definiálása (gk, gj)
"              - linebreak bekapcsolása
" 2023.05.20.: Az <F5> billentyű insert módban is működjön.
"              Váltás a bufferek között az <F9> és <F10> billentyűkkel
" 2023.11.25.: Buffer bezárása az <F12> billentyűvel, fájl tördelése és
"              kommentek javítása
" 2023.11.30.: PowerShell script language pack, 'pprovost/vim-ps1' hozzáadása
"
" -----------------------------------------------------------------------------
