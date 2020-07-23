import termios, fcntl, sys, os
import rospy     #import ROS library
from geometry_msgs.msg import TwistStamped
from python_turtle.srv import addturtle, removeturtle

#keyboard reading settings
fd = sys.stdin.fileno()
oldterm = termios.tcgetattr(fd)
newattr = termios.tcgetattr(fd)
newattr[3] = newattr[3] & ~termios.ICANON & ~termios.ECHO
termios.tcsetattr(fd, termios.TCSANOW, newattr)
oldflags = fcntl.fcntl(fd, fcntl.F_GETFL)
fcntl.fcntl(fd, fcntl.F_SETFL, oldflags | os.O_NONBLOCK)


#ROS initialization
rospy.init_node('keyboard_control', anonymous=False)
pub=rospy.Publisher('drive',TwistStamped,queue_size=1)

#add my turtle to the turtle list
my_turtlename="turtle1"
rospy.wait_for_service('addturtle')
add_turtle=rospy.ServiceProxy('addturtle',addturtle)
ret=add_turtle(my_turtlename)



print("Running")
print("Press Arrow Key to Control Turtle")
print("Press q to quit")
try:
    while not rospy.is_shutdown():
        try:
            #form ros msg
            msg=TwistStamped()
            msg.header.frame_id=my_turtlename
            c = sys.stdin.read()
            if "\x1b[A" in c:
                msg.twist.linear.x=10                   ####Drive forward
            if "\x1b[B" in c:
                msg.twist.linear.x=-10                  ####Drive backward               
            if "\x1b[C" in c:
                msg.twist.angular.z=-10                 ####Drive right
            if "\x1b[D" in c:
                msg.twist.angular.z=10                  ####Drive left
            if "q" in c:
                break
            pub.publish(msg)      
        except IOError: pass
#finish reading keyboard input
finally:
    termios.tcsetattr(fd, termios.TCSAFLUSH, oldterm)
    fcntl.fcntl(fd, fcntl.F_SETFL, oldflags)

#remove my turtle
rospy.wait_for_service('removeturtle')
remove_turtle=rospy.ServiceProxy('removeturtle',removeturtle)
ret=remove_turtle(my_turtlename)