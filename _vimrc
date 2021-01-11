"==== gvim默认设置 ===========================================================================
set nocompatible "关闭  vi兼容模式
source $VIMRUNTIME/vimrc_example.vim
""""source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"==== Vundle插件配置 =========================================================================
 "set nocompatible               " be improved
 "filetype off                   " required! 必要的！

 set rtp+=$VIM\vimfiles\plugged\vim-plug
 call plug#begin('$VIM/vimfiles/plugged')

 " vim-plug自带更新功能，不需要纳入插件

 " My Bundles here 自定义的插件:
 "
 " original repos on github 来自github上的插件（格式：Bundle '作者名/插件名')
 " vim-scripts repos 官方的Vim-scripts(格式：Bundle '插件名')
 " non github repos 来自非github上的插件(格式：Bundle 'git://完整的URL')

 " 来自用户的自定义插件在此行后添加

 Plug 'vimcn/vimcdoc', {'branch' : 'release'}
 " Vim中文文档
 set helplang=cn " 配置帮助语言为中文

 " 文件树管理
 Plug 'scrooloose/nerdtree'
 let NERDTreeWinSize=36
 " 让nerdTree在最后一个buffer窗口关闭时，不让其缩放
 "Plug 'oblitum/bufkill'
 " 生成函数变量列表，比TagList好用
 Plug 'majutsushi/tagbar'
 let Tlist_Use_Right_Window=1
 let g:tagbar_left=0
 " 注释代码的插件
 Plug 'tpope/vim-commentary'
 " 搜索目录下的文件，类似Command-T，但是不依赖ruby，轻量级
 Plug 'kien/ctrlp.vim'
 " 生成成对的(),[],{},"",''
 Plug 'jiangmiao/auto-pairs'
 let g:AutoPairsFlyMode = 0
 let g:AutoPairsShortcutBackInsert = '<M-b>'
 " 在成对的(),[],{},"",''符号及之间进行操作
 Plug 'tpope/vim-surround'
 " 界面美化(tab,提示框,状态条)
 Plug 'vim-airline/vim-airline'
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#tab_nr_type = 1
 let g:airline#extensions#tabline#show_tab_nr = 1
 let g:airline#extensions#tabline#formatter = 'short_path'
 let g:airline#extensions#tabline#buffer_nr_show = 0
 let g:airline#extensions#tabline#fnametruncate = 16
 let g:airline#extensions#tabline#fnamecollapse = 2
 let g:airline#extensions#tabline#buffer_idx_mode = 1
 set t_Co=256
 Plug 'vim-airline/vim-airline-themes'
 let g:airline_theme='dracula'
 " 彩虹括号对
 Plug 'kien/rainbow_parentheses.vim'
 Plug 'Shougo/neocomplcache'
 let g:neocomplcache_force_overwrite_completefunc=1
 let g:neocomplcache_enable_at_startup = 1
 let g:neocomplcache_enable_smart_case = 1
 let g:neocomplcache_enable_camel_case_completion = 1
 let g:neocomplcache_enable_underbar_completion = 1
 let g:neocomplcache_min_syntax_length = 0
 " 在.cpp和.h中跳转
 Plug 'vim-scripts/a.vim'
 " 填补clang_complete的其它语言
 ""Bundle 'oblitum/clang_complete'
 ""let g:clang_complete_auto=1  " 开启自动补全(默认：1)
 ""let g:clang_complete_copen=1 " 在检测到错误之后打开快速修复窗口(默认：0)
 ""let g:clang_hl_errors=1      " 以clang的方式高亮警告和错误(默认：1)
 ""let g:clang_periodic_quickfix=0  " 周期性更新快速修复窗口(默认：0)
 ""let g:clang_snippets=1       " 开启snippets补全(默认:0)
 ""let g:clang_conceal_snippets=1   " 使用Vim的conceal特征隐藏<#和#>,从而界定代码片段(默认:1)
 ""let g:clang_library_path="F:\Vim\vimfiles\Bundle\clang_complete" " 设置libclang.dll的路径
 ""let g:clang_use_library=1    " 使用libclang.dll加速
 ""set conceallevel=2           " 见帮助文档
 ""set concealcursor=vin        " 见帮助文档
 ""set completeopt=menu,menuone " 见帮助文档
 ""set pumheight=11             " 见帮助文档
 " 解决clang_complete和neocomplcache的冲突
 ""Bundle 'osyo-manga/neocomplcache-clang_complete'
 " 填补clang_complete的其它语言
 Plug 'Shougo/neocomplcache'
 let g:neocomplcache_force_overwrite_completefunc=1
 let g:neocomplcache_enable_at_startup = 1
 let g:neocomplcache_enable_smart_case = 1
 let g:neocomplcache_enable_camel_case_completion = 1
 let g:neocomplcache_enable_underbar_completion = 1
 let g:neocomplcache_min_syntax_length = 0
 " Sublime Text 的多重选取特性
 Plug 'terryma/vim-multiple-cursors'
 " Zen-Coding html/css快捷插件
 Plug 'mattn/emmet-vim'
 " 缩进对其线
 Plug 'Yggdroot/indentLine'
 let g:indentLine_char = '|'
 let g:indentLine_color_gui = '#666666'
 " Base64编解码插件
 Plug 'christianrondeau/vim-base64'
 " 快速定位插件
 Plug 'easymotion/vim-easymotion'

 silent! call plug#end()
 "filetype plugin indent on     " required! 必要的！
 "
 " Brief help vim-plug常用指令
 " :PlugList          - list configured bundles 列出已安装的插件
 " :PlugInstall(!)    - install(update) bundles 安装(升级)所有配置文件中的插件
 " :PlugSearch(!) foo - search(or refresh cache first) for foo
 " 查找(先刷新缓存)foo
 " :PlugClean(!)      - confirm(or auto-approve) removal of unused bundles
 " (自动)删除未在_vimrc中定义的插件
 "
 " NOTE: comments after Bundle command are not allowed..

"==== tags配置 ===============================================================================
set tags=tags,.\tags;
set autochdir

"==== 键盘映射 ===============================================================================
" <Leader>绑定
let mapleader=","
"窗口切换
"nnoremap <C-Tab> <C-w><C-w>
nnoremap <C-Tab> :bn<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"自动补全
 "<Tab>键为向下选择；<S-Tab>键为向上选择
inoremap <expr><Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
"用ctags生成tags
nnoremap <F11> :!ctags<Space>-R<Space>--c++-kinds=+px<Space>--fields=+iaS<Space>--extra=+q<CR>
nnoremap <F12> :!ctags<Space>-R<Space>--python-kinds=-i<CR>
"qmake编译
nnoremap <C-F9> :!qmake -project<CR>
nnoremap <F9> :!qmake<CR>
"make编译
nnoremap <F6> :copen<CR>:make<CR>
nnoremap <S-F4> :!explorer debug<CR>
nnoremap <C-F4> :!explorer release<CR>
"g++编译
nnoremap <F5> :!g++ -o %:r.exe %<CR>:!%:r.exe<CR>
nnoremap <C-F5> :!g++ -static -o %:r.exe %<CR>:!%:r.exe<CR>
" json格式化
nnoremap <F2> :%!java -jar D:/Vim/tools/json.jar<CR>
"tag跳转
nmap <C-BS> <C-t>
nmap <C-CR> <C-]>
"高亮与选中单词相同的单词
nnoremap <C-i> #*

"==== VIM设置 ================================================================================
winpos 32 64        		      " 设置窗口位置
set lines=40 columns=128	          " 设置窗口长宽
set colorcolumn=91                " 设置行边界高亮
set guioptions=m                  " 仅显示菜单栏
set guifont=Consolas:h11:cANSI  " 设置字体
colorscheme desert		              " 设置配色方案
set wrap                          " 禁用 自动折行(仅显示效果行不超出vim窗体宽度)
set textwidth=0                     " 自动换行长度(0位不自动换行)
set number		                  " 显示行号
set norelativenumber                " 不显示相对行号
set nobackup        		      " 禁用  自动备份
set noundofile                  " 禁用 生成撤销动作文件
set nocompatible        	      " 禁用  vi的键盘模式，而是vim自己的
set fileencoding=utf-8            " 设置默认字符编码为utf-8(UCS-BOM是带BOM的utf-8)
set fileencodings=ucs-bom,utf-8,shift_jis,cp936,gb18030,big5 "设置字符编码检测顺序(cp936=GBK)
filetype plugin indent on         " 启动  文件类型检测
set syntax=on       		      " 启用  语法高亮
set confirm         		      " 在处理未保存或只读文件的时候，弹出确认
"set cindent         		      " C缩进结构
set smartindent                   " 智能缩进
set autoindent                    " 自动缩进（与智能配合）
set shiftround                    " 缩进对齐
set tabstop=2                     " 设定  制表符空格数为2
set shiftwidth=2                  " 设定  缩进空格数为2
set ignorecase smartcase          " 设置  查找智能大小写忽略(禁用加no-)
set expandtab   		          " 设置  用空格替代制表符(禁用加no-)
set incsearch       		      " 启用  增量式搜索(禁用加no-)
set history=255     		      " 设定  撤销记录为255次

"==== 针对性配置 ================================================================
" c,c++类型文件配置
function CppFileSettings()
  set columns=174
  NERDTree
  wincmd p
  call tagbar#autoopen()
endfunction
autocmd FileType c,cpp,lua call CppFileSettings()
