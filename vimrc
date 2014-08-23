" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

" Pathogen --------------------------------------------------------------- {{{

let mapleader=","
" enable pathogen bundle loader
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" }}}
" Basic options ---------------------------------------------------------- {{{

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
" set wildignore+=*.o,*.obj,.git,public/system/**,tmp,upload

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

set mouse=a

" highlight current line
set cursorline

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
colorscheme railscasts
"colorscheme solarized
"colorscheme molokai

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

" Syntastic -------------------------------------------------------------- {{{

let g:syntastic_ruby_exec = '/Users/simons/.rvm/rubies/ruby-2.0.0-p247/bin/ruby'

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

nmap <leader>gaa :!git add -A; gs<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gs :Gstatus<CR><C-w>20+
nmap <leader>gl :Glog<CR>

" }}}
" GitV ------------------------------------------------------------------- {{{

nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>

" }}}
" CTags  ----------------------------------------------------------------- {{{

command! Ctg !/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=public/system --exclude=tmp --exclude=log *

" }}}
" CtrlP  ----------------------------------------------------------------- {{{

let g:ctrlp_map = '<leader><leader>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$\|public\/system$\|tmp$\|upload$',
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

" }}}
" Quickfix list ----------------------------------------------------------- {{{

" clear the quickfix list
com! Clfx call setqflist([])
nmap <leader>qc :Clfx<cr>:copen<cr>:cclose<cr>

" }}}
" File Types ------------------------------------------------------------- {{{

filetype on 

autocmd FileType xml,html,python setlocal ts=4 sts=4 sw=4 expandtab

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
autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead *.arb set filetype=ruby
autocmd BufNewFile,BufRead Guardfile set filetype=ruby
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html

" }}}
" RSpec ------------------------------------------------------------------ {{{

autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.ruby-rspec 

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
