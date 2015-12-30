;;; dto-org-gtd.el --- dto's org-mode configuration for GTD

;; Copyright (C) 2007  David O'Toole

;; Author: David O'Toole(require 'org) <dto@gnu.org>
;; Modifier: Junjia Ni (creamidea@gmail.com, 2015) 
;; Keywords: tools

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; There are several articles about using GTD (GettingThingsDone) with
;; OrgMode. I'm publishing mine as an Emacs Lisp source
;; file. 

;; This is a very basic example org-and-gtd setup. It's also my real
;; configuration, so you can load it yourself or just take a few
;; pieces.

;;; Code:

(require 'org)
(setq gtd-path "~/Documents/GTD")

;; I have a nice Wacom tablet, so I like to use the mouse. Org-mouse
;; adds various clickable menus to org-mode constructs.
(require 'org-mouse)

;; I want files with the extension ".org" to open in org-mode.
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; I keep almost everything in one big org file.
;; I open my gtd file when I hit C-c g
(defvar org-gtd-file (concat gtd-path "/newgtd.org"))
(defun gtd ()
  "Open the GTD file."
  (interactive)
  (find-file org-gtd-file))

;; Some basic keybindings.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cr" 'org-remember)
(global-set-key "\C-cg" 'gtd)
(global-set-key "\C-cc" 'org-capture)

;; This seems like a good basic set of keywords to start out with:

(setq org-use-fast-todo-selection t)
;; (setq org-todo-keywords '((type "TODO" "NEXT" "WAITING" "DONE")))
(setq org-todo-keywords
      (quote ((sequence "TODO(t!)" "NEXT(n)" "|" "DONE(d@/!)")
              (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "HOLD(h)" "|" "CANCELLED(c@/!)")
	      (sequence "SOMEDAY(s)"))))

;; Some projects need their own org files, but I still want them to
;; show up in my agenda.

(defvar org-gtd-other-files)
(setf org-gtd-other-files
      (list (concat gtd-path "/projects/third-part-monitor.org")
	    (concat gtd-path "/remember.org")
	    (concat gtd-path "/reading.org")))
(setf org-agenda-files (cons org-gtd-file org-gtd-other-files))
;; (setq org-agenda-files (list "~/Documents/GTD/project"))

;; When I'm using org to track issues in a project, I use these
;; keywords on a file-local basis: 

;; #+SEQ_TODO: TODO | DONE
;; #+SEQ_TODO: REPORT BUG KNOWNCAUSE | FIXED 
;; #+SEQ_TODO: | CANCELLED

;; The lisp version is:

;; (setq org-todo-keywords '((sequence "TODO" | "DONE")
;;   			  (sequence "REPORT" "BUG" "KNOWNCAUSE" | "FIXED")
;; 			  (sequence | "CANCELLED")))

;; Easy basic searches. Get a quick view of nextactions, etc

(setq org-agenda-custom-commands
      '(("w" todo "WAITING" nil)
	("n" todo "NEXT" nil)
	("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))))

;; I use org's tag feature to implement contexts.

(setq org-tag-alist '(("STUDIO" . ?s) ;; company studio office
		      ("PROJECT" . ?p) ;; difference task at company
		      ("HOME" . ?h) ;; home
		      ("MAIL" . ?m) ;; mail somebody
		      ("LUNCHTIME" . ?l) ;; breakfast lunchtime dinner onway etc. (rest)
		      ("TOURISM" . ?t) ;; tourism or not at home/company and any where
		      ("COMPUTER" . ?c)
		      ;; ("FIELD" . ?f) 
		      ("READING" . ?r))) ;; reading 

;; I like to color-code task types.

(setf org-todo-keyword-faces
      '(("NEXT" . (:foreground "yellow" :background "red" :bold t :weight bold))
	("TODO" . (:foreground "cyan" :bold t :weight bold))
	;; ("TODO" . (:foreground "cyan" :background "steelblue" :bold t :weight bold))
	("STARTED" . (:foreground "springgreen" :bold t :weight bold))
	("CANCELLED" . (:foreground "#DC143C" :bold t :weight bold))
	("WAITING" . (:foreground "yellow" :bold t :weight bold))
	;; ("WAITING" . (:foreground "yellow" :background "magenta2" :bold t :weight bold))
	("DEFERRED" . (:foreground "deepskyblue" :bold t :weight bold))
	("DONE" . (:foreground "gray50" :background "gray30"))))

;; I put the archive in a separate file, because the gtd file will
;; probably already get pretty big just with current tasks.

(setq org-archive-location "%s_archive::* Archive")

;; Remember support. This creates several files:
;;
;;   ~/todo.org      Where remembered TODO's are stored.
;;   ~/journal.org   Timestamped journal entries.
;;   ~/remember.org  All other notes

;; and a keybinding of "C-c r" for making quick notes from any buffer.

;; These bits of Remembered information must eventually be reviewed
;; and filed somewhere (perhaps in gtd.org, or in a project-specific
;; org file.) The out-of-sight, out-of-mind rule applies here---if I
;; don't review these auxiliary org-files, I'll probably forget what's
;; in them.

;; (add-to-list 'load-path "~/.emacs.d/package/remember-el")
;; (require 'remember)
;; move sub-tree from one file to another
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets '((org-agenda-files :level . 1)))
(setq org-reverse-note-order t)  ;; note at beginning of file by default.
(setq org-default-notes-file (concat gtd-path "/remember.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat gtd-path "/newgtd.org") "Tasks")
	 "* TODO %?\n  %i\n  %a\n")
        ("i" "Idea" entry (file+headline (concat gtd-path "/newgtd.org") "Idea")
	 "** %?\n %T\n  %a\n")
        ("j" "Journal" entry (file+datetree (concat gtd-path "/journal.org"))
	 "* %?\nEntered on %U\n  %i\n  %a\n")))

;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)

;; (setq org-remember-templates
;;       `((?t "* TODO %?\n  %i\n  %a" ,(concat gtd-path "/todo.org"))
;;         (?j "* %U %?\n\n  %i\n  %a" ,(concat gtd-path "/journal.org"))
;;         (?i "* %^{Title}\n  %i\n  %a" ,(concat gtd-path "/remember.org") "New Ideas")))

;; (global-set-key "\C-cr" 'org-remember)
;; (global-set-key [(f12)] 'org-remember)

;; My preferences. These are less related to GTD, and more to my
;; particular setup. They are included here for completeness, and so
;; that new org users can see a complete example org-gtd
;; configuration.

(setq org-return-follows-link t)
(setq org-hide-leading-stars t) 
(setf org-tags-column -65)
(setf org-special-ctrl-a/e t)

;; (setq org-log-done t)
(setq org-log-done 'time)
(setq org-log-done 'note)
(setq org-deadline-warning-days 14)
(setq org-fontify-emphasized-text t)
(setq org-fontify-done-headline t)
(setq org-agenda-include-all-todo nil)
(setq org-agenda-include-diary t)
(setq org-agenda-use-time-grid t)
(setq org-directory gtd-path)
;; org export setting(config)
;; (setq org-export-html-style "<link rel=stylesheet href=\"../e/freeshell2.css\" type=\"text/css\">")
;; (setq org-export-with-section-numbers nil)
;; (setq org-export-with-toc nil)
(setq org-adapt-indentation nil)

;; widen category field a little
(setq org-agenda-prefix-format "  %-17:c%?-12t% s")

;; fix new keybinding that clobbers mine
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key [(control tab)] 'other-window)))

(provide 'org-gtd)
;;; org-gtd.el ends here
