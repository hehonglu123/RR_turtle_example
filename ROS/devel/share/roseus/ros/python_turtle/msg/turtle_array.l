;; Auto-generated. Do not edit!


(when (boundp 'python_turtle::turtle_array)
  (if (not (find-package "PYTHON_TURTLE"))
    (make-package "PYTHON_TURTLE"))
  (shadow 'turtle_array (find-package "PYTHON_TURTLE")))
(unless (find-package "PYTHON_TURTLE::TURTLE_ARRAY")
  (make-package "PYTHON_TURTLE::TURTLE_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude turtle_array.msg.html


(defclass python_turtle::turtle_array
  :super ros::object
  :slots (_turtles ))

(defmethod python_turtle::turtle_array
  (:init
   (&key
    ((:turtles __turtles) (let (r) (dotimes (i 0) (push (instance python_turtle::turtle :init) r)) r))
    )
   (send-super :init)
   (setq _turtles __turtles)
   self)
  (:turtles
   (&rest __turtles)
   (if (keywordp (car __turtles))
       (send* _turtles __turtles)
     (progn
       (if __turtles (setq _turtles (car __turtles)))
       _turtles)))
  (:serialization-length
   ()
   (+
    ;; python_turtle/turtle[] _turtles
    (apply #'+ (send-all _turtles :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; python_turtle/turtle[] _turtles
     (write-long (length _turtles) s)
     (dolist (elem _turtles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; python_turtle/turtle[] _turtles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _turtles (let (r) (dotimes (i n) (push (instance python_turtle::turtle :init) r)) r))
     (dolist (elem- _turtles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get python_turtle::turtle_array :md5sum-) "a167676d2b4e0f20402b9b02bac07167")
(setf (get python_turtle::turtle_array :datatype-) "python_turtle/turtle_array")
(setf (get python_turtle::turtle_array :definition-)
      "turtle[] turtles
================================================================================
MSG: python_turtle/turtle
string name
geometry_msgs/Pose turtle_pose
string color
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

")



(provide :python_turtle/turtle_array "a167676d2b4e0f20402b9b02bac07167")


