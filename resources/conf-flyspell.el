;; flyspell related config

(require 'flyspell-lazy)

;(flyspell-lazy-mode 1)

(flyspell-mode 1)      ; or (flyspell-prog-mode)

;; (eval-after-load 'flyspell
;;   '(progn
;;      (require 'flyspell-lazy)
;;      (flyspell-lazy-mode 1)))

;; better performance
(setq flyspell-issue-message-flag nil)

;; if (aspell installed) { use aspell }
(defun flyspell-detect-ispell-args (&optional RUN-TOGETHER)
  "if RUN-TOGETHER is true, spell check the CamelCase words"
  (let (args)
    (when ispell-program-name
      (setq args (list "--sug-mode=normal" "--lang=en_US"))
      (if RUN-TOGETHER
          (setq args (append args '("--run-together" "--run-together-limit=16" "--run-together-min=2")))))
    args
    ))

(cond
 ((executable-find "aspell")
  (setq ispell-program-name "aspell"))
 (t (setq ispell-program-name nil)))

;; ispell-cmd-args is useless, it's the list of *extra* command line arguments we will append to the ispell process when ispell-send-string()
;; ispell-extra-args is the command arguments which will *always* be used when start ispell process
(setq ispell-extra-args (flyspell-detect-ispell-args t))
;; (setq ispell-cmd-args (flyspell-detect-ispell-args))
(defadvice ispell-word (around my-ispell-word activate)
  (let ((old-ispell-extra-args ispell-extra-args))
    (ispell-kill-ispell t)
    ;; use emacs original arguments
    (setq ispell-extra-args (flyspell-detect-ispell-args))
    ad-do-it
    ;; restore our own ispell arguments
    (setq ispell-extra-args old-ispell-extra-args)
    (ispell-kill-ispell t)
    ))

(defadvice flyspell-auto-correct-word (around my-flyspell-auto-correct-word activate)
  (let ((old-ispell-extra-args ispell-extra-args))
    (ispell-kill-ispell t)
    ;; use emacs original arguments
    (setq ispell-extra-args (flyspell-detect-ispell-args))
    ad-do-it
    ;; restore our own ispell arguments
    (setq ispell-extra-args old-ispell-extra-args)
    (ispell-kill-ispell t)
    ))

;; Add auto spell-checking in comments for all programming language modes
;; if and only if there is enough memory
;; You can use prog-mode-hook instead.
(dolist (hook '(lisp-mode-hook
                emacs-mode
                erlang-mode
                gfm-mode-hook
                emacs-lisp-mode-hook
                scheme-mode-hook
                clojure-mode-hook
                ruby-mode-hook
                yaml-mode
                python-mode-hook
                shell-mode-hook
                php-mode-hook
                css-mode-hook
                haskell-mode-hook
                caml-mode-hook
                c++-mode-hook
                c-mode-hook
                lua-mode-hook
                crontab-mode-hook
                perl-mode-hook
                tcl-mode-hook
                js2-mode-hook))
  (add-hook hook 'flyspell-prog-mode))


;; you can also use "M-x ispell-word" or hotkey "M-$". It pop up a multiple choice
;; @see http://frequal.com/Perspectives/EmacsTip03-FlyspellAutoCorrectWord.html
(global-set-key (kbd "C-;") 'ispell-word)

