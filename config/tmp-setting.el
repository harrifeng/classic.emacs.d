(provide 'tmp-setting)

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)))
 '(
   multi-term
   helm-mt
   ))



(require 'multi-term)
(setq multi-term-program "/bin/bash")
;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)



(defun java-save-compile-and-run()
  (interactive)
  (save-buffer)
  (compile
   (format "cd $(git rev-parse --show-cdup) && export TERM=dumb && ./gradlew run -DmainClass=%s"
           (mapconcat 'identity
                      (split-string
                       (substring (file-name-sans-extension (buffer-file-name))
                                  (string-match "org" (file-name-sans-extension
                                                       (buffer-file-name)))
                                  (string-width (file-name-sans-extension
                                                 (buffer-file-name)))) "/") "."))))

(add-hook 'java-mode-hook
          (lambda ()
            (define-key java-mode-map (kbd "<f9>") 'java-save-compile-and-run)
            (define-key java-mode-map (kbd "TAB") #'company-indent-or-complete-common)
            ))

