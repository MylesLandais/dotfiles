# Vim-Plug Install
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
    
see https://github.com/junegunn/vim-plug

# You Complete Me (YCM) Setup
Requires python neovim support

`pip install pynvim`

__After :PluginInstall:__

`./install.py --gocode-completer --racer-completer`
