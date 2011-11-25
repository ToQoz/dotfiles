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
; use option for meta key
(setq mac-option-modifier 'meta)
; font setting
(when (>= emacs-major-version 23)
 (set-face-attribute 'default nil
                     :family "monaco"
                     :height 140)
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0208
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0212
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'mule-unicode-0100-24ff
  '("monaco" . "iso10646-1"))
 (setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.2)
        (".*osaka-bold.*" . 1.2)
        (".*osaka-medium.*" . 1.2)
        (".*courier-bold-.*-mac-roman" . 1.0)
        (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
        (".*monaco-bold-.*-mac-roman" . 0.9)
        ("-cdac$" . 1.3))))
;;(set-frame-font "ricty-13")
;;(set-frame-font (if (boundp 'window-system)

(if (boundp 'window-system)
    (setq initial-frame-alist
          (append (list
                  '(width . 100)
                  '(height . 50)
                  '(top . 0)
                  '(left . 150)
                  )
          initial-frame-alist)))
(setq default-frame-alist initial-frame-alist)