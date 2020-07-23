
(cl:in-package :asdf)

(defsystem "python_turtle-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "addturtle" :depends-on ("_package_addturtle"))
    (:file "_package_addturtle" :depends-on ("_package"))
    (:file "removeturtle" :depends-on ("_package_removeturtle"))
    (:file "_package_removeturtle" :depends-on ("_package"))
    (:file "setcolor" :depends-on ("_package_setcolor"))
    (:file "_package_setcolor" :depends-on ("_package"))
    (:file "setpose" :depends-on ("_package_setpose"))
    (:file "_package_setpose" :depends-on ("_package"))
  ))