(provide 'systype-setting)
(cond
 ;; mac system special----------------------------------->>
 ((eq system-type 'darwin)
  ;; Command as meta
  (setq mac-option-key-is-meta nil
	mac-command-key-is-meta t
	mac-command-modifier 'meta
	mac-option-modifier 'none)

  ;; full screen setting
  (setq ns-use-native-fullscreen nil)
  (defun toggle-fullscreen ()
    "Toggle full screen"
    (interactive)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
  (global-set-key (kbd "<f5>")         'toggle-fullscreen)

  (menu-bar-mode t))
 ;; linux system special-------------------------------->>
 ((eq system-type 'gnu/linux)
  (menu-bar-mode t))

 ;; cygwin system special------------------------------->>
 ((eq system-type 'cygwin)
  (menu-bar-mode nil))

 ;; windows system special------------------------------>>
 ((eq system-type 'windows-nt)

  ;;packages
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("melpa" . "http://melpa.milkbox.net/packages/")))  
  
  (package-initialize)

  (run-with-idle-timer 1 nil 'w32-send-sys-command 61488)
  (menu-bar-mode -1))
 )
