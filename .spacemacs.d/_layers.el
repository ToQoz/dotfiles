(setq-default
  ;; Base distribution to use. This is a layer contained in the directory
  ;; `+distribution'. For now available distributions are `spacemacs-base'
  ;; or `spacemacs'. (default 'spacemacs)
  dotspacemacs-distribution 'spacemacs
  ;; Lazy installation of layers (i.e. layers are installed only when a file
  ;; with a supported type is opened). Possible values are `all', `unused'
  ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
  ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
  ;; lazy install any layer that support lazy installation even the layers
  ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
  ;; installation feature and you have to explicitly list a layer in the
  ;; variable `dotspacemacs-configuration-layers' to install it.
  ;; (default 'unused)
  dotspacemacs-enable-lazy-installation 'unused
  ;; If non-nil then Spacemacs will ask for confirmation before installing
  ;; a layer lazily. (default t)
  dotspacemacs-ask-for-lazy-installation t
  ;; If non-nil layers with lazy install support are lazy installed.
  ;; List of additional paths where to look for configuration layers.
  ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
  dotspacemacs-configuration-layer-path '()
  ;; List of configuration layers to load.
  dotspacemacs-configuration-layers
  '(
    csharp
    html
    swift
    scala
    go
    javascript
    vimscript
    helm
    better-defaults
    emacs-lisp
    git
    markdown
    org
    yaml
    (auto-completion :variables
                    ;; use tab to complete
                    ;; return key enters new line
                    auto-completion-return-key-behavior 'complete
                    auto-completion-tab-key-behavior 'complete
                    auto-completion-enable-sort-by-usage t
                    ;; completion tool tip, nil, buggy in evil
                    auto-completion-enable-help-tooltip nil
                    :disabled-for  ; layer name
                    org
                    markdown)
    (shell :variables
           shell-default-shell 'eshell
           shell-default-height 30
           shell-default-position 'bottom)
    spell-checking
    syntax-checking
    version-control
    )
  ;; List of additional packages that will be installed without being
  ;; wrapped in a layer. If you need some configuration for these
  ;; packages, then consider creating a layer. You can also put the
  ;; configuration in `dotspacemacs/user-config'.
  dotspacemacs-additional-packages '(helm-ghq helm-ls-git company ddskk terraform-mode)
  ;; A list of packages that cannot be updated.
  dotspacemacs-frozen-packages '()
  ;; A list of packages that will not be installed and loaded.
  dotspacemacs-excluded-packages '()
  ;; Defines the behaviour of Spacemacs when installing packages.
  ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
  ;; `used-only' installs only explicitly used packages and uninstall any
  ;; unused packages as well as their unused dependencies.
  ;; `used-but-keep-unused' installs only the used packages but won't uninstall
  ;; them if they become unused. `all' installs *all* packages supported by
  ;; Spacemacs and never uninstall them. (default is `used-only')
  dotspacemacs-install-packages 'used-only)
