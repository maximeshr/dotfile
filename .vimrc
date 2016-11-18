" .vimrc
" v0.1 2016-01-11 Maxime Sahroui.
" If you have any questions, email me at maxime.sahroui@gmail.com

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
" Setup Vundle:
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
set nocompatible " Fuck VI... That's for grandpas.
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

" Let vundle manage itself:
Plugin 'gmarik/vundle'

" Just a shitload of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'

" Fuzzy finder -- absolutely must have.
Plugin 'kien/ctrlp.vim'

" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'

" Proper JSON filetype detection, and support.
Plugin 'leshill/vim-json'

" vim already has syntax support for javascript, but the indent support is
" shit. This fixes that.
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'

" JavaScript should look a lot nicer.
Plugin 'jelera/vim-javascript-syntax'

" TypeScript
Plugin 'leafgarland/typescript-vim'

" Automatically add the closing quote, bracket or any other thing
Plugin 'Raimondi/delimitMate'

" vim indents HTML very poorly on it's own. This fixes a lot of that.
Plugin 'indenthtml.vim'

" I write markdown a lot. This is a good syntax.
Plugin 'tpope/vim-markdown'

" LESS syntax.
Plugin 'groenewege/vim-less'

" Coffee-script syntax.
Plugin 'kchmck/vim-coffee-script'

" NERD-tree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Vim-airline
Plugin 'bling/vim-airline'

" SNIPPETS <3
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'

" Better whitespace highlighting for Vim
Plugin 'ntpeters/vim-better-whitespace'

" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/reverts hunks.
Plugin 'airblade/vim-gitgutter'
Plugin 'moll/vim-bbye'

" This plugin is used for displaying thin vertical lines at each indentation
" level for code indented with spaces. For code indented with tabs I think
" there is no need to support it, because you can use :set list lcs=tab:\|\
" (here is a space).
Plugin 'Yggdroot/indentLine'

" using cpi to copy to clipboard
Plugin 'christoomey/vim-system-copy'

" auto indent file with preferences
Plugin 'ciaranm/detectindent'

" May be this is the smallest Vim plugin in the world. It adds some useful
" mappings for manage simple todo lists (example below) and nothing more.
Plugin 'vitalk/vim-simple-todo'

" Write JavaScript ES6 easily with vim.
Plugin 'isRuslan/vim-es6'

Plugin 'icholy/typescript-tools.git'

" Surround.vim is all about surroundings: parentheses, brackets, quotes, XML
" tags, and more. The plugin provides mappings to easily delete, change and
" add such surroundings in pairs.
Plugin 'tpope/vim-surround'

" This plugin provides a start screen for Vim and Neovim.
"
" It provides dynamically created headers or footers and uses configurable
" lists to show recently used or bookmarked files and persistent sessions. All
" of this can be accessed in a simple to use menu that even allows to open
" multiple entries at once.
"
" Startify doesn't get in your way and works out-of-the-box, but provides many
" options for fine-grained customization.
Plugin 'mhinz/vim-startify'

" -----------------------------------------------------------------------------
" Global Settings
" -----------------------------------------------------------------------------

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on     " Filetype auto-detection
syntax on                     " Syntax highlighting

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab                 " use spaces instead of tabs.
set smarttab                  " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround                " tab / shifting moves to closest tabstop.
set autoindent                " Match indents on new lines.
set smartindent               " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup                  " We have vcs, we don't need backups.
set nowritebackup             " We have vcs, we don't need backups.
set noswapfile                " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden                    " allow me to have buffers with unsaved changes.
set autoread                  " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase                " case insensitive search
set smartcase                 " If there are uppercase letters, become case-sensitive.
set incsearch                 " live incremental searching
set showmatch                 " live match highlighting
set hlsearch                  " highlight matches
set gdefault                  " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block
set t_Co=256                  " set color to 256 ;)
set number                    " display usefull numbers
set colorcolumn=80            " adding ruler to work like a boss

" -----------------------------------------------------------------------------
" Mapping
" -----------------------------------------------------------------------------

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap JJ <esc>

" insert new line when pressing ENTER
nmap <CR> o<Esc>k

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>
map <leader>l :bn<CR>
map <leader>k :bp<CR>
map <leader>m :Bdelete<CR>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" press F5 to strip white spaces
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" press F7 to re-indent all file
map <F7> mzgg=G`z

" -----------------------------------------------------------------------------
" Plugin Settings
" -----------------------------------------------------------------------------

" // ctrlp configuration
" -----------------------------------------------------------------------------

" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 5

" Removing useless files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'


" // NERD-tree configuration
" -----------------------------------------------------------------------------

map <C-n> :NERDTreeTabsToggle<CR>


" // Airline configuration
" -----------------------------------------------------------------------------

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 " automatically populate the g:airline_symbols
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" // gitgutter configuration
" -----------------------------------------------------------------------------

" gitgutter lag fix
" If you experience a lag, you can trade speed for accuracy:
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" gitgutter column
let g:gitgutter_sign_column_always = 1

" // TypeScript configuration
" -----------------------------------------------------------------------------

" You can add compiler options by modifying the compiler options variable.
let g:typescript_compiler_options = '-sourcemap'

" // AutoIndent configuration
" -----------------------------------------------------------------------------

" May also be used in an autocommand, for example:
:autocmd BufReadPost * :DetectIndent

" To specify a preferred indent level when no detection is possible:
:let g:detectindent_preferred_indent = 4

" // SimpleTodo configuration
" -----------------------------------------------------------------------------

let g:simple_todo_tick_symbol = 'y'

" // Snippets configuration
" -----------------------------------------------------------------------------
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"")

" @TODO
" Bundle icholy/typescript-tools.git
au BufRead,BufNewFile *.ts        setlocal filetype=typescript

" -----------------------------------------------------------------------------
" Functions
" -----------------------------------------------------------------------------

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

" -----------------------------------------------------------------------------
" File extensions
" -----------------------------------------------------------------------------

autocmd BufNewFile,BufRead *.es6 set filetype=javascript

" -----------------------------------------------------------------------------
" Theme Settings
" -----------------------------------------------------------------------------

" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
" and access colors present in 256 colorspace
set background=dark
set t_Co=256
let base16colorspace=256
colorscheme base16-default
