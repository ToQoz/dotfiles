;; linum-mode performance hack: http://d.hatena.ne.jp/daimatz/20120215/1329248780
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))
;; title
(setq frame-title-format "Spacemacs")
;; C-h
(global-set-key (kbd "\C-h") 'delete-backward-char)
(define-key global-map "\C-h" 'delete-backward-char)
;; fullscreen
(set-frame-parameter nil 'fullscreen 'maximized)

;; persisted undo tree
(require 'undo-tree)
(setq undo-tree-auto-save-history t)
(global-undo-tree-mode)

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
;; ensime
(setq ensime-startup-notification nil)
(setq ensime-startup-snapshot-notification nil)
(add-hook 'scala-mode-hook 'ensime)
;; scalastyle
(setq-default flycheck-scalastylerc "scalastyle_config.xml")

; tread _ as a word character (vim way)
; https://github.com/emacs-evil/evil/blob/bc3db5cf16506d94049e4611b1873c7d76e4e070/README.md#underscore-_-is-not-a-word-character
(modify-syntax-entry ?_ "w")

;; helm-recentf
;; (default: SPC f r)

;; helm-ghq
;; (custom: SPC f g)
(spacemacs/set-leader-keys "fg" 'helm-ghq)

;; helm-git-ls-files
;; (custom: SPC f l)
(spacemacs/set-leader-keys "fl" 'helm-ls-git-ls)

;; shell-mode
(defun my/shell-clear ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))
(add-hook 'shell-mode-hook '(lambda () (local-set-key "\C-l" 'my/shell-clear)))

;; js2-mode (eslint, flycheck)
;; js2-mode options
(setq-default js2-strict-missing-semi-warning nil
              js2-basic-offset 2
              js-switch-indent-offset 2
              js-indent-level 2)
(defun my/npm-command(command)
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (global-command (executable-find command))
         (local-command (expand-file-name (concat "node_modules/.bin/" command) root)))

  (cond ((file-executable-p local-command) local-command)
        (t (or global-command "eslint")))))
; prefer local eslint
; eslint: https://github.com/syl20bnr/spacemacs/blob/master/layers/%2Bframeworks/react/funcs.el#L30
; eslint --fix: https://github.com/codesuki/eslint-fix/blob/master/eslint-fix.el
(defun my/eslint ()
  (let ((eslint (my/npm-command "eslint")))
    (setq-local flycheck-javascript-eslint-executable eslint)))
(add-hook 'js2-mode-hook 'my/eslint)
; eslint --fix
(defun eslint-fix ()
  (interactive)
  (let ((eslint (my/npm-command "eslint")))
    (if (file-executable-p eslint)
        (progn (call-process eslint nil "*eslint errors*" nil "--fix" buffer-file-name)
               (revert-buffer t t t))
      (message "eslint is not found"))))


(add-to-list 'load-path
             (expand-file-name "swagger-mode" dotspacemacs-directory))
(require 'swagger-mode)
