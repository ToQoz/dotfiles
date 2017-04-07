(defun dotspacemacs/layers ()
  (load-file (expand-file-name "system-layers.el" dotspacemacs-directory)))

(defun dotspacemacs/init ()
  (load-file (expand-file-name "system-init.el" dotspacemacs-directory)))

(defun dotspacemacs/user-init ()
  (load-file (expand-file-name "user-init.el" dotspacemacs-directory)))
  (setq custom-file (expand-file-name "custom-file.el" dotspacemacs-directory))

(defun dotspacemacs/user-config ()
  (load-file (expand-file-name "user-config.el" dotspacemacs-directory)))

(defun dotspacemacs/emacs-custom-settings ()
  (load-file custom-file))
