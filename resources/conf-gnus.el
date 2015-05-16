;; gnus related configs

; use the gmane server as the primary news source
(setq gnus-select-method '(nntp "news.gmane.org"))

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


;; ; line format strings
;; (setq gnus-summary-line-format "%O%U%R%z%d %B%(%[%4L: %-22,22f%]%) %s\n")
;; (setq gnus-summary-mode-line-format "Gnus: %p [%A / Sc:%4z] %Z")

;; ; threading visual appearacne
;; (setq gnus-summary-same-subject "")
;; (setq gnus-sum-thread-tree-root "")
;; (setq gnus-sum-thread-tree-single-indent "")
;; (setq gnus-sum-thread-tree-leaf-with-other "+-> ")
;; (setq gnus-sum-thread-tree-vertical "|")
;; (setq gnus-sum-thread-tree-single-leaf "`-> ")

;; (setq gnus-group-line-format   "%P%m%M%L%6N/%-5R| %*%-16G %D\n" ; %* Positioning Point or use : instead
;;       gnus-summary-line-format "|%*%U%R%B%s%-66=%-20,20f|%4L |%D|\n"
;;       gnus-topic-line-format   "%i%n %A (%G) %v\n")
