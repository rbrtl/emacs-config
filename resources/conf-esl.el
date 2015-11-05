;; ESL related configurations

; Some utility functions from ergoemacs.org
(defun s-trim-left (s)
  "Remove whitespace at the beginning of S."
  (if (string-match "\\`[ \t\n\r]+" s)
      (replace-match "" t t s)
    s))

(defun s-trim-right (s)
  "Remove whitespace at the end of S."
  (if (string-match "[ \t\n\r]+\\'" s)
      (replace-match "" t t s)
    s))

(defun s-trim (s)
  "Remove whitespace at the beginning and end of S."
  (s-trim-left (s-trim-right s)))


;; Load the path from file and remove all whitespaces if there is any from the
;; beginning and the tail of the string
(setq kerl-current-erlang-root (s-trim
                                (with-temp-buffer
                                  (insert-file-contents "~/.kerl/.activepath")
                                  (buffer-string))))

(setq erlang-root-dir kerl-current-erlang-root)
(add-to-list 'exec-path (concat
                         (file-name-as-directory kerl-current-erlang-root)
                         "bin"))
(setq erlang-man-root-dir (concat
                           (file-name-as-directory kerl-current-erlang-root)
                           "man"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ESL related templates

;; (tempo-define-template
;;  "esl-module-header"
;;  '("%%%=============================================================================
;; %%% @copyright (C) 1999-2012, Erlang Solutions Ltd
;; %%% @author Gabor Olah <gabor.olah@erlang-solutions.com>
;; %%% @doc 
;; %%%
;; %%% 
;; %%%
;; %%% @end
;; %%%=============================================================================
;; "))
