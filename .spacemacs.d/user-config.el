;; title
(setq frame-title-format "Spacemacs")
;; C-h
(global-set-key (kbd "\C-h") 'delete-backward-char)
(define-key global-map "\C-h" 'delete-backward-char)
;; fullscreen
(set-frame-parameter nil 'fullscreen 'maximized)

;; ddskk
(when (require 'skk nil t)
  (global-set-key (kbd "\C-j") 'skk-auto-fill-mode)
  (define-key global-map "\C-j" 'skk-auto-fill-mode)
  (setq default-input-method "japanese-skk")
  (require 'skk-study)
  ;; use skkserve
  (setq skk-server-host "localhost")
  (setq skk-server-portnum 1178)
  )
;; company
;; https://github.com/nsf/gocode/tree/007b034ad7b6d5b70bd18348fc7609a9fdcbad18/emacs-company#possible-improvements
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
