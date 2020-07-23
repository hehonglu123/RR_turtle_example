; Auto-generated. Do not edit!


(cl:in-package python_turtle-msg)


;//! \htmlinclude turtle.msg.html

(cl:defclass <turtle> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (turtle_pose
    :reader turtle_pose
    :initarg :turtle_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (color
    :reader color
    :initarg :color
    :type cl:string
    :initform ""))
)

(cl:defclass turtle (<turtle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <turtle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'turtle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-msg:<turtle> is deprecated: use python_turtle-msg:turtle instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <turtle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-msg:name-val is deprecated.  Use python_turtle-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'turtle_pose-val :lambda-list '(m))
(cl:defmethod turtle_pose-val ((m <turtle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-msg:turtle_pose-val is deprecated.  Use python_turtle-msg:turtle_pose instead.")
  (turtle_pose m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <turtle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-msg:color-val is deprecated.  Use python_turtle-msg:color instead.")
  (color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <turtle>) ostream)
  "Serializes a message object of type '<turtle>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'turtle_pose) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <turtle>) istream)
  "Deserializes a message object of type '<turtle>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'turtle_pose) istream)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<turtle>)))
  "Returns string type for a message object of type '<turtle>"
  "python_turtle/turtle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'turtle)))
  "Returns string type for a message object of type 'turtle"
  "python_turtle/turtle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<turtle>)))
  "Returns md5sum for a message object of type '<turtle>"
  "2b46ddca532ac1ab602d56cef5ac1313")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'turtle)))
  "Returns md5sum for a message object of type 'turtle"
  "2b46ddca532ac1ab602d56cef5ac1313")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<turtle>)))
  "Returns full string definition for message of type '<turtle>"
  (cl:format cl:nil "string name~%geometry_msgs/Pose turtle_pose~%string color~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'turtle)))
  "Returns full string definition for message of type 'turtle"
  (cl:format cl:nil "string name~%geometry_msgs/Pose turtle_pose~%string color~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <turtle>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'turtle_pose))
     4 (cl:length (cl:slot-value msg 'color))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <turtle>))
  "Converts a ROS message object to a list"
  (cl:list 'turtle
    (cl:cons ':name (name msg))
    (cl:cons ':turtle_pose (turtle_pose msg))
    (cl:cons ':color (color msg))
))
