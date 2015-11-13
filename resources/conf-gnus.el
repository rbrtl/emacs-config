;; gnus related configs

(require 'gnus)

;; ; use the gmane server as the primary news source
;; (setq gnus-select-method '(nntp "news.gmane.org"))

;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.gwene.org"))

;; ; use the topic mode
;; (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; (setq gnus-summary-line-format "%(%-7,7N%)  [%U%R%O] %4,4L/%-5,5k %&user-date; %B %-25,25f %* %s\n"
;;       gnus-summary-mode-line-format "Gnus: %p [%A] %Z (%r read)")

;; (setq gnus-auto-center-summary 'vertical
;;       gnus-summary-display-while-building nil
;;       gnus-summary-goto-unread t
;;       gnus-summary-display-arrow t
;;       gnus-summary-line-format "%(%-7,7N%)  [%U%R%O] %4,4L/%-5,5k %&user-date; %B %-25,25f %* %s\n"
;;       gnus-user-date-format-alist '((7776000 . "%b %d %H:%M ") ; 1/4 year
;;                                     (t . "%Y %b %d  "))
;;       gnus-summary-to-prefix "=> "
;;       gnus-summary-mode-line-format "Gnus: %p [%A] %Z (%r read)"

;;       gnus-sum-thread-tree-root "."
;;       gnus-sum-thread-tree-false-root "F"
;;       gnus-sum-thread-tree-single-indent ""
;;       gnus-sum-thread-tree-indent "  "
;;       gnus-sum-thread-tree-vertical        "│"
;;       gnus-sum-thread-tree-leaf-with-other "├──►"
;;       gnus-sum-thread-tree-single-leaf     "└──►"
;;       )

;; (define-key gnus-summary-mode-map [(meta p)] '(lambda() (interactive) (scroll-other-window -1)))
;; (define-key gnus-summary-mode-map [(meta n)] '(lambda() (interactive) (scroll-other-window 1)))

(setq gnus-select-method
      '(nnimap "esl"
	       (nnimap-address "imap.gmail.com")  ; it could also be imap.googlemail.com if that's your server.
	       (nnimap-server-port "imaps")
	       (nnimap-stream ssl)
           (nnimap-authinfo-file (expand-file-name "~/.authinfo.gpg"))))
;; (setq gnus-select-method nil)

(setq smtpmail-smtp-service 465
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; Formatting the overal appearance
;; "%U%R%z%I%(%[%4L: %-23,23f%]%) %s\n"
(setq gnus-summary-line-format "%O%U%R%z %-20,20&user-date;% │ %-22,22f% │ %B %s\n")
(setq gnus-user-date-format-alist
      '(((gnus-seconds-today) . "Today, %H:%M")
        ((+ 86400 (gnus-seconds-today)) . "Yesterday, %H:%M")
        (604800 . "%A %H:%M") ;;that's one week
        ((gnus-seconds-month) . "%A %d")
        ((gnus-seconds-year) . "%B %d")
        (t . "%B %d '%y"))) ;;this one is used when no other does match


;; "Gnus: %g [%A] %Z"
(setq gnus-summary-mode-line-format "Gnus: %p [%A / Sc:%4z] %Z")
(setq gnus-summary-same-subject " · · · ")
(setq gnus-sum-thread-tree-indent "  ")
(setq gnus-sum-thread-tree-root             "╭● ")
(setq gnus-sum-thread-tree-false-root       "◯─╮")
(setq gnus-sum-thread-tree-single-indent    "◎ ")
(setq gnus-sum-thread-tree-vertical         "│")
(setq gnus-sum-thread-tree-leaf-with-other  "├──❯ ")
(setq gnus-sum-thread-tree-single-leaf      "╰──❯ ")

(setq gnus-thread-sort-functions '(gnus-thread-sort-by-number 
                                   gnus-thread-sort-by-most-recent-date 
                                   gnus-thread-sort-by-total-score) 
      gnus-subthread-sort-functions '(gnus-thread-sort-by-number 
                                      gnus-thread-sort-by-date) 
      gnus-sort-gathered-threads-function 'gnus-thread-sort-by-date) 

;; (setq gnus-sum-thread-tree-root "╭● ")
;; (Setq gnus-sum-thread-tree-single-indent "")
;; (setq gnus-sum-thread-tree-leaf-with-other "├──❯ ")
;; (setq gnus-sum-thread-tree-vertical "│")
;; (setq gnus-sum-thread-tree-single-leaf "╰──❯ ")

;;Generate the mail headers before you edit your message.
(setq message-generate-headers-first t)

;;The message buffer will be killed after sending a message.
(setq message-kill-buffer-on-exit t)

;;When composing a mail, start the auto-fill-mode.
(add-hook 'message-mode-hook 'turn-on-auto-fill)

(setq gnus-fetch-old-headers 'some)

;; Save marked mails on the disk
(setq gnus-use-cache t)

;; Tree view for groups.
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;;Do not generate a message ID
(setq message-required-mail-headers
  (remove' Message-ID message-required-mail-headers))

(require 'init-bbdb)

;;Auto-complete for email addresses
(add-hook 'message-mode-hook
          '(lambda ()
             (bbdb-initialize 'message)
             (bbdb-initialize 'gnus)
             (local-set-key "<TAB>" 'bbdb-complete-name)))

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(setq bbdb/news-auto-create-p t)

