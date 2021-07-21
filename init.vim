call plug#begin('~/.vim/plugged')

Plug 'buoto/gotests-vim'
Plug 'tomlion/vim-solidity'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'skwp/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-powerline'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-rails'
Plug 'tjennings/git-grep-vim'
Plug 'nonsense/tomorrow-night-vim-theme'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/bufkill.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'goldfeld/vim-seek'
Plug 'tpope/vim-markdown'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-endwise'
Plug 'rking/ag.vim'
Plug 'ervandew/screen'
Plug 'lunaru/vim-less'
Plug 'vim-scripts/ZoomWin'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

Plug 'garbas/vim-snipmate'
Plug 'ngmy/vim-rubocop'
Plug 'fatih/vim-go'
Plug 't-yuki/vim-go-coverlay'
Plug 'gevans/vim-ginkgo'
"Plug 'Shougo/neocomplete.vim'
Plug 'benmills/vimux-golang'
Plug 'benmills/vimux'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'

Plug 'derekwyatt/vim-scala'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Initialize plugin system
call plug#end()

set number                      "Line numbers are good
set mouse=a
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on
set synmaxcol=120

" Change Leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapLeader has to be set before vundle starts loading all
" the plugins.
let mapleader="\<SPACE>"

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
"set list!
"set listchars=tab:>-

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" == TONY

syntax enable
set background=dark

let g:solarized_termtrans = 1

"set term=xterm-256color

colorscheme Tomorrow-Night-Eighties

filetype plugin indent on


noremap <Leader>svi :BundleInstall<CR>
noremap <Leader>ev :e ~/.config/nvim/init.vim<CR>
"map <Leader>gct :!ctags -R --exclude=.git --exclude=log<CR>
map <Leader>gct :!/usr/local/bin/ctags -R --exclude=.git --exclude=log<CR>
set tags=./tags;/;~/.rvm/gems/tags
nnoremap <silent> <Leader>f <C-]>
nnoremap <silent> <Leader>F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
nnoremap <Leader>gg :GitGrep ""<left>
nnoremap <Leader>ga :Ag 

"map <Leader>gcT :!cd ~/.rvm/gems && ctags -R --exclude=.git --exclude=log ./ ~/.rvm/gems/<CR>
map <Leader>gcT :!cd ~/.rvm/gems && /usr/local/bin/ctags -R --exclude=.git --exclude=log ./ ~/.rvm/gems/<CR>


" Type ,hl to toggle highlighting on/off, and show current value.
noremap <Leader>hl :set hlsearch! hlsearch?<CR>
nmap <silent> // :nohlsearch<CR>

" ============================
" SplitJoin plugin
" ============================
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" MacOS compat copy/paste
set clipboard=unnamed

" calls sudo and reloads the file
command SW :execute ':silent w !sudo tee % > /dev/null' | :edit!
command SWq :execute ':W' | :q
command SWQ :Wq

" toggle line wrap
map <Leader>wr :set wrap!<CR>

" git log
map <Leader>gl :! gl<cr>

" auto-start in hard-mode
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" case-insensitive search for vim-seek
set ic

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
set timeoutlen=1000 ttimeoutlen=0

" Autoopen NERDTree and move cursor to the right
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

nnoremap <F4> :set paste!<cr>

let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 0

function! ScreenShellStartOrRestart()
  if g:ScreenShellActive
    ScreenShellReopen
  else
    ScreenShellVertical
  endif
endfunction

map <Leader><Leader>cc :call ScreenShellStartOrRestart()<cr>

map <F5> :ScreenShellVertical<CR>
"command! -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <Leader><Leader>c :ScreenShellVertical bundle exec rails c<CR>
map <Leader><Leader>z :w<CR> :call ScreenShellSend("cucumber ".@%)<CR>
map <Leader><Leader>R :w<CR> :call ScreenShellSend("rspec ".@%)<CR>
map <Leader><Leader>S :w<CR> :call ScreenShellSend("rubocop ".@%)<CR>
map <Leader><Leader>r :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader><Leader>e :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader><Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>
map <Leader><Leader>gt :w<CR> :call ScreenShellSend("cd ".expand('%:p:h')." && go test -run ./".expand('%'))<CR>
"map <Leader><Leader>b :! ruby -cw %<CR>

map <Leader><Leader>ss :ScreenSend<CR>

let g:ruby_debugger_debug_mode = 1
let g:ruby_debugger_progname = 'vim'
let g:ruby_debugger_default_script = 'rails s'

map <M-s> :w<CR>  "Works in normal mode, must press Esc first"
imap <M-s> <Esc>:w<CR>i "Works in insert mode, saves and puts back in insert mode"


map <Leader>qv :pclose<cr>

" MacOS compat copy/paste
set clipboard=unnamed

" Autocomplete
set completeopt=longest,menuone

" RuboCop from Anywhere
"nmap <Leader>ru :RuboCop<CR>
"imap <Leader>ru <ESC>:RuboCop<CR>

let g:golang_goroot = '/usr/local/Cellar/go/1.3.1/libexec'

autocmd BufWritePre *.go silent GoImports

" Vim-go mappings

au FileType go nmap <Leader>gfs <Plug>(go-def)
au FileType go nmap <Leader>gfv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gft <Plug>(go-def-tab)

