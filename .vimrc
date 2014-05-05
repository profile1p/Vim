"==== Vundle插件配置 ====
set nocompatible

"==== 键盘映射 ===========================================================================
"窗口与buffer切换
nnoremap <C-Tab> :bn<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"自动不全
" <Tab>键为向下选择<S-Tab>键为向上选择
inoremap <expr><Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr><S-tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
"tag跳转
nmap <C-BS> <C-t>
nmap <C-CR> <C-]>
"高亮与选中单词相同带单词
nnoremap <C-i> *#

"==== Vim设置 ============================================================================
set lines=30 columns=95         " 设置窗口位置
set colorcolumn=95              " 设置行边界高亮
set guioptions=m                " 设置工具栏显示组件
set guifont=Consolas:h11:b:cANSI " 设置工具栏字体
colorscheme desert              " 设置配色方案
set wrap                        " 禁用自动换行
set relativenumber              " 显示相对行号
set fileencoding=utf-8          " 默认字符编码为uhf-8(UCS-BOM是带BOM带uhf-8)
set fileencodings=ucs-bom,utf-8,shift_jis,cp936,gb18030,big5 "设置字符编码检测顺序(cp936=GBK)
filetype plugin indent on       " 启动文件类型检测
set syntax=on                   " 启动语法高亮
set cindent                     " C缩进风格
set tabstop=2                   " 设定制表符空格数为2
set shiftwidth=2                " 设定碎进空格数为2
set ignorecase smartcase        " 设置查找智能大小写忽略
set expandtab                   " 设置用空格太提制表符
set incsearch                   " 启用增量式搜索
set history=255                 " 设定撤销记录次数为255次
