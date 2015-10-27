;; ace-window specific configuration

(setq window-min-heigth 1)

(defun olikasg-smart-select-window ()
  (interactive)
  "Change window and maximize it."
  (call-interactively 'ace-select-window)
  (enlarge-window 200))

;(global-set-key (kbd "M-o") 'olikasg-smart-select-window)
