(in-package #:stumpwm)

;;;;;;;; Mode-line ;;;;;;;;;;

(cond
  ;; If Polybar is installed, we'll use it
  ((which "polybar")
   (run-shell-command "polybar --config=~/.config/polybar/config.ini mybar"))
  
  ;; Otherwise will switch to a simple StumpWM mode-line
  (t
   (load-module "battery-portable")

   ;; Default: "%m%n%s%50t"
   (setf stumpwm:*window-format*
         "%n: %10t")

   ;; Default: "[^B%n^b] %W"
   (stumpwm:enable-mode-line (stumpwm:current-screen)
                             (stumpwm:current-head)
                             t
                             ;; %L is keyboard but if I use it,
                             ;; everything hangs on opening yet another
                             ;; application:
                             ;; https://github.com/stumpwm/stumpwm/issues/1157
                                        ;
                             ;; %B - battery
                             "%g %W ^>%d | %B")))
