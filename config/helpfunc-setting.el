(provide 'helpfunc-setting)

(defun sap-proxy()
  (interactive)
  (setq url-proxy-services '(("http" . "proxy.sin.sap.corp:8080")
                             ("https" . "proxy.sin.sap.corp:8080")))
  )
(defun no-proxy()
  (interactive)
  (setq url-proxy-services nil)
  )


(defun whack-whitespace (arg)
  "Delete all white space from point to the next word.  With prefix ARG
    delete across newlines as well.  The only danger in this is that you
    don't have to actually be at the end of a word to make it work.  It
    skips over to the next whitespace and then whacks it all to the next
    word."
  (interactive "P")
  (let ((regexp (if arg "[ \t\n]+" "[ \t]+")))
    (re-search-forward regexp nil t)
    (replace-match "" nil nil)))

;; Translate the problematic keys to the function key Hyper,
;; then bind this to the desired ctrl-i behavior
(keyboard-translate ?\C-i ?\H-i)
(global-set-key [?\H-i] 'whack-whitespace)

(defun shell-mode-auto-rename-buffer (text)
  (if (eq major-mode 'shell-mode)
      (rename-buffer  (concat "*Shell: "
                  (concat default-directory "*")) t)))

(defun my-shell-mode-hook ()
  (local-set-key (kbd "C-x C-l")
         (lambda nil (interactive) (erase-buffer)
           (comint-send-input)))
  )

;;eshell clear the screen
(defun eshell/cls ()
  "Clears the shell buffer ala Unix's clear or DOS' cls"
  (interactive)
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
    ;; simply delete the region
    (delete-region (point-min) (point-max))))

;; Alt+; as comment advanced;
(defun qiang-comment-dwim-line (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p))
       (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position)
                   (line-end-position))
    (comment-dwim arg)))


;; Copy line from point to the end, also, exclude the line break,
;; it will looks more naturely
(defadvice kill-ring-save
  (before slick-copy activate compile)
  "When called interactively with no active region,
   copy a single line instead."
  (interactive (if mark-active (list (region-beginning)
                     (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))

;; For Ctrl + x, Ctrl + u
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))
(defun backward-kill-line (arg)
  (interactive "p") (kill-line 0) )

;; For ctrl + x, ctrl + k
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;;set transparent and use f4 to control it
(setq alpha-list '((100 100) (80 70) (60 40)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )

;; font setting functions
(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  (require 'cl)                         ; for find if
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
                            :size chinese-font-size)))
    ;; Set the default English font
    ;;
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)

    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Following is the shell customization ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; run mulitiple shell
(add-hook 'comint-output-filter-functions 'shell-mode-auto-rename-buffer)

;; run mulitiple eshell
(add-hook 'eshell-mode-hook
      (lambda ()
        (rename-buffer (concat "*EShell: "
                   (concat default-directory "*")) t)))

(add-hook 'eshell-directory-change-hook
      (lambda ()
        (rename-buffer (concat "*EShell: "
                   (concat default-directory "*")) t)))


;;clean all the buffer content
(add-hook 'shell-mode-hook 'my-shell-mode-hook)

(setq
 eshell-save-history-on-exit   t
 eshell-history-size           512
 eshell-hist-ignoredups        t
 eshell-cmpl-ignore-case       t
 eshell-cp-interactive-query   t
 eshell-ln-interactive-query   t
 eshell-mv-interactive-query   t
 eshell-rm-interactive-query   t
 eshell-mv-overwrite-files     nil
 eshell-highlight-prompt   t
 eshell-prompt-regexp      "^[^#$\n]* [#>]+ "
 eshell-prompt-function
 (lambda nil
   (concat
    (abbreviate-file-name (eshell/pwd))
    (if (= (user-uid) 0)
    " # " " >>> ")))
 )

;; eshell time spent
(add-hook 'eshell-load-hook
          (lambda()(setq last-command-start-time (time-to-seconds))))
(add-hook 'eshell-pre-command-hook
          (lambda()(setq last-command-start-time (time-to-seconds))))
(add-hook 'eshell-before-prompt-hook
          (lambda()
        (message "spend %g seconds"
             (- (time-to-seconds) last-command-start-time))))
