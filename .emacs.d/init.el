; 言語を日本語にする
(set-language-environment 'Japanese)
; 極力UTF-8とする
(prefer-coding-system 'utf-8)
; C-h を backspace にする
(global-set-key "\C-h" 'delete-backward-char)
; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
; optionをmeta keyとして使う
(setq mac-option-modifier 'meta)
