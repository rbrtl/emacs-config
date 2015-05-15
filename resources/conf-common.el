;; Common setting

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ediff does not open a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Tab to spaces
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
