(provide 'mode-setting)
;; cc mode---------------->>
(setq c-default-style
      (quote ((java-mode . "java")
	      (awk-mode . "awk")
              (c-mode . "bsd")
              (other . "stroustrup")))
      c-basic-offset 4)

;; nXML mode-------------->>
(setq nxml-child-indent 4)

;; makefile mode---------->>
(add-to-list 'auto-mode-alist '("\\.mak\\'" . makefile-mode))
