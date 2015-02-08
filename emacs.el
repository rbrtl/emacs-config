;; Emacs-config by olikasg.

;; This file is a starting point to bootstrap an emacs config on any of
;; my computers.

(when (string-equal system-type "darwin")
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char))

(icomplete-mode t)

(defun load-config (config-name)
  "Load the requested config.

Config files should be located in ./resources directory."
  (load (concat
	 (file-name-as-directory emacs-repository-path)
	 (file-name-as-directory "resources") config-name ".el")))

(load-config "bootstrap-packages")
(load-config "theme")
