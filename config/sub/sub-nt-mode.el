(provide 'sub-nt-mode)

;; python mode------------>>
(require 'python)

(setq
 python-shell-interpreter "python.exe"
 python-shell-interpreter-args (concat "-i " (concat my-python-script-path
                                                     "ipython-script.py"))) 
