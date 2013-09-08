(provide 'el-setting)

;; (package-initialize)
;; ;; check if the packages is installed; if not, install it.
;; (mapc
;;  (lambda (package)
;;    (or (package-installed-p package)
;;        (if (y-or-n-p (format "Package %s is missing. Install it? " package))
;;            (package-install package))))
;;  '(
;;    anything
;;    anything-config
;;    auto-complete
;;    grep-a-lot
;;    highlight-symbol
;;    jedi
;;    multi-web-mode
;;    magit
;;    rainbow-mode
;;    sublime-themes
;;    ))
;;
;; ;; [A]nything-config && [A]nything---------------------------------------->>
;; (require 'anything-config)
;; (global-set-key (kbd "C-x b")
;;   (lambda() (interactive)
;;     (anything
;;      :prompt "Switch to: "
;;      :candidate-number-limit 10                 ;; up to 10 of each
;;      :sources
;;      '( anything-c-source-buffers               ;; buffers
;;         anything-c-source-recentf               ;; recent files
;;         anything-c-source-bookmarks             ;; bookmarks
;;         anything-c-source-files-in-current-dir+ ;; current dir
;;         anything-c-source-locate))))            ;; use 'locate'
;;
;; ;; [A]uto-complete-------------------------------------------------------->>
;; (require 'auto-complete-config)
;; (ac-config-default)
;;
;; ;; [G]rep-a-lot----------------------------------------------------------->>
;; (require 'grep-a-lot)
;; (grep-a-lot-setup-keys)
;;
;; ;; [H]ighlight-symbol----------------------------------------------------->>
;; (setq highlight-symbol-mode t)
;; (global-set-key [(control f3)] 'highlight-symbol-at-point)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
;;
;; ;; [J]edi plugin---------------------------------------------------------->>
;; (add-hook 'python-mode-hook 'jedi:ac-setup)
;; (setq jedi:setup-keys t)
;;
;;
;; ;; [M]agit---------------------------------------------------------->>
;; ;; Nothing to config now
;;
;; ;; [M]util-web-mode------------------------------------------------------->>
;; (require 'multi-web-mode)
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;                   (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;                   (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;; (multi-web-global-mode 1)
;;
;; ;; [R]ainbow-mode--------------------------------------------------------->>
;; (require 'rainbow-mode)
;; (dolist (hook '(css-mode-hook
;;                 html-mode-hook))
;;   (add-hook hook (lambda () (rainbow-mode t))))
;;
;;
;; ;; [S]ublime-themes]------------------------------------------------------>>
;; (load-theme 'hickey t)

;; ;; [Y]asnippet------------------------------------------------------------>>
;; (require 'yasnippet)
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/path-to-yasnippet/snippets/")

;; ;; [Y]asnippet-bundle----------------------------------------------------->>
;; (require 'yasnippet-bundle)

;; ;; [Y]asnippet & [Y]asnippet bundle share following setting--------------->>
;; ;; modify conflict with org-mode
;; (yas-global-mode 1)
;; (defun yas/org-very-safe-expand ()
;;   (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))
;;
;; (add-hook 'org-mode-hook
;; 	  (lambda ()
;; 	    (make-variable-buffer-local 'yas/trigger-key)
;; 	    (setq yas/trigger-key [tab])
;; 	    (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
;; 	    (define-key yas/keymap [tab] 'yas/next-field)))
;;
;; ;;Right configuration for snippet show without mouse control
;; (require 'dropdown-list)
;; (setq yas/prompt-functions
;;       '(yas/dropdown-prompt
;;         yas/ido-prompt
;;         yas/x-prompt
;;         yas/completing-prompt
;;         yas/no-prompt))
