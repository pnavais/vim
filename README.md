# VIM Configuration
My Personal VIM Configuration.

### Installation
_NOTE: Make sure to backup your existing .vimrc file or .vim directory_

vim-plug plugin is required since this config file relies heavily on it to handle several plugins. 

1. Setup **vim-plug**:

  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

2. Setup **.vimrc**:

  ```
  git clone https://github.com/pnavais/vim.git /some/dir && cp /some/dir/vimrc ~/.vimrc 
  ```
3. Install the rest of the plugins through **vim-plug**

  Open **VIM** and run ``:PluginInstall``
  
  
### Quick features
- Airline statusbar (Tabline disabled by default)
- NERDTree access using the \<Ctrl-R\> shortcut
- Navigate through tabs using \<Ctrl-hjkl\>
- Navigate through splits using \<Alt-arrow keys\> (Not working on mac :cry:)
- Launch CtrlP \<Ctrl-P\> to quickly find files
- Darcula theme enabled by default
- Solarized theme (use `solarized_termcolors=16` for better results under terminal. Dark mode may require solarized terminal colors)
- Edit .vimrc file with \<leader\>ev
- Javascript Support
- Surround + Repeat (i.e ysiw\<char\> + dot command)
- Tabular plugin. Perform any selection (_VISUAL recommended_) and run : `Tabularize /<pattern>` to perform data tabulation using the given pattern.

_**NOTE:** Airline and powerline fonts are enabled by default but powerline fonts shall be installed in the system separately.NERD Fonts highly recommended --> (see https://github.com/ryanoasis/nerd-fonts)_
