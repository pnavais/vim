# Dotfiles installation 
My Personal set of dotfiles with installer.

[![asciicast](https://asciinema.org/a/div7031ylnzqxuuvphafh8x1b.png)](https://asciinema.org/a/div7031ylnzqxuuvphafh8x1b)

### Installation

Just run ```install.sh```

_NOTE: This is still WIP_

Pending Stuff : 

1. Install Maven, Ant, Groovy, JDK through **sdkman** 

2. Install Node through npm (Homebrew on Mac OS X)
  
### Quick features

_TBD_

OSX :
- Homebrew installation/update with basic packages
- Terminfo with italics support for VIM/NVIM & tmux

VIM & NEOVIM :
- Airline statusbar (Tabline disabled by default)
- NERDTree access using the <kbd>\<Ctrl-R\></kbd> shortcut
- Navigate through tabs using <kbd>\<Ctrl-hjkl\></kbd>
- Launch CtrlP \<Ctrl-P\> to quickly find files
- Darcula theme enabled by default
- Solarized theme (use `solarized_termcolors=16` for better results under terminal. Dark mode may require solarized terminal colors)
- Edit .vimrc file with <kbd>\<leader\>ev</kbd>
- Javascript Support
- Surround + Repeat (i.e <kbd>ysiw\<char\> + dot command</kbd>)
- Comment lines with <kbd>\<leader>cc</kdb> or toggle comments with <kbd><leader>c space</kbd>
- Tabular plugin. Perform any selection (_VISUAL recommended_) and run : <kbd>`Tabularize /<pattern>`</kbd> to perform data tabulation using the given pattern.

_**NOTE:** Airline and powerline fonts are enabled by default but powerline fonts shall be installed in the system separately.NERD Fonts highly recommended --> (see https://github.com/ryanoasis/nerd-fonts)_
