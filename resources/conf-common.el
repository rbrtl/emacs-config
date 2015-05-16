;; Common setting

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; display time
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;; ediff does not open a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Tab to spaces
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

