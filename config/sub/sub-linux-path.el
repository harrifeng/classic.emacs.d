(provide 'sub-linux-path)

;;For Macos build the emacs by
;; > brew install emacs --cocoa --srge
(setenv "PATH"
	(concat
	 "/usr/local/bin" ":"
	 "/bin"           ":"
	 "/sbin"          ":"
	 "/usr"           ":"
	 "/usr/bin"       ":"
	 "/usr/sbin"      ":"
	 (getenv "PATH")
	 ))

;; (add-to-list 'load-path "~/.emacs.d/config/sub/eim")
(add-to-list 'load-path (concat my-lisps-path "sub/eim"))
(autoload 'eim-use-package "eim" "Another emacs input method")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; if Tooltip is not ok, uncomment following sentence. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq eim-use-tooltip nil)

(register-input-method
 "eim-wb" "euc-cn" 'eim-use-package
 "五笔" "汉字五笔输入法" "wb.txt")
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" "py.txt")

;; `;` use English temporarily
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)
