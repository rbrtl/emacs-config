;; org-mode settings

(setq org-catch-invisible-edits 'smart)
(setq org-cycle-include-plain-lists 'integrate)

(setq org-drawers (quote ("BIBTEX")))

(setq org-publish-project-alist
      '(("olikasg-github-io" ;; settings for olikasg.github.io
         :base-directory "~/Documents/git/olikasg.github.io/org"
         :base-extension "org"
         :publishing-directory "~/Documents/git/olikasg.github.io/deploy"
         :recursive t
         :publishing-function org-html-publish-to-html
         :with-toc nil
         :headline-levels 4
         :auto-preamble nil
         :auto-sitemap nil
         :html-extension "html"
         :body-only t)))

;; fontify code in code blocks
(setq org-src-fontify-natively t)

(org-block-begin-line
 ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF"))))
(org-block-background
 ((t (:background "#FFFFEA"))))
(org-block-end-line
 ((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF"))))

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq wombat-org-file (concat org-directory "/wombat.org"))
(setq 
(setq org-capture-templates
      '(("t" "Wombat simple todo" entry (file+headline wombat-org-file "Tasks")
         "* TODO %?\n")
        ("l" "Wombat linked todo" entry (file+headline wombat-org-file "Tasks")
         "* TODO %?\n   #+BEGIN_SRC erlang\n   %i\n   #+END_SRC\n   %l")
        ("i" "Wombat idea" entry (file+headline wombat-org-file "Idea")
         "* %?\n  %i\n  %a")))

(let ((a "valami"))
  (message a))
