" Search from home directory
nnoremap <leader>pp :lua require('telescope.builtin').find_files({ search_dirs = {"~/"}, hidden = true })<CR>
" Search in all files in the current git project
nnoremap <leader>pf :lua require('telescope.builtin').git_files({ hidden = true })<CR>
" Search in all files from the current directory
nnoremap <leader>pw :lua require('telescope.builtin').find_files({ hidden = true })<CR>

" Grep
nnoremap <leader>pe :lua require('telescope.builtin').live_grep()<CR>

" Search buffers
nnoremap <leader>pi :lua require('telescope.builtin').buffers()<CR>

" Search nvim help
nnoremap <leader>po :lua require('telescope.builtin').help_tags()<CR>
