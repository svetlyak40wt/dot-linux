(in-package #:stumpwm)

(defparameter *frame-dump-file* (uiop:native-namestring "~/.stumpwm-fdump")
  "Dump file for keeping frame positions.")

(defcommand layout-save () ()
  (dump-group-to-file *frame-dump-file*))

(defcommand layout-load () ()
  (if (probe-file *frame-dump-file*)
      (restore-from-file *frame-dump-file*)
      (message "Dump file not found")))


;; Hook не нужен: так как команда сохраняет layout только одной вкладки
;; workspaces, а использовать dump-desktop-to-file у меня не получилось
;; из-за ошибки:
;; 
;; (flet ((layout-load ()
;;          (run-commands "layout-load")))
;;   (add-hook *config-loaded-hook* #'layout-load))

;; Change default group's name:
(setf (group-name (car (screen-groups (current-screen))))
      "Def")

;; greate new groups
(run-commands "gnewbg Web"
              "gnewbg Emacs"
              "gnewbg IM"
              ;; "gnewbg-float FLT"
              )
