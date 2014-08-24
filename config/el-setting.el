(provide 'el-setting)

(package-initialize)
;; check if the packages is installed; if not, install it.
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)))
 '(
   ag
   auto-complete
   bm
   dash-at-point
   dsvn
   grep-a-lot
   git-gutter
   helm
   helm-ag
   helm-projectile
   highlight-indentation
   highlight-symbol
   highline
   htmlize
   magit
   multi-term
   multiple-cursors
   inf-ruby
   pastels-on-dark-theme
   projectile
   restclient
   rvm
   scss-mode
   sublime-themes
   web-mode
   yasnippet dropdown-list ;; dropdown-list is needed by yasnippet
   ))
;; [A]g------------------------------------------------------------------->>
(setq ag-highlight-search t)

;; [A]uto-complete-------------------------------------------------------->>
(require 'auto-complete-config)
(ac-config-default)

;; [B]m-toogle------------------------------------------------------------>>
(require 'bm)
(global-set-key (kbd "C-x m")        'bm-toggle)

;; [G]rep-a-lot----------------------------------------------------------->>
(require 'grep-a-lot)
(grep-a-lot-setup-keys)

;; [H]ighlight-indentation------------------------------------------------>>
(require 'highlight-indentation)

(add-hook 'ruby-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))

(add-hook 'emacs-lisp-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))

(add-hook 'python-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))

;; [H]ighlight-symbol----------------------------------------------------->>
(setq highlight-symbol-mode t)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; [H]ighline-mode-------------------------------------------------------->>
(require 'highline)
(highline-mode 1)
(global-set-key [f8] 'highline-mode)

;; To customize the background color
(set-face-background 'highline-face "#333")

;; [I]nf-ruby------------------------------------------------------------->>
;; ruby shell mode

;; [M]agit---------------------------------------------------------------->>
;; Nothing to config now

;; [P]astels-on-dark------------------------------------------------------>>
(load-theme 'pastels-on-dark t)

;; [P]rojectile----------------------------------------------------------->>
;; (projectile-global-mode)


;; to enable caching unconditionally
;; (setq projectile-enable-caching t)

;; To disable remote file exists cache that use this snippet of code:
;; (setq projectile-file-exists-remote-cache-expire nil)

;; Completion
;; (setq projectile-completion-system 'grizzl)

;; [R]ainbow-mode--------------------------------------------------------->>
;; (require 'rainbow-mode)
;; (dolist (hook '(css-mode-hook
;;                 html-mode-hook))
;;   (add-hook hook (lambda () (rainbow-mode t))))

;; [S]ublime-themes]------------------------------------------------------>>
;; (load-theme 'hickey t)
;; (load-theme 'wheatgrass t)

;; [W]eb-mode------------------------------------------------------------->>
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; [Y]asnippet------------------------------------------------------------>>
(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs
      '(
        (concat my-emacs-path "snippets")
        ))

;; [d]ropdown-------------------------------------------<<
(require 'dropdown-list)
(setq yas-prompt-functions
      '(yas/dropdown-prompt
        yas/ido-prompt
        yas/x-prompt
        yas/completing-prompt
        yas/no-prompt))
(require 'restclient)
(add-to-list 'auto-mode-alist '("\\.http?\\'" . restclient-mode))

(require 'multi-term)
(require 'git-gutter)
(global-git-gutter-mode +1)

(require 'dsvn)

(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

;; This file integrates well with vc-svn, so you might want to do this
;; as well:

(require 'vc-svn)

(require 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))


(require 'helm)

(global-set-key (kbd "C-;")          'helm-toggle-visible-mark)
(global-set-key (kbd "C-x C-r")      'helm-recentf)
(global-set-key (kbd "C-x b")        'helm-mini)
(global-set-key (kbd "M-p")          'helm-projectile)
(global-set-key (kbd "M-y")          'helm-show-kill-ring)
(global-set-key (kbd "M-x")          'helm-M-x)
(global-set-key (kbd "C-c C-m")      'helm-M-x)
(global-set-key (kbd "C-x C-m")      'helm-M-x)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
