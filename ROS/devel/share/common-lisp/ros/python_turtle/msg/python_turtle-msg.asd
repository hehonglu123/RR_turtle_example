
(cl:in-package :asdf)

(defsystem "python_turtle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "turtle" :depends-on ("_package_turtle"))
    (:file "_package_turtle" :depends-on ("_package"))
    (:file "turtle_array" :depends-on ("_package_turtle_array"))
    (:file "_package_turtle_array" :depends-on ("_package"))
  ))