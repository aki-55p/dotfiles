set nocompatible "vi非互換モード
set shortmess+=I "起動メッセージ非表示

"#######################
" 表示系
"#######################
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示
"タブの代わりに空白文字を挿入する
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set breakindent

"iTerm2 の256色モード反映
set t_Co=256

" 挿入モードでカーソル形状を変更する
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"

" カーソル形状がすぐに元に戻らないのでタイムアウト時間を調整
set ttimeoutlen=10
" 挿入モードを抜けた時にカーソルが見えなくなる現象対策(なぜかこれで治る)
inoremap <ESC> <ESC>

" vim indent guides
colorscheme default " なんか指定しないと怒られる
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=252


"#######################
" プログラミングヘルプ系
"#######################
syntax on "カラー表示

"オートインデント
set autoindent
set smartindent 

" undo の回数
set undolevels=1000


"#######################
" 検索系
"#######################
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
set nohlsearch "検索結果文字列の非ハイライト表示


"#######################
" 文字コード 
"#######################
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileencoding=utf-8
set fileformats=unix,dos,mac


"######################
" 操作系
"######################
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" 前回閉じた時の場所を記憶
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

" esc を C-j に、改行を C-k に
imap <C-j> <C-[>
imap <C-k> <C-m>
vmap <C-j> <C-[>
vmap <C-k> <C-m>

" クリップボードにヤンク
set clipboard+=unnamed
set clipboard+=autoselect
" カーソル位置の単語をyank
nnoremap vv vawy

"######################
" binary mode at once when add -b
"######################
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

"######################
" syntastic config
"######################
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_coffee_checkers = ['coffeelint']

"######################
" vim-easy-motion setting
"######################
" キーマップリセット
let g:EasyMotion_do_mapping = 0

" 上下の移動がしやすい
"noremap <Leader>j <Plug>(easymotion-j)
"noremap <Leader>k <Plug>(easymotion-k)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" easy-motion {char} 2個
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)

" 複数keyでFind Motion
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)

" 小文字でも大文字でもマッチ(大文字で入れた時は大文字のみ)
let g:EasyMotion_smartcase = 1

" マッチした時のアルファベット大文字使う(なんか効いてない？)
let g:EasyMotion_use_upper = 1

" space or <CR> で最初の候補に飛べる
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

"######################
" Quick Run
"######################
let g:quickrun_config = get(g:, 'quickrun_config', {})

" vimproc を使って非同期に実行し，結果を quickfix に出力する
let g:quickrun_config._ = {
            \ 'outputter' : 'quickfix',
            \ 'runner' : 'vimproc'
            \ }

let g:quickrun_config.cpp = {
            \ 'command' : 'clang++',
            \ 'cmdopt' : '-std=c++1y -Wall -Wextra',
            \ }

"######################
" dein
"######################

if &compatible
  set nocompatible
endif

set runtimepath^=~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/dotfiles/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
call dein#add('shougo/unite.vim')
call dein#add('shougo/neocomplete.vim')
call dein#add('vim-scripts/surround.vim')
call dein#add('Lokaltog/vim-easymotion')

" Dash install
call dein#add('rizzatti/funcoo.vim')
call dein#add('rizzatti/dash.vim')

" editorconfig
call dein#add('editorconfig/editorconfig-vim')

" run in vim
call dein#add('thinca/vim-quickrun')

" indent guide
call dein#add('nathanaelkane/vim-indent-guides')

" the_silver_searcher
call dein#add('rking/ag.vim')

" wakatime
call dein#add('wakatime/vim-wakatime')

" syntastic
call dein#add('scrooloose/syntastic.git')

" syntax
call dein#add('slim-template/vim-slim')
call dein#add('digitaltoad/vim-jade')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('kchmck/vim-coffee-script')
call dein#add('leafgarland/typescript-vim')
call dein#add('sudar/vim-arduino-syntax')
call dein#add('sophacles/vim-processing')
call dein#add('toyamarinyon/vim-swift')
call dein#add('elixir-lang/vim-elixir')
call dein#add('tikhomirov/vim-glsl')
call dein#add('wavded/vim-stylus')

call dein#end()

filetype plugin indent on     " Required!

if dein#check_install()
  call dein#install()
endif

"######################
" NeoComplete 
"######################
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] ='\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
                             
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left> neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up> neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down> neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"######################
" filetype 設定 
"######################
"Processing syntax用
au BufNewFile,BufRead *.pde setf processing
"arduino syntax用
au BufNewFile,BufRead *.ino setf arduino

" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" coffee 用インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

" action script syntax highlight
au BufNewFile,BufRead *.as setf actionscript
