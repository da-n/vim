"----------General----------"

set nocompatible				"Be iMproved, required
so ~/.vim/plugins.vim				"Souce Vundle bootstrap
syntax enable					"Syntax highlighting
let mapleader=','				"The default leader is \ but a comma is better
set backspace=indent,eol,start			"Make backspace behave like other editors


"----------Visuals----------"

set number					"Activate line numbers
let base16colorspace=256			"256 colors
set t_Co=256					"256 colors terminal
colorscheme molokai				"Set theme
set linespace=10				"Set line spaces
set guioptions-=l				"No sidebars
set guioptions-=L				"No sidebars
set guioptions-=r				"No sidebars
set guioptions-=R				"No sidebars

"Set the split colors
hi vertsplit guifg=bg guibg=bg
hi vertsplit ctermfg=000 ctermbg=000

"Set the tab bar colors
hi TabLineFill ctermfg=16 ctermbg=16
hi TabLine ctermfg=240 ctermbg=16
hi TabLineSel ctermfg=240 ctermbg=234


"----------Search----------"

set hlsearch					"Highlight search results
set incsearch					"Show highlighted search results incrementally


"----------Split management----------"

"Splits always open below
set splitbelow

"Splits always open on right
set splitright

"Go to split down
nmap <C-J> <C-W><C-J>

"Go to split up 
nmap <C-K> <C-W><C-K>

"Go to left split
nmap <C-H> <C-W><C-H>

"Go to right split
nmap <C-L> <C-W><C-L>


"----------Mappings----------"

"Make it east to edit the vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <c-N> :NERDTreeToggle<cr>

"CtrlP Buffer Tag
nmap <c-R> :CtrlPBufTag<cr>

"CtrlP recent files
nmap <c-E> :CtrlPMRUFiles<cr>

"Find a tag
nmap <leader>f :tag<space>


"----------Plugins----------"

"/
"/ CtrlP
"/

"Move the CtrlP window to top, order top to bottom, minimum 1, maximum of 30, show 20
let g:ctrlp_match_window='top,order:ttb,min:1,max:30,results:20'

"Ignore files and folders in .gitignore
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']

"/
"/ NERDTree
"/

"Stop NERFTree from taking the dash button
let NERDTreeHijackNetrw=0


"----------Auto-Commands----------"

"Automatically source the vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup end
 
