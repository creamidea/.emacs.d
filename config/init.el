 (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d3a85b814c17775b7dae99ddb20ff153f8a33013271ddd88d37548a32ec97d42" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(frame-background-mode (quote dark))
 '(linum-format " %5i ")
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/Documents/work.org")))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(user-full-name "Junjia Ni")
 '(user-mail-address "creamidea@gmail.com")
 '(transient-mark-mode (quote (only . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "outline" :slant normal :weight Regular :height 150 :width normal)))))
;; Setting Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "PingFang SC" :size 15)))
;; (font-spec :family "Microsoft Yahei" :size 14)))

(add-hook 'window-configuration-change-hook
          (lambda ()
            (setq frame-title-format
                  (concat
                   ;; "creamidea@gmail.com: "
                   ;; invocation-name "@" system-name ": "
                   "Au9ustTrek@" system-name
                   (replace-regexp-in-string
                    (concat "/home/" user-login-name) "~"
                    (or buffer-file-name "%b"))))))
;; (x-focus-frame nil)

;; =============================================
;; http://stable.melpa.org/#/getting-started
;; (require 'package) ;; You might already have this line
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; (when (< emacs-major-version 24)
;;   ;; For important compatibility libraries like cl-lib
;;   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;; (package-initialize) ;; You might already have this line

;; ================================================================================
;; themes
;; https://github.com/owainlewis/emacs-color-themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-themes/themes")
(load-theme 'brin t)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;; (load-theme 'solarized t)

;; ==================================================
;; dont create make backup file
(setq make-backup-file nil)
;; dont create the template file
(setq-default make-backup-files nil)
;; close the start page(welcome page)
(setq inhibit-startup-message t)
;; set the default directory
(setq default-directory "~/codes/")
;; 括号自动补全
(electric-pair-mode t)
(show-paren-mode 1)
;; (setq column-number-mode t)
;; (global-linum-mode t)
;; set transparency
;; (set-frame-parameter (selected-frame) 'alpha '(95 95))
;; (add-to-list 'default-frame-alist '(alpha 95 95))

;; ===================================================
;; ibuffer : advance buffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; 设置M-空格 来setmark了,这样我就不用按 C-@ 来 setmark 了, C-@ 很不好按
(global-set-key (kbd "M-<SPC>") 'set-mark-command)

;; seth the key : TAB
(setq default-tab-width 2)
(setq tab-stop-list ())
(setq-default indent-tabs-mode nil)

;; Easy PG
;; (require 'epa-file)
;; (epa-file-enable)

;; 改造Alt+;
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;; custom
;; ===================================================
;; yasnippet
(add-to-list 'load-path "~/.emacs.d/package/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; ===================================================
;; auto-complete: custome function
;; (global-auto-complete-mode 1)
((lambda (modes)
   "Bind the modes that gave to the auto-complete-mode"
   (interactive)
   (dolist (mode modes)
     (add-hook mode
	       (lambda () (auto-complete-mode 1))))
   )(list 'jsx-mode-hook 'js-mode-hook 'lisp-interaction-mode 'cc-mode 'c-mode 'emacs-lisp-mode))
;; (Add-hook 'js-mode-hook
;;          (lambda () (auto-complete-mode 1)))

(load-file "~/.emacs.d/config/org-mode.el")
(load-file "~/.emacs.d/config/others-mode.el")

;; ================================================================================
;; (server-start)
(load "server")
(unless (server-running-p) (server-start))
