
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename: init.vim
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
set runtimepath+=/Users/pavloko/.config/nvim/repos/github.com/Shougo/dein.vim
call dein#begin(expand('/Users/pavloko/.config/nvim')) " plugins' root path
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

" --- Tools
" ---------------------------------------
call dein#add('vim-airline/vim-airline')
call dein#add('scrooloose/nerdtree', {'om_cmd': 'NERDTreeToggle'})
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('ctrlpvim/ctrlp.vim') " Quick fileopen via CTRL+P
call dein#add('neomake/neomake')
call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
call dein#add('zchee/deoplete-jedi')
call dein#add('zchee/deoplete-go', {'build': 'make'},{'on_ft': 'go'})
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('altercation/vim-colors-solarized')  " Theme
call dein#add('tpope/vim-surround')
call dein#add('Yggdroot/indentLine')
call dein#add('Raimondi/delimitMate', {'on_ft': ['javascript', 'typescript', 'css', 'styl', 'scss', 'jsx']})
call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})

" --- Git
" ---------------------------------------
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('Xuyuanp/nerdtree-git-plugin')

" --- Syntax
" ---------------------------------------
call dein#add('elzr/vim-json', {'on_ft': 'json'})
call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})

" --- Web Development
" ---------------------------------------
call dein#add('mattn/emmet-vim', {'on_ft': 'html'})
call dein#add('valloric/matchtagalways', {'on_ft': 'html'})   " Shows current tag in HTML
call dein#add('hail2u/vim-css3-syntax', {'on_ft': ['css', 'scss', 'sass', 'styl']})
call dein#add('wavded/vim-stylus', {'of_ft': 'styl'})
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('alampros/vim-styled-jsx')
call dein#add('othree/javascript-libraries-syntax.vim')
call dein#add('1995eaton/vim-better-javascript-completion', {'on_ft': ['javascript']})
call dein#add('Quramy/tsuquyomi', {'on_ft': 'typescript'})
call dein#add('leafgarland/typescript-vim')

call dein#end()
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
set background=dark
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized   " set colorscheme

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
" 04. Vim Theme
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
" set lazyredraw            " Optimize performace
" set ttyfast

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
" NVIM Settings
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Jump tp last cursor position when opening a file
" dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
      end
endfunction

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
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

" NERDTree Settings
let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
map <C-\> :NERDTreeToggle<CR>

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

" remove the .ext~ files, but not the swapfiles
set nobackup writebackup
set noswapfile

" Emmet config
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall   " only css and html

" Highlight JSX in .JS files
let g:jsx_ext_required=0

" Tern Settings
set omnifunc=syntaxcomplete#Complete
let g:tern_map_keys = 1
let g:tern_show_arguments_hints = 'on_hold'

" Fugitive Settings
:set diffopt+=vertical

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:loaded_python_provider = 1
" Deoplete-jedi
let g:deoplete#sources#jedi#show_docstring = 1
autocmd CompleteDone * pclose! " Close preview after complete is done
let g:python_host_prog = '/usr/local/bin/python'
" let g:python2_host_prog = '/usr/local/bin/python2.7'
let g:python3_host_prog = '/usr/local/bin/python3.6'
let g:neomake_python_enabled_makers = ['flake8']

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Tell Neosnippet about the other snippets
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippet'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" Typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript

" Neomake
autocmd! BufWritePost,BufEnter * Neomake

" Git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72

