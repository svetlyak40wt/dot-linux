(in-package #:stumpwm)

;;;;;;;;;;;;;;;;;;;;;;;
;; Keyboard settings ;;
;;;;;;;;;;;;;;;;;;;;;;; 

(load-module "kbd-layouts")
;; To make s-SPC shortcut work on Macbook, you also need to
;; write this content to the ~/.Xmodmap:
;; 
;; clear mod2
;; clear mod4
;; add mod4 = Super_L

(setf kbd-layouts:*caps-lock-behavior* :ctrl)
(setf kbd-layouts:*run-xmodmap* t)
(setf kbd-layouts:*xmodmap-config*
      (lambda (layout)
        (format nil "~~/.Xmodmap-~A" layout)))
(kbd-layouts:keyboard-layout-list "us" "ru")

(define-key *top-map* (kbd "s-SPC") "switch-keyboard-layout")
;; (define-key *top-map* (kbd "s-Tab") "switch-keyboard-layout")

;; я рассчитывал что это поможет сделать "натуральный" scroll
;; (setf (uiop:getenv "GDK_CORE_DEVICE_EVENTS") "1")
(run-prog "/usr/bin/xinput"
          :args (list
                 "--set-prop"
                 "bcm5974"
                 "libinput Natural Scrolling Enabled"
                 "1"))

