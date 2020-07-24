import rospy     #import ROS library
import turtle
from geometry_msgs.msg import Twist
from single_turtle.msg import turtle_msg

#display setup
screen = turtle.Screen()
screen.bgcolor("lightblue")
#turtle setup
t1=turtle.Turtle()
t1.shape("turtle")

turtle_obj=turtle_msg()
def callback(data):

	global turtle_obj
	turtle_obj=data

def update():                    #set a new pose for turtlebot
    global turtle_obj
    if turtle_obj.color=="None":
        t1.penup()
    else:
        t1.pencolor(turtle_obj.color)

    t1.setpos(turtle_obj.turtle_pose.position.x,turtle_obj.turtle_pose.position.y)
    t1.seth(turtle_obj.turtle_pose.orientation.z)

rospy.init_node('circle_node', anonymous=False)
pub=rospy.Publisher('drive',Twist,queue_size=1)
sub=rospy.Subscriber('turtle',turtle_msg,callback)

while not rospy.is_shutdown():
	update()
	msg=Twist()	#create message object
	msg.linear.x=10
	msg.angular.z=10
	pub.publish(msg)  