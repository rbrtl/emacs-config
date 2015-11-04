;; Config for auto-complete mode

(require 'auto-complete)

(setq-default ac-sources '(ac-source-filename
 ac-source-functions
 ac-source-yasnippet
 ac-source-variables
 ac-source-symbols
 ac-source-features
 ac-source-abbrev
 ac-source-words-in-same-mode-buffers
 ac-source-dictionary))
