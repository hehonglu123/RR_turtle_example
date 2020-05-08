
#import ROS library
import rospy
from geometry_msgs.msg import Twist, Pose


if __name__ == '__main__':
	pub = rospy.Publisher('turtle_drive', Twist, queue_size=10)
	rospy.init_node('turtlebot_publisher', anonymous=True)
	rate = rospy.Rate(10) # 10hz
	while not rospy.is_shutdown():
		message=Twist()
		message.linear.x=5
		pub.publish(message)
		rate.sleep()