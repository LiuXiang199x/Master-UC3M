
(cl:in-package :asdf)

(defsystem "interaccion-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "multiplicador" :depends-on ("_package_multiplicador"))
    (:file "_package_multiplicador" :depends-on ("_package"))
  ))