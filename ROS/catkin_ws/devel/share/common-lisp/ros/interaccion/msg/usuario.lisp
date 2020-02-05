; Auto-generated. Do not edit!


(cl:in-package interaccion-msg)


;//! \htmlinclude usuario.msg.html

(cl:defclass <usuario> (roslisp-msg-protocol:ros-message)
  ((emocion
    :reader emocion
    :initarg :emocion
    :type cl:string
    :initform "")
   (posicion
    :reader posicion
    :initarg :posicion
    :type interaccion-msg:pos_usuario
    :initform (cl:make-instance 'interaccion-msg:pos_usuario))
   (infPersonal
    :reader infPersonal
    :initarg :infPersonal
    :type interaccion-msg:inf_personal_usuario
    :initform (cl:make-instance 'interaccion-msg:inf_personal_usuario)))
)

(cl:defclass usuario (<usuario>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <usuario>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'usuario)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaccion-msg:<usuario> is deprecated: use interaccion-msg:usuario instead.")))

(cl:ensure-generic-function 'emocion-val :lambda-list '(m))
(cl:defmethod emocion-val ((m <usuario>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-msg:emocion-val is deprecated.  Use interaccion-msg:emocion instead.")
  (emocion m))

(cl:ensure-generic-function 'posicion-val :lambda-list '(m))
(cl:defmethod posicion-val ((m <usuario>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-msg:posicion-val is deprecated.  Use interaccion-msg:posicion instead.")
  (posicion m))

(cl:ensure-generic-function 'infPersonal-val :lambda-list '(m))
(cl:defmethod infPersonal-val ((m <usuario>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-msg:infPersonal-val is deprecated.  Use interaccion-msg:infPersonal instead.")
  (infPersonal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <usuario>) ostream)
  "Serializes a message object of type '<usuario>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'emocion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'emocion))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'posicion) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'infPersonal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <usuario>) istream)
  "Deserializes a message object of type '<usuario>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'emocion) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'emocion) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'posicion) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'infPersonal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<usuario>)))
  "Returns string type for a message object of type '<usuario>"
  "interaccion/usuario")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'usuario)))
  "Returns string type for a message object of type 'usuario"
  "interaccion/usuario")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<usuario>)))
  "Returns md5sum for a message object of type '<usuario>"
  "a7116d7ee7ed4b4fab7670a37626d063")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'usuario)))
  "Returns md5sum for a message object of type 'usuario"
  "a7116d7ee7ed4b4fab7670a37626d063")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<usuario>)))
  "Returns full string definition for message of type '<usuario>"
  (cl:format cl:nil "string emocion~%pos_usuario posicion~%inf_personal_usuario infPersonal~%~%================================================================================~%MSG: interaccion/pos_usuario~%int32 x~%int32 y~%int32 z~%~%================================================================================~%MSG: interaccion/inf_personal_usuario~%string nombre~%int32 edad~%string idiomas~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'usuario)))
  "Returns full string definition for message of type 'usuario"
  (cl:format cl:nil "string emocion~%pos_usuario posicion~%inf_personal_usuario infPersonal~%~%================================================================================~%MSG: interaccion/pos_usuario~%int32 x~%int32 y~%int32 z~%~%================================================================================~%MSG: interaccion/inf_personal_usuario~%string nombre~%int32 edad~%string idiomas~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <usuario>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'emocion))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'posicion))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'infPersonal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <usuario>))
  "Converts a ROS message object to a list"
  (cl:list 'usuario
    (cl:cons ':emocion (emocion msg))
    (cl:cons ':posicion (posicion msg))
    (cl:cons ':infPersonal (infPersonal msg))
))
