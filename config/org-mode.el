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
  (require 'ox-rss)
  (setq org-src-fontify-natively t)
  (setq creamidea-path "/Users/creamidea/Documents/creamidea")
  (setq creamidea-public-path "/Users/creamidea/Documents/creamidea")
  ;; (setq creamidea-public-path "/Users/creamidea/Code/repos/oe-nk/public") ;; Here will change by your oe-nk's public
  
  ;; (setq meta-linkedin "<meta name=\"linkedin\" content=\"https://cn.linkedin.com/in/junjia-ni-b3a42365\">")
  ;; %t stands for the title.
  ;; %a stands for the author's name.
  ;; %e stands for the author's email.
  ;; %d stands for the date.
  ;; %c will be replaced by `org-html-creator-string'.
  ;; %v will be replaced by `org-html-validation-link'.
  ;; %T will be replaced by the export time.
  ;; %C will be replaced by the last modification time.
  ;; C-h v org-html-postamble-format 
  (setq author-info "<div id=\"meta-article\"><p class=\"author\">%a</p>\n<p class=\"email\">%e</p>\n<p class=\"date\">%d</p>\n<p class=\"export-date\">%T</p>\n<p class=\"creator\">%c</p>\n<p class=\"validation\">%v</p>\n<p class=\"last-modification-time\">%C</p></div>") 
  (setq link-medium-fonts "<link rel=\"stylesheet\" type=\"text/css\" href=\"/static/medium-fonts.css\">")
  (setq link-style-css "<link rel=\"stylesheet\" type=\"text/css\" href=\"/static/style.css\">")
  (setq analytics-js "<!-- Google Analytics --><script>window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;ga('create', 'UA-38213594-1', 'auto');ga('send', 'pageview');</script><script async src='//www.google-analytics.com/analytics.js'></script><!-- End Google Analytics -->")
  (setq app-js "<script src=\"/static/app.js\"></script>")

  (setq org-link-abbrev-alist
	'(("static-img"  . "../static/img/reference/%s")
	  ("glfs" . "https://media.githubusercontent.com/media/creamidea/creamidea.github.com/master/static/lfs/%s")
	  ("gdraw". "https://docs.google.com/drawings/d/")
	  ("url-to-ja" . "http://translate.google.fr/translate?sl=en&tl=ja&u=%h")
	  ("google"    . "http://www.google.com/search?q=")
	  ("gmap"      . "http://maps.google.com/maps?q=%s")
	  ("omap"      . "http://nominatim.openstreetmap.org/search?q=%s&polygon=1")
	  ("ads"       . "http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?author=%s&db_key=AST")))
  
  (setq org-publish-project-alist
	`(
	  ;; 把各部分的配置文件写到这里面来
	  ("creamidea-article"
	   :base-directory ,(concat creamidea-path "/_content")
	   ;; :base-directory ,(concat creamidea-path "/_articles/")
	   :base-extension "org"
	   
	   :publishing-directory ,creamidea-public-path
	   :recursive f
	   :publishing-function org-html-publish-to-html
	   :headline-levels 4             ; Just the default for this project.
	   :html-head ,(concat link-style-css link-medium-fonts)
	   ;; :auto-preamble t
	   ;; :html-preamble ,(concat app-js analytics-js)
	   :html-postamble ,(concat author-info app-js analytics-js )
	   :html-extension "html"
	   :section-numbers t
	   ;; :body-only: t
	   :author "冰糖火箭筒(Junjia Ni)"
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
	   :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|html"
	   :publishing-directory  ,creamidea-public-path
	   :recursive f
	   :publishing-function org-publish-attachment
	   )
	  ("homepage-rss"
	   :base-directory ,(concat creamidea-path "/_content")
	   :base-extension "org"
	   :publishing-directory ,creamidea-public-path
	   :publishing-function (org-rss-publish-to-rss)
	   :html-link-home "http://creamidea.github.io/"
	   :html-link-use-abs-url t)
	  ;; :rss-image-url "http://creamidea.github.io/favicon.ico"
	  ;; :rss-extension "xml"
	  ;; :section-numbers nil
	  ;; :exclude ".*"            ;; To exclude all files...
	  ;; :include ("index.org")   ;; ... except index.org.
	  ;; :table-of-contents nil)
	  ("creamidea" :components ("creamidea-article" "homepage-rss"))
	  ;; ("creamidea" :components ("creamidea-article" "creamidea-static"))
	  ;; http://lujun9972.github.io/emacs/elisp/
	  ;; http://forrestchang.github.io/2015/08/29/use-emacs-org-mode-build-blog/
	  ))
  (global-set-key (kbd "C-c x") 'org-publish-current-project))
(eval-after-load "org"
  (lambda ()
    (load-creamidea-publish)
    (load-deck)))
