import traceback
import time
import rospy		#import ROS client library
from geometry_msgs.msg import TwistStamped
from python_turtle.srv import addturtle, removeturtle, setcolor

#ROS initialization
rospy.init_node('circle', anonymous=False)
pub=rospy.Publisher('drive',TwistStamped,queue_size=1)

#add my turtle to the turtle list
my_turtlename="turtle2"
rospy.wait_for_service('addturtle')
add_turtle=rospy.ServiceProxy('addturtle',addturtle)
ret=add_turtle(my_turtlename)

rospy.wait_for_service('setcolor')
set_color=rospy.ServiceProxy('setcolor',setcolor)
ret=set_color(my_turtlename,"red")

#ros msg
msg=TwistStamped()
msg.header.frame_id=my_turtlename
msg.twist.linear.x=10
msg.twist.angular.z=10
while not rospy.is_shutdown():
	try:
		pub.publish(msg)
		time.sleep(0.1)
	except:
		#remove my turtle
		rospy.wait_for_service('removeturtle')
		remove_turtle=rospy.ServiceProxy('removeturtle',removeturtle)
		ret=remove_turtle(my_turtlename)
		break

