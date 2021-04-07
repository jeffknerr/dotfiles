# dotfiles
My config/dotfiles.

I use these on a Debian/Ubuntu computer. Currently sets up
zsh, vim, tmux, and a few other small things (mutt, python,
git, i3).

Running `makeitso` will put most things in place, and suggest
other actions that might be needed:

```
git clone git@github.com:jeffknerr/dotfiles.git
cd dotfiles
cp .defaults defaults  # will customize .sig, .gitconfig, etc
vim defaults
./makeitso
```

## TODO

- fix up vimrc file
- *really* test it
