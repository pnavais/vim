# VIM Configuration
My Personal VIM Configuration.

### Installation
_NOTE: Make sure to backup your existing .vimrc file or .vim directory_

VIM Vundle plugin is required since this config file relies heavily on Vundle to handle several plugins. 

1. Setup **Vundle**:

  `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

2. Setup **.vimrc**:

  ```
  git clone <this_repo>
  cp vimrc $HOME/.vimrc 
  ```
3. Install the rest of the plugins through **_Vundle_**

  Open **VIM** and execute ``:BundleInstall``
