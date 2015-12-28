;; ===================================================
;; sws: scss
(add-to-list 'load-path (expand-file-name "~/.emacs.d/package/scss-mode"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
;; ===================================================
;; sws: jade
(add-to-list 'load-path "~/.emacs.d/package/jade-mode")
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
(add-to-list 'load-path "~/.emacs.d/package/jsx-mode/src")
(require 'jsx-mode)
(setq jsx-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

;; ===================================================
;; for restclient mode
(add-to-list 'load-path "~/.emacs.d/package/restclient-mode")
(require 'restclient)
(setq restclient-same-buffer-response t)
(setq restclient-same-buffer-response-name "*RESTful Response Message*")
(setq restclient-log-request nil)
(setq restclient-inhibit-cookies nil)

;; (add-to-list 'load-path "~/.emacs.d/package/powerline")
;; (require 'powerline)
;; (powerline-center-theme)

;; ===================================================
;; for dash
(add-to-list 'load-path "~/.emacs.d/package/dash-at-point")
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)
