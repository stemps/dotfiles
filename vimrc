" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

" Vundle ----------------------------------------------------------------- {{{
set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'fugitive.vim'
Plugin 'ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'snipmate-snippets'
Plugin 'Tabular'
Plugin 'cucumber.zip'
Plugin 'endwise.vim'
Plugin 'rails.vim'
Plugin 'ruby-matchit'
Plugin 'ecomba/vim-ruby-refactoring.git'
Plugin 'surround.vim'
Plugin 'html-improved-indentation'
Plugin 'Haml'
Plugin 'unimpaired.vim'
Plugin 'commentary.vim'
Plugin 'vim-coffee-script'
Plugin 'Syntastic'
Plugin 'EasyMotion'
Plugin 'tlib'
Plugin 'ctrlp.vim'
Plugin 'tpope/vim-dispatch.git'
Plugin 'quickfixsigns'
Plugin 'ruby.vim'
Plugin 'mattn/emmet-vim.git'
Plugin 'Vim-Rspec'
Plugin 'vim-airline'
Plugin 'ragtag.vim'
Plugin 'tpope/vim-markdown'
Plugin 'hexHighlight.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'YankRing.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'hashivim/vim-terraform'
Plugin 'juliosueiras/vim-terraform-completion'
Plugin 'slashmili/alchemist.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'craigemery/vim-autotag'
Plugin 'posva/vim-vue'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'MaxMEllon/vim-jsx-pretty'

call vundle#end()
filetype plugin indent on


" }}}
" Basic options ---------------------------------------------------------- {{{

