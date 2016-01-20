;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/package/"))
(let ((default-directory
	(concat user-emacs-directory
		(convert-standard-filename "package/"))))
  (normal-top-level-add-subdirs-to-load-path))

;; ibuffer : advance buffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; Easy PG
;; (require 'epa-file)
;; (epa-file-enable)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete: custome function
;; (global-auto-complete-mode 1)
;; (add-to-list 'load-path "~/.emacs.d/package/popup-el")
;; (add-to-list 'load-path "~/.emacs.d/package/auto-complete")
(require 'popup)
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;; ((lambda (modes)
;;    "Bind the modes that gave to the auto-complete-mode"
;;    (interactive)
;;    (dolist (mode modes)
;;      (add-hook mode
;; 	       (lambda () (auto-complete-mode 1))))
;;    )(list 'jsx-mode-hook 'js-mode-hook 'lisp-interaction-mode 'cc-mode 'c-mode 'emacs-lisp-mode))
;; (Add-hook 'js-mode-hook
;;          (lambda () (auto-complete-mode 1)))

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; sws: scss
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; sws: jade
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; xtpl-mode
(add-to-list 'auto-mode-alist '("\\.xtpl" . html-mode))

;; es6-mode
(add-to-list 'auto-mode-alist '("\\.es6" . js-mode))

;; jsx-mode
;; https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/
;; (add-to-list 'load-path "~/.emacs.d/package/jsx-mode/src")
(require 'jsx-mode)
(setq jsx-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

;; restclient mode
;; (add-to-list 'load-path "~/.emacs.d/package/restclient-mode")
;; (require 'restclient)
;; (setq restclient-same-buffer-response t)
;; (setq restclient-same-buffer-response-name "*RESTful Response Message*")
;; (setq restclient-log-request nil)
;; (setq restclient-inhibit-cookies nil)

;; power-line
;; (add-to-list 'load-path "~/.emacs.d/package/powerline")
;; (require 'powerline)
;; (powerline-default-theme)

;; dash mode
;; (add-to-list 'load-path "~/.emacs.d/package/dash-at-point")
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; markdown mode
;; (add-to-list 'load-path "~/.emacs.d/package/markdown-mode")
;; (require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
;; (autoload 'jsx-mode "jsx-mode" "JSX mode" t)

;; ;; You can edit user-customizable variables by typing the following command.
;; ;;     M-x customize-group [RET] jsx-mode
;; (custom-set-variables
;;  '(jsx-indent-level 2)
;;  '(jsx-cmd-options '("--add-search-path" "/path/to/search-path"))
;;  '(jsx-use-flymake t)
;;  '(jsx-syntax-check-mode "compile"))

;; (defun jsx-mode-init ()
;;   (define-key jsx-mode-map (kbd "C-c d") 'jsx-display-popup-err-for-current-line)
;;   (when (require 'auto-complete nil t)
;;     (auto-complete-mode t)))

;; (add-hook 'jsx-mode-hook 'jsx-mode-init)
