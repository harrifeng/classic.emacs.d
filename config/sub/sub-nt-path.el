(provide 'sub-nt-path)

(if (file-exists-p "c:/Devbox/")
    (defconst my-dev "c:/Devbox/")
  (defconst my-dev "d:/Devbox/"))

(defconst my-util-path
  (concat my-dev "Util/"))

(defconst my-ruby-path
  (concat my-dev "Ruby200/bin/"))

(defconst my-python-path
  (concat my-dev "Python266/App/"))
(defconst my-python-script-path
  (concat my-python-path "Scripts/"))

(defconst my-git-path
  (concat my-dev "Git/bin/"))

(defconst my-mingw-path
  (concat my-dev "MinGW/bin/"))

(defconst my-tool-path
  (concat my-dev "Tools/"))

(defconst my-java-home
  (concat my-dev "Java/"))

(defconst my-java-path
  (concat my-dev "Java/bin/"))

(defconst my-java-util-path
  (concat my-dev "JavaUtil/"))

(defconst my-ant-path
  (concat my-java-util-path "ant/bin"))

(defconst my-maven-path
  (concat my-java-util-path "maven/bin"))

(defconst my-graphviz-path
  (concat my-dev "Graphviz/bin/"))

(setenv "PATH"
        (concat
         my-tool-path ";"
         my-git-path ";"
         my-python-path ";"
         my-ruby-path ";"
         my-python-script-path ";"
         my-java-path ";"
         my-ant-path ";"
         my-maven-path ";"         
         my-mingw-path ";"
         my-graphviz-path ";"
         my-util-path ";"
         (getenv "PATH")))

(setenv "JAVA_HOME"
        my-java-home)
