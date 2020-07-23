; Auto-generated. Do not edit!


(cl:in-package python_turtle-srv)


;//! \htmlinclude setcolor-request.msg.html

(cl:defclass <setcolor-request> (roslisp-msg-protocol:ros-message)
  ((turtle_name
    :reader turtle_name
    :initarg :turtle_name
    :type cl:string
    :initform "")
   (color
    :reader color
    :initarg :color
    :type cl:string
    :initform ""))
)

(cl:defclass setcolor-request (<setcolor-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setcolor-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setcolor-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-srv:<setcolor-request> is deprecated: use python_turtle-srv:setcolor-request instead.")))

(cl:ensure-generic-function 'turtle_name-val :lambda-list '(m))
(cl:defmethod turtle_name-val ((m <setcolor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-srv:turtle_name-val is deprecated.  Use python_turtle-srv:turtle_name instead.")
  (turtle_name m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <setcolor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-srv:color-val is deprecated.  Use python_turtle-srv:color instead.")
  (color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setcolor-request>) ostream)
  "Serializes a message object of type '<setcolor-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'turtle_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'turtle_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setcolor-request>) istream)
  "Deserializes a message object of type '<setcolor-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turtle_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'turtle_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setcolor-request>)))
  "Returns string type for a service object of type '<setcolor-request>"
  "python_turtle/setcolorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setcolor-request)))
  "Returns string type for a service object of type 'setcolor-request"
  "python_turtle/setcolorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setcolor-request>)))
  "Returns md5sum for a message object of type '<setcolor-request>"
  "4e5c5e738507cfbcc1070c9c1e8f412e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setcolor-request)))
  "Returns md5sum for a message object of type 'setcolor-request"
  "4e5c5e738507cfbcc1070c9c1e8f412e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setcolor-request>)))
  "Returns full string definition for message of type '<setcolor-request>"
  (cl:format cl:nil "string turtle_name~%string color~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setcolor-request)))
  "Returns full string definition for message of type 'setcolor-request"
  (cl:format cl:nil "string turtle_name~%string color~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setcolor-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'turtle_name))
     4 (cl:length (cl:slot-value msg 'color))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setcolor-request>))
  "Converts a ROS message object to a list"
  (cl:list 'setcolor-request
    (cl:cons ':turtle_name (turtle_name msg))
    (cl:cons ':color (color msg))
))
;//! \htmlinclude setcolor-response.msg.html

(cl:defclass <setcolor-response> (roslisp-msg-protocol:ros-message)
  ((ret
    :reader ret
    :initarg :ret
    :type cl:fixnum
    :initform 0))
)

(cl:defclass setcolor-response (<setcolor-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setcolor-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setcolor-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-srv:<setcolor-response> is deprecated: use python_turtle-srv:setcolor-response instead.")))

(cl:ensure-generic-function 'ret-val :lambda-list '(m))
(cl:defmethod ret-val ((m <setcolor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-srv:ret-val is deprecated.  Use python_turtle-srv:ret instead.")
  (ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setcolor-response>) ostream)
  "Serializes a message object of type '<setcolor-response>"
  (cl:let* ((signed (cl:slot-value msg 'ret)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setcolor-response>) istream)
  "Deserializes a message object of type '<setcolor-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ret) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setcolor-response>)))
  "Returns string type for a service object of type '<setcolor-response>"
  "python_turtle/setcolorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setcolor-response)))
  "Returns string type for a service object of type 'setcolor-response"
  "python_turtle/setcolorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setcolor-response>)))
  "Returns md5sum for a message object of type '<setcolor-response>"
  "4e5c5e738507cfbcc1070c9c1e8f412e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setcolor-response)))
  "Returns md5sum for a message object of type 'setcolor-response"
  "4e5c5e738507cfbcc1070c9c1e8f412e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setcolor-response>)))
  "Returns full string definition for message of type '<setcolor-response>"
  (cl:format cl:nil "int8 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setcolor-response)))
  "Returns full string definition for message of type 'setcolor-response"
  (cl:format cl:nil "int8 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setcolor-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setcolor-response>))
  "Converts a ROS message object to a list"
  (cl:list 'setcolor-response
    (cl:cons ':ret (ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'setcolor)))
  'setcolor-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'setcolor)))
  'setcolor-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setcolor)))
  "Returns string type for a service object of type '<setcolor>"
  "python_turtle/setcolor")