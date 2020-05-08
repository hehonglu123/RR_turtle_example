import turtle

#import ROS library
import rospy
from geometry_msgs.msg import Twist, Pose


screen=turtle.Screen()
Turtle=turtle.Turtle()
Turtle.shape("turtle")
screen.bgcolor("lightblue")


def callback1(data):
	Turtle.forward(data.linear.x)
	Turtle.left(data.angular.z)

def callback2(data):
	Turtle.setpos(data.position.x,data.position.y)
	Turtle.seth(data.orientation.z)



rospy.init_node('turtlebot', anonymous=True)

rospy.Subscriber("turtle_drive", Twist, callback1)
rospy.Subscriber("turtle_setpose", Pose, callback2)
rospy.spin()