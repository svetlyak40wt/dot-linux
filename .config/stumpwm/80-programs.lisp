(in-package #:stumpwm)

;; firefox
;; Bitwarden
;; kitty
;; Emacs

(define-key *top-map* (kbd "C-s-l") "emacs")

;; Note: Use this command, to determine window properties
;; before using it as a filter for run-or-raise:
;; 
;; show-window-properties

(defcommand run-browser () ()
  "Start browser unless it is already running, in which case focus it."
  (run-or-raise-prefer-group "firefox"
                             :role "browser"))

(defcommand run-terminal () ()
  "Start terminal unless it is already running, in which case focus it."
  (run-or-raise-prefer-group "kitty"
                             :class "kitty"))

(defcommand run-messenger () ()
  "Start messenger unless it is already running, in which case focus it."
  (run-or-raise-prefer-group "telegram-desktop"
                             :class "TelegramDesktop"))

(define-key *top-map* (kbd "C-s-s") "run-browser")
(define-key *top-map* (kbd "C-s-t") "run-terminal")
(define-key *top-map* (kbd "C-s-m") "run-messenger")


;; Program switcher
(stumpwm:add-to-load-path "~/.stumpwm.d/modules/rofi")
(load-module "rofi")

(defparameter *apps-menu*
  '(("Terminal" . "exec kitty")
    ("Emacs" . "exec emacs")
    ("Browser" . "exec firefox")
    ("Bitwarden" . "exec bitwarden")
    ("Telegram" . "exec telegram-desktop")))


(defcommand select-app-menu () ()
  (rofi:menu *apps-menu* "-i -matching fuzzy"))


;; Here I need to make something similar to Alfred on OSX :(
;; windowlist
;; 

(define-key *top-map* (kbd "M-SPC") "select-app-menu")
(define-key *top-map* (kbd "s-Tab") "rofi-windowlist")

