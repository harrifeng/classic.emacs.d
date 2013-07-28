(provide 'el-get-setting)

;;--------jedi plugin-------------------------------------------------->>
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:setup-keys t)

;; ---------yasnippet-------------------------------------------------->>
(yas-global-mode 1)
;; modify conflict with org-mode
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
	  (lambda ()
	    (make-variable-buffer-local 'yas/trigger-key)
	    (setq yas/trigger-key [tab])
	    (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
	    (define-key yas/keymap [tab] 'yas/next-field)))

;;Right configuration for snippet show without mouse control
(require 'dropdown-list)
(setq yas/prompt-functions
      '(yas/dropdown-prompt
        yas/ido-prompt
        yas/x-prompt
        yas/completing-prompt
        yas/no-prompt))

;; auto-complete------------------------------------------------------->>
(require 'auto-complete-config)
(ac-config-default)

;; grep-a-lot---------------------------------------------------------->>
;; (grep-a-lot-setup-keys) already set by el-get
