set nocompatible

set termguicolors
set t_Co=256
set encoding=utf8

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/dein')
	call dein#begin('~/.config/nvim/dein')

	" Let dein manage dein
	" Required:
	call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

	call dein#add('morhetz/gruvbox')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('raymond-w-ko/vim-lua-indent')
	call dein#add('nathanaelkane/vim-indent-guides')
	call dein#add('ntpeters/vim-better-whitespace')
	call dein#add('ciaranm/securemodelines')
	call dein#add('beyondmarc/glsl.vim')
	call dein#add('octol/vim-cpp-enhanced-highlight')
    "call dein#add('tbastos/vim-lua')
	call dein#add('rust-lang/rust.vim')
	call dein#add('mattn/webapi-vim')
	call dein#add('ervandew/supertab')
    call dein#add('powerman/vim-plugin-AnsiEsc')
    call dein#add('lervag/vimtex')

	call dein#end()

	call dein#save_state()
endif

" Required:
filetype plugin indent on
" Which one?
syntax enable
syntax on

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

let g:airline_powerline_fonts=1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"

colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

set background=dark

highlight clear SignColumn

let mapleader = "\\"

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab
set smartindent

set mousehide
if has("mouse")
	set mouse=a
endif

set nowrap
set linebreak
set textwidth=0

set completeopt+=longest,menuone

set spelllang=en_us

" map spellcheck
map <F7> :setlocal spell!<CR>

" map paste togle
" map set pastetoggle=<F8>
set pastetoggle=<F8>

" map wrap toggle
map <F9> :call ToggleWrap()<CR>
function ToggleWrap()
	if (&wrap == 1)
		set nowrap
		set fo-=ta
		set textwidth=0
	else
		set wrap
		set fo+=ta
		set textwidth=80
	endif
endfunction

autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
autocmd FileType text setlocal spell
autocmd FileType rst setlocal spell

" map Buffers
nmap <silent> <Leader>n :enew<CR>
nmap <silent> <Leader>; :bnext<CR>
nmap <silent> <Leader>j :bprevious<CR>
" map close buffer
nmap <silent> <Leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nmap <silent> <Leader>Q :bp<bar>sp<bar>bn<bar>bd!<CR>
" map Tabs
nmap <silent> <Leader>tn :tabe<CR>
nmap <silent> <Leader>tl :tabn<CR>
nmap <silent> <Leader>th :tabp<CR>
" map close tab
nmap <silent> <Leader>tq :tabclose<CR>

nmap <leader>t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>t3 :set expandtab tabstop=3 shiftwidth=3 softtabstop=3<CR>
nmap <leader>t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

set number

set scrolloff=3
set sidescrolloff=3

set incsearch
set ignorecase
set smartcase
set hlsearch
set showmatch

set showtabline=2

set ttyfast

set noswapfile

set showmode
set showbreak=>\

set laststatus=2

set hidden
set showcmd
set autoread

set clipboard+=unnamedplus

set nobackup
set noswapfile
set colorcolumn=80,100,120

set tags=tags;

set splitbelow
set splitright

" Other Shortcuts - "cat ~/.config/nvim/init.vim | grep map" for all keys
" map :ts show tag list
" map :tf/:tl show first/last tag
" map :tn/:tp show next/prev tag
" map splits
" map :[v]sp [vertical] split
" map :n open buffer in window
" map Windows
" map <C-W>-[hjkl] change window
" map <C-W>-T move to a new tab
" map <C-W>-[rR] slide from left to right (or reverse)
" map <C-W>-[HJKL] move to that edge
" map <C-W>-o close other windows
" map <C-W>-q close window
" map <C-W-[=><-+] change window size

set foldmethod=syntax

set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep
set grepformat=%f:%l:%c:%m,%f:%l:%m

"augroup DebugGroup
"  autocmd!
"  autocmd BufAdd      * :call s:Debug('BufAdd')
"  autocmd BufCreate   * :call s:Debug('BufCreate')
"
"  autocmd BufDelete   * :call s:Debug('BufDelete')
"  autocmd BufWipeout   * :call s:Debug('BufWipeout')
"  autocmd BufFilePre   * :call s:Debug('BufFilePre')
"  autocmd BufFilePost   * :call s:Debug('BufFilePost')
"  autocmd BufEnter   * :call s:Debug('BufEnter')
"  autocmd BufLeave   * :call s:Debug('BufLeave')
"  autocmd BufWinEnter   * :call s:Debug('BufWinEnter')
"  autocmd BufWinLeave   * :call s:Debug('BufWinLeave')
"  autocmd BufUnload   * :call s:Debug('BufUnload')
"  autocmd BufHidden   * :call s:Debug('BufHidden')
"  autocmd BufNew   * :call s:Debug('BufNew')
"  autocmd FileType   * :call s:Debug('FileType')
"  autocmd Syntax   * :call s:Debug('Syntax')
"augroup END

function! s:Debug(message) abort
        silent execute '!echo '.a:message.' '.bufnr("%").' >> debug'
endfunction

autocmd FileType rust,c,cpp,h,hpp,py,vim,javascript,xml,html,txt,glsl*,lua autocmd BufEnter <buffer> EnableStripWhitespaceOnSave

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey19
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey23

" Auto complete
set complete=.,b,u,],kspell

let g:asyncomplete_remove_duplicates = 1
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" map next spelling word
nmap <silent> <Leader>s ]sz=

" Cpp highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

autocmd VimEnter,Colorscheme * :hi cCustomScope guifg=PaleVioletRed1
autocmd VimEnter,Colorscheme * :hi cCustomClass guifg=violet
autocmd VimEnter,Colorscheme * :hi cCustomMemVar guifg=SeaGreen1

autocmd FileType cpp,c source ~/.config/nvim/syntax/vulkan1.0.vim

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap h ;
noremap j h
noremap k j
noremap l k
noremap ; l

noremap <C-W>h <C-W>;
noremap <C-W>j <C-W>h
noremap <C-W>k <C-W>j
noremap <C-W>l <C-W>k
noremap <C-W>; <C-W>l

" Mupdf
let g:vimtex_view_method = 'mupdf'
let g:tex_flavor = 'latex'
let g:matchup_matchparen_deferred = 1
let g:vimtex_view_use_temp_files = 1
