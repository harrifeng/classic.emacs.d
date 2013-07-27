(provide 'path-setting)

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
;; exec-path based on path, can work on all system if path is
;; set successfully
(setq exec-path (split-string (getenv "PATH") path-separator))
