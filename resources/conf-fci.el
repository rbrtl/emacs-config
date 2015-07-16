;; fill-column-mode

(require 'fill-column-indicator)

(setq fci-rule-column 80)

(add-hook 'erlang-mode-hook 'fci-mode)

