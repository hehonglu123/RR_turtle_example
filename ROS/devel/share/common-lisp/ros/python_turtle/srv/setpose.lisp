; Auto-generated. Do not edit!


(cl:in-package python_turtle-srv)


;//! \htmlinclude setpose-request.msg.html

(cl:defclass <setpose-request> (roslisp-msg-protocol:ros-message)
  ((turtle_pose
    :reader turtle_pose
    :initarg :turtle_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
)

(cl:defclass setpose-request (<setpose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setpose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setpose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-srv:<setpose-request> is deprecated: use python_turtle-srv:setpose-request instead.")))

(cl:ensure-generic-function 'turtle_pose-val :lambda-list '(m))
(cl:defmethod turtle_pose-val ((m <setpose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-srv:turtle_pose-val is deprecated.  Use python_turtle-srv:turtle_pose instead.")
  (turtle_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setpose-request>) ostream)
  "Serializes a message object of type '<setpose-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'turtle_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setpose-request>) istream)
  "Deserializes a message object of type '<setpose-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'turtle_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setpose-request>)))
  "Returns string type for a service object of type '<setpose-request>"
  "python_turtle/setposeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setpose-request)))
  "Returns string type for a service object of type 'setpose-request"
  "python_turtle/setposeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setpose-request>)))
  "Returns md5sum for a message object of type '<setpose-request>"
  "c7286894f126aa93e3ce655b0b322988")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setpose-request)))
  "Returns md5sum for a message object of type 'setpose-request"
  "c7286894f126aa93e3ce655b0b322988")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setpose-request>)))
  "Returns full string definition for message of type '<setpose-request>"
  (cl:format cl:nil "geometry_msgs/PoseStamped turtle_pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setpose-request)))
  "Returns full string definition for message of type 'setpose-request"
  (cl:format cl:nil "geometry_msgs/PoseStamped turtle_pose~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setpose-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'turtle_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setpose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'setpose-request
    (cl:cons ':turtle_pose (turtle_pose msg))
))
;//! \htmlinclude setpose-response.msg.html

(cl:defclass <setpose-response> (roslisp-msg-protocol:ros-message)
  ((ret
    :reader ret
    :initarg :ret
    :type cl:fixnum
    :initform 0))
)

(cl:defclass setpose-response (<setpose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setpose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setpose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name python_turtle-srv:<setpose-response> is deprecated: use python_turtle-srv:setpose-response instead.")))

(cl:ensure-generic-function 'ret-val :lambda-list '(m))
(cl:defmethod ret-val ((m <setpose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader python_turtle-srv:ret-val is deprecated.  Use python_turtle-srv:ret instead.")
  (ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setpose-response>) ostream)
  "Serializes a message object of type '<setpose-response>"
  (cl:let* ((signed (cl:slot-value msg 'ret)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setpose-response>) istream)
  "Deserializes a message object of type '<setpose-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ret) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setpose-response>)))
  "Returns string type for a service object of type '<setpose-response>"
  "python_turtle/setposeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setpose-response)))
  "Returns string type for a service object of type 'setpose-response"
  "python_turtle/setposeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setpose-response>)))
  "Returns md5sum for a message object of type '<setpose-response>"
  "c7286894f126aa93e3ce655b0b322988")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setpose-response)))
  "Returns md5sum for a message object of type 'setpose-response"
  "c7286894f126aa93e3ce655b0b322988")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setpose-response>)))
  "Returns full string definition for message of type '<setpose-response>"
  (cl:format cl:nil "int8 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setpose-response)))
  "Returns full string definition for message of type 'setpose-response"
  (cl:format cl:nil "int8 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setpose-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setpose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'setpose-response
    (cl:cons ':ret (ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'setpose)))
  'setpose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'setpose)))
  'setpose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setpose)))
  "Returns string type for a service object of type '<setpose>"
  "python_turtle/setpose")