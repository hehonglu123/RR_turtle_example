import turtle
import time
import numpy as np
import traceback
import copy
#import ROS library
import rospy
from std_msgs.msg import Int8
from geometry_msgs.msg import TwistStamped, Pose
from python_turtle.msg import turtle,turtle_array
from python_turtle.srv import addturtle, removeturtle, setcolor, setpose


#Actual class object
class create_impl:
	def __init__(self):               			#initialization upon creation
		#message type initialziation
		self.turtle_pose=Pose()
		self.turtle=turtle()
		self.turtles=turtle_array()
		self.name_dict={}									#name_dict: name<->index
		self.turtle_change=True
		self.vel_sub=rospy.Subscriber('drive',TwistStamped,self.drive_callback)
		self.change_pub=rospy.Publisher('change',Int8,queue_size=1)

		self.pose_server=rospy.Service('setpose', setpose, self.set_pose)
		self.pose_server=rospy.Service('setcolor', setcolor, self.set_color)
		self.pose_server=rospy.Service('addturtle', addturtle, self.add_turtle)
		self.pose_server=rospy.Service('removeturtle', removeturtle, self.remove_turtle)

	def drive_callback(self,data):            #Drive function, update new position, this is the one referred in definition
		self.turtles.turtles[self.name_dict[data.header.frame_id]].turtle_pose.position.x+=data.twist.linear.x*np.cos(np.radians(self.turtles.turtles[self.name_dict[data.header.frame_id]].turtle_pose.orientation.z))
		self.turtles.turtles[self.name_dict[data.header.frame_id]].turtle_pose.position.y+=data.twist.linear.x*np.sin(np.radians(self.turtles.turtles[self.name_dict[data.header.frame_id]].turtle_pose.orientation.z))
		self.turtles.turtles[self.name_dict[data.header.frame_id]].turtle_pose.orientation.z+=data.twist.angular.z

	def set_pose(self,req):
		self.turtles.turtles[self.name_dict[req.turtle_pose.header.frame_id]].turtle_pose=req.turtle_pose.pose
		return 1
	def set_color(self,req):
		self.turtles.turtles[self.name_dict[req.turtle_name]].color=req.color
		return 1
	def add_turtle(self,req):					#add new turtle at origin
		self.turtle_change=True
		self.name_dict[req.turtle_name]=len(self.turtles.turtles)
		self.turtle.name=req.turtle_name
		self.turtle.turtle_pose=self.turtle_pose
		self.turtle.turtle_pose.position.x=0
		self.turtle.turtle_pose.position.y=0
		self.turtle.turtle_pose.orientation.z=0
		self.turtles.turtles.append(copy.deepcopy(self.turtle))

		self.change_pub.publish(1)
		return 1
	def remove_turtle(self,req):
		self.turtle_change=True
		del self.turtles.turtles[self.name_dict[req.turtle_name]]
		del self.name_dict[req.turtle_name]
		
		self.change_pub.publish(1)
		return 1
		

if __name__ == '__main__':
		
	rospy.init_node('turtlebot', anonymous=True)
	obj=create_impl()
	pose_pub=rospy.Publisher('turtles',turtle_array,queue_size=1)
	while not rospy.is_shutdown():
		pose_pub.publish(obj.turtles)
		time.sleep(0.01)
