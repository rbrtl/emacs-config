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

; Thanks to Niles (http://nileshk.com/2009/06/13/prompt-before-closing-emacs.html)
(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))

;; Dired act as a file manager
(setq dired-dwim-target t)

(show-paren-mode t)
