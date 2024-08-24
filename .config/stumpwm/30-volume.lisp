(in-package #:stumpwm)

;;; Volume control

(load-module "stump-volume-control")

;; Without this audio can't be unmuted (at least on ubuntu 22.04):
;; https://askubuntu.com/a/286437
(setf stump-volume-control:*sound-card* "pulse")

(define-key *top-map* (kbd "XF86AudioRaiseVolume") "volume-up")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "volume-down")
(define-key *top-map* (kbd "XF86AudioMute") "volume-toggle-mute")

(stump-volume-control:volume-toggle-mute)
