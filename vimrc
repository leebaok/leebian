" 一个简单的 vimrc 配置 
" by leebaok

set nocompatible    " 不使用vi的键盘模式
" 设定默认解码
set fenc=utf-8      " 详细信息可以见 :help fenc/fileencoding
" 设置读取文件时尝试的编码方式
set fencs=utf-8,usc-bom,gb18030,gbk,gb2312,cp936
" 允许backspace处理indent,eol,start(缩进、行尾、开头)
set backspace=indent,eol,start
set autoindent      " 自动缩进
set ts=4            " 设置 tab 为4个空格, ts=tapstop
set sw=4            " 设置缩进为4空格, sw=shiftwidth
set history=50		"  保存50跳记录
set ruler		    " 在右下角显示光标所在地方
set showcmd		    " 在输入命令过程中，显示没有输完的命令
set incsearch		" 增量搜索，每输入一个字符就立即进行搜索
set cursorline      " 在正在编辑的该行加一条横线
set showmatch       " 高亮 {[()]} 的匹配 
set hlsearch        " 高亮搜索结果 
set nu              " 显示行号
set wrap            " 自动折行，当文本太长时，折行显示
set tw=1000         " 设置文本宽度，大于该宽度时，自动换行，这里设为 1000，使之不换行，tw=textwidth

syntax enable       " 高亮
filetype plugin indent on   " 根据文件类型加载插件、缩进、语法检查

" 关于折叠
" 折叠方式有 manual, indent, expr, syntax, diff, marker
" 下面设置折叠方式为 indent，根据缩进折叠
set foldmethod=indent
" 折叠指令： zc--折叠，zC--嵌套折叠，zo--打开折叠，zO--嵌套打开折叠
" 打开文件的时候，希望不折叠代码
set nofoldenable

" 关于备份 
set backup		" 备份文件
set backupdir=~/.vim-backup " 备份文件的位置
set undofile		" 保存一份未修改的文件
set undodir=~/.vim-backup

set mouse-=a        " 禁用鼠标
" 打开鼠标支持
"if has('mouse')
"  set mouse=a
"endif

" 打开文件时，跳转到上次编辑到的地方，除非第一行有标记
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" 使用pathogen来管理插件
" pathogen.vim 放在 .vim/autoload 下
" 其他插件都放在 .vim/bundle 下
" 安装其他插件： 
" 	1. cd .vim/bundle 
" 	2. git clone https://github.com/...
" 	3. in Vim :   :Helptags  生成帮助文档
execute pathogen#infect()


" solarized 配置 ( 需要在 terminal 中选择 solarized 配色，否则很难看)
" 	cd .vim/bundle
"	git clone git://github.com/altercation/vim-colors-solarized.git
" 终端使用solarized时，vim 背景色可能会产生冲突，需要指定 t_Co解决，貌似不需要 
" 如果terminal 也想使用 solarized，参见：
" 	https://github.com/Anthony25/gnome-terminal-colors-solarized
" 如果 ls 的配色也使用 solarized，参见：
" 	https://github.com/seebi/dircolors-solarized
set t_Co=16 " 指定颜色数目 
set background=light
colorscheme solarized
" 如果terminal没有使用solarized，那么指定solarized使用256兼容模式
" let g:solarized_termcolors=256  

" airline 配置
" 	cd .vim/bundle 
"  	git clone https://github.com/bling/vim-airline
"  	apt-get install fonts-powerline
set laststatus=2     " airline 一直显示
let g:airline#extensions#tabline#enabled = 1   " tabline 一直在顶部显示
let g:airline_powerline_fonts=1  " 让airline使用powerline的符号字体显示
" 禁用 trailing space check 和 mixed-indent check
" 如果不禁用，那么 trailing space/mixed indent 会在ariline末尾显示
" trailing space就是行尾空格，他会显示之后行尾有空格的行号
" mixed-indent就是混合使用space、tab来缩进，他会显示之后混合缩进的行的行号
let g:airline#extensions#whitespace#enabled=0
" 设置 airline 的主题（所有主题在 .vim/bundle/vim-airline/autoload/airline/themes 下面）
" 在 solarized 配色下，这几个主题不错：solarized base16 bubblegum dark kalisi lucius luna tomorrow understated zenburn 
" let g:airline_theme='solarized'
" 是否在顶栏显示buffers （如果显示，那么当只有一个tab时，会将buffers显示出来）
let g:airline#extensions#tabline#show_buffers = 0


