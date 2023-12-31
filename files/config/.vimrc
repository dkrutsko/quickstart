
""----------------------------------------------------------------------------""
"" Vimrc                                                                      ""
""----------------------------------------------------------------------------""

" Download and install vim-plug if required
if empty (glob ('~/.vim/autoload/plug.vim'))
	silent !curl -sSLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

""----------------------------------------------------------------------------""

" Specify a directory for plugins
call plug#begin ('~/.vim/bundle')

" Install support for editor config
Plug 'editorconfig/editorconfig-vim'

" Enable multiple-cursor capability
Plug 'terryma/vim-multiple-cursors'

" Enable Unix commands
Plug 'tpope/vim-eunuch'

" Install an alignment helper
Plug 'junegunn/vim-easy-align'

" Visualizable history
Plug 'mbbill/undotree'

" Better character pairs
Plug 'tpope/vim-surround'

" Better repeat command
Plug 'tpope/vim-repeat'

" Better comment/uncomment
Plug 'tpope/vim-commentary'

" Better Git integration
Plug 'tpope/vim-fugitive'

" Include statusline/tabline
Plug 'itchyny/lightline.vim'

" Show the list of buffers
Plug 'bling/vim-bufferline'

" More sensible defaults
Plug 'tpope/vim-sensible'

" Add a Molokai theme
Plug 'tomasr/molokai'

" Initialize plugin system
call plug#end()

""----------------------------------------------------------------------------""

" Ensure editor config plugin works well with Fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

""----------------------------------------------------------------------------""

" Some EasyAlign bindings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""----------------------------------------------------------------------------""

" 256 colors
set t_Co=256

" Improve the theme colors
if (has ('termguicolors'))
	set termguicolors
endif

" Use Molokai color scheme
silent! colorscheme molokai

""----------------------------------------------------------------------------""

" Directories
set directory=~/.vim/tmp/swap
if (!isdirectory (&directory))
	call mkdir (&directory, 'p')
endif

set backupdir=~/.vim/tmp/backup
if (!isdirectory (&backupdir))
	call mkdir (&backupdir, 'p')
endif

set undodir=~/.vim/tmp/undo
if (!isdirectory (&undodir))
	call mkdir (&undodir, 'p')
endif

""----------------------------------------------------------------------------""

" General
set modelines=0		" Disable mode lines to improve security
set belloff=all		" Disable the constant annoying beeping
set nowrap			" Disable use of automatic text wrapping
set number			" Ensure line numbers are on by default
set numberwidth=5	" Support at least 4-digit line numbers
set ttyfast			" Improve general scrolling performance
set showmode		" Display input or replace mode at bottom
set showcmd			" Display the current command being used
set undofile		" Save all undo info to an external file
set title			" Show filename in the terminal title bar
set paste			" Use the paste mode as default behavior
set hidden			" Ensure hidden buffers are always shown

" Searching
set showmatch		" Highlight any matching bracket pairs
set matchpairs+=<:>	" Make sure angle brackets are matched
set hlsearch		" Highlight any matching search patterns
set ignorecase		" Use case-insensitive as the default
set smartcase		" Uppercase search when using uppercase

" Whitespace
set showbreak=↪		" Visualize all the break characters
set tabstop=4		" The number of spaces a tab counts for
set softtabstop=4	" The number of spaces when tab is used
set shiftwidth=4	" The number of spaces to indent with
set noexpandtab		" Don't use spaces to represent a tab

" Set characters which will help visualize the whitespaces
set listchars=tab:»\ ,trail:·,extends:>,precedes:<,space:·

" Ignoring
set wildignore+=*/tmp/*,tmp/**,.git/**,.gitkeep,.hg/**,.svn/**,*.DS_Store
set wildignore+=*.swp,*.tmp,*.lock,*.dll,*.so,*.rar,*.tar,*.zip
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpeg,*.jpg,*.pdf,*.png,*.psd,*.svg
set wildignore+=*.eof,*.eot,*.otf,*.ttf,*.woff,*.woff2,*.mp4

" Shortcuts
" Bind F2 to toggle insert paste mode
nnoremap <F2> :set paste!<CR>

" Bind F3 to toggle whitespace display
nnoremap <F3> :set list!<CR>

" Bind F5 to toggle undo tree sidebar
nnoremap <F5> :UndotreeToggle<CR>

" Bind F6 to toggle the line numbers
nnoremap <F6> :set number!<CR>

" Bind F2 to toggle insert paste mode
set pastetoggle=<F2>
