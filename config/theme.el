;; ;;;;;;;
;; themes;
;; ;;;;;;;

(when window-system (set-frame-size (selected-frame) 86 24))
(add-hook 'window-configuration-change-hook
          (lambda ()
            (setq frame-title-format
                  (concat
                   ;; "creamidea@gmail.com: "
                   ;; invocation-name "@" system-name ": "
                   "Au9ustTrek@" system-name ":"
                   (replace-regexp-in-string
                    (concat "/home/" user-login-name) "~"
                    (or buffer-file-name "%b"))))))
;; (x-focus-frame nil)
;; :font Menlo Monaco Fira-Mono Source-Code-Pro
;; (let ((my-favourite-font "Fira Mono")
;;       (my-font-size "16"))
;;   (add-to-list 'initial-frame-alist `(font . ,(concat my-favourite-font "-" my-font-size)))
;;   (add-to-list 'default-frame-alist `(font . ,(concat my-favourite-font "-" my-font-size)))
;;   (set-face-attribute 'default nil :family my-favourite-font :height 160))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; :font Menlo Monaco Fira-Mono Source-Code-Pro DejaVu-Sans-Mono
 ;; :weight Regular bold normal
 '(default ((t (:family "DejaVu Sans Mono" :weight bold :height 120 :width normal)))))
;; '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight Regular :height 160 :size 16 :width normal)))))

;; Setting Chinese Font
(if (display-graphic-p)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family "PingFang SC" :size 14)))
  ;; (font-spec :family "Microsoft Yahei" :size 14 :height 156)))
  )

;; set transparency
;; (set-frame-parameter (selected-frame) 'alpha '(95 95))
;; (add-to-list 'default-frame-alist '(alpha 95 95))

;; emacs-color-themes
;; https://github.com/owainlewis/emacs-color-themes
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-themes/themes")
;; (load-theme 'brin t)
;; (load-theme 'junio t)

;; solarized
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;; (load-theme 'solarized t)
;; (custom-set-variables
;;  '(solarized-termcolors 256)
;;  '(solarized-contrast 'high)
;;  '(solarized-visibility 'high)
;;  '(solarized-degrade t))
;; (set-frame-parameter nil 'background-mode 'dark)
;; (set-terminal-parameter nil 'background-mode 'dark)
;; (enable-theme 'solarized)

;; tomorrow-theme
(load-file "~/.emacs.d/themes/tomorrow-theme/color-theme-tomorrow.el")
;; (require 'color-theme-tomorrow)
(load-theme 'tomorrow-night-bright t)
;; (load-theme 'tomorrow-night t)
;; (load-theme 'tomorrow-night tomorrow-night-eighties t)
