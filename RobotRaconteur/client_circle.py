from RobotRaconteur.Client import *		#import RR client library
import time

url='rr+tcp://localhost:22222/?service=Turtlebot_Service'
obj=RRN.ConnectService(url)
#following not working yet
# pose=RRN.GetStructureType("experimental.turtlebot_create.pose",obj)
pose=obj.turtle_pose
i=0

def drawR(obj):
	obj.drive(200,0)
	now=time.time()
	obj.drive(0,-90)
	print("function call time= ",time.time()-now)
	for i in range(21):
		obj.drive(9,-9)
	obj.drive(0,140)
	obj.drive(120,0)

while True:
	pose.x=0
	pose.y=0
	pose.angle=90
	obj.setpose(pose)
	obj.setpencolor("red")
	drawR(obj)
	pose.x=30
	pose.y=0
	obj.setpose(pose)
	obj.setpencolor("green")
	drawR(obj)
	obj.clear_screen()

