(defconst my-emacs-path "~/.emacs.d/")

(defconst my-lisps-path  (concat my-emacs-path "config/")
  "Path for configuration")
(add-to-list 'load-path my-lisps-path)

(require 'systype-setting)
(require 'basic-setting)
(require 'helpfunc-setting)
(require 'plugin-setting)
(require 'mode-setting)
(require 'path-setting)
(require 'font-setting)
(require 'shell-setting)
(require 'modeline-setting)
(require 'el-get-setting)
;; keybing is the last to load
(require 'keybind-setting)

