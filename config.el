;; Emacs-config by olikasg.

;; This file is a starting point to bootstrap an emacs config on any of
;; my computers.

(when (string-equal system-type "darwin")
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char))

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; display time
;; (setq display-time-day-and-date t
;;      display-time-24hr-format t)
;; (display-time)

(ido-mode 1)

;; ediff does not open a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Tab to spaces
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Mail address on my personal machine
(setq user-mail-address "gabor.olah@erlang-solutions.com"
      user-login-name "olikasg"
      user-full-name "Gabor Olah")

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

(setq require-final-newline t)

(global-hl-line-mode t)

(setq-default fill-column 80)

(defun set-trailing-whitespace ()
  (setq show-trailing-whitespace t)
)

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(setq package-enable-at-startup nil)
(package-initialize t)
;(package-read-all-archive-contents)
;(package-refresh-contents)

(add-to-list 'load-path (concat
			 (file-name-as-directory emacs-repository-path)
			 "use-package-2.1"))

(require 'use-package)

(setq use-package-verbose t)
;(setq use-package-debug t)

(use-package magit
  :ensure t
  :pin melpa-stable
  :init
  (setq git-commit-summary-max-length 72)
  (setq git-commit-fill-column 72) ; Longer than 72 characters in a line looks ugly on GitHub
  :bind (("C-c s" . magit-status)
         ("C-c l" . magit-log-all)))

(use-package cl
  :demand t)

(use-package diminish
  :ensure t)

(use-package undo-tree
  :ensure t
  :ensure diff
  :ensure diminish
  :pin gnu
  :load-path "~/.emacs.d/elpa/undo-tree-0.6.5"
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

(use-package powerline
  :ensure t
  :ensure cl
  :pin melpa-stable
  :defer t
  :config
  (powerline-default-theme))

(use-package bm
  :ensure t
  :pin marmalade
  :bind (("C-?" . bm-toggle)
         ("C-<" . bm-previous)
         ("C->" . bm-nexr)))

(use-package ace-window
  :ensure t
  :pin elpa
  :bind (("M-p" . ace-window)))


;;;;(add-hook 'erlang-mode-hook 'set-trailing-whitespace)


;; (add-to-list 'load-path "resources")

;; ;(iswitchb-mode t)
;; (ido-mode t)

;; (defun load-config (config-name)
;;   "Load the requested config.

;; Config files should be located in `./resources' directory. Config
;; files should start with prefix `conf-'."
;;   (load (concat
;; 	 (file-name-as-directory emacs-repository-path)
;; 	 (file-name-as-directory "resources") "conf-" config-name ".el")))

;; (load-config "bootstrap-packages")
;; (load-config "common")
;; (load-config "theme")
;; (load-config "irfc")
;; (load-config "jekyll")
;; (load-config "svn")
;; (load-config "magit")
;; ;(load-config "fci")
;; (load-config "bbdb")
;; (load-config "gnus")
;; (load-config "flyspell")
;; (load-config "erlang")
;; (load-config "auto-complete")
;; (when (string= system-name "olikasg-esl.local")
;;   (load-config "esl")
;;   (load-config "esl-internal"))
;; (load-config "helm")
