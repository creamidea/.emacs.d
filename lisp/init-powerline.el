;;; package --- Summary
;;; Commentary:
;;; set the powerline

;;; Code:
(require-package 'powerline)
(powerline-default-theme)

;; https://github.com/AnthonyDiGirolamo/airline-themes
;; (require 'airline-themes)
;; (load-theme 'airline-base16-gui-light)
;; ;; light/base16-gui-dark
;; (setq powerline-utf-8-separator-left        #xe0b0
;;       powerline-utf-8-separator-right       #xe0b2
;;       airline-utf-glyph-separator-left      #xe0b0
;;       airline-utf-glyph-separator-right     #xe0b2
;;       airline-utf-glyph-subseparator-left   #xe0b1
;;       airline-utf-glyph-subseparator-right  #xe0b3
;;       airline-utf-glyph-branch              #xe0a0
;;       airline-utf-glyph-readonly            #xe0a2
;;       airline-utf-glyph-linenumber          #xe0a1)

(provide 'init-powerline)
;;; init-powerline.el ends here.
