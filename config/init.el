(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(user-full-name "Junjia Ni")
 '(user-mail-address "creamidea@gmail.com")
 '(inhibit-startup-message t) ;; close the start page(welcome page)
 '(make-backup-files nil)
 ;; '(custom-safe-themes
 ;;   (quote
 ;;    ("d3a85b814c17775b7dae99ddb20ff153f8a33013271ddd88d37548a32ec97d42" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 ;; '(frame-background-mode (quote dark))
 '(linum-format " %6i ")
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/Documents/work.org")))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 ;; '(cursor-type 'bar)
 '(blink-cursor-mode nil)
 '(blink-cursor-blinks 0)
 ;; '(line-spacing 0.24)
 '(message-log-max nil)
 '(electric-pair-mode t);; 括号自动补全
 '(indent-tabs-mode nil)
 '(transient-mark-mode (quote (only . t))))

;; ;;;;;;;;;;;;;;;;;;
;; set some variable;
;; ;;;;;;;;;;;;;;;;;
;; set the default directory
;; (setq default-directory "~/Code/")
(show-paren-mode 1) ;; 高亮括号匹配
;; (setq column-number-mode t)
;; (global-linum-mode t)

;; seth the tab size : TAB
;; (setq tab-stop-list ())
;; (setq indent-tabs-mode nil)
;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 2)
(setq-default tab-width 2)
(setq js-indent-level 2)
(setq python-indent-level 2)

;; ;;;;;;;;;;;;;;;;;
;; (server-start) ;;
;; ;;;;;;;;;;;;;;;;;
(load "server")
(unless (server-running-p) (server-start))

;; elpa setting
;; http://stable.melpa.org/#/getting-started
;; (require 'package) ;; You might already have this line
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; (when (< emacs-major-version 24)
;;   ;; For important compatibility libraries like cl-lib
;;   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;; (package-initialize) ;; You might already have this line

;; keymap binding
;; 设置M-空格 来setmark了,这样我就不用按 C-@ 来 setmark 了, C-@ 很不好按
(global-set-key (kbd "M-<SPC>") 'set-mark-command)

;; change Alt+;
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.If no region is selected and current line is not blank and we are not at the end of the line,then comment current line.Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;; load files
(load-file "~/.emacs.d/config/theme.el")
(load-file "~/.emacs.d/config/package.el")
(load-file "~/.emacs.d/config/org-mode.el")
