; Auto-generated. Do not edit!


(cl:in-package python_turtle-msg)


;//! \htmlinclude turtle_array.msg.html

(cl:defclass <turtle_array> (roslisp-msg-protocol:ros-message)
  ((turtles
    :reader turtles
    :initarg :turtles
    :type (cl:vector python_turtle-msg:turtle)
   :initform (cl:make-array 0 :element-type 'python_turtle-msg:turtle :initial-element (cl:make-instance 'python_turtle-msg:turtle))))
)

(cl:defclass turtle_array (<turtle_array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <turtle_array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'turtle_array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-msg:<turtle_array> is deprecated: use python_turtle-msg:turtle_array instead.")))

(cl:ensure-generic-function 'turtles-val :lambda-list '(m))
(cl:defmethod turtles-val ((m <turtle_array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-msg:turtles-val is deprecated.  Use python_turtle-msg:turtles instead.")
  (turtles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <turtle_array>) ostream)
  "Serializes a message object of type '<turtle_array>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'turtles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'turtles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <turtle_array>) istream)
  "Deserializes a message object of type '<turtle_array>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'turtles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'turtles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'python_turtle-msg:turtle))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<turtle_array>)))
  "Returns string type for a message object of type '<turtle_array>"
  "python_turtle/turtle_array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'turtle_array)))
  "Returns string type for a message object of type 'turtle_array"
  "python_turtle/turtle_array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<turtle_array>)))
  "Returns md5sum for a message object of type '<turtle_array>"
  "a167676d2b4e0f20402b9b02bac07167")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'turtle_array)))
  "Returns md5sum for a message object of type 'turtle_array"
  "a167676d2b4e0f20402b9b02bac07167")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<turtle_array>)))
  "Returns full string definition for message of type '<turtle_array>"
  (cl:format cl:nil "turtle[] turtles~%================================================================================~%MSG: python_turtle/turtle~%string name~%geometry_msgs/Pose turtle_pose~%string color~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'turtle_array)))
  "Returns full string definition for message of type 'turtle_array"
  (cl:format cl:nil "turtle[] turtles~%================================================================================~%MSG: python_turtle/turtle~%string name~%geometry_msgs/Pose turtle_pose~%string color~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <turtle_array>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'turtles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <turtle_array>))
  "Converts a ROS message object to a list"
  (cl:list 'turtle_array
    (cl:cons ':turtles (turtles msg))
))
