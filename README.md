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
cp .defaults defaults
vim defaults
./makeitso
```

## TODO

- sig customizations???
- finish the script to install all of this
- *really* test it
