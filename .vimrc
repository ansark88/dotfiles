autocmd!
syntax on
set number
set hlsearch
set wrapscan
"set autoindent
set expandtab
"set tabstop=4
set softtabstop=4
set cindent	   "C言語特価のインデントスタイル helpでcinoptions-valuesを読もう
set incsearch
set backspace=eol,indent,start
set textwidth=0		"0は無効です
set shiftwidth=4
set listchars=tab:>-
" バッファを保存しなくても他のバッファを表示できるようにする
set hidden
 " バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
set confirm
set visualbell t_vb=
set noerrorbells
set iminsert=0	"InsertModeでIMEをOFF(0)にする
set iskeyword+=- " ハイフンは単語の一部として扱う

set clipboard=unnamed,autoselect

"backupの設定
set backup
set backupdir=$HOME/.vim/backup
let &directory = &backupdir

"Undoファイルの置き場
set undodir=$HOME/.vim/undo
        
"vimdiff色
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

"**************** NeoBundle Setting ***************
" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath+=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
"Bundle 'gmarik/vundle'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'unite.vim'
"NeoBundle 'thinca/vim-quickrun'
" Bundle 'ref.vim'
NeoBundle 'ag.vim'
NeoBundle 'taglist.vim'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make',
			\     'linux' : 'make',
			\     'unix' : 'gmake',
			\    },
			\ }
NeoBundle 'YankRing.vim'
NeoBundle 'othree/eregex.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
"Bundle 'Align'
"Bundle 'h1mesuke/vim-alignta'
"Bundle 'w3m.vim'
"Bundle 'mileszs/ack.vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'scrooloose/nerdtree.git'

"color scheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'altercation/vim-colors-solarized.git'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

"******************: NeoBundle SettingEnd ************

"NERD-Commenter.vim
" コメントした後に挿入するスペースの数
let NERDSpaceDelims = 1
" キーマップの変更。<Leader>=\+cでコメント化と解除を行う。
" コメントされていれば、コメントを外し、コメントされてなければコメント化する。
" Leaderは\のことです
nmap <Leader>c <Plug>NERDCommenterToggle		
vmap <Leader>c <Plug>NERDCommenterToggle

"ack.vim
"let g:ackprg="C:\\Perl\\bin\\ack.pl -H --nocolor --nogroup --column"

"ag.vim
let g:ag_prg="C:\\bin\\ag.exe"

"w3m.vim
"let g:w3m#command = 'D:\\cygwin\\bin\\w3m.exe'

" gtags
    " 検索結果Windowを閉じる
    nnoremap <C-q> :cclose<CR>
    " Grep 準備
    nnoremap <C-g> :Gtags -g
    " このファイルの関数一覧
    nnoremap <C-l> :Gtags -f %<CR>
    " カーソル以下の定義元を探す
    nnoremap <C-j> :Gtags <C-r><C-w><CR>
    " カーソル以下の使用箇所を探す
    nnoremap <C-k> :Gtags -r <C-r><C-w><CR>
	"カーソル以下を検索する
	nnoremap <C-c> :GtagsCursor <CR>

" TagList.vim
let Tlist_Show_One_File = 1
nmap <Leader>t :TlistToggle<CR>

 " My Bundles here:
"neocomplcache.vim
" 大文字小文字を区別する
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:NeoComplCache_SmartCase = 1
" キャメルケース補完を有効にする
let g:NeoComplCache_EnableCamelCaseCompletion = 0
" アンダーバー補完を有効にする
let g:NeoComplCache_EnableUnderbarCompletion = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"Align.vim
"let g:Align_xstrlen = 3
"let g:DrChipTopLvlMenu = ''

"alignta.vim
"let g:alignta_default_options = '<--1:1'
"vnoremap ,al :<C-u>alignta <--

"unite.vim
"バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,uu :<C-u>Unite file_mru<CR>
" Unite Outline
nnoremap <silent> ,uo : <C-u>Unite -no-quit -vertical -winwidth=30 outline<CR>
" grep検索
nnoremap <silent> ,ug  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
"FuzzyFinder.vim

let g:unite_source_grep_recursive_opt = '-r'

