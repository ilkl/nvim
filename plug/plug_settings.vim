"============
"功能插件设置
"============
"COC设置
source ~/.config/nvim/plug/coc/coc_config.vim

"floaterm设置
hi Floaterm guibg=black
hi FloatermBorder guibg=none guifg=cyan
let g:floaterm_position = 'center'
let g:floaterm_wintype = 'floating'
noremap <LEADER>ftn :FloatermNew<CR>
noremap <LEADER>ftk :FloatermKill<CR>

"OpenBrowser设置
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nmap gu <Plug>(openbrowser-open)
vmap gu <Plug>(openbrowser-open)

" CompleteParameter设置
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

"Accelerated-ws设置
nmap s <Plug>(accelerated_jk_gj)
nmap w <Plug>(accelerated_jk_gk)

"Easymotion设置
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
map ' <Plug>(easymotion-overwin-f2)
nmap ' <Plug>(easymotion-overwin-f2)
vmap ' <Plug>(easymotion-overwin-f2)

"Vista设置
noremap <LEADER>v :Vista<CR>
let g:vista#renderer#enable_icon = 1
let g:vista_disable_statusline = 1
let g:vista_default_executive = 'ctags'
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_vimwiki_executive = 'markdown'
let g:vista_executive_for = {
			\ 'vimwiki': 'markdown',
			\ 'pandoc': 'markdown',
			\ 'markdown': 'toc',
			\ 'yaml': 'coc',
			\ 'typescript': 'coc',
			\ 'typescriptreact': 'coc',
			\ }

"Translator设置
nmap <silent> <Leader>ts <Plug>TranslateW
vmap <silent> <Leader>ts <Plug>TranslateWV
let g:translator_window_max_width=0.3
let g:translator_window_max_height=0.3
let g:translator_default_engines=['youdao' , 'google']

"Vim-table-mode设置
map <LEADER>tm :TableModeToggle<CR>

"Neoformat设置
nnoremap <LEADER>fm :Neoformat<CR>

"FZF模糊搜索设置
" nmap <C-z> :<C-u>SessionSave<CR>
" nmap <C-x> :<C-u>SessionLoad<CR>
" nnoremap <silent> <C-h> :History<CR>
" nnoremap <silent> <C-p> :Files<CR>
" nnoremap <silent> <C-t> :Colors<CR>
" nnoremap <silent> <C-f> :Rg<CR>
" nnoremap <silent> <C-m> :Marks<CR>

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nmap <Leader>cn :<C-u>DashboardNewFile<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>tc :Colors<CR>
nnoremap <silent> <Leader>fa :Rg<CR>
nnoremap <silent> <Leader>fb :Marks<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
	redir => list
	silent ls
	redir END
	return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
	execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
			\ 'source': s:list_buffers(),
			\ 'sink*': { lines -> s:delete_buffers(lines) },
			\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
			\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }

" Indentline设置
let g:indentLine_enabled = 1
let g:indentLine_char='┆'
let g:indentLine_fileTypeExclude = ['defx', 'denite','startify','tagbar','vista_kind','vista','coc-explorer','dashboard']
let g:indentLine_concealcursor = 'niv'
let g:indentLine_showFirstIndentLevel =1


"MarkdownPreview设置
let g:instant_markdown_autostart = 0
let g:instant_markdown_port = 8888

autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>

"Vim-go设置
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"Defx设置
noremap <LEADER>fe :Defx<CR>

call defx#custom#option('_', {
			\ 'resume': 1,
			\ 'winwidth': 30,
			\ 'split': 'vertical',
			\ 'direction': 'topleft',
			\ 'show_ignored_files': 0,
			\ 'columns': 'mark:indent:git:icons:filename',
			\ 'root_marker': '',
			\ })

call defx#custom#column('git', {
			\   'indicators': {
			\     'Modified'  : '•',
			\     'Staged'    : '✚',
			\     'Untracked' : 'ᵁ',
			\     'Renamed'   : '≫',
			\     'Unmerged'  : '≠',
			\     'Ignored'   : 'ⁱ',
			\     'Deleted'   : '✖',
			\     'Unknown'   : '⁇'
			\   }
			\ })

call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })

augroup user_plugin_defx
	autocmd!
	autocmd FileType defx call <SID>defx_mappings()
	autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif
	autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif
augroup END

