"### RYU's VIMRC ###

""===== General ====={{{
  "set directory=$HOME/.vim/swap// "swapファイルの保存場所指定
  "set undofile "全てのファイルについて永続アンドゥを有効化
  "if !isdirectory(expand("$home/.vim/undodir"))
  "  call mkdir(expand("$home/.vim/undodir"), "p")
  "endif
  set clipboard=unnamed, "システムクリップボード (*)にコピー
  let mapleader = "\<space>"
""}}}


""===== Display ====={{{
  syntax on "コードに色をつける
  set number "行数表示
  set title "編集中のファイル名の表示
  set showmatch "括弧入力時に対応する括弧を示す
  set wrap "行の折り返し
  set scrolloff=20
  set foldmethod=indent "indent箇所を折りたたんで表示
  set foldlevel=3 "ファイルを開いた時にデフォルトで折りたたむレベル
""}}}


""===== Character, Moving cursor ======{{{
  set fenc=utf-8 "文字コードを指定
  set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
  set autoindent "自動インデント
  set tabstop=4 "tabのの幅設定
  set expandtab
  set shiftwidth=2 "自動的に入力されたインデントの空白をつ2文字に設定
  set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ "不可視文字の指定
  "set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末で行のカーソル移動を可能にする
  set backspace=indent,eol,start "バックスペースでの行移動を可能にする
  autocmd InsertLeave * set nopaste
""}}}


""===== Indent ====={{{
  " ファイルタイプ検出を有効にする
  "filetype on
  filetype plugin indent on
  
  "augroup vimrc
  "    " 以前の autocmd コマンドをクリア
  "    autocmd!
  "
  "    " C/C++/Java 言語系のファイルタイプが設定されたら cindent モードを有効にする
  "    autocmd FileType c,cpp,java  setl cindent
  "    autocmd FileType c,cpp,java  setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround
  "augroup END
""}}}


""===== Search ====={{{
  set ignorecase "大文字/小文字の区別なし
  set smartcase "検索文字列に大文字が入っている場合は区別する
  set wrapscan "最後まで検索したら最初の行に戻る
  set incsearch ""インクリメンタルサーチ
  set hlsearch "検索単語のハイライト
  map <ESC><ESC> :nohlsearch<CR> " 検索結果のハイライトをEsc連打でクリアする
  nnoremap [q :cprevious<CR>      "前へ
  nnoremap ]q :cnext<CR>          "次へ
  nnoremap [Q :<C-u>cfirst<CR>    "最初へ
  nnoremap ]Q :<C-u>clast<CR>     "最後へ
  
  "grep検索の設定
  set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
  set grepprg=grep\ -nh
""}}}


""===== Moving Window ====={{{
  nnoremap s <Nop>
  nnoremap sj <C-w>j
  nnoremap sk <C-w>k
  nnoremap sl <C-w>l
  nnoremap sh <C-w>h
  nnoremap sJ <C-w>J
  nnoremap sK <C-w>K
  nnoremap sL <C-w>L
  nnoremap sH <C-w>H
  nnoremap sr <C-w>r
  "window resizeでは、行頭に数字を入力することで一気にresize可能
  nnoremap s= <C-w>= 
  nnoremap s- <C-w>-
  nnoremap s+ <C-w>+
  nnoremap s< <C-w><
  nnoremap s> <C-w>>
  nnoremap sw <C-w>w
  nnoremap so <C-w>_<C-w>|
  nnoremap sN :<C-u>bn<CR>
  nnoremap sP :<C-u>bp<CR>
  nnoremap st :<C-u>tabnew<CR>
  nnoremap sT :<C-u>Unite tab<CR>
  "nnoremap ss :<C-u>sp<CR>
  "nnoremap sv :<C-u>vs<CR>
  nnoremap sq :<C-u>q<CR>
  nnoremap sQ :<C-u>bd<CR>
  nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
  nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
  
  command! Bd :bp | :sp | :bn | :bd
""}}}


""===== Key Input ====={{{
  "Ctrl+jキーでESCキー
  inoremap <silent> <C-j> <Esc>
  
  " Immediately add a closing quotes or braces in insert mode.
  "inoremap ' ''<esc>i
  "inoremap " ""<esc>i
  "inoremap ( ()<esc>i
  "inoremap { {}<esc>i
  "inoremap [ []<esc>i
  
  "mapping Leader key
  noremap <leader>w :w<cr> 
  noremap <leader>n :NERDTreeToggle<cr> 
  
  "入力モード時のカーソル移動
  "inoremap <C-m> <Down>
  "inoremap <C-,> <Up>
  "inoremap <C-.> <Left>
  "inoremap <C-/> <Right>
  "vnoremap d "_d
  
  "削除と切り取りを明確に使い分ける
  nnoremap d "_d
  vnoremap D "_D
  nnoremap D "_D
  vnoremap x "_x
  nnoremap x "_x
  vnoremap s "_s
  nnoremap s "_s
  nnoremap t d
  vnoremap t x
  nnoremap tt dd
  nnoremap T D

  map <Leader>mn  :MemoNew<CR>
  map <Leader>ml  :MemoList<CR>
  map <Leader>mg  :MemoGrep<CR>

""}}}




