(push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
(push '("ensime" . "melpa-stable") package-pinned-packages)
(setq exec-path-from-shell-check-startup-files nil)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
                                        ; custom-file
(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)
