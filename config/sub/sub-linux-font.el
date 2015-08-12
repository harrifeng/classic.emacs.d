(provide 'sub-linux-font)

;; Setting English Font
;; on Ubuntu need install font: sudo apt-get install -y fonts-inconsolata
(set-face-attribute
 'default nil :font (concat
                     "Inconsolata" my-font-size))
