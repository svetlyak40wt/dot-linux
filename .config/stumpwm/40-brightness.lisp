(in-package #:stumpwm)

;; TODO: Это я пока не донастроил :(

;; To change brightness
;; git clone https://github.com/russell/stumpwm-kbd-brightness ~/stumpwm.d/modules/
;; git clone https://github.com/russell/stumpwm-dbus ~/stumpwm.d/modules
(stumpwm:add-to-load-path "~/.stumpwm.d/modules/stumpwm-kbd-brightness/")
(stumpwm:add-to-load-path "~/.stumpwm.d/modules/stumpwm-dbus/")



;; sudo apt install libfixposix-dev
;; Don't know how to REQUIRE sb-rotate-byte, required for this system :(
;; (ql:quickload "stumpwm.contrib.kbd-brightness")
