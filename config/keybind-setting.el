(provide 'keybind-setting)
(global-set-key (kbd "C-x C-k")      'kill-region)
(global-set-key (kbd "C-x C-y")      'kill-ring-save)
(global-set-key (kbd "C-x C-u")      'backward-kill-line)
(global-set-key (kbd "C-x C-b")      'ibuffer)
(global-set-key (kbd "C-w")          'backward-kill-word)
(global-set-key (kbd "C-o")          'other-window)
(global-set-key (kbd "C-h")          'backward-delete-char-untabify)
(global-set-key (kbd "<f5>")         'revert-buffer)
;; Previous in GUI they share Ctrl+Enter
(global-set-key (kbd "<f6>")         'cua-set-rectangle-mark)
(global-set-key (kbd "<f6>")         'mark-whole-buffer)
(global-set-key (kbd "C-c C-a")      'mark-whole-buffer)

(global-set-key (kbd "<f7>")         'indent-whole)
(global-set-key (kbd "<f12>")        'whitespace-mode)
(global-set-key (kbd "<C-f11>")      'toggle-tool-bar-mode-from-frame)
(global-set-key (kbd "M-;")          'qiang-comment-dwim-line)
(global-set-key (kbd "M-/")          'hippie-expand)
(global-set-key (kbd "C-j")          'newline-and-indent)
(global-set-key (kbd "M-p")          'query-replace)

(global-set-key (kbd "<f2>")         'helm-global-mark-ring)
(global-set-key (kbd "C-x C-g")      'helm-global-mark-ring)
(global-set-key (kbd "C-c C-g")      'helm-global-mark-ring)
;; Still need these key to work on the GUI emacs
(global-set-key (kbd "<C-return>")   'mark-whole-buffer)
(global-set-key (kbd "C-,")          'set-mark-command)
(global-set-key (kbd "C-2")          'set-mark-command)
