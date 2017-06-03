# Dotfiles installation 
My Personal set of dotfiles with installer.

### Installation
_NOTE: This is still WIP_


Pending Stuff : 

1. Setup **vim-plug**:

  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

2. Install **vim-plug** plugins headless:

  ```
  vim +PlugInstall
  ```
3. Install **sdkman** to a custom location

4. Install Maven, Ant, Groovy, JDK through **sdkman** 

5. Install Node through npm (Homebrew on Mac OS X)
  
### Quick features

_TBD_

VIM:
- Airline statusbar (Tabline disabled by default)
- NERDTree access using the \<Ctrl-R\> shortcut
- Navigate through tabs using \<Ctrl-hjkl\>
- Navigate through splits using \<leader-keys\> (Not working on mac :cry:)
- Launch CtrlP \<Ctrl-P\> to quickly find files
- Darcula theme enabled by default
- Solarized theme (use `solarized_termcolors=16` for better results under terminal. Dark mode may require solarized terminal colors)
- Edit .vimrc file with \<leader\>ev
- Javascript Support
- Surround + Repeat (i.e ysiw\<char\> + dot command)
- Comment lines with <leader>cc or toggle comments with <leader>c<space>
- Tabular plugin. Perform any selection (_VISUAL recommended_) and run : `Tabularize /<pattern>` to perform data tabulation using the given pattern.

_**NOTE:** Airline and powerline fonts are enabled by default but powerline fonts shall be installed in the system separately.NERD Fonts highly recommended --> (see https://github.com/ryanoasis/nerd-fonts)_
