# VIM Configuration
My Personal VIM Configuration.

### Installation
_NOTE: Make sure to backup your existing .vimrc file or .vim directory_

VIM Vundle plugin is required since this config file relies heavily on it to handle several plugins. 

1. Setup **Vundle**:

  `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

2. Setup **.vimrc**:

  ```
  git clone https://github.com/pnavais/vim.git /some/dir && cp /some/dir/vimrc ~/.vimrc 
  ```
3. Install the rest of the plugins through **Vundle**

  Open **VIM** and run ``:BundleInstall``
  
  
### Quick features
- Airline statusbar (Tabline disabled by default)
- NERDTree access using the \<Ctrl-R\> shortcut
- Navigate through tabs using \<Ctrl-left\> and \<Ctrl-right\>
- Navigate through splits using \<Alt-arrow keys\>
- Launch CtrlP \<Ctrl-P\> to quickly find files
- Solarized theme disabled by default (use `solarized_termcolors=16` for better results under terminal)
- Edit .vimrc file with \<leader\>ev
- Added Tabular plugin. Perform any selection (_VISUAL recommended_) and run : `Tabularize /<pattern>` to perform data tabulation using the given pattern.

_NOTE: Airline and powerline fonts are enabled by default but powerline fonts shall be installed in the system separately._
