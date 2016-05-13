;; Common setting

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; display time
;; (setq display-time-day-and-date t
;;      display-time-24hr-format t)
;; (display-time)

;; ediff does not open a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Tab to spaces
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Mail address on my personal machine
(setq user-mail-address "gabor.olah@erlang-solutions.com"
      user-login-name "olikasg"
      user-full-name "Gabor Olah")

;(setq desktop-save-mode t)

; Thanks to Niles (http://nileshk.com/2009/06/13/prompt-before-closing-emacs.html)
(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(global-set-key (kbd "C-x C-c") 'ask-before-closing)

;; Dired act as a file manager
(setq dired-dwim-target t)

(show-paren-mode t)

(setq require-final-newline t)

(global-hl-line-mode t)

(setq-default fill-column 80)

(defun set-trailing-whitespace ()
  (setq show-trailing-whitespace t)
)

(add-hook 'prog-mode-hook 'set-trailing-whitespace)
(add-hook 'erlang-mode-hook 'set-trailing-whitespace)


(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start)
  (require 'textile-mode)

  (require 'darkroom)

  (require 'auto-complete)
  (ac-config-default)

  ;;(require 'automargin)
  ;;(automargin-mode t)

  (require 'undo-tree)

  (require 'projectile)
  (global-set-key (kbd "C-x F") 'projectile-find-file)
  ;;(global-set-key (kbd "C-x C-f") 'ido-find-file)
;;;; ** beacon

  (setq beacon-color "red"
        beacon-lighter nil)
  (setq beacon-dont-blink-major-modes nil)
  (require 'beacon)
  (beacon-mode 1)
;;;; ** on-screen
  (setq on-screen-highlight-method 'narrow-line
        on-screen-inverse-flag t
        on-screen-highlighting-to-background-delta 1
        on-screen-delay 5)
  (require 'on-screen)
  (on-screen-global-mode 1)

)

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'erlang-mode-hook 'whitespace-mode)


