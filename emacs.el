;; Emacs-config by olikasg.

;; This file is a starting point to bootstrap an emacs config on any of
;; my computers.

(add-to-list 'load-path "resources")

(when (string-equal system-type "darwin")
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char))

;(iswitchb-mode t)
(ido-mode t)

(defun load-config (config-name)
  "Load the requested config.

Config files should be located in `./resources' directory. Config
files should start with prefix `conf-'."
  (load (concat
	 (file-name-as-directory emacs-repository-path)
	 (file-name-as-directory "resources") "conf-" config-name ".el")))

(load-config "bootstrap-packages")
(load-config "common")
(load-config "theme")
(load-config "powerline")
(load-config "bm")
(load-config "irfc")
(load-config "jekyll")
;(load-config "gnus")
(load-config "svn")
(load-config "magit")
(when (string= system-name "olikasg-esl.local")
  (load-config "esl"))
(load-config "fci")
(load-config "flyspell")
(load-config "ace")
(load-config "auto-complete")

