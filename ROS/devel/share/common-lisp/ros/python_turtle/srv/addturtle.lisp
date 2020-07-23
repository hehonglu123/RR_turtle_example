; Auto-generated. Do not edit!


(cl:in-package python_turtle-srv)


;//! \htmlinclude addturtle-request.msg.html

(cl:defclass <addturtle-request> (roslisp-msg-protocol:ros-message)
  ((turtle_name
    :reader turtle_name
    :initarg :turtle_name
    :type cl:string
    :initform ""))
)

(cl:defclass addturtle-request (<addturtle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addturtle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addturtle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-srv:<addturtle-request> is deprecated: use python_turtle-srv:addturtle-request instead.")))

(cl:ensure-generic-function 'turtle_name-val :lambda-list '(m))
(cl:defmethod turtle_name-val ((m <addturtle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-srv:turtle_name-val is deprecated.  Use python_turtle-srv:turtle_name instead.")
  (turtle_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addturtle-request>) ostream)
  "Serializes a message object of type '<addturtle-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'turtle_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'turtle_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addturtle-request>) istream)
  "Deserializes a message object of type '<addturtle-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addturtle-request>)))
  "Returns string type for a service object of type '<addturtle-request>"
  "python_turtle/addturtleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addturtle-request)))
  "Returns string type for a service object of type 'addturtle-request"
  "python_turtle/addturtleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addturtle-request>)))
  "Returns md5sum for a message object of type '<addturtle-request>"
  "77308e5f6594808d16ab77e3e54c717b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addturtle-request)))
  "Returns md5sum for a message object of type 'addturtle-request"
  "77308e5f6594808d16ab77e3e54c717b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addturtle-request>)))
  "Returns full string definition for message of type '<addturtle-request>"
  (cl:format cl:nil "string turtle_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addturtle-request)))
  "Returns full string definition for message of type 'addturtle-request"
  (cl:format cl:nil "string turtle_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addturtle-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'turtle_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addturtle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'addturtle-request
    (cl:cons ':turtle_name (turtle_name msg))
))
;//! \htmlinclude addturtle-response.msg.html

(cl:defclass <addturtle-response> (roslisp-msg-protocol:ros-message)
  ((ret
    :reader ret
    :initarg :ret
    :type cl:fixnum
    :initform 0))
)

(cl:defclass addturtle-response (<addturtle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <addturtle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'addturtle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-srv:<addturtle-response> is deprecated: use python_turtle-srv:addturtle-response instead.")))

(cl:ensure-generic-function 'ret-val :lambda-list '(m))
(cl:defmethod ret-val ((m <addturtle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-srv:ret-val is deprecated.  Use python_turtle-srv:ret instead.")
  (ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <addturtle-response>) ostream)
  "Serializes a message object of type '<addturtle-response>"
  (cl:let* ((signed (cl:slot-value msg 'ret)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <addturtle-response>) istream)
  "Deserializes a message object of type '<addturtle-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ret) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<addturtle-response>)))
  "Returns string type for a service object of type '<addturtle-response>"
  "python_turtle/addturtleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addturtle-response)))
  "Returns string type for a service object of type 'addturtle-response"
  "python_turtle/addturtleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<addturtle-response>)))
  "Returns md5sum for a message object of type '<addturtle-response>"
  "77308e5f6594808d16ab77e3e54c717b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'addturtle-response)))
  "Returns md5sum for a message object of type 'addturtle-response"
  "77308e5f6594808d16ab77e3e54c717b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<addturtle-response>)))
  "Returns full string definition for message of type '<addturtle-response>"
  (cl:format cl:nil "int8 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'addturtle-response)))
  "Returns full string definition for message of type 'addturtle-response"
  (cl:format cl:nil "int8 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <addturtle-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <addturtle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'addturtle-response
    (cl:cons ':ret (ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'addturtle)))
  'addturtle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'addturtle)))
  'addturtle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'addturtle)))
  "Returns string type for a service object of type '<addturtle>"
  "python_turtle/addturtle")