au FileType go nmap <leader>gor <Plug>(go-run)
au FileType go nmap <leader>gob <Plug>(go-build)
au FileType go nmap <leader>got <Plug>(go-test)
au FileType go nmap <leader>goc <Plug>(go-coverage)

au FileType go nmap <Leader>gdb <Plug>(go-doc-browser)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gdv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gds <Plug>(go-doc-split)

au FileType go nmap <Leader>gli <Plug>(go-implements)

" Popup menu hightLight Group
 "highlight Pmenu    ctermbg=13  guibg=DarkBlue
 "highlight PmenuSel ctermbg=7   guibg=DarkBlue     guifg=LightBlue
 "highlight PmenuSbar ctermbg=7  guibg=DarkGray
 "highlight PmenuThumb           guibg=Black

 "hi Pmenu  gui=NONE ctermbg=0 guibg=Grey40
 "hi Pmenu ctermfg=10 guifg=#80a0ff
 "hi PmenuSbar  gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
 "hi PmenuThumb  gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
map <Leader>rf :wa<CR> :GolangTestFocused<CR>
imap jj <Esc>
"
" Command maps
command W w
command Wq wq
command WQ wq
command Q q
command Qa qa
command QA qa















" settings
"
"unmap <leader>ba
"unmap <leader>bundo
"unmap <leader>bw
"unmap <leader>bun
"unmap <leader>bb
"unmap <leader>bf
"unmap <leader>bd
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Default to filename searches - so that appctrl will find application
" controller
"
" Changed back to path<leader> i think this is more useful
let g:ctrlp_by_filename = 0

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste<leader> then hit ctrl-p)
let g:ctrlp_map = '<leader>t'
nnoremap <silent> <leader>t :CtrlPMixed<CR>

" Additional mapping for buffer search
nnoremap <silent> <leader>b :CtrlPBuffer<cr>
nnoremap <silent> <leader>m :CtrlPMRU<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path<leader> making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map <leader>jm :CtrlP app/models<CR>
map <leader>jc :CtrlP app/controllers<CR>
map <leader>jv :CtrlP app/views<CR>
map <leader>jh :CtrlP app/helpers<CR>
map <leader>jl :CtrlP lib<CR>
map <leader>jp :CtrlP public<CR>
map <leader>js :CtrlP spec<CR>
map <leader>jf :CtrlP fast_spec<CR>
map <leader>jd :CtrlP db<CR>
map <leader>jC :CtrlP config<CR>
map <leader>jV :CtrlP vendor<CR>
map <leader>jF :CtrlP factories<CR>
map <leader>jT :CtrlP test<CR>
map <leader>jr :CtrlP spec/requests<CR>

"Cmd-Shift-(M)ethod - jump to a method (tag in current file)
"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <D-M> :CtrlPBufTag<CR>

" MRU relative only to the current path
let g:ctrlp_mruf_relative = 1

map f <leader><leader>f
map ; <leader><leader>w
map <leader>; <leader><leader>b
map F <leader><leader>F

call EasyMotion#InitOptions({
\   'leader_key'      : '<Leader><Leader>'
\ , 'keys'            : 'fjdksewoavn'
\ , 'do_shade'        : 1
\ , 'do_mapping'      : 2
\ , 'grouping'        : 1
\ })
" fugitive.git
" ========================================
" For fugitive.git<leader> dp means :diffput. Define dg to mean :diffget
nnoremap <silent> <leader>dg :diffget<CR>
nnoremap <silent> <leader>dp :diffput<CR>

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
let g:gitgutter_highlight_lines = 0

":GitGutterEnable

"highlight link GitGutterAdd DiffAdd
"highlight link GitGutterChange DiffAdd
"highlight link GitGutterDelete DiffAdd
"highlight link GitGutterChangeDelete DiffAdd
highlight clear SignColumn
nmap <leader>u :GundoToggle<CR>

" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1

" a little wider for wider screens
let g:gundo_width = 60
"let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  ""return neocomplete#close_popup() . "\<CR>"
  "" For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 30<CR>
noremap <Leader>n :NERDTreeToggle<CR>
let g:Powerline_symbols='fancy'
"let g:Powerline_theme='solarized'
"let g:Powerline_colorscheme='solarized'

set laststatus=2 "always show the statusline
" <leader>q to toggle quickfix window (where you have stuff like GitGrep)
" <leader>oq to open it back up (rare)
nmap <silent> <leader>qc :cclose<CR>
nmap <silent> <leader>qo :copen<CR>
" Better key maps for switching between controller and view
nnoremap <leader>vv :Rview<cr>
nnoremap <leader>cc :Rcontroller<cr>
"set conceallevel=2
"set concealcursor=vin
""let g:clang_snippets=1
""let g:clang_conceal_snippets=1
""let g:clang_snippets_engine='clang_complete'

"" Complete options (disable preview scratch window, longest removed to aways show menu)
"set completeopt=menu,menuone

"" Limit popup menu height
"set pumheight=20

"" SuperTab completion fall-back
"let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
"open the taglist (method browser) using ,T
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
nnoremap <silent> <Leader>T :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap <leader>ww :StripTrailingWhitespaces<CR>

set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

nnoremap <leader>go :GoInfo<cr>
nnoremap <leader>ge :GoIfErr<cr>

let g:go_guru_scope = ["..."]
