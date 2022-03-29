" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim self configurations
set cindent
set incsearch
set backspace=2
set foldenable
"inoremap ( ( )<left>
"inoremap ' ''<left>
"inoremap { {}<left>"
" inoremap < <><left>
"inoremap : : 
"inoremap = = 
"inoremap [ []<left>
set hls
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR>

" Aditional config for auto complete feature
set complete+=kspell
set completeopt=menuone,longest

syntax on

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nu
set autoindent

" Setting encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set fencs=utf-8,gbk
filetype on
set ts=4
set sw=4
set tabstop=2 shiftwidth=2 expandtab

"color plate"
let g:industry_termcolors=256
colorscheme one

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

hi link Search Todo

"Add vertical line to indicate max-length 80 characters
highlight ColorColumn term=bold ctermbg=darkgrey
set colorcolumn=80

"Put all vim swap files into a separate folder from the folder which contains
"the file
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir)
  call mkdir(&dir, 'p', 0700)
endif

"set for vundle.
set nocompatible

"keep Plugin commands between vundle#begin/end."
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manager Vundle, required.
Plugin 'gmarik/Vundle.vim'
"Plugin 'cscope.vim'
"Plugin 'nginx.vim'
Plugin 'Emmet.vim'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'valloric/MatchTagAlways'

" Surrounding operations, type :help surround to get manuals
Plugin 'tpope/vim-surround'

" Atom-like theme
Plugin 'rakr/vim-one'

" ES6 support
Plugin 'isruslan/vim-es6'

"code snippets engine for Vim, with snippets library,
Plugin 'xptemplate'

"YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for
"vim. automatically complete."
" Plugin 'Valloric/YouCompleteMe'
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

Plugin 'Raimondi/delimitMate'
"settings for delimitMate.
let delimitMate_expand_space = 1
let delimitMate_autoclose = 1
let delimitMate_expand_cr = 1

"this plugin will allow you to run ag from vim, and shows the results in a
"split window."
Plugin 'rking/ag.vim'
"https://github.com/gyng/ctrlsf.vim run :CtrlSf pattern it will split a new
"window to show search result."
Plugin 'dyng/ctrlsf.vim'	

Plugin 'scrooloose/nerdtree'
map <F12> :NERDTreeToggle<CR>
"open a NERDTree automatically when vim starts up."
"autocmd vimenter * NERDTree

" Set up vim page, list recently opened files 
Plugin 'mhinz/vim-startify'

"ale: common lint engine for various languages, Config lint only on file saving
Plugin 'w0rp/ale'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
" 自定义 error highlight color
highlight ALEError ctermfg=232 ctermbg=166 guifg=#000000 guibg=#df5f00
highlight link ALEWarning WarningMsg

"Plugin for react.js
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

"Easy motion, Move cursor quickly.
Plugin 'easymotion/vim-easymotion'

" Show all tags of current opend file. overview of code source
Plugin 'majutsushi/tagbar'
" Map F8 to toggle the tagbar
nmap <f8> :TagbarToggle<CR>

"Configs for easy motion:
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap q <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap q <Plug>(easymotion-overwin-f2)

"Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

"JK motions: Line motions, move in fuzzy search results
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"Add status line, air-line is a powerful plugin
Plugin 'vim-airline/vim-airline'
"Config tabline which airline builtin
let g:airline#extensions#tabline#enabled = 1

"Add buffer line, because airline builtin, so, ignored now.
"Plugin 'bling/vim-bufferline'

Plugin 'tomasiser/vim-code-dark'

"Clone the plugin into a separate directory:
"cd ~/.vim && git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim,
"The ctrlp plugin needs install manually
"Ctrlp, a more powerful tool, configurations for Ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Replace ctrlp with Fzf to search files
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

" Map Ctrl + p to :Files command
nnoremap <C-p> :Files<Cr>

" Map Ctrl + n to :Buffers<Cr>
nnoremap <C-n> :Buffers<Cr>

" A powerful commenter, Comment a specific line
Plugin 'scrooloose/nerdcommenter'
" commenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Briefly highlight which text was yanked.
" Plugin 'machakann/vim-highlightedyank'

" Automatically show Vim's complete menu while typing.
Plugin 'vim-scripts/AutoComplPop'


"for vundle, all plugins must be added before the following line."
call vundle#end()

filetype plugin indent on

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif


" This callback will be executed when the entire command is completed
function! BackgroundCommandClose(channel)
  " Read the output from the command into the quickfix window
  execute "cfile! " . g:backgroundCommandOutput
  " Open the quickfix window
  copen
  unlet g:backgroundCommandOutput
endfunction

function! RunBackgroundCommand(command)
  " Make sure we're running VIM version 8 or higher.
  if v:version < 800
    echoerr 'RunBackgroundCommand requires VIM version 8 or higher'
    return
  endif

  if exists('g:backgroundCommandOutput')
    echo 'Already running task in background'
  else
    echo 'Running task in background'
    " Launch the job.  " Notice that we're only capturing out, and not err here.  This is because, for some reason, the callback
    " will not actually get hit
    let g:backgroundCommandOutput = tempname()
    call job_start(a:command, {'close_cb': 'BackgroundCommandClose', 'out_io': 'file', 'out_name': g:backgroundCommandOutput})
  endif
endfunction

" So we can use :BackgroundCommand to call our function.
command! -nargs=+ -complete=shellcmd RunBackgroundCommand call RunBackgroundCommand(<q-args>)
