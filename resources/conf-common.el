(show-paren-mode t)

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


