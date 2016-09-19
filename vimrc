"----------General----------"

set nocompatible				"Be iMproved, required
so ~/.vim/plugins.vim				"Souce Vundle bootstrap
syntax enable					"Syntax highlighting
let mapleader=','				"The default leader is \ but a comma is better
set backspace=indent,eol,start			"Make backspace behave like other editors
set autowriteall 				"Automatically write the file when switching buffers
set complete=.,w,b,u 				"Set our desired autocompletion matcing.


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
hi vertsplit ctermfg=234 ctermbg=16


"Set the tab bar colors
hi TabLineFill ctermfg=16 ctermbg=16
hi TabLine ctermfg=240 ctermbg=16
hi TabLineSel ctermfg=240 ctermbg=234


"----------Alerts----------"

set noerrorbells visualbell t_vb=		"Disable audible bell


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

"Edit vundle plugin file.
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

"Make it easy to edit snippet files.
nmap <Leader>es :e ~/.vim/snippets/<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Find a tag
nmap <leader>f :tag<space>

"Move entire lines with Alt+k and Alt+J, also works in Visual mode
nnoremap <S-K> :m-2<CR>
nnoremap <S-J> :m+<CR>
inoremap <S-K> <Esc>:m-2<CR>
inoremap <S-J> <Esc>:m+<CR>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>


"----------Plugins----------"

"/
"/ CtrlP
"/

"Move the CtrlP window to top, order top to bottom, minimum 1, maximum of 30, show 20
let g:ctrlp_match_window='top,order:ttb,min:1,max:30,results:20'

"Ignore files and folders in .gitignore
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']

"CtrlP Buffer Tag
nmap <c-R> :CtrlPBufTag<cr>

"CtrlP recent files
nmap <c-E> :CtrlPMRUFiles<cr>

"/
"/ NERDTree
"/

"Stop NERFTree from taking the dash button
let NERDTreeHijackNetrw=0

"Make NERDTree easier to toggle
nmap <c-N> :NERDTreeToggle<cr>

"/
"/ vim-php-namespace
"/

"Import classes (add use statements)
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

"Make class names fully qualified
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>f <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>f :call PhpExpandClass()<CR>


"/
"/ vim-php-cs-fixer
"/
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"----------Laravel-Specfic----------"
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>r :e routes/<cr>
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :e app/<cr>
nmap <Leader><Leader>v :e resources/views/<cr>


"----------Auto-Commands----------"

"Automatically source the vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup end
 
