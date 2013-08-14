(provide 'systype-setting)
(cond
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; OS X system specific test on MAC OS 10.8    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ((eq system-type 'darwin)
  ;; unix-like path setting------------------------------------>>
  (require 'sub-unix-path)
  (require 'sub-mac-mode)
  (require 'sub-mac-font)

  ;; Command as meta------------------------------------------->>
  (setq mac-option-key-is-meta nil
	mac-command-key-is-meta t
	mac-command-modifier 'meta
	mac-option-modifier 'none)

  ;; el-get setting-------------------------------------------->>
  (add-to-list 'load-path (concat my-emacs-path "el-get/el-get"))
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (let (el-get-master-branch)
	(goto-char (point-max))
	(eval-print-last-sexp))))
  (el-get 'sync)

  ;; full screen setting--------------------------------------->>
  (setq ns-use-native-fullscreen nil)
  (defun toggle-fullscreen ()
    "Toggle full screen"
    (interactive)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
  (global-set-key (kbd "<f8>")         'toggle-fullscreen)

  ;; Mac Emacs start with fix height and width----------------->>
  (add-to-list 'default-frame-alist '(height . 50))
  (add-to-list 'default-frame-alist '(width . 176))

  ;; menu-bar-mode is useful in mac---------------------------->>
  (menu-bar-mode t))
 
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; Linux System specific test on Ubuntu 12.04  ;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ((eq system-type 'gnu/linux)
  (require 'sub-unix-mode)
  (require 'sub-unix-font)
  (menu-bar-mode t))
 
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; Cygwin System specific test on 1.7.1        ;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ((eq system-type 'cygwin)
  (require 'sub-nt-font)
  ;; max windows size on start up------------------------------>>
  (run-with-idle-timer 1 nil 'w32-send-sys-command 61488)
  (menu-bar-mode nil))

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; Windows NT System specific test on Windows 7 ;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ((eq system-type 'windows-nt)
  ;; nt-like path setting------------------------------------>>
  (require 'sub-nt-path)
  (require 'sub-nt-mode)
  (require 'sub-nt-font)

  ;; max windows size on start up------------------------------>>
  (run-with-idle-timer 1 nil 'w32-send-sys-command 61488)
  ;; no menu bar----------------------------------------------->>
  (menu-bar-mode -1))
 )
