;; Emacs-config by olikasg.

;; This file is a starting point to bootstrap an emacs config on any of
;; my computers.

(when (string-equal system-type "darwin")
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char)
  (setq ring-bell-function 'ignore))

(if window-system
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

(setq mouse-wheel-scroll-amount '(3 ((shift) . 5) ((control))))
(setq mouse-wheel-progressive-speed nil)

;; display time
(setq display-time-day-and-date t
     display-time-24hr-format t)

;; ediff does not open a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Tab to spaces
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Mail address on my personal machine
(setq user-mail-address "robert.edwin.lee@icloud.com"
      user-login-name "rob"
      user-full-name "Robert Lee")

;; Dired act as a file manager - copy to other dired frame by default
(setq dired-dwim-target t)

(setq-default fill-column 80)

(defun set-trailing-whitespace ()
  (setq show-trailing-whitespace t))


(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(setq package-enable-at-startup nil)
(package-initialize)
;(package-read-all-archive-contents)
;(package-refresh-contents)

(add-to-list 'load-path (concat
                         (file-name-as-directory emacs-repository-path)
                         "use-package-2.1"))

(require 'use-package)

(setq use-package-verbose t)
;; (setq use-package-debug t)

;; (use-package dash
;;   :ensure t)

;; (use-package popup
;;   :ensure t)

(use-package magit
  :ensure t
  :pin melpa-stable
  :init
  (setq git-commit-summary-max-length 72)
  (setq git-commit-fill-column 72) ; Longer than 72 characters in a line looks ugly on GitHub
  :bind (("C-c s" . magit-status)
         ("C-c l" . magit-log-all)))

;; (use-package cl
;;   :demand t)

;; (use-package diminish
;;   :ensure t)

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
  :bind (("<f6>" . bm-toggle)
         ("<f7>" . bm-previous)
         ("<f8>" . bm-next)))

(use-package hc-zenburn-theme
  :ensure t
  :pin melpa-stable
  :init
  (load-theme 'hc-zenburn t))

(use-package which-key
  :ensure t
  :pin gnu
  :config
  (which-key-mode))

(use-package helm
  :ensure t
  :pin melpa
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)
    (helm-mode))
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-x c SPC" . helm-all-mark-rings)))

(ido-mode -1) ;; Turn off ido mode in case I enabled it accidentally

(use-package helm-ag
  :ensure t
  :pin melpa-stable
  :config
  (custom-set-variables
   '(helm-ag-base-command "ack --nocolor --nogroup")))

(use-package projectile
  :ensure t
  :pin melpa)

(use-package helm-projectile
  :ensure t
  :pin melpa
  :bind (("C-x p f" . helm-projectile-find-file)))

(use-package markdown-mode
  :ensure t
  :pin melpa-stable)

(use-package writeroom-mode
  :ensure t
  :pin melpa-stable)

(use-package dockerfile-mode
  :ensure t
  :pin melpa-stable)

(use-package docker
  :ensure t
  :pin melpa-stable)

(use-package company
  :ensure t
  :pin melpa
  :bind (("C-;" . company-complete))
  :config
  (global-company-mode))

(use-package company-flx
  :ensure t
  :config
  (company-flx-mode +1))


;; TODO: ::CHALLENGE:: Find a way to integrate macOS spelling

;; ;; find aspell and hunspell automatically
;; (cond
;;  ;; try hunspell at first
;;  ;; if hunspell does NOT exist, use aspell
;;  ((executable-find "hunspell")
;;   (setq ispell-program-name "hunspell")
;;   (setq ispell-local-dictionary "en_US")
;;   (setq ispell-local-dictionary-alist
;;         ;; Please note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell
;;         ;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries
;;         '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))))

;;  ((executable-find "aspell")
;;   (setq ispell-program-name "aspell")
;;   ;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
;;   (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))

;; (global-set-key (kbd "C-;") 'ispell-word)

