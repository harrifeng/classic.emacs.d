(provide 'el-setting)

(package-initialize)
;; check if the packages is installed; if not, install it.
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)))
 '(
   ag
   anything
   anything-config
   auto-complete
   bm
   dash-at-point
   grep-a-lot
   highlight-indentation
   highlight-symbol
   highline
   htmlize
   magit
   inf-ruby
   pastels-on-dark-theme
   restclient
   smartparens
   sublime-themes
   web-mode
   yasnippet dropdown-list ;; dropdown-list is needed by yasnippet
   ))
;; [A]g------------------------------------------------------------------->>
(setq ag-highlight-search t)

;; [A]nything-config && [A]nything---------------------------------------->>
(require 'anything-config)
(global-set-key (kbd "C-x b")
  (lambda() (interactive)
    (anything
     :prompt "Switch to: "
     :candidate-number-limit 100                 ;; up to 100 of each
     :sources
     '( anything-c-source-buffers               ;; buffers
        anything-c-source-recentf               ;; recent files
        anything-c-source-bookmarks             ;; bookmarks
        anything-c-source-files-in-current-dir+ ;; current dir
        anything-c-source-locate))))            ;; use 'locate'

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

;; [M]util-web-mode------------------------------------------------------->>
;; (require 'multi-web-mode)
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;                   (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;                   (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;; (multi-web-global-mode 1)

;; [P]astels-on-dark------------------------------------------------------>>
(load-theme 'pastels-on-dark t)
;; [R]ainbow-mode--------------------------------------------------------->>
;; (require 'rainbow-mode)
;; (dolist (hook '(css-mode-hook
;;                 html-mode-hook))
;;   (add-hook hook (lambda () (rainbow-mode t))))

;; [S]martparens---------------------------------------------------------->>
;; (smartparens-global-mode)
;; (show-smartparens-global-mode t)

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
