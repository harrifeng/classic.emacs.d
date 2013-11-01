(provide 'basic-setting)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; =============Quantified Habits================ ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq user-mail-address "harrifeng@gmail.com")
(setq user-full-name    "harrifeng")

(setq kill-ring-max 200)

(setq-default tab-width 4)

(setq scroll-step 0
      scroll-margin 0
      scroll-conservatively 10000)

(fset 'yes-or-no-p 'y-or-n-p)

(setq ring-bell-function 'ignore)

(setq ispell-program-name "aspell.exe")

;;auto expand
(setq hippie-expand-try-functions-list
      '(try-expand-line ;; whole line first
	try-expand-line-all-buffers
	try-expand-list
	try-expand-list-all-buffers
	try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name
	try-complete-file-name-partially
	try-complete-lisp-symbol
	try-complete-lisp-symbol-partially
	try-expand-whole-kill))

;;Custom setting saved file location
(setq abbrev-file-name (concat my-lisps-path ".abbrev_defs"))
(setq custom-file (concat my-lisps-path ".emacs_custom.el"))

;;auto compile elc file when saved
(add-hook 'after-save-hook
          (lambda ()
            (if (eq major-mode 'emacs-lisp-mode)
                (save-excursion (byte-compile-file buffer-file-name)))))

;;faster compile & accurate warning.
(setq byte-compile-verbose nil)
(setq font-lock-verbose t)

;;UTF-8 Setting
(set-language-environment 'Chinese-GB)
(setq-default pathname-coding-system 'euc-cn)
(setq file-name-coding-system 'euc-cn)

;;Encoding setting
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-16)
(prefer-coding-system 'utf-8)

;; grep-windows-height
(setq compilation-window-height 12)
(setq grep-window-height 12)

(setenv "PAGER" "cat")

;; packages setting, this will work on all platforms, although unix-link system
;; can use el-get, package still exist as supplementary
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))  

(package-initialize)

;; different font size for different hosts
(defconst my-font-size
  (cond
   ((string-match system-name "hfeng-home")
    ":pixelsize=18")
   ((string-match system-name "hfeng-air.local")
    ":pixelsize=14")
   ((string-match system-name "hfeng-t60p")
    ":pixelsize=20")
   ((string-match system-name "sh-rd-hfeng")
    ":pixelsize=14")
   (":pixelsize=14")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ==============Boolean Habits=================== ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use spaces only!
(setq-default indent-tabs-mode nil)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq column-number-mode t)
(customize-set-variable 'scroll-bar-mode nil)
(blink-cursor-mode nil)
(tool-bar-mode -1)
;; Delete the CR and the end of the line when Ctrl + K at beginning of the line
(setq-default kill-whole-line t)
;; if kill content are the same, ignore them
(setq kill-do-not-dave-duplicates t)
;; Stop scroll-bar, it's very important to make emacs looks move more smoothly
(setq comment-empty-lines t)

;; up-down case
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; always new find windows on horizontally
(setq split-width-threshold nil)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)
