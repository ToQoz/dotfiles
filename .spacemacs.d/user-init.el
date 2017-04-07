; http://spacemacs.org/doc/FAQ.html#orgheadline14
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

; ensime
(push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
(push '("ensime" . "melpa-stable") package-pinned-packages)

; exec-path
(setq exec-path-from-shell-check-startup-files nil)
(let* ((path '(
               "/usr/local/bin"
               "/usr/local/opt/coreutils/libexec/gnubin"
               "/usr/local/opt/gnu-tar/libexec/gnubin"
               "~/.rbenv/shims"
               "~/_go/bin"
               "~/bin"
               "~/private/bin"
               )))
  (dolist (p path)
    (add-to-list 'exec-path (expand-file-name p))
    (setenv "PATH" (concat (expand-file-path p) ":" (getenv "PATH")))))
