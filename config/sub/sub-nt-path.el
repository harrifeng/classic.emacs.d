(provide 'sub-nt-path)

(if (file-exists-p "c:/Dropbox")
    (defconst my-dropbox-dev "C:/Dropbox/Development/")
  (defconst my-dropbox-dev "d:/Dropbox/Development/"))

(cond
 ((file-exists-p (concat my-dropbox-dev "Python27/App/"))
  (defconst my-python-path (concat my-dropbox-dev "Python27/App/")))
 ((file-exists-p "c:/python27")
  (defconst my-python-path "c:/python27/"))
 ((file-exists-p "d:/python27")
  (defconst my-python-path "d:/python27/"))
 ((file-exists-p "c:/python26")
  (defconst my-python-path "c:/python26/"))
 ((file-exists-p "d:/python26")
  (defconst my-python-path "d:/python26/")))

(defconst my-python-script-path
  (concat my-python-path "Scripts/"))

(defconst my-git-path (concat my-dropbox-dev "PortableGit/bin/"))
(defconst my-tool-path (concat my-dropbox-dev "Tools/"))
(defconst my-tcc-path (concat my-dropbox-dev "tcc/"))
(defconst my-mingw-path (concat my-dropbox-dev "MingW/bin/"))

(setenv "PATH"
        (concat
         my-tool-path ";"
         my-git-path ";"
         my-python-path ";"
         my-python-script-path ";"
         my-tcc-path ";"
         my-mingw-path ";"
         (getenv "PATH")))
