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

;; Mail address on my personal machine
(setq user-mail-address "olikas.g@gmail.com"
      user-login-name "olikasg"
      user-full-name "Gabor Olah")

(setq desktop-save-mode t)
