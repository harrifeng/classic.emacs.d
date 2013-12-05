(provide 'build-in-setting)

;;--------mail---------------------->>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use ssl, it will NOT need any support from gnutls or starttls to ;;
;; send email, tested on Mac and Windows 7                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq smtpmail-stream-type 'ssl)
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 465)

;;--------tramp-------------------->>
(require 'tramp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tramp will ask for plink in windows, I will use cygwin emacs on ;;
;; windows							   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tramp setting password keep time
(setq password-cache-expiry 6000)
;; usage is like this /sudo:root@host, then select the user name
(if (string-equal system-type "windows-nt")
    (add-to-list 'tramp-default-proxies-alist
                 '(nil "\\`root\\'" "/plink:%h:"))
  (add-to-list 'tramp-default-proxies-alist
               '(nil "\\`root\\'" "/ssh:%h:")))

(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))

;; --------uniquify------------------->>
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-separator "|@|")

;; --------paren------------------->>
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0)

;; --------iswitch----------------->>
(iswitchb-mode 1)
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "*Messages*"))

;;--------recentf------------------>>
(recentf-mode 1)
(setq recentf-max-menu-items 100)

;;--------ibuffer------------------>>
(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Shell"  (or
                          (mode . shell-mode)
                          (mode . eshell-mode)))
               ("Grep"   (or
                          (mode . grep-mode)
                          (mode . occur-mode)))
               ("Python" (or
                          (name . "^\\*Py")
                          (mode . python-mode)))
               ("Sql"    (or
                          (name . "^\\*SQ")
                          (mode . sql-mode)))
               ("XML"    (or
                          (mode . nxml-mode)
                          (mode . html-mode)
                          (mode . js-mode)))
               ("Make"   (or
                          (name . "Makefile")
                          (name . "MAKEFILE")
                          (filename . "\\.mak$")))
               ("Emacs"  (or
                          (mode . emacs-lisp-mode)
                          (name . "^\\.emacs$")))
               ("C-like" (or
                          (mode . c-mode)
                          (mode . java-mode)
                          (mode . c++-mode)))
               ("bat-sh" (or
                          (filename . "\\.bat$")
                          (filename . "\\.sh$")))
               ("Log"    (or
                          (filename . "\\.md$")
                          (filename . "\\.log$")))
               ("Manage" (or
                          (name . "^\\*Bookmark List")
                          (name . "^\\*Open Recent")
                          (name . "^\\*Messages")
                          (name . "^\\*Completions")
                          (name . "^\\*Compile-Log")
                          (name . "^\\*scratch\\*$")))
               ("Ruby"   (mode . ruby-mode))
               ("Magit"  (name . "^\\*magit"))
               ("Docs"   (mode . org-mode))
               ("Dired"  (mode . dired-mode))))))

(setq ibuffer-show-empty-filter-groups nil)

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;;--------org-mode------------------>>
;; I don't want to use org-mode's auto type subscript.
;; only setting this is not enough, you also
;; have to set '#+OPTIONS:^:{}' at the beginning
;; of the org file, With this setting, 'a_b' will
;; not be interpreted as a subscript, but 'a_{b}' will.
(setq org-export-with-sub-superscripts nil)

;; When you have made some personal keyboard shortcuts in
;; emacs using global-set-key, both major modes and minor
;; modes will override those if it uses the same keys.
;; This is because major mode and minor mode's keymaps
;; have priority over global keymaps.
(add-hook 'org-mode-hook
          (lambda()
            (define-key org-mode-map (kbd "C-,") 'set-mark-command)))

(setq org-publish-project-alist
      (list
       '("htmlfiles"
         :base-extension "org"
         :publishing-function org-publish-org-to-html
         :headline-levels 3
         :with-section-numbers nil
         :table-of-contents nil
         :auto-preamble t
         :htmlized-source t
         :auto-postamble nil)))

;; org-mode blog (require orgmode version 8.0)

(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "~/orgblog/org/"
         :base-extension "org"
         :publishing-directory "~/orgblog/blog/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :html-link-home "index.html"
         :html-link-up "sitemap.html"
         :headline-levels 5
         :section-numbers nil
         :auto-preamble t
         :auto-sitemap t ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org" ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap" ; ... with title 'Sitemap'.
         :author "your name"
         :email "your email"
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\"/>"
         :html-preamble
         "
         <div id=\"header\">
            <div id=\"header-top\">
                <div id=\"blog-title\">Harrifeng's Path</div>
                <div id=\"blog-sub-title\"></div>
            </div>
            <div id=\"nav\">
                <ul>
                    <li><a href=\"/\">首页</a></li>
                    <li><a href=\"/notes.html\">读书笔记</a></li>
                    <li><a href=\"/about.html\">About</a></li>
                    <li><a href=\"/atom.xml\">RSS</a></li>
                    <li>
                    </li>
                </ul>
            </div>
         </div>
         "
         :html-postamble
         "
         <!-- Duoshuo Comment BEGIN -->
         <div class=\"ds-thread\"></div>
         <script type=\"text/javascript\">
             var duoshuoQuery = {short_name:\"harrifeng\"};
             (function() {
             var ds = document.createElement('script');
             ds.type = 'text/javascript';ds.async = true;
             ds.src = 'http://static.duoshuo.com/embed.js';
             ds.charset = 'UTF-8';
             (document.getElementsByTagName('head')[0] 
             || document.getElementsByTagName('body')[0]).appendChild(ds);
             })();
         </script>
         <!-- Duoshuo Comment END -->
         ")
        ("blog-static"
         :base-directory "~/orgblog/org/"
         :base-extension "css\\|js\\|pdf\\|png\\|jpg\\|gif\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/orgblog/blog/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-static"))
        ;;
        ))
