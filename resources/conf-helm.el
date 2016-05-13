;; helm -related configs

(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-s o") 'helm-occur)

(helm-autoresize-mode 1)
