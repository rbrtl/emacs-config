;; gnus related configs

; use the gmane server as the primary news source
(setq gnus-select-method '(nntp "news.gmane.org"))

(add-to-list 'gnus-secondary-select-methods '(nntp "news.gwene.org"))

; use the topic mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-summary-line-format "%(%-7,7N%)  [%U%R%O] %4,4L/%-5,5k %&user-date; %B %-25,25f %* %s\n"
      gnus-summary-mode-line-format "Gnus: %p [%A] %Z (%r read)")

(setq gnus-auto-center-summary 'vertical
      gnus-summary-display-while-building nil
      gnus-summary-goto-unread t
      gnus-summary-display-arrow t
      gnus-summary-line-format "%(%-7,7N%)  [%U%R%O] %4,4L/%-5,5k %&user-date; %B %-25,25f %* %s\n"
      gnus-user-date-format-alist '((7776000 . "%b %d %H:%M ") ; 1/4 year
                                    (t . "%Y %b %d  "))
      gnus-summary-to-prefix "=> "
      gnus-summary-mode-line-format "Gnus: %p [%A] %Z (%r read)"

      gnus-sum-thread-tree-root "."
      gnus-sum-thread-tree-false-root "F"
      gnus-sum-thread-tree-single-indent ""
      gnus-sum-thread-tree-indent "  "
      gnus-sum-thread-tree-vertical        "│"
      gnus-sum-thread-tree-leaf-with-other "├──►"
      gnus-sum-thread-tree-single-leaf     "└──►"
      )

(define-key gnus-summary-mode-map [(meta p)] '(lambda() (interactive) (scroll-other-window -1)))
(define-key gnus-summary-mode-map [(meta n)] '(lambda() (interactive) (scroll-other-window 1)))

