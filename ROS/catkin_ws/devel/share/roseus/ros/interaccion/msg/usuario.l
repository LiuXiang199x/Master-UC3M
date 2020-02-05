;; Auto-generated. Do not edit!


(when (boundp 'interaccion::usuario)
  (if (not (find-package "INTERACCION"))
    (make-package "INTERACCION"))
  (shadow 'usuario (find-package "INTERACCION")))
(unless (find-package "INTERACCION::USUARIO")
  (make-package "INTERACCION::USUARIO"))

(in-package "ROS")
;;//! \htmlinclude usuario.msg.html


(defclass interaccion::usuario
  :super ros::object
  :slots (_emocion _posicion _infPersonal ))

(defmethod interaccion::usuario
  (:init
   (&key
    ((:emocion __emocion) "")
    ((:posicion __posicion) (instance interaccion::pos_usuario :init))
    ((:infPersonal __infPersonal) (instance interaccion::inf_personal_usuario :init))
    )
   (send-super :init)
   (setq _emocion (string __emocion))
   (setq _posicion __posicion)
   (setq _infPersonal __infPersonal)
   self)
  (:emocion
   (&optional __emocion)
   (if __emocion (setq _emocion __emocion)) _emocion)
  (:posicion
   (&rest __posicion)
   (if (keywordp (car __posicion))
       (send* _posicion __posicion)
     (progn
       (if __posicion (setq _posicion (car __posicion)))
       _posicion)))
  (:infPersonal
   (&rest __infPersonal)
   (if (keywordp (car __infPersonal))
       (send* _infPersonal __infPersonal)
     (progn
       (if __infPersonal (setq _infPersonal (car __infPersonal)))
       _infPersonal)))
  (:serialization-length
   ()
   (+
    ;; string _emocion
    4 (length _emocion)
    ;; interaccion/pos_usuario _posicion
    (send _posicion :serialization-length)
    ;; interaccion/inf_personal_usuario _infPersonal
    (send _infPersonal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _emocion
       (write-long (length _emocion) s) (princ _emocion s)
     ;; interaccion/pos_usuario _posicion
       (send _posicion :serialize s)
     ;; interaccion/inf_personal_usuario _infPersonal
       (send _infPersonal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _emocion
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _emocion (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; interaccion/pos_usuario _posicion
     (send _posicion :deserialize buf ptr-) (incf ptr- (send _posicion :serialization-length))
   ;; interaccion/inf_personal_usuario _infPersonal
     (send _infPersonal :deserialize buf ptr-) (incf ptr- (send _infPersonal :serialization-length))
   ;;
   self)
  )

(setf (get interaccion::usuario :md5sum-) "a7116d7ee7ed4b4fab7670a37626d063")
(setf (get interaccion::usuario :datatype-) "interaccion/usuario")
(setf (get interaccion::usuario :definition-)
      "string emocion
pos_usuario posicion
inf_personal_usuario infPersonal

================================================================================
MSG: interaccion/pos_usuario
int32 x
int32 y
int32 z

================================================================================
MSG: interaccion/inf_personal_usuario
string nombre
int32 edad
string idiomas

")



(provide :interaccion/usuario "a7116d7ee7ed4b4fab7670a37626d063")


