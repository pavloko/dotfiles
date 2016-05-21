"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename: .vimrc
" Maintainer: Pavlo Kochubei <pavlo.kochubei@gmail.com>
"
" Sections:
" 01. General...........,......General Vim behavior
" 02. Plugins..................Vundle Plugins
" 03. Events...................General autocmd events
" 04. Theme/Colors.............Colors, fonts, etc.
" 05. Vim UI...................User interface behavior
" 06. Text Formatting/Layout...Text, tab, indentation related
" 07. Custom Commands..........Any custom command aliases

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " get rid of Vi compatability
set encoding=utf-8
set fileencoding=utf-8
set autoread            " autoreload files changed outside of Vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" --- Tools
" ---------------------------------------
Plugin 'tmhedberg/SimpylFold'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'marijnh/tern_for_vim'

" --- Web Development
" ---------------------------------------
" Plugin 'SirVer/ultisnips'
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'skammer/vim-css-color'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'honza/vim-snippets'
Plugin 'mxw/vim-jsx'
Plugin 'justinj/vim-react-snippets'

" --- Python Development
" ---------------------------------------
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

" --- Go Development
" ---------------------------------------
Plugin 'fatih/vim-go'

" --- Extra
" ---------------------------------------
Bundle 'wakatime/vim-wakatime'

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

call vundle#end()            " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab

" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable           " enable syntax highlighting (previously syntax on).
" set t_Co=256            " enable 256-color mode.
set background=dark
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized   " set colorscheme
" highlight clear

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

" Prettify Vagrantfile
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Prettify Markdown files
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=red
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " show line numbers
set numberwidth=6         " make the number gutter 6 characters wide
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set visualbell
nnoremap <esc> :noh<return><esc>  " use ESC to remove search highlight


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set textwidth=80          " Line width = 80 characters

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Custom Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prettify JSON files making them easier to read
command PrettyJSON %!python -m json.tool

" Enable folding with the spacebar
nnoremap <space> za


" Enable folding
set foldmethod=indent
" set foldlevel=1
let g:SimpylFold_docstring_preview=1

" Autocomplete Options
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" NERDTree Settings
let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
map <C-\> :NERDTreeToggle<CR>
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" Code Stylings
let python_highlight_all=1

" Full screen HELP only apply to .txt files
augroup HelpInTabs
  autocmd!
  autocmd BufEnter *.txt call HelpInNewTab()
augroup END
" Only apply to help files
function! HelpInNewTab()
  if &buftype == 'help'
    " Convert the help window to a tab...
    execute "normal \<C-W>T"
  endif
endfunction


if has('gui_running')
  syntax on
  set hlsearch
  colorscheme solarized
  set bs=2
  set ai
  set ruler
  set guioptions-=m     " remove menu bar
  set guioptions-=T     " remove toolbar
  " set guioptions-=r     " remove right-hand scroll bar
  set guioptions-=L     " remove left-hand scroll bar
endif

" Set GUI Font
set guifont=Menlo:h16
set background=dark

" remove the .ext~ files, but not the swapfiles
set nobackup writebackup
set noswapfile

" Emmet config
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Better Whitespace strip on Save
autocmd BufWritePre * StripWhitespace

" Highlight JSX in .JS files
let g:jsx_ext_required=0

" Go Development setup
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
