"
" ██████╗ ██████╗ ██████╗ ███████╗  ██╗   ██╗██╗███╗   ███╗
"██╔════╝██╔═══██╗██╔══██╗██╔════╝  ██║   ██║██║████╗ ████║
"██║     ██║   ██║██████╔╝█████╗    ██║   ██║██║██╔████╔██║
"██║     ██║   ██║██╔══██╗██╔══╝    ╚██╗ ██╔╝██║██║╚██╔╝██║
"╚██████╗╚██████╔╝██║  ██║███████╗██╗╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝

"============
"首次安装使用
"============
"Vim-Plug的首次下载安装
if empty(glob('~/.config/nvim/plugged'))
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"模块化配置
source ~/.config/nvim/core/general_config.vim
source ~/.config/nvim/core/key_bindings.vim
source ~/.config/nvim/core/special_config.vim
source ~/.config/nvim/core/language_config.vim
source ~/.config/nvim/plug/plug_list.vim
source ~/.config/nvim/plug/plug_settings.vim
source ~/.config/nvim/theme/theme.vim
