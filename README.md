# personal dotfiles

```
curl -sf -L https://raw.githubusercontent.com/ToQoz/dotfiles/master/bootstrap | sh
```

## advanced: install private dotfiles

```
$ ssh-keygen -t rsa -b 4096 -C "toqoz403@gmail.com"
```

add `~/.ssh/id_rsa.pub` to https://github.com/settings/keys

```
git clone git@github.com:ToQoz/private.git ~/_dev/github.com/ToQoz/private
ln -sf ~/_dev/github.com/ToQoz/private ~/private
```