" NERD Tree 配置
" 在 .vim/bundle 下clone了NERD Tree后，需要在 vim 中  :Helptags 以及 :help NERD_tree.txt
" 文件浏览器插件，可以通过下面的配置自动打开NERD Tree
" autocmd vimenter * NERDTree
" 在 vim 中可以通过 NERDTreeToggle 打开 NERD Tree

" vimcdoc (vim中文文档)安装
" 	cd .vim/bundle
" 	git clone https://github.com/asins/vimcdoc.git
" 	in Vim :  :helptags ~/.vim/bundle/vimcdoc/doc
" 	然后可以使用了

" indentLine 配置
"   cd .vim/bundle
"   git clone https://github.com/Yggdroot/indentLine
" 默认indentLine可以将空格缩进转化为垂直对其线，对tab不起作用
" 要想对 tab 起作用，可以 :set list lcs=tab:\|\
" 设置对其线颜色
" let g:indentLine_color_term=239
" 设置对其字符,  比如 ¦, ┆, ︙ or │
let g:indentLine_char='¦'   
" 在vim中可以通过 IndentLinesToggle 切换 打开/关闭 对齐线
" 如果要在 vim 中查看 g:indentLine_enabled，输入 let g:indentLine_enabled 就可以了
let g:indentLine_enabled=0

" vim 在做语法检查的时候需要依赖一些语法检查器
" 比如，python 的检查需要依赖 python-flake8 或者 pylint 或者 pyflakes
" 我们这里用 pyflakes 检查（apt-get install pyflakes）
" 安装之后，通过下面指令指定检查器
" (flake8(python-flake8)之前使用过，检查的太严了，烦死了)
" 补充： 使用python的语法检查还需要安装vim相关的插件
"        因为vim默认编译不支持python的插件自动加载（进入vim, :version 查看选项）
"        一种方法是安装 scrooloose/syntastic，这个插件支持无数语言的检查
"        	cd .vim/bundle
"        	git clone https://github.com/scrooloose/syntastic
"        不过，现在发现，vim也有支持python的版本，vim-nox
let g:syntastic_python_checkers=['pyflakes']

" c 语法检查器配置
" include 文件的目录
" let g:syntastic_c_include_dirs = ['/usr/include/', '/usr/include/gtk-3.0/']


" YouCompleteMe 强大的自动补全插件
" 要想实现python的自动补全，需要vim 支持python，所以需要安装 vim-nox 版本
" ycm_auto_trigger 自动打开自动补全，默认为1，关闭可以设置成0
" 当想在某个文件编辑的时候打开， 可以 :let ycm_auto_trigger=1
let g:ycm_auto_trigger=1
" 按 TAB 选补全的时候，有时候上面会出现 vim 的 preview 窗口，会提示一些用法
" 虽然有帮助作用，但是我不喜欢，可以通过下面的选项关闭
set completeopt-=preview
" 如果喜欢提示窗口，就是上面说的 preview，但是想让他自动消失
" 可以通过下面的两个选项控制
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_autoclose_preview_window_after_insertion=1
" 指定C/C++的额外配置，可以自动补全C/C++的头文件等信息
" 需要在 .ycm_extra_conf.py 的flags中添加：
" '-isystem',
" '/usr/include',
" '-isystem',
" '/usr/include/c++/4.8',
" '-isystem',
" '/usr/include',
" '/usr/include/x86_64-linux-gun/c++',
" 在 .ycm_extra_conf.py 中默认使用 C++11 标准检查语法，如果需要检查 C 语言，
" 请把 '-std=c++11' 改成 '-std=c99'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

