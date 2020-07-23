;; Auto-generated. Do not edit!


(when (boundp 'python_turtle::setcolor)
  (if (not (find-package "PYTHON_TURTLE"))
    (make-package "PYTHON_TURTLE"))
  (shadow 'setcolor (find-package "PYTHON_TURTLE")))
(unless (find-package "PYTHON_TURTLE::SETCOLOR")
  (make-package "PYTHON_TURTLE::SETCOLOR"))
(unless (find-package "PYTHON_TURTLE::SETCOLORREQUEST")
  (make-package "PYTHON_TURTLE::SETCOLORREQUEST"))
(unless (find-package "PYTHON_TURTLE::SETCOLORRESPONSE")
  (make-package "PYTHON_TURTLE::SETCOLORRESPONSE"))

(in-package "ROS")





(defclass python_turtle::setcolorRequest
  :super ros::object
  :slots (_turtle_name _color ))

(defmethod python_turtle::setcolorRequest
  (:init
   (&key
    ((:turtle_name __turtle_name) "")
    ((:color __color) "")
    )
   (send-super :init)
   (setq _turtle_name (string __turtle_name))
   (setq _color (string __color))
   self)
  (:turtle_name
   (&optional __turtle_name)
   (if __turtle_name (setq _turtle_name __turtle_name)) _turtle_name)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:serialization-length
   ()
   (+
    ;; string _turtle_name
    4 (length _turtle_name)
    ;; string _color
    4 (length _color)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _turtle_name
       (write-long (length _turtle_name) s) (princ _turtle_name s)
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _turtle_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _turtle_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass python_turtle::setcolorResponse
  :super ros::object
  :slots (_ret ))

(defmethod python_turtle::setcolorResponse
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

(defclass python_turtle::setcolor
  :super ros::object
  :slots ())

(setf (get python_turtle::setcolor :md5sum-) "4e5c5e738507cfbcc1070c9c1e8f412e")
(setf (get python_turtle::setcolor :datatype-) "python_turtle/setcolor")
(setf (get python_turtle::setcolor :request) python_turtle::setcolorRequest)
(setf (get python_turtle::setcolor :response) python_turtle::setcolorResponse)

(defmethod python_turtle::setcolorRequest
  (:response () (instance python_turtle::setcolorResponse :init)))

(setf (get python_turtle::setcolorRequest :md5sum-) "4e5c5e738507cfbcc1070c9c1e8f412e")
(setf (get python_turtle::setcolorRequest :datatype-) "python_turtle/setcolorRequest")
(setf (get python_turtle::setcolorRequest :definition-)
      "string turtle_name
string color
---
int8 ret

")

(setf (get python_turtle::setcolorResponse :md5sum-) "4e5c5e738507cfbcc1070c9c1e8f412e")
(setf (get python_turtle::setcolorResponse :datatype-) "python_turtle/setcolorResponse")
(setf (get python_turtle::setcolorResponse :definition-)
      "string turtle_name
string color
---
int8 ret

")



(provide :python_turtle/setcolor "4e5c5e738507cfbcc1070c9c1e8f412e")


