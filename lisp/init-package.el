(yas-global-mode 1)

;; ibuffer : advance buffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
;; (auto-complete :repo "auto-complete/auto-complete" :fetcher github)

(require-package 'undo-tree)
(global-undo-tree-mode)
