(provide 'package-setting)

;; auto-complete------------------------------------------------------->>
(require 'auto-complete-config)
(ac-config-default)

;; monokai-theme------------------------------------------------------->>
(load-theme 'hickey t)


;; Yasnippet-bundle---------------------------------------------------->>
(require 'yasnippet-bundle)

;;Right configuration for snippet show without mouse control
(require 'dropdown-list)
(setq yas/prompt-functions
      '(yas/dropdown-prompt
        yas/ido-prompt
        yas/x-prompt
        yas/completing-prompt
        yas/no-prompt))
;; If we want to use custome yasnippet, we should download yasnippet
;; other than yasnippet-buddle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'yasnippet)						 ;;
;; (yas/initialize)						 ;;
;; (yas/load-directory "~/.emacs.d/path-to-yasnippet/snippets/") ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
