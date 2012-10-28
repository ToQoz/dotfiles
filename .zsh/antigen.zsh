source ~/.zsh/antigen/antigen.zsh

#antigen-lib

# Bundles from the default repo
#
# some problem will be occured use auto-fu with zsh-syntax-highlighting.
# but it is recognized by auto-fu's writter.
# `TODO: play nice with zsh-syntax-highlighting. https://github.com/hchbaw/auto-fu.zsh`
# if update for playing nice with zsh-syntax-highlighting, i use zsh-syntax-highlighting
antigen-bundle hchbaw/auto-fu.zsh
# antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-apply
# starting install plugin and theme
# $ exec $SHELL
