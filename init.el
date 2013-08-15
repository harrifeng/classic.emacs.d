(defconst my-emacs-path "~/.emacs.d/")

(defconst my-lisps-path  (concat my-emacs-path "config/")
  "Path for configuration")
(add-to-list 'load-path my-lisps-path)

(require 'basic-setting)
(require 'helpfunc-setting)
(require 'path-setting)
(require 'systype-setting)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; path is used by others ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'plugin-setting)
(require 'mode-setting)
(require 'shell-setting)
(require 'modeline-setting)

;; (require 'el-get-setting)
;; (require 'package-setting)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybind is the last to load ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'keybind-setting)

