" CVE-2019-12735
set modelines=0
set nomodeline

" encoding
set encoding=UTF-8

" size of tab
set tabstop=4

" size of indent
set shiftwidth=2

" spaces instead of tabs
set expandtab

" turn on line numbers
set number

set nocompatible              " be iMproved, required
filetype off                  " required

" Configure ALE - must be done before ALE is loaded
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
" ruby
" let g:ale_ruby_rubocop_executable = '~/.gem/ruby/2.6.1/bin/rubocop'
" let g:ale_ruby_rubocop_options = '--force-exclusion'
" let g:ale_ruby_ruby_executable = '~/.rubies/ruby-2.6.1/bin/ruby'

" let g:ale_ruby_brakeman_options = ''
" let g:ale_ruby_reek_show_context = 0
" let g:ale_ruby_reek_show_wiki_link = 0

let g:ale_linter_aliases = {
      \'jsx': ['css', 'javascript'],
      \'es6': ['javascript']
\}
let g:ale_linters = {
      \'jsx': ['stylelint', 'eslint'],
      \'javascript': ['standard', 'eslint']
\}
let g:ale_fixers = {
    \'*': ['remove_trailing_lines', 'trim_whitespace'],
    \'javascript': ['standard', 'eslint'],
    \'rust': ['rustfmt'],
    \'go': ['gofmt', 'gofumpt', 'goimports', 'golines', 'gopls'],
\}

" set this to your rtp location
set rtp+=/usr/local/bin/fzf

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " faster fuzzy find files
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
" Plug 'benmills/vimux' " tmux integration
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plug 'tpope/vim-eunuch'         " shell commands
Plug 'tpope/vim-surround'  " surround text object with stuff like brackets
Plug 'vim-airline/vim-airline' " cooler status bar for vi
Plug 'vim-airline/vim-airline-themes' " themes for cool vi status bar
Plug 'vim-scripts/tComment' " easy commenting
Plug 'rizzatti/dash.vim'    " integrate dash
Plug 'dense-analysis/ale' " linter
" Plug 'christoomey/vim-tmux-navigator' " VIM and Tmux integration
Plug 'mileszs/ack.vim' " integration with ack
Plug 'chriskempson/base16-vim' " colorschemes
Plug 'sickill/vim-monokai'  " colorscheme
Plug 'airblade/vim-gitgutter' " git gutter
" Plug 'neoclide/coc.nvim'
" Plug 'ryanoasis/vim-devicons'   " nerdtree icons - nerd fonts
Plug 'mhinz/vim-startify'  " cool start screens

" JavaScript plugins
Plug 'othree/yajs.vim'

" Rails plugins
" Plug 'tpope/vim-bundler'    " bundler
" Plug 'tpope/vim-rails'      " rails
" Plug 'tpope/vim-dispatch'   " async process
" Plug 'janko-m/vim-test'     " test runner

" Golang plugins
Plug 'fatih/vim-go'

" Plug configuration
let g:airline#extensions#tabline#enabled = 1  " turn on airline
let g:airline_theme='bubblegum'

call plug#end()            " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set t_Co=256

" Access colors present in 256 colorspace
let base16colorspace=256

set background=dark
colorscheme monokai
" if unable to find monokai, can use default-dark
" or can use base16 theme below
" colorscheme base16-default-dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Ignore for ctrl-p (fuzzy find files)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Call silver_searcher (ag command, like grep/ack, override Ack)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeNodeDelimiter = "\u00a0"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-o> :NERDTreeToggle<CR>
map ; :Files<CR>
" https://www.reddit.com/r/neovim/comments/petq61/neovim_060_y_not_yanking_line_but_to_end_of_line/
nnoremap Y Y

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Automatically treat .es6 extension files as javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufRead,BufNewFile Vagrantfile setfiletype ruby
