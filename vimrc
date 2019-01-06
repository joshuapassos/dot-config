" - specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nmap <C-p> :FZF<cr>
Plug 'dyng/ctrlsf.vim'
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'eugen0329/vim-esearch'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let NERDTreeShowHidden=1

set nobackup
set nowb
set noswapfile
set encoding=UTF-8

" Change cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let g:esearch = {
  \ 'adapter':          'ag',
  \ 'backend':          'vimproc',
  \ 'out':              'win',
  \ 'batch_size':       1000,
  \ 'use':              ['visual', 'hlsearch', 'last'],
  \ 'default_mappings': 1,
  \}


nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <C-N> :tabnew<CR>
nnoremap <C-Q> :q<CR>
nnoremap <C-B> :NERDTreeFocusToggle<CR>

set t_Co=256
set termguicolors
set number
set background=dark

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Load NerdTree
" Ensure NERDTree is open
" function! s:isOpen()
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" Reveal NERDTree file on open it
" function! s:reveal()
"  if &modifiable && s:isOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction

"au VimEnter * NERDTree
"au BufEnter * call s:reveal()




" Save with <C-S> and update git gutter
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
                           \|:GitGutter
nnoremap <silent> <C-S> :<C-u>Update<CR>

let g:airline#extensions#tabline#enabled = 1

" Git gutter symbols and colors
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_modified = '~~'
hi GitGutterAdd ctermfg=34 ctermfg=White guifg=#FFFFFF guibg=#2ECC71 cterm=Bold
hi GitGutterDelete ctermbg=161 ctermfg=White guifg=#FFFFFF guibg=#E74C3C cterm=Bold
hi GitGutterChange ctermbg=32 ctermfg=White guifg=#FFFFFF guibg=#2980B9 cterm=Bold

" TypeScript
let g:tsuquyomi_completion_detail = 1
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:tsuquyomi_disable_quickfix = 1

" Mouse support
if has('mouse')
  set mouse=a
endif


augroup tslint
  function! s:typescript_after(ch, msg)
    let cnt = len(getqflist())
    if cnt > 0
      echomsg printf('[Tslint] %s errors', cnt)
    endif
  endfunction
  let g:tslint_callbacks = {
    \ 'after_run': function('s:typescript_after')
    \ }

  let g:tsuquyomi_disable_quickfix = 1

  function! s:ts_quickfix()
    let winid = win_getid()
    execute ':TsuquyomiGeterr'
    call tslint#run('a', winid)
  endfunction

  autocmd BufWritePost *.ts,*.tsx silent! call s:ts_quickfix()
  autocmd InsertLeave *.ts,*.tsx silent! call s:ts_quickfix()
augroup END


" Tabs
hi TabLine guibg=#333333 guifg=#CCCCCC
hi TabLineSel guibg=#2980B9 guifg=#FFFFFF cterm=Bold


" Focus on editor instead of NerdTree
" au VimEnter * wincmd p

" Kill trailing whitespace on save
" au BufWritePre * StripWhitespace

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Themes
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'liuchengxu/space-vim-dark'

" Install TypeScript plugins
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/vim-dtsm'
Plug 'mhartington/vim-typings'
Plug 'Valloric/YouCompleteMe'
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf'


if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']


" Plugin to Elm
Plug 'ElmCast/elm-vim'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

colorscheme space-vim-dark

 
