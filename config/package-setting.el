(provide 'package-setting)

;; ;; auto-complete------------------------------------------------------->>
;; (require 'auto-complete-config)
;; (ac-config-default)
;;
;; ;; color theme autoload[package:sublime-themes]------------------------------>>
;; ;; (load-theme 'hickey t)
;;
;;
;; ;; Yasnippet-bundle---------------------------------------------------->>
;; (require 'yasnippet-bundle)
;;
;; ;;Right configuration for snippet show without mouse control
;; (require 'dropdown-list)
;; (setq yas/prompt-functions
;;       '(yas/dropdown-prompt
;;         yas/ido-prompt
;;         yas/x-prompt
;;         yas/completing-prompt
;;         yas/no-prompt))
;; ;; If we want to use custome yasnippet, we should download yasnippet
;; ;; other than yasnippet-buddle
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; (require 'yasnippet)						 ;;
;; ;; (yas/initialize)						 ;;
;; ;; (yas/load-directory "~/.emacs.d/path-to-yasnippet/snippets/") ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; mutil-web-mode---------------------------------------------------->>
;; (require 'multi-web-mode)
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;                   (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;                   (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;; (multi-web-global-mode 1)
