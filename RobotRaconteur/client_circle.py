from RobotRaconteur.Client import *		#import RR client library
import time

url='rr+tcp://localhost:22222/?service=Turtlebot_Service'
obj=RRN.ConnectService(url)
#following not working yet
# pose=RRN.GetStructureType("experimental.turtlebot_create.pose",obj)
pose=obj.turtle_pose
i=0

def drawR(obj):
	for i in range(40):
		obj.drive(5,0)
	now=time.time()
	obj.drive(0,-90)
	print("function call time= ",time.time()-now)
	for i in range(30):
		obj.drive(6,-6.2)
	obj.drive(0,140)
	for i in range(25):
		obj.drive(5,0)


obj.setpencolor("red")
pose.angle=90
obj.setpose(pose)
drawR(obj)
obj.setpencolor("none")
pose.x=30
pose.y=0
obj.setpose(pose)
obj.setpencolor("green")
drawR(obj)

