; Auto-generated. Do not edit!


(cl:in-package interaccion-srv)


;//! \htmlinclude multiplicador-request.msg.html

(cl:defclass <multiplicador-request> (roslisp-msg-protocol:ros-message)
  ((entrada
    :reader entrada
    :initarg :entrada
    :type cl:integer
    :initform 0))
)

(cl:defclass multiplicador-request (<multiplicador-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <multiplicador-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'multiplicador-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaccion-srv:<multiplicador-request> is deprecated: use interaccion-srv:multiplicador-request instead.")))

(cl:ensure-generic-function 'entrada-val :lambda-list '(m))
(cl:defmethod entrada-val ((m <multiplicador-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-srv:entrada-val is deprecated.  Use interaccion-srv:entrada instead.")
  (entrada m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <multiplicador-request>) ostream)
  "Serializes a message object of type '<multiplicador-request>"
  (cl:let* ((signed (cl:slot-value msg 'entrada)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <multiplicador-request>) istream)
  "Deserializes a message object of type '<multiplicador-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'entrada) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<multiplicador-request>)))
  "Returns string type for a service object of type '<multiplicador-request>"
  "interaccion/multiplicadorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'multiplicador-request)))
  "Returns string type for a service object of type 'multiplicador-request"
  "interaccion/multiplicadorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<multiplicador-request>)))
  "Returns md5sum for a message object of type '<multiplicador-request>"
  "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'multiplicador-request)))
  "Returns md5sum for a message object of type 'multiplicador-request"
  "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<multiplicador-request>)))
  "Returns full string definition for message of type '<multiplicador-request>"
  (cl:format cl:nil "int64 entrada~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'multiplicador-request)))
  "Returns full string definition for message of type 'multiplicador-request"
  (cl:format cl:nil "int64 entrada~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <multiplicador-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <multiplicador-request>))
  "Converts a ROS message object to a list"
  (cl:list 'multiplicador-request
    (cl:cons ':entrada (entrada msg))
))
;//! \htmlinclude multiplicador-response.msg.html

(cl:defclass <multiplicador-response> (roslisp-msg-protocol:ros-message)
  ((resultado
    :reader resultado
    :initarg :resultado
    :type cl:integer
    :initform 0))
)

(cl:defclass multiplicador-response (<multiplicador-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <multiplicador-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'multiplicador-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaccion-srv:<multiplicador-response> is deprecated: use interaccion-srv:multiplicador-response instead.")))

(cl:ensure-generic-function 'resultado-val :lambda-list '(m))
(cl:defmethod resultado-val ((m <multiplicador-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-srv:resultado-val is deprecated.  Use interaccion-srv:resultado instead.")
  (resultado m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <multiplicador-response>) ostream)
  "Serializes a message object of type '<multiplicador-response>"
  (cl:let* ((signed (cl:slot-value msg 'resultado)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <multiplicador-response>) istream)
  "Deserializes a message object of type '<multiplicador-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'resultado) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<multiplicador-response>)))
  "Returns string type for a service object of type '<multiplicador-response>"
  "interaccion/multiplicadorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'multiplicador-response)))
  "Returns string type for a service object of type 'multiplicador-response"
  "interaccion/multiplicadorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<multiplicador-response>)))
  "Returns md5sum for a message object of type '<multiplicador-response>"
  "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'multiplicador-response)))
  "Returns md5sum for a message object of type 'multiplicador-response"
  "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<multiplicador-response>)))
  "Returns full string definition for message of type '<multiplicador-response>"
  (cl:format cl:nil "int64 resultado~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'multiplicador-response)))
  "Returns full string definition for message of type 'multiplicador-response"
  (cl:format cl:nil "int64 resultado~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <multiplicador-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <multiplicador-response>))
  "Converts a ROS message object to a list"
  (cl:list 'multiplicador-response
    (cl:cons ':resultado (resultado msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'multiplicador)))
  'multiplicador-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'multiplicador)))
  'multiplicador-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'multiplicador)))
  "Returns string type for a service object of type '<multiplicador>"
  "interaccion/multiplicador")