nnoremap <silent> ,fb :<C-u>tabnew<CR>:tabmove<CR>:FufBuffer!<CR>
nnoremap <silent> ,ff :<C-u>tabnew<CR>:tabmove<CR>:FufFile! <C-r>=expand('#:~:.')[:-1-len(expand('#:~:.:t'))]<CR><CR>
nnoremap <silent> ,fm :<C-u>tabnew<CR>:tabmove<CR>:FufMruFile!<CR>
nnoremap <silent> ,fr :<C-u>tabnew<CR>:tabmove<CR>:FufFile **/<CR>

"ptコマンドでunite-grepをかかける
"if executable('pt')
"  let g:unite_source_grep_command = 'pt'
"  "let g:unite_source_grep_default_opts = '--nogroup --nocolor'
"  let g:unite_source_grep_default_opts = '/nogroup /nocolor'
"  let g:unite_source_grep_recursive_opt = ''
"endif

"YankRing.vim
nnoremap <silent> ,yy :<C-u>YRShow<CR>
let g:yankring_max_history = 20
let g:yankring_window_heig= 7

"NERDTree.vim
nnoremap <Leader>p :NERDTreeToggle<CR>

"vimの流儀より <C-u>はcountの誤作動防止 exコマンドの入力内容をリセット
"autocmdのリセット
filetype plugin indent on 
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>
"nnoremap <C-h> :<C-u>help<Space>
"nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

"最終変更テキストの選択
nnoremap gc `[v`]
vnoremap :<C-u>normal gc<Enter>
onoremap :<C-u>normal gc<Enter>

"開いたバッファのカレントディレクトリへ移動,au!はauの上書き、cd.vimを無効に
":au! BufEnter *.html,*.erb,*.rb execute ":lcd " . expand("%:p:h")

"zencoding.vim"
"let g:user_zen_expandabbr_key = '<c-e>'  

"function vimgrep
"function Mygrep(stext,path)
"	:vimgrep /g:stext/ g:path | cwin
"endfunction

function! Testvim()
	put = 'hello world'
endfunction 

"行末移動して選択文字列を挿入
function! MakeMacroHeader()
	let cw = expand('<cword>')
	:normal $a		
	put = l:cw
endfunction

"ハイライトをESC連打で消す
nnoremap <ESC><ESC><ESC> :nohlsearch<CR>

"Beep音を消す
"set visualbell t_vb=

"cd.vim
":source $VIMRUNTIME/macros/cd.vim

"<C-Space>でomni補完
imap <C-Space> <C-x><C-o>

"ペースト時のインデント無効に
"set paste

"加算を10進数で行う
set nrformats-=octal

"ステータスライン常時表示
set laststatus=2
set showcmd

"文字コード、改行コード、gitのブランチ()表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%{fugitive#statusline()}%=%l,%c%V%8P

"	検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

"UTF-8で全角文字の文字幅を調整する
set ambiwidth=double

"jkで物理行移動できるように
   nnoremap j gj
   nnoremap k gk

"改行コード自動認識
set fileformats=unix,dos,mac

"以下のコマンド実行結果をQucifixで自動的に開く
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

nnoremap ,,   <C-w><C-w>
nnoremap ,cc  :tabclose<CR>
nnoremap <F4> :Ag <cword><CR>
nnoremap <F5> :cd %:h<CR>

"CRを含まないで行ヤンク
nnoremap dy	  0y$   

"C言語の左辺と右辺を切り替える
nnoremap ,sw :s/\([ \t]*\)\(.*[^ \t]\)\([ \t]*=[ \t]*\)\([^ \t]*[^;]\)\(;\)/\1\4\3\2\5/g<CR>:noh<CR>
vnoremap ,sw :s/\([ \t]*\)\(.*[^ \t]\)\([ \t]*=[ \t]*\)\([^ \t]*[^;]\)\(;\)/\1\4\3\2\5/g<CR>:noh<CR>

"邪魔なのでF1無効
nnoremap <F1> jk
inoremap <F1> <Space><BS>  
vnoremap <F1> jk

"http://qiita.com/hachi8833/items/7beeee825c11f7437f54
inoremap <silent> jj <ESC>

"http://qiita.com/rita_cano_bika/items/2ae9c8304f8f12b1b443より
"xで消した時にヤンクレジスタに保存しない
nnoremap x "_x
"
" ---コマンドモード---
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

"gtags
nnoremap ,gg :!gtags -v<CR>

"Qucikfixの過去リスト移動
map <F7> :col<CR>
map <F8> :cnew<CR>

map <F9> :noh<CR>
" ^jでコマンドモードに戻る
"map! <C-j> <C-[>
filetype on
filetype plugin indent on     " required!

