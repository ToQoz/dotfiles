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
;; ensime
(setq ensime-startup-snapshot-notification nil)

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
              js-indent-level 2)
(defun my/npm-command(command)
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (global-command (executable-find command))
         (local-command (expand-file-name (concat "node_modules/.bin/" command) root)))

  (cond ((file-executable-p local-command) local-command)
        (else global-command))))

; https://github.com/syl20bnr/spacemacs/blob/master/layers/%2Bframeworks/react/funcs.el#L30
(defun my/prefer-local-eslint ()
  (let ((eslint (my/npm-command "eslint")))
  (setq-local flycheck-javascript-eslint-executable eslint)))
(add-hook 'js2-mode-hook 'my/prefer-local-eslint)

; prefer local eslint than global eslint
; https://github.com/codesuki/eslint-fix/blob/master/eslint-fix.el
(defun eslint-fix ()
  (interactive)
  (let ((eslint (my/npm-command "eslint")))
  (progn (call-process eslint nil "*ESLint Errors*" nil "--fix" buffer-file-name)
        (revert-buffer t t t))))
(provide 'eslint-fix)
