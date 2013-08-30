(provide 'sub-nt-path)

(if (file-exists-p "c:/Dropbox")
    (defconst my-dropbox-dev "C:/Dropbox/Development/")
  (defconst my-dropbox-dev "d:/Dropbox/Development/"))

(if (file-exists-p "c:/python26")
    (defconst my-python-path "c:/python26/")
  (defconst my-python-path "d:/python26/"))

(defconst my-python-script-path
  (concat my-python-path "Scripts/"))

(defconst my-git-path (concat my-dropbox-dev "PortableGit/bin/"))
(defconst my-mingw-path (concat my-dropbox-dev "PortableMingw/bin/"))

(setenv "PATH"
	(concat
	 my-mingw-path ";"
	 my-git-path ";"
	 my-python-path ";"
	 my-python-script-path ";"
	 (getenv "PATH")))
