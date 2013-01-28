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
set wildignore+=*.o,*.obj,.git,public/system/**,tmp,upload

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
colorscheme solarized
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


" quickly edit .vimrc and other related files
map <leader>vc :tabedit $MYVIMRC<Enter><esc>
map <leader>vq :tabedit $HOME/Documents/vim-questions.txt<Enter><esc>
map <leader>vs :tabedit $HOME/Documents/vim-cheatsheet.txt<Enter><esc>

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
"map <leader>rm :Rmodel<CR>
"map <leader>rc :Rcontroller<CR>
"map <leader>rv :Rview<CR>
"map <leader>rs :e db/schema.rb<CR>

" search an replace
map <leader>ra :%s/<c-r><c-w>//g<Left><Left>
map <leader>rp :%s/<c-r><c-w>//gc<Left><Left><Left>
map <leader>rg yiw:Ack -Q "<c-r>""<CR>:Qargs <bar> argdo %s/<c-r>"//gc <bar> update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

"Taglist
nnoremap <silent> <F7> :TlistToggle<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
if has("mac") && has("gui")
  set listchars=tab:▸\ ,eol:¬
endif

" quick changing buffers, windows and tabs
nmap <C-h> 10h
nmap <C-j> 5j
nmap <C-k> 5k
nmap <C-l> 10l
nmap <A-h> :tabprevious<Enter>
nmap <A-l> :tabnext<Enter>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" un-highlight current pattern on CR
nnoremap <CR> :noh<CR><CR>

if has("autocmd")
  filetype on 
  autocmd FileType ruby imap <C-l> =><Space>
  autocmd BufNewFile,BufRead *.thor set syntax=ruby
  autocmd BufNewFile,BufRead *.arb set syntax=ruby
  autocmd FileType xml,html,python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html
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
map <leader><Leader> :CommandTFlush<CR>:CommandT<CR>
map <leader>t :CommandTFlush<CR>:CommandT<CR>
map <leader>ca :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>cv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>cc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>cm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>ch :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>cl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>cp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>cs :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>cf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>cg :topleft 100 :split Gemfile<cr>

command Ctags !ctags -R --exclude=.git --exclude=log --exclude=public/system --exclude=tmp *


" execute command on quickfix list
" from http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim/5686810#5686810
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
