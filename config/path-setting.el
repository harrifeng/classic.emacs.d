(provide 'path-setting)

(if (file-exists-p "c:/Dropbox")
    (defconst my-dropbox-dev "C:/Dropbox/Development/")
  (defconst my-dropbox-dev "d:/Dropbox/Development/"))

(if (file-exists-p "c:/python26")
    (defconst my-python-path "c:/python26/")
  (defconst my-python-path "d:/python26/"))

(defconst my-python-script-path
  (concat my-python-path "Scripts/"))

(defconst my-git-path (concat my-dropbox-dev "PortableGit/bin/"))

(setenv "PATH"
	(concat
	 my-git-path ";"
	 my-python-path ";"
	 my-python-script-path ";"
	 (getenv "PATH")))
;; exec-path based on path, can work on all system if path is
;; set successfully
(setq exec-path (split-string (getenv "PATH") path-separator))
