(provide 'tmp-setting)

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)))
 '(
   multi-term
   helm-mt
   company-go
   exec-path-from-shell
   ))



(require 'multi-term)
(setq multi-term-program "/bin/bash")
;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)


(defun rust-save-compile-and-run ()
  (interactive)
  (save-buffer)

  (if (locate-dominating-file (buffer-file-name) "Cargo.toml")

      (compile "cargo run")

    (compile
     (format "rustc %s && %s"
         (buffer-file-name)
         (file-name-sans-extension (buffer-file-name))))))

(add-hook 'rust-mode-hook
      (lambda ()
        (define-key rust-mode-map (kbd "<f9>") 'rust-save-compile-and-run)))


(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))

(add-hook 'go-mode-hook
      (lambda ()
        (define-key go-mode-map (kbd "<f9>") 'go-run)))
