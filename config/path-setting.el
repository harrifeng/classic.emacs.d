(provide 'path-setting)

(defconst my-dropbox-dev "d:/Dropbox/Development/")
(defconst my-git-path (concat my-dropbox-dev "PortableGit/bin/"))
(setenv "PATH"
	(concat
	 my-git-path ";"
	 (getenv "PATH")))
;; exec-path based on path, can work on all system if path is
;; set successfully
(setq exec-path (split-string (getenv "PATH") path-separator))