""===== Character Encoding ====={{{
  "if &comptable
  "	set nocomptable
  "endif
  set encoding=utf-8
  set fileencodings=utf-8,euc-jp,sjis,utf-8
  set fileformats=unix,dos,mac
""}}}


""===== Tag / Jump =====""{{{
  noremap <leader>] :YcmCompleter GoTo<cr>
  set tags=.tags;$HOME  " Look for a tags file recursively in parent directories.
  
  "## universal-ctags_01
  function! s:execute_ctags() abort
    let tag_name = '.tags'  " 探すタグファイル名
    let tags_path = findfile(tag_name, '.;')  " ディレクトリを遡り、タグファイルを探し、パス取得
    " タグファイルパスが見つからなかった場合
    if tags_path ==# ''  
      return
    endif
  
    let tags_dirpath = fnamemodify(tags_path, ':p:h')  " タグファイルのディレクトリパスを取得
    " 見つかったタグファイルのディレクトリに移動して、ctagsをバックグラウンド実行（エラー出力破棄）
    execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
  endfunction
  
  augroup ctags
    autocmd!
    autocmd BufWritePost * call s:execute_ctags()
  augroup END
  nnoremap <C-l> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
  nnoremap <C-k> :vsplit<CR> :exe("tjump ".expand('<cword>'))<CR>
""}}}


"""====== Row and column highlighting ====={{{
  "" 行を強調表示
  "set cursorline
  "highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
  "" アンダーラインを引く(gui)
  """highlight CursorLine gui=underline guifg=NONE guibg=NONE
  "" 列を強調表示
  "set cursorcolumn
"""}}}


"""====== Plugin Management ====={{{
  "
  let g:plug_timeout = 300  " Increase vim-plug timeout for YouCompleteMe.
  
  "Install vim-plug if it's not already installed (Unix-only).
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
      \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin()  " Manage plugins with vim-plug.
  
  Plug 'ctrlpvim/ctrlp.vim'                                     "Ctrl+pで曖昧検索
  Plug 'easymotion/vim-easymotion'                              "移動コマンド
  Plug 'mileszs/ack.vim'                                        "ack 統合
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }        "vim上でディレクトリの参照
  Plug 'tpope/vim-unimpaired'                                   "一連の便利なショートカット
  Plug 'tpope/vim-vinegar'                                      " - でnetrwを開く
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }       "補完プラグイン
  Plug 'sjl/gundo.vim'                                          "アンドゥツリーの可視化
  Plug 'tpope/vim-fugitive'
  Plug 'christoomey/vim-tmux-navigator'                         "tmuxとの統合
  Plug 'tpope/vim-dispatch'
  Plug 'janko-m/vim-test'                                       "テスト検証のプラグイン
  "Plug 'vim-syntastic/syntastic' "pythonファイルのシンタクスチ  ク. 追加すると少し処理が重くなる
  Plug 'vim-scripts/ScrollColors'                               "カラースキーム
  Plug 'flazz/vim-colorschemes'                                 "カラースキーム
  Plug 'vim-airline/vim-airline'                                "ステータスラインの表示
  Plug 'puremourning/vimspector'                                "Debugger
  Plug 'cohama/lexima.vim'                                      "括弧自動補完
  Plug 'justmao945/vim-clang'                                   "c/c++ 補完
  Plug 'pangloss/vim-javascript'                                "javascript sysntax highlight
  Plug 'leafgarland/typescript-vim'
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}               "Rust コード補完 構文チェック
  Plug 'glidenote/memolist.vim'                                 "vim メモプラグイン
  
  call plug#end()
  packloadall  "全てのプラグインをロードする
  silent! helptags ALL  "すべてのプラグインようにヘルプファイルをロードする
  " 保存し終えたら :w | source $MYVIMRC | PlugInstall
  
  
  "" === NERDTree === {{
    "autocmd VimEnter * NERDTree     " Enable NERDTree on Vim startup.
    " Autoclose NERDTree if it's the only open window left.
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
       \ b:NERDTree.isTabTree()) | q | endif
  ""}}
  
  "" === YouCompleteMe === {{
    let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
    let g:ycm_auto_trigger = 1
    let g:ycm_min_num_of_chars_for_completion = 3
    let g:ycm_autoclose_preview_window_after_insertion = 1
    set splitbelow
  ""}}
  
  "" === Gundo === {{
    noremap <f5> :GundoToggle<cr>  " Map Gundo to <F5>.
    let g:gundo_prefer_python3 = 1
  ""}}
  
  "" === vim-Test === {{
    let test#strategy = "dispatch"
  ""}}
  
  "" === Syntastic === {{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_pylint_exe = 'pylint3'
  ""}}

  "" === Rust === {{
    let g:rustfmt_autosave = 1
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300
    
    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif
    
    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
  ""}}
  
"""}}}


"""====== Build ====={{{
  " Use :make to run pylint for Python files.
  autocmd filetype python setlocal makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
  autocmd filetype python setlocal errorformat=%f:%l:\ %m
"""}}}


"""====== ColorScheme ====={{{
  set t_Co=256
  set background=dark
  colorscheme PaperColor
  " show colorscheme list "
  ":colorscheme ctrl+D"
  
  " - my favorite colorscheme list - "
  " darkblue, 
"""}}}


""==============================================================================
