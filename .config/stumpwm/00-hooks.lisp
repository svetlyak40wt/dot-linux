(in-package #:stumpwm)

(defvar *config-loaded-hook* '()
  "A hook called when after all files from ~/.config/stumpwm/ were loaded.

   The hook is called without an argument.")
