;; Auto-generated. Do not edit!


(when (boundp 'python_turtle::addturtle)
  (if (not (find-package "PYTHON_TURTLE"))
    (make-package "PYTHON_TURTLE"))
  (shadow 'addturtle (find-package "PYTHON_TURTLE")))
(unless (find-package "PYTHON_TURTLE::ADDTURTLE")
  (make-package "PYTHON_TURTLE::ADDTURTLE"))
(unless (find-package "PYTHON_TURTLE::ADDTURTLEREQUEST")
  (make-package "PYTHON_TURTLE::ADDTURTLEREQUEST"))
(unless (find-package "PYTHON_TURTLE::ADDTURTLERESPONSE")
  (make-package "PYTHON_TURTLE::ADDTURTLERESPONSE"))

(in-package "ROS")





(defclass python_turtle::addturtleRequest
  :super ros::object
  :slots (_turtle_name ))

(defmethod python_turtle::addturtleRequest
  (:init
   (&key
    ((:turtle_name __turtle_name) "")
    )
   (send-super :init)
   (setq _turtle_name (string __turtle_name))
   self)
  (:turtle_name
   (&optional __turtle_name)
   (if __turtle_name (setq _turtle_name __turtle_name)) _turtle_name)
  (:serialization-length
   ()
   (+
    ;; string _turtle_name
    4 (length _turtle_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _turtle_name
       (write-long (length _turtle_name) s) (princ _turtle_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _turtle_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _turtle_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass python_turtle::addturtleResponse
  :super ros::object
  :slots (_ret ))

(defmethod python_turtle::addturtleResponse
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

(defclass python_turtle::addturtle
  :super ros::object
  :slots ())

(setf (get python_turtle::addturtle :md5sum-) "77308e5f6594808d16ab77e3e54c717b")
(setf (get python_turtle::addturtle :datatype-) "python_turtle/addturtle")
(setf (get python_turtle::addturtle :request) python_turtle::addturtleRequest)
(setf (get python_turtle::addturtle :response) python_turtle::addturtleResponse)

(defmethod python_turtle::addturtleRequest
  (:response () (instance python_turtle::addturtleResponse :init)))

(setf (get python_turtle::addturtleRequest :md5sum-) "77308e5f6594808d16ab77e3e54c717b")
(setf (get python_turtle::addturtleRequest :datatype-) "python_turtle/addturtleRequest")
(setf (get python_turtle::addturtleRequest :definition-)
      "string turtle_name
---
int8 ret

")

(setf (get python_turtle::addturtleResponse :md5sum-) "77308e5f6594808d16ab77e3e54c717b")
(setf (get python_turtle::addturtleResponse :datatype-) "python_turtle/addturtleResponse")
(setf (get python_turtle::addturtleResponse :definition-)
      "string turtle_name
---
int8 ret

")



(provide :python_turtle/addturtle "77308e5f6594808d16ab77e3e54c717b")


