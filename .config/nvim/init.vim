function! InitializeCoc()
  call coc#util#install()
  call coc#util#install_extensions([
  \ 'coc-java',
  \ ])
endfunction

call plug#begin()

Plug 'neoclide/coc.nvim', {'do': { -> InitializeCoc() } }

Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

call plug#end()

syntax on
colorscheme onedark
