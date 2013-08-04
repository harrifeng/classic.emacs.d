(provide 'font-setting)

(defconst my-font-size
  (cond
   ((string-match system-name "hfeng-linux")
    ":pixelsize=16")
   ((string-match system-name "hfeng-air.local")
    ":pixelsize=14")
   ((string-match system-name "hfeng-t60p")
    ":pixelsize=20")
   ((string-match system-name "sh-rd-hfeng")
    ":pixelsize=16")
   (":pixelsize=16")))

(qiang-set-font
 '("Menlo" "Courier New" "Consolas" "Monaco" "DejaVu Sans Mono" "Monospace")
 my-font-size
 '("楷体" "kai" "Microsoft Yahei" "文泉驿等宽微米黑"
   "黑体" "新宋体" ))
