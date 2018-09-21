set number
syntax on 
set showcmd
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
set vb
set linebreak " переносить целые слова
set hidden " не выгружать буфер когда переключаешься на другой
set mouse=a " включает поддержку мыши при работе в терминале (без GUI)
set mousehide " скрывать мышь в режиме ввода текста
set showcmd " показывать незавершенные команды в статусбаре (автодополнение ввода)
set mps+=<:> " показывать совпадающие скобки для HTML-тегов
set showmatch " показывать первую парную скобку после ввода второй
set autoread " перечитывать изменённые файлы автоматически
set t_Co=256 " использовать больше цветов в терминале
set statusline=%F%m%r%h%w\ [FF,FE,TE=%{&fileformat},%{&fileencoding},%{&encoding}\]
"Изменяет шрифт строки статуса (делает его не жирным)
hi StatusLine gui=reverse cterm=reverse
set laststatus=2 " всегда показывать строку состояния
set noruler "Отключить линейку
"Проблема красного на красном при spellchecking-е решается такой строкой в .vimrc
highlight SpellBad ctermfg=Black ctermbg=Red
au BufWinLeave *.* silent mkview " при закрытии файла сохранить 'вид'
au BufWinEnter *.* silent loadview " при открытии - восстановить сохранённый
"set backspace=indent,eol,start " backspace обрабатывает отступы, концы строк
set sessionoptions=curdir,buffers,tabpages " опции сессий - перейти в текущую директорию, использовать буферы и табы
set noswapfile " не использовать своп-файл (в него скидываются открытые буферы)
set browsedir=current
set visualbell " вместо писка бипером мигать курсором при ошибках ввода
set clipboard=unnamed " во избежание лишней путаницы использовать системный буфер обмена вместо буфера Vim
set backup " включить сохранение резервных копий
set title " показывать имя буфера в заголовке терминала
set history=128 " хранить больше истории команд
set undolevels=2048 " хранить историю изменений числом N
set whichwrap=b,<,>,[,],l,h " перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
"set virtualedit=all " позволяет курсору выходить за пределы строки
let c_syntax_for_h="" " необходимо установить для того, чтобы *.h файлам присваивался тип c, а не cpp
" При вставке фрагмента сохраняет отступ
"set pastetoggle=
"подсвечивает все слова, которые совпадают со словом под курсором.
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))
set t_Co=256
" Проверка орфографии
set spell spelllang=ru,en,de

" игнорировать регистр при поиске
set ic
" подсвечивать поиск
set hls
" использовать инкрементальный поиск
set is
" ширина текста 
"set textwidth=70
" минимальная высота окна пусть будет 0 (по умолчанию - 1)
set winminheight=0
" всегда делать активное окно максимального размера
set noequalalways
set winheight=9999
" задать размер табуляции в четыре пробела
set ts=2
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set nosmartindent



" Relative numbering
" set relativenumber

" Plug In
call plug#begin('~/.vim/plugged')

" On-demand loading
" File Manager
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Table Mode
" Plug 'dhruvasagar/vim-table-mode', { 'on':  'TableMode' }
" Colorschemes
Plug 'morhetz/gruvbox'
colorscheme gruvbox
set background=dark
"Snippets 
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"Optional ijjjSnipets
Plug 'honza/vim-snippets'
"j:q Autocomplete, Additional Installation required
" Plug 'Valloric/YouCompleteMe' 
" Auto Pairs {} []
Plug 'jiangmiao/auto-pairs'
" Search through files
Plug 'kien/ctrlp.vim'
" Easy Motion in text
Plug 'easymotion/vim-easymotion'
" Hard Mode
Plug 'wikitopian/hardmode'
" Vim SASS Run-Time
Plug 'tpope/vim-haml'
" Wiki Tour
Plug 'vimwiki/vimwiki'
" Syntax better
" javascript
Plug 'pangloss/vim-javascript'
" html
Plug 'othree/html5.vim'
" css
Plug 'mtscout6/vim-tagbar-css'
" Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Started Page
Plug 'mhinz/vim-startify'
" Commentary
Plug 'tpope/vim-commentary'
" Systemcopy
Plug 'christoomey/vim-system-copy'
" Tagbar
Plug 'majutsushi/tagbar'
" Tmux Navigation
Plug 'christoomey/vim-tmux-navigator'
"C# Syntax
Plug 'OrangeT/vim-csharp'

" Initialize plugin system
call plug#end()

map <F7> :setlocal spell spelllang=en_us<CR>
map <F8> :setlocal spell spelllang=de_de<CR>

map <F3> :update<CR>

nmap <F9> :TagbarToggle<CR>

" compile and run
map <F6> :call CompileAndRun()<CR>

func! CompileAndRun()
:w
:!javac "%" && java -cp "%:p:h" "%:t:r"
endfunc

" Mapping

map <C-n> :NERDTreeToggle<CR>
map <C-b> :source ~/.vimrc<CR>
map <Leader> <Plug>(easymotion-prefix)

" Auto source
autocmd! bufwritepost ~/.vimrc execute "normal! :source ~/.vimrc"

" ## Edit .vimrc ##
map ,v :vsp $MYVIMRC<CR>

" Needed for SASS
:map <F7> :checktime<CR>
:map! <F7> <C-O>:checktime<CR>

"CtrlP Search Settings
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$|.bundle$\|vendor'

inoremap ;n <esc>ea
inoremap ;x <esc>A;<CR>

map ;o :%s/ö/"o/g<CR>
map ;u :%s/ü/"u/g<CR>
map ;a :%s/ä/"a/g<CR>
map ,ä ysiw'ela


