;; add load path
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

; set japanese
(set-language-environment 'Japanese)
; set UTF-8
(prefer-coding-system 'utf-8)
; use C-h for backspace
(global-set-key "\C-h" 'delete-backward-char)
; *.~ don't create backup
(setq make-backup-files nil)
; .#* don't create backup
(setq auto-save-default nil)
; [for mac] use option for meta key
(setq mac-option-modifier 'meta)

; font setting
(set-frame-font "Menlo-14")
;;(set-frame-font (if (boundp 'window-system)

;; window setting
(if (boundp 'window-system)
  (setq initial-frame-alist
    (append (list
        '(width . 100)
        '(height . 50)
        '(top . 0)
        '(left . 150))
      initial-frame-alist)))
(setq default-frame-alist initial-frame-alist)

;; use space insted of tab
(setq indent-tabs-mode nil)
(setq tab-width 2 indent-tabs-mode nil)

;; show line feed code
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; show line number
;; (require 'linum)
;; (global-linum-mode t)
;; (setq linum-format "%5d")
;;
;; (require 'nyan-mode)
;; (nyan-mode)
;; (nyan-start-animation)

(set-frame-parameter nil 'alpha 90)

(global-set-key (kbd "M-<RET>") 'ns-toggle-fullscreen)

;; C-o.
(define-prefix-command 'ctl-o-map)
(global-set-key (kbd "C-o") 'ctl-o-map)
(define-key ctl-o-map (kbd "C-e") 'eval-current-buffer)

(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (setq auto-install-use-wget t)
  (auto-install-compatibility-setup))