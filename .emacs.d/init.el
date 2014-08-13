;; add load path
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

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

; disble auto fill
; http://d.hatena.ne.jp/overlast/20071117/1195258595
(setq text-mode-hook 'turn-off-auto-fill)

; font setting
; (set-frame-font "Menlo for Powerline:h11")
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

; (set-frame-parameter nil 'alpha 90)

(global-set-key (kbd "M-<RET>") 'ns-toggle-fullscreen)

;; C-o.
(define-prefix-command 'ctl-o-map)
(global-set-key (kbd "C-o") 'ctl-o-map)
(define-key ctl-o-map (kbd "C-e") 'eval-current-buffer)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipes")

(el-get 'sync
	'(el-get
	  ddskk
	  ))

;; ddskk
(require 'skk-setup)
(require 'skk)

; tutorial file
(setq skk-tut-file "~/.emacs.d/el-get/ddskk/etc/SKK.tut")

; dict
(setq skk-jisyo "~/.emacs.d/el-get/ddskk/et/SKK-JISYO.L")
(setq skk-backup-jisyo "~/.emacs.d/el-get/ddskk/etc/SKK-JISYO.L.backup")

(require 'info)
(add-to-list 'Info-additional-directory-list "~/.emacs.d/info")

(setq confirm-kill-emacs 'y-or-n-p)
