# Eduardo Borsa dotfiles

## Based from: [naps62 - dotfiles](https://github.com/naps62/dotfiles/tree/0158077e24c439f78acd6ba7fd19271fb7ff104c)

# Summary

- [Install](#install)

## Install

1. Clone the repo:

```sh
    git clone https://github.com/EduardoBorsa/dotfiles ~/dotfiles
```

2. Enter on the directory: `cd ~/dotfiles`.

3. run `stow */`.

## Missing things:

- Finish configurating zsh.
  - Revisit Starship
- Check where it starts polybar

  - Checks what extra configs can I add to the status bar.
  - https://www.youtube.com/watch?v=S1jQfGcKjtA

  - Check if by default it has the adblock for youtube.

- Ansible
- Take a look into picom.

## Questions:

- Brave customization

### alacritty

- Terminal

### bin

This is basically where I host most of my script files.

### nvim

Editor

### tmux

Terminal multiplexor

### zsh with Oh My ZSH

[Oh My ZSH](https://ohmyz.sh/)
Oh My Zsh is an open source, community-driven framework for managing your Zsh configuration.

### rofi

[rofi](https://github.com/davatorium/rofi)

TODO: Still can't use emogis inside terminal. Check how to use rofimoji.
Read the README.md from rofi:

Replace for d_menu for i3

### arandr

Configuration for monitors

### polybar

[polybar](https://github.com/polybar/polybar)
A fast and easy-to-use tool for creating status bars.

### i3

[i3](https://i3wm.org/)
i3 is a tiling window manager,

### Xresources

[X Resources](<https://wiki.archlinux.org/title/x_resources#:~:text=Xresources%20is%20a%20user%2Dlevel,terminal%20preferences%20(e.g.%20terminal%20colors)>)

    Xresources is a user-level configuration dotfile, typically located at ~/.Xresources.
    It can be used to set X resources, which are configuration parameters for X client applications.

#### Commands

- `xrdb -query -all`

  - Check if after login in the xresources are loaded by running

#### Obs:

Inside the `i3/config`, it was put: `exec xrdb -merge ~/.Xresources` to load the configuration.

#### Questions:

- What is the purpose of Xmodmap? Where should I put it?
  - keyboard.
- What is the purpose of Xresources? Where should I put it?
  - main stuff for creating colors
- What is the purpose of xinitrc? Where should I put it?
  - Looks like it is the thing that I am using inside i3 config.
- What is the purpose of xsession? Where should I put it?

### PSQL

- Should I need a psqlrc file?
- Where to put it?
  - ~/.psqlrc

### picom

[picom](https://wiki.archlinux.org/title/Picom)

picom is a standalone compositor for Xorg, suitable for use with window managers that do not provide compositing.
picom is a fork of compton, which is a fork of xcompmgr-dana, which in turn is a fork of xcompmgr.

### proselint

[proselint](http://proselint.com/)
