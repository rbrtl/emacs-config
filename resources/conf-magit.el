;; magit related configs

(setq magit-last-seen-setup-instructions "1.4.0")

(setq git-commit-summary-max-length 72)
;; Longer than 72 characters in a line looks ugly on GitHub
(setq git-commit-fill-column 72)

(global-set-key (kbd "C-c s") 'magit-status)
(global-set-key (kbd "C-c l") 'magit-log-all)
;(global-set-key (kbd "C-c d") 'magit-ediff-resolve)

;(require 'magit-gh-pulls)
;(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
