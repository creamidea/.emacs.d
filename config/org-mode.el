;; ===================================================
;; for org mode
(add-to-list 'load-path "~/.emacs.d/package/org-mode")
(add-to-list 'load-path "~/.emacs.d/package/org-mode/contrib/lisp" t)

(load-file "~/.emacs.d/config/worg-dto-org-gtd.el")
(require 'org-gtd)

(defun load-deck ()
  "Config for Deck"
  (require 'ox-deck)
  (custom-set-variables
   ;; neon swiss web-2.0
   '(org-deck-theme "web-2.0.css")
   ;; horizontal-slide vertical-slide fade
   '(org-deck-transition "fade.css")
   ;; '(org-deck-include-extensions '(goto menu navigation scale status))
   '(org-html-link-home "http://creamidea.github.io")))
(defun load-creamidea-publish ()
  "Config for Creamidea Publish"
  (require 'ox-publish)
  (setq org-src-fontify-natively t)
  (setq creamidea-path "/Users/creamidea/Documents/creamidea")
  (setq creamidea-public-path "/Users/creamidea/codes/repos/oe-nk/public") ;; Here will change by your oe-nk's public
  
  (setq meta-linkedin "<meta name=\"linkedin\" content=\"https://cn.linkedin.com/in/junjia-ni-b3a42365\"></meta>")
  (setq meta-email "<meta name=\"gmail\" content=\"creamidea@gmail.com\"></meta>")
  (setq link-medium-fonts "<link rel=\"stylesheet\" type=\"text/css\" href=\"/medium-fonts.css\" />")
  (setq link-style-css "<link rel=\"stylesheet\" type=\"text/css\" href=\"/style.css\" />")
  (setq analytics-js "<!-- Google Analytics --><script>window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;ga('create', 'UA-38213594-1', 'auto');ga('send', 'pageview');</script><script async src='//www.google-analytics.com/analytics.js'></script><!-- End Google Analytics -->")
  (setq app-js "<script src=\"/app.js\"></script>")
  
  (setq org-publish-project-alist
	`(
	  ;; 把各部分的配置文件写到这里面来
	  ("creamidea-article"
	   :base-directory ,(concat creamidea-path "/content")
	   ;; :base-directory ,(concat creamidea-path "/_articles/")
	   :base-extension "org"
	   
	   :publishing-directory ,creamidea-public-path
	   :recursive f
	   :publishing-function org-html-publish-to-html
	   :headline-levels 4             ; Just the default for this project.
	   :html-head ,(concat meta-linkedin meta-email link-style-css link-medium-fonts)
	   :html-postamble ,(concat app-js analytics-js)
	   :html-extension "html"
	   :auto-preamble t
	   :section-numbers t
	   ;; :body-only: t
	   :author "Junjia Ni(NekoTrek)"
	   :email "creamidea@gmail.com"
	   :auto-sitemap t                ; Generate sitemap.org automagically...
	   :sitemap-filename "index.org"  ; ... call it sitemap.org (it's the default)...
	   :sitemap-title "e[(i)(pi)]+1=0(19890514)" ; ... with title 'Sitemap'.
	   :sitemap-sort-files anti-chronologically
	   :sitemap-file-entry-format "%t %d"
	   :org-html-doctype-alist html5
	   )
	  ("creamidea-static"
	   :base-directory ,(concat creamidea-path "/static")
	   :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	   :publishing-directory  ,creamidea-public-path
	   :recursive f
	   :publishing-function org-publish-attachment
	   )
	  ("creamidea" :components ("creamidea-article" "creamidea-static"))
	  ;; ("creamidea" :components ("creamidea-article" "creamidea-static"))
	  ;; http://lujun9972.github.io/emacs/elisp/
	  ;; http://forrestchang.github.io/2015/08/29/use-emacs-org-mode-build-blog/
	  ))
  (global-set-key (kbd "C-c x") 'org-publish-current-project))
(eval-after-load "org"
  (lambda ()
    (load-creamidea-publish)
    (load-deck)))
