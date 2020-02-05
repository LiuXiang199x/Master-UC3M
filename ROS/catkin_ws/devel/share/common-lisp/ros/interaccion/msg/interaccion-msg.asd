
(cl:in-package :asdf)

(defsystem "interaccion-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "inf_personal_usuario" :depends-on ("_package_inf_personal_usuario"))
    (:file "_package_inf_personal_usuario" :depends-on ("_package"))
    (:file "pos_usuario" :depends-on ("_package_pos_usuario"))
    (:file "_package_pos_usuario" :depends-on ("_package"))
    (:file "usuario" :depends-on ("_package_usuario"))
    (:file "_package_usuario" :depends-on ("_package"))
  ))