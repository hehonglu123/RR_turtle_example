;; Auto-generated. Do not edit!


(when (boundp 'python_turtle::setpose)
  (if (not (find-package "PYTHON_TURTLE"))
    (make-package "PYTHON_TURTLE"))
  (shadow 'setpose (find-package "PYTHON_TURTLE")))
(unless (find-package "PYTHON_TURTLE::SETPOSE")
  (make-package "PYTHON_TURTLE::SETPOSE"))
(unless (find-package "PYTHON_TURTLE::SETPOSEREQUEST")
  (make-package "PYTHON_TURTLE::SETPOSEREQUEST"))
(unless (find-package "PYTHON_TURTLE::SETPOSERESPONSE")
  (make-package "PYTHON_TURTLE::SETPOSERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass python_turtle::setposeRequest
  :super ros::object
  :slots (_turtle_pose ))

(defmethod python_turtle::setposeRequest
  (:init
   (&key
    ((:turtle_pose __turtle_pose) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _turtle_pose __turtle_pose)
   self)
  (:turtle_pose
   (&rest __turtle_pose)
   (if (keywordp (car __turtle_pose))
       (send* _turtle_pose __turtle_pose)
     (progn
       (if __turtle_pose (setq _turtle_pose (car __turtle_pose)))
       _turtle_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _turtle_pose
    (send _turtle_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _turtle_pose
       (send _turtle_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _turtle_pose
     (send _turtle_pose :deserialize buf ptr-) (incf ptr- (send _turtle_pose :serialization-length))
   ;;
   self)
  )

(defclass python_turtle::setposeResponse
  :super ros::object
  :slots (_ret ))

(defmethod python_turtle::setposeResponse
  (:init
   (&key
    ((:ret __ret) 0)
    )
   (send-super :init)
   (setq _ret (round __ret))
   self)
  (:ret
   (&optional __ret)
   (if __ret (setq _ret __ret)) _ret)
  (:serialization-length
   ()
   (+
    ;; int8 _ret
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _ret
       (write-byte _ret s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _ret
     (setq _ret (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _ret 127) (setq _ret (- _ret 256)))
   ;;
   self)
  )

(defclass python_turtle::setpose
  :super ros::object
  :slots ())

(setf (get python_turtle::setpose :md5sum-) "c7286894f126aa93e3ce655b0b322988")
(setf (get python_turtle::setpose :datatype-) "python_turtle/setpose")
(setf (get python_turtle::setpose :request) python_turtle::setposeRequest)
(setf (get python_turtle::setpose :response) python_turtle::setposeResponse)

(defmethod python_turtle::setposeRequest
  (:response () (instance python_turtle::setposeResponse :init)))

(setf (get python_turtle::setposeRequest :md5sum-) "c7286894f126aa93e3ce655b0b322988")
(setf (get python_turtle::setposeRequest :datatype-) "python_turtle/setposeRequest")
(setf (get python_turtle::setposeRequest :definition-)
      "geometry_msgs/PoseStamped turtle_pose

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
int8 ret

")

(setf (get python_turtle::setposeResponse :md5sum-) "c7286894f126aa93e3ce655b0b322988")
(setf (get python_turtle::setposeResponse :datatype-) "python_turtle/setposeResponse")
(setf (get python_turtle::setposeResponse :definition-)
      "geometry_msgs/PoseStamped turtle_pose

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
int8 ret

")



(provide :python_turtle/setpose "c7286894f126aa93e3ce655b0b322988")