let mapleader=","

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
set wildignore+=*.o,*.obj
set wildignore+=*.o,*.obj,.git,public/system/**,tmp,upload,node_modules,deps,storage,_build,_deps

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

set previewheight=20

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

set mouse=a

" highlight current line
" set cursorline

set lazyredraw

" }}}
" Appearance ------------------------------------------------------------- {{{

set guifont=Inconsolata-dz\ for\ Powerline:h12
set guioptions=m	" hide top menu bar

if has("mac") && has("gui")
  set macmeta

  " enable fullscreen
  set fuopt+=maxhorz                      
  map <D-CR> :set invfu<CR>                
endif

" Theme
" colorscheme railscasts
" colorscheme solarized
colorscheme molokai

" window sizes
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" }}}
" Folding ---------------------------------------------------------------- {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15

function! MyFoldText() 
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()

" }}}
" Plugins ---------------------------------------------------------------- {{{

:nmap <silent> <leader>d <Plug>DashSearch
:nmap <silent> <leader>D <Plug>DashGlobalSearch

let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 17

" Syntastic -------------------------------------------------------------- {{{

" tell ruby not to output warnings. They have too many false positives
let g:syntastic_ruby_mri_args='-T1 -c'

" }}}
" NerdTree --------------------------------------------------------------- {{{

map <leader>nn :NERDTreeToggle<Enter>
map <F3> :NERDTreeToggle<Enter>
map <leader>nr :NERDTreeFind<Enter>

"NERDtree defaults
let NERDTreeHijackNetrw=0
let NERDTreeShowBookmarks=1 

" }}}
" Ack Plugin ------------------------------------------------------------- {{{

map <leader>FF :Ack -Q ""<Left>
map <leader>Ff :Ack ""<Left>
map <leader>FA :Ack -Q "<c-r><c-w>"<CR>
map <leader>Fa :Ack "<c-r><c-w>"<CR>

" }}}
" EasyMotion plugin ------------------------------------------------------ {{{

let g:EasyMotion_leader_key = '\'

" }}}
" Rails PLugin ----------------------------------------------------------- {{{

"map <leader>rm :Rmodel<CR>
"map <leader>rc :Rcontroller<CR>
"map <leader>rv :Rview<CR>
"map <leader>rs :e db/schema.rb<CR>

" }}}
" Taglist ---------------------------------------------------------------- {{{

nnoremap <silent> <F7> :TlistToggle<CR>

" }}}
" multi cursor ----------------------------------------------------------- {{{

let g:multi_cursor_start_key='<C-s>'

" }}}
" Fugitive --------------------------------------------------------------- {{{

" auto-close fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

nmap <leader>gaa :!git add -A; git status<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR><C-w>20+
nmap <leader>gl :Glog<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>dg :diffget<CR>
nmap <leader>dp :diffput<CR>

" }}}
" GitV ------------------------------------------------------------------- {{{

nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>

" }}}
" CtrlP  ----------------------------------------------------------------- {{{

let g:ctrlp_map = '<leader><leader>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$\|public\/system$\|tmp$\|upload$\|fixtures\/vcr_cassettes$\|node_modules$|deps$|storage$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Do not try to be smart when determining the working directory. Use the
" actual vim working directory instead.
let g:ctrlp_working_path_mode = '0'

" }}}
" YankRing --------------------------------------------------------------- {{{

nmap <leader>yr :YRShow<CR>

" }}}
" Powerline  ------------------------------------------------------------- {{{

set rtp+=/Users/simons/dotfiles/vim/bundle/powerline/powerline/bindings/vim

" }}}
" vim-dispatch ----------------------------------------------------------- {{{

nmap <leader>m :Make<CR>

" }}}
" quickfixsigns ---------------------------------------------------------- {{{

" default: ['qfl', 'loc', 'marks', 'vcsdiff', 'breakpoints']
let g:quickfixsigns_classes = ['qfl', 'loc', 'vcsdiff', 'breakpoints']

" }}}
" Tabularize ------------------------------------------------------------- {{{

if exists(":Tabularize")
  nmap <Leader>t<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>t<Bar> :Tabularize /<Bar><CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
  nmap <Leader>t= :Tabularize /=\zs<CR>
  vmap <Leader>t= :Tabularize /=\zs<CR>
endif

" }}}
" VIM-Rspec -------------------------------------------------------------- {{{

let g:rspec_command = "compiler rspec | Make -f documentation {spec}"

autocmd User BufEnterRails let g:rspec_command = "compiler rspec | set makeprg=bin/rspec | Make -f documentation {spec}"

map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>ss :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

" }}}

" }}}
" Quick Edits ------------------------------------------------------------ {{{

map <leader>vc :tabedit $MYVIMRC<Enter><esc>
map <leader>vq :tabedit $HOME/Documents/vim-questions.txt<Enter><esc>
map <leader>vs :tabedit $HOME/Documents/vim-cheatsheet.txt<Enter><esc>
map <leader>vn :tabedit $HOME/Documents/vim-notes.txt<Enter><esc>

" }}}
" Search and replace ----------------------------------------------------- {{{
 
map <leader>ra :%s/<c-r><c-w>/<c-r><c-w>/g<Left><Left>
map <leader>rp :%s/<c-r><c-w>/<c-r><c-w>/gc<Left><Left><Left>
map <leader>rg yiw:Ack -Q "<c-r>""<CR>:Qargs <bar> argdo %s/<c-r>"//gc <bar> update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

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

" }}}
" Show hidden characters ------------------------------------------------- {{{

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
if has("mac") && has("gui")
  set listchars=tab:▸\ ,eol:¬
endif

" }}}
" Navigation ------------------------------------------------------------- {{{

" quick changing buffers, windows and tabs
nmap <C-h> 10h
nmap <C-j> 5j
nmap <C-k> 5k
nmap <C-l> 10l
nmap <A-h> :tabprevious<Enter>
nmap <A-l> :tabnext<Enter>

" go to end of selection after yank
vmap y ygv<Esc>

" }}}
" Highlighting ----------------------------------------------------------- {{{

nnoremap <CR> :noh<CR><CR>

:set colorcolumn=+1
:highlight ColorColumn ctermbg=lightgrey guibg=#222222

" }}}
" Quickfix list ----------------------------------------------------------- {{{

" clear the quickfix list
com! Clfx call setqflist([])
nmap <leader>qc :Clfx<cr>:copen<cr>:cclose<cr>

" }}}
" File Types ------------------------------------------------------------- {{{

filetype on 

autocmd FileType xml,python setlocal ts=4 sts=4 sw=4 expandtab

" VIM -------------------------------------------------------------------- {{{

augroup ft_vim
  au!
  au FileType vim setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
augroup END

" }}}
" Cucumber---------------------------------------------------------------- {{{

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

" }}}
" Ruby ------------------------------------------------------------------- {{{

autocmd FileType ruby imap <C-l> =><Space>
autocmd FileType ruby set textwidth=100
autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead *.arb set filetype=ruby
autocmd BufNewFile,BufRead Guardfile set filetype=ruby
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html

" }}}
" RSpec ------------------------------------------------------------------ {{{

autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.ruby-rspec 

" }}}
" Elixir ------------------------------------------------------------------- {{{

autocmd FileType elixir imap <C-l> \|><Space>
autocmd FileType elixir imap <C-j> <-<Space>
autocmd FileType elixir imap <C-k> -><Space>

" }}}

" }}}
" Hex Colors ------------------------------------------------------------- {{{

nmap <leader>h :call HexHighlight()<Return>

" }}}
" Directory navigation --------------------------------------------------- {{{

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" }}}
