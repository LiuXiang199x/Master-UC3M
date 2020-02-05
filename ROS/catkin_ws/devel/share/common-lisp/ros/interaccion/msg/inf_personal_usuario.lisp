; Auto-generated. Do not edit!


(cl:in-package interaccion-msg)


;//! \htmlinclude inf_personal_usuario.msg.html

(cl:defclass <inf_personal_usuario> (roslisp-msg-protocol:ros-message)
  ((nombre
    :reader nombre
    :initarg :nombre
    :type cl:string
    :initform "")
   (edad
    :reader edad
    :initarg :edad
    :type cl:integer
    :initform 0)
   (idiomas
    :reader idiomas
    :initarg :idiomas
    :type cl:string
    :initform ""))
)

(cl:defclass inf_personal_usuario (<inf_personal_usuario>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <inf_personal_usuario>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'inf_personal_usuario)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaccion-msg:<inf_personal_usuario> is deprecated: use interaccion-msg:inf_personal_usuario instead.")))

(cl:ensure-generic-function 'nombre-val :lambda-list '(m))
(cl:defmethod nombre-val ((m <inf_personal_usuario>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-msg:nombre-val is deprecated.  Use interaccion-msg:nombre instead.")
  (nombre m))

(cl:ensure-generic-function 'edad-val :lambda-list '(m))
(cl:defmethod edad-val ((m <inf_personal_usuario>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-msg:edad-val is deprecated.  Use interaccion-msg:edad instead.")
  (edad m))

(cl:ensure-generic-function 'idiomas-val :lambda-list '(m))
(cl:defmethod idiomas-val ((m <inf_personal_usuario>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-msg:idiomas-val is deprecated.  Use interaccion-msg:idiomas instead.")
  (idiomas m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <inf_personal_usuario>) ostream)
  "Serializes a message object of type '<inf_personal_usuario>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nombre))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nombre))
  (cl:let* ((signed (cl:slot-value msg 'edad)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'idiomas))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'idiomas))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <inf_personal_usuario>) istream)
  "Deserializes a message object of type '<inf_personal_usuario>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nombre) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'nombre) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'edad) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idiomas) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'idiomas) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<inf_personal_usuario>)))
  "Returns string type for a message object of type '<inf_personal_usuario>"
  "interaccion/inf_personal_usuario")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'inf_personal_usuario)))
  "Returns string type for a message object of type 'inf_personal_usuario"
  "interaccion/inf_personal_usuario")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<inf_personal_usuario>)))
  "Returns md5sum for a message object of type '<inf_personal_usuario>"
  "5d63e3fb247d30364a089bf55aee435e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'inf_personal_usuario)))
  "Returns md5sum for a message object of type 'inf_personal_usuario"
  "5d63e3fb247d30364a089bf55aee435e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<inf_personal_usuario>)))
  "Returns full string definition for message of type '<inf_personal_usuario>"
  (cl:format cl:nil "string nombre~%int32 edad~%string idiomas~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'inf_personal_usuario)))
  "Returns full string definition for message of type 'inf_personal_usuario"
  (cl:format cl:nil "string nombre~%int32 edad~%string idiomas~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <inf_personal_usuario>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'nombre))
     4
     4 (cl:length (cl:slot-value msg 'idiomas))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <inf_personal_usuario>))
  "Converts a ROS message object to a list"
  (cl:list 'inf_personal_usuario
    (cl:cons ':nombre (nombre msg))
    (cl:cons ':edad (edad msg))
    (cl:cons ':idiomas (idiomas msg))
))