function! s:jump_dirty(dir) abort
	let l:icons = get(g:, 'defx_git_indicators', {})
	let l:icons_pattern = join(values(l:icons), '\|')

	if ! empty(l:icons_pattern)
		let l:direction = a:dir > 0 ? 'w' : 'bw'
		return search(printf('\(%s\)', l:icons_pattern), l:direction)
	endif
endfunction

function! s:defx_toggle_tree() abort
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_mappings() abort
	setlocal signcolumn=no expandtab
	nnoremap <silent><buffer><expr> <CR>     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
	nnoremap <silent><buffer><expr> <C-h>     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
	nnoremap <silent><buffer><expr> c defx#do_action('copy')
	nnoremap <silent><buffer><expr> m defx#do_action('move')
	nnoremap <silent><buffer><expr> p defx#do_action('paste')
	nnoremap <silent><buffer><expr> d defx#do_action('open')
	nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N defx#do_action('new_file')
	nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
	nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> x defx#do_action('remove')
	nnoremap <silent><buffer><expr> r defx#do_action('rename')
	nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> l defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> <C-h> defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
	nnoremap <silent><buffer><expr> a defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
	nnoremap <silent><buffer><expr> q defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
	nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
	nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
	nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
	nnoremap <silent><buffer><expr> 3u  defx#do_action('cd', ['../../..'])
	nnoremap <silent><buffer><expr> 4u  defx#do_action('cd', ['../../../..'])

endfunction

function! s:defx_toggle_tree() abort
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_toggle_tree() abort
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

let g:defx_icons_column_length = 2
let g:defx_icons_mark_icon = ''
let g:defx_icons_parent_icon = ""
" Rainbow_Parenthess设置
let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['black',       'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"NerdCommenter设置
let g:NERDSpaceDelims            = 1
let g:NERDCompactSexyComs        = 1
let g:NERDDefaultAlign           = 'left'
let g:NERDAltDelims_java         = 1
let g:NERDCustomDelimiters       = {'c': {'left': '/*', 'right': '*/'}}
let g:NERDCommentEmptyLines      = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines    = 1
"============
"美化插件设置
"============

"Dashboard设置
" let g:dashboard_custom_header = [
"       \ '',
"       \ '███████╗██╗   ██╗ ██████╗ ██╗    ██╗   ██╗███████╗    ██╗',
"       \ '██╔════╝██║   ██║██╔═══██╗██║    ██║   ██║██╔════╝    ██║',
"       \ '█████╗  ██║   ██║██║   ██║██║    ██║   ██║█████╗      ██║',
"       \ '██╔══╝  ╚██╗ ██╔╝██║   ██║██║    ╚██╗ ██╔╝██╔══╝      ╚═╝',
"       \ '███████╗ ╚████╔╝ ╚██████╔╝███████╗╚████╔╝ ███████╗    ██╗',
"       \ '╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═══╝  ╚══════╝    ╚═╝',
"       \ '',
"       \ '                       [KyleJKC]',
"       \ '',
"       \ ]
let g:dashboard_preview_command = 'cat'
let g:dashboard_preview_file = '~/.config/nvim/dashboard.cat'
let g:dashboard_preview_file_height = 10
let g:dashboard_preview_file_width = 80
let g:dashboard_default_executive ='telescope'
let g:dashboard_default_executive ='fzf'
" let g:dashboard_custom_shortcut={
"       \ 'last_session'       : 'Ctrl X',
"       \ 'find_history'       : 'Ctrl H',
"       \ 'find_file'          : 'Ctrl P',
"       \ 'new_file'           : 'Ctrl E',
"       \ 'change_colorscheme' : 'Ctrl T',
"       \ 'find_word'          : 'Ctrl F',
"       \ 'book_marks'         : 'Ctrl M',
"       \ }
let g:dashboard_custom_shortcut={
			\ 'last_session'       : 'SPC s l',
			\ 'find_history'       : 'SPC f h',
			\ 'find_file'          : 'SPC f f',
			\ 'new_file'           : 'SPC f n',
			\ 'change_colorscheme' : 'SPC t c',
			\ 'find_word'          : 'SPC f a',
			\ 'book_marks'         : 'SPC f b',
			\ }
noremap <LEADER>fn :DashboardNewFile<CR>

"Galaxyline设置
luafile ~/.config/nvim/theme/eviline.lua

"vim-easy-align设置
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"Vim-buffet设置
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

"vimspector设置
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/nvim/vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/vimspector_json',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=🛑 texthl=Normal
sign define vimspectorBPDisabled text=🚫 texthl=Normal
sign define vimspectorPC text=👉 texthl=SpellBad
