syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set splitright
set splitbelow

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'adamjiwa/vim-todo'
Plug 'neovim/nvim-lspconfig'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'lyuts/vim-rtags'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

noremap <leader>tt :call TodaysTodo()<CR>
noremap <leader>tT :call TomorrowsTodo()<CR>
noremap <leader>ty :call YesterdaysTodo()<CR>
noremap <leader>tg :call GlobalTodo()<CR>

" find a way to move to the top off the buffer after this
nnoremap <leader>mm :vnew \| 0read ! wsl man -P cat<SPACE>
nnoremap <leader>mw :vnew \| 0read ! wsl man -P cat <C-R>=expand("<cword>")<CR><CR>gg

nnoremap <leader>sw :! "/Program Files/Mozilla Firefox/firefox.exe" --search <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>ss :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndoTreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pn :wincmd v<bar> :e ~/notes <bar> :vertical resize 30<CR>
nnoremap <leader>pw :wincmd v<bar> :e ~/workNotes <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
" Add a command that adds the path of the buffer to the rg to search from cwd
" and deeper
"command! cwdRg execute Rg
"nnoremap <leader>psc :Rg <C-R>=expand("%:p:h")<CR><SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
"nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>= :horizontal resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>_ :horizontal resize -5<CR>
nnoremap <leader>rp :resize 100<CR>
"nnoremap <leader>ee oif err != nil {<CR>log.Fatalf("%+\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>


lua << EOF
local nvim_lsp = require('lspconfig')
vim.lsp.set_log_level("debug")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'clangd' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end

local esp_idf_path = os.getenv("IDF_PATH")
local idf_tools_path = os.getenv("IDF_TOOLS_PATH")
if esp_idf_path then
  -- for esp-idf
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require'lspconfig'.clangd.setup{
    -- handlers = handlers,
    -- capabilities = capabilities,
    on_attach = on_attach,
    -- todo: figure out how to get this to work without specific version number
    cmd = { idf_tools_path .. "/tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/clangd", "--background-index", "--query-driver=**", },
    root_dir = function()
        -- leave empty to stop nvim from cd'ing into ~/ due to global .clangd file
    end
  }

else
  -- clangd config
  require'lspconfig'.clangd.setup{
    -- cmd = { 'clangd', "--background-index", "--clang-tidy"},
    on_attach = on_attach,
    handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      disable = { "cpp copyright" }
    })}
  }
end

EOF
