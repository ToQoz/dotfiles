(defun dotspacemacs/layers ()
  (load-file (expand-file-name "_layers.el" dotspacemacs-directory)))

(defun dotspacemacs/init ()
  (load-file (expand-file-name "_init.el" dotspacemacs-directory)))

(defun dotspacemacs/user-init ()
  (load-file (expand-file-name "user-init.el" dotspacemacs-directory)))

(defun dotspacemacs/user-config ()
  (load-file (expand-file-name "user-config.el" dotspacemacs-directory)))
