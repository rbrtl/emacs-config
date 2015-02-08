;; Bootstrap every package that is not installed.

(require 'package)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize t)
(package-read-all-archive-contents)
(package-refresh-contents)

(defun load-installed-packages ()
  "Loads the config file into a list."
  (with-temp-buffer
    (insert-file-contents (concat
			   (file-name-as-directory emacs-repository-path)
			   "installed-packages.conf"))
    (split-string (buffer-string) "\n" t)))

(defun install-package-if-missing (package)
  "Intall a package if it is not installed already."
  (if (package-installed-p package)
         nil
    (if (y-or-n-p (format "Package '%s' is missing. Install it? " package))
	(package-install
	 (car (cdr (assoc (intern package) package-archive-contents))))
      package)))

(mapc 'install-package-if-missing
      (load-installed-packages))

