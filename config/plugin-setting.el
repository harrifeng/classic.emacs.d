(provide 'plugin-setting)

;;--------tramp-------------------->>
(require 'tramp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tramp will ask for plink in windows, I will use cygwin emacs on ;;
;; windows							   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tramp setting password keep time
(setq password-cache-expiry 6000)
;; usage is like this /sudo:root@host, then select the user name
(add-to-list 'tramp-default-proxies-alist
	     '(nil "\\`root\\'" "/ssh:%h:"))

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
               ("shell"  (or
			  (mode . shell-mode)
			  (mode . eshell-mode)))
               ("python" (or
			  (name . "^\\*Py")
			  (mode . python-mode)))
               ("ruby"   (mode . ruby-mode))
               ("html"   (mode . html-mode))
	       ("cc-c"   (or
			  (mode . c-mode)
			  (mode . c++-mode)))
               ("java"   (mode . java-mode))
               ("org"    (mode . org-mode))
	       ("emacs"  (or
			  (mode . emacs-lisp-mode)
			  (name . "^\\.emacs$")
			  (name . "^\\*scratch\\*$")))
	       ("Make"  (or
			  (name . "Makefile")
			  (name . "MAKEFILE")
			  (filename . "\\.mak$")))
	       ("bat-sh" (or
			  (filename . "\\.bat$")
			  (filename . "\\.sh$")))
	       ("temp"   (or
			  (name . "^\\*$")))
               ("xml"    (mode . nxml-mode))
               ("dired"  (mode . dired-mode))))))

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
	    (define-key org-mode-map (kbd "C-,") 'set-mark-command)
	    ))

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
	 :auto-postamble nil)
       ))
