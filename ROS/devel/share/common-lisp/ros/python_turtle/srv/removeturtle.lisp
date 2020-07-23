; Auto-generated. Do not edit!


(cl:in-package python_turtle-srv)


;//! \htmlinclude removeturtle-request.msg.html

(cl:defclass <removeturtle-request> (roslisp-msg-protocol:ros-message)
  ((turtle_name
    :reader turtle_name
    :initarg :turtle_name
    :type cl:string
    :initform ""))
)

(cl:defclass removeturtle-request (<removeturtle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <removeturtle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'removeturtle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-srv:<removeturtle-request> is deprecated: use python_turtle-srv:removeturtle-request instead.")))

(cl:ensure-generic-function 'turtle_name-val :lambda-list '(m))
(cl:defmethod turtle_name-val ((m <removeturtle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-srv:turtle_name-val is deprecated.  Use python_turtle-srv:turtle_name instead.")
  (turtle_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <removeturtle-request>) ostream)
  "Serializes a message object of type '<removeturtle-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'turtle_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'turtle_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <removeturtle-request>) istream)
  "Deserializes a message object of type '<removeturtle-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turtle_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'turtle_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<removeturtle-request>)))
  "Returns string type for a service object of type '<removeturtle-request>"
  "python_turtle/removeturtleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'removeturtle-request)))
  "Returns string type for a service object of type 'removeturtle-request"
  "python_turtle/removeturtleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<removeturtle-request>)))
  "Returns md5sum for a message object of type '<removeturtle-request>"
  "77308e5f6594808d16ab77e3e54c717b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'removeturtle-request)))
  "Returns md5sum for a message object of type 'removeturtle-request"
  "77308e5f6594808d16ab77e3e54c717b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<removeturtle-request>)))
  "Returns full string definition for message of type '<removeturtle-request>"
  (cl:format cl:nil "string turtle_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'removeturtle-request)))
  "Returns full string definition for message of type 'removeturtle-request"
  (cl:format cl:nil "string turtle_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <removeturtle-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'turtle_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <removeturtle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'removeturtle-request
    (cl:cons ':turtle_name (turtle_name msg))
))
;//! \htmlinclude removeturtle-response.msg.html

(cl:defclass <removeturtle-response> (roslisp-msg-protocol:ros-message)
  ((ret
    :reader ret
    :initarg :ret
    :type cl:fixnum
    :initform 0))
)

(cl:defclass removeturtle-response (<removeturtle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <removeturtle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'removeturtle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-srv:<removeturtle-response> is deprecated: use python_turtle-srv:removeturtle-response instead.")))

(cl:ensure-generic-function 'ret-val :lambda-list '(m))
(cl:defmethod ret-val ((m <removeturtle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-srv:ret-val is deprecated.  Use python_turtle-srv:ret instead.")
  (ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <removeturtle-response>) ostream)
  "Serializes a message object of type '<removeturtle-response>"
  (cl:let* ((signed (cl:slot-value msg 'ret)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <removeturtle-response>) istream)
  "Deserializes a message object of type '<removeturtle-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ret) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<removeturtle-response>)))
  "Returns string type for a service object of type '<removeturtle-response>"
  "python_turtle/removeturtleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'removeturtle-response)))
  "Returns string type for a service object of type 'removeturtle-response"
  "python_turtle/removeturtleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<removeturtle-response>)))
  "Returns md5sum for a message object of type '<removeturtle-response>"
  "77308e5f6594808d16ab77e3e54c717b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'removeturtle-response)))
  "Returns md5sum for a message object of type 'removeturtle-response"
  "77308e5f6594808d16ab77e3e54c717b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<removeturtle-response>)))
  "Returns full string definition for message of type '<removeturtle-response>"
  (cl:format cl:nil "int8 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'removeturtle-response)))
  "Returns full string definition for message of type 'removeturtle-response"
  (cl:format cl:nil "int8 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <removeturtle-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <removeturtle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'removeturtle-response
    (cl:cons ':ret (ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'removeturtle)))
  'removeturtle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'removeturtle)))
  'removeturtle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'removeturtle)))
  "Returns string type for a service object of type '<removeturtle>"
  "python_turtle/removeturtle")