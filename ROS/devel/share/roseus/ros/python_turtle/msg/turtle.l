;; Auto-generated. Do not edit!


(when (boundp 'python_turtle::turtle)
  (if (not (find-package "PYTHON_TURTLE"))
    (make-package "PYTHON_TURTLE"))
  (shadow 'turtle (find-package "PYTHON_TURTLE")))
(unless (find-package "PYTHON_TURTLE::TURTLE")
  (make-package "PYTHON_TURTLE::TURTLE"))

(in-package "ROS")
;;//! \htmlinclude turtle.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass python_turtle::turtle
  :super ros::object
  :slots (_name _turtle_pose _color ))

(defmethod python_turtle::turtle
  (:init
   (&key
    ((:name __name) "")
    ((:turtle_pose __turtle_pose) (instance geometry_msgs::Pose :init))
    ((:color __color) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _turtle_pose __turtle_pose)
   (setq _color (string __color))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:turtle_pose
   (&rest __turtle_pose)
   (if (keywordp (car __turtle_pose))
       (send* _turtle_pose __turtle_pose)
     (progn
       (if __turtle_pose (setq _turtle_pose (car __turtle_pose)))
       _turtle_pose)))
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; geometry_msgs/Pose _turtle_pose
    (send _turtle_pose :serialization-length)
    ;; string _color
    4 (length _color)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; geometry_msgs/Pose _turtle_pose
       (send _turtle_pose :serialize s)
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _turtle_pose
     (send _turtle_pose :deserialize buf ptr-) (incf ptr- (send _turtle_pose :serialization-length))
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get python_turtle::turtle :md5sum-) "2b46ddca532ac1ab602d56cef5ac1313")
(setf (get python_turtle::turtle :datatype-) "python_turtle/turtle")
(setf (get python_turtle::turtle :definition-)
      "string name
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



(provide :python_turtle/turtle "2b46ddca532ac1ab602d56cef5ac1313")


