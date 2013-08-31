(provide 'sub-gnu-mail)

(setq smtpmail-stream-type 'ssl)
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 465)
