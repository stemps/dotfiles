" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

let mapleader=","
" enable pathogen bundle loader
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set shellcmdflag=-ic          " make it behave like an interactive shell (i.e. have aliases)

set nostartofline                 " Remeber cursor column after buffer switch

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=*.o,*.obj,.git,public/system/**

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set guifont=Inconsolata-dz:h12
set guioptions=m	" hide top menu bar

set mouse=a

" highlight current line
set cursorline

if has("mac") && has("gui")
  set macmeta

  " enable fullscreen
  set fuopt+=maxhorz                      
  map <D-CR> :set invfu<CR>                
endif

" Theme
colorscheme railscasts
"colorscheme molokai

" window sizes
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" GIT
nmap <leader>gaa :!git add -A; gs<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gl :Glog<CR>

" Tabularize
if exists(":Tabularize")
  nmap <Leader>t<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>t<Bar> :Tabularize /<Bar><CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
  nmap <Leader>t= :Tabularize /=\zs<CR>
  vmap <Leader>t= :Tabularize /=\zs<CR>
endif


" quickly edit .vimrc
map <leader>v :tabedit $MYVIMRC<Enter><esc>

" NerdTree
map <leader>nn :NERDTreeToggle<Enter>
map <F3> :NERDTreeToggle<Enter>
map <leader>nr :NERDTreeFind<Enter>

"Ack Plugin
map <leader>FF :Ack -Q ""<Left>
map <leader>Ff :Ack ""<Left>
map <leader>FA :Ack -Q "<c-r><c-w>"<CR>
map <leader>Fa :Ack "<c-r><c-w>"<CR>

" Rails Plugin
map <leader>rm :Rmodel<CR>
map <leader>rc :Rcontroller<CR>
map <leader>rv :Rview<CR>
map <leader>rs :e db/schema.rb<CR>

"Taglist
nnoremap <silent> <F7> :TlistToggle<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
if has("mac") && has("gui")
  set listchars=tab:▸\ ,eol:¬
endif

" quick changing buffers, windows and tabs
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <A-h> :tabprevious<Enter>
map <A-l> :tabnext<Enter>
map <a-k> :bp<Enter>
map <a-j> :bn<Enter>
map <a-w> :bd<Enter>

" un-highlight current pattern on CR
nnoremap <CR> :noh<CR><CR>

if has("autocmd")
  filetype on 
  autocmd FileType ruby imap <C-l> =><Space>
  autocmd BufNewFile,BufRead *.thor set syntax=ruby
  autocmd FileType xml,html,python setlocal ts=4 sts=4 sw=4 expandtab
endif

" automatically align cucumber bars (https://gist.github.com/287147)
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"NERDtree defaults
let NERDTreeHijackNetrw=0
let NERDTreeShowBookmarks=1 

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <leader>h :call HexHighlight()<Return>

" auto-close fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Command-T auto-refresh
nmap <leader>t :CommandTFlush<CR>:CommandT<CR>

