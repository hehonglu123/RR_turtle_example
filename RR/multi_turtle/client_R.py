import traceback
import time
from RobotRaconteur.Client import *		#import RR client library

url='rr+tcp://localhost:22222/?service=Turtlebot_Service'
obj=RRN.ConnectService(url)

#add my turtle to the turtle list
my_turtlename="turtle2"
obj.add_turtle(my_turtlename)

def drawR(turtlename):
	obj.drive(turtlename,0,90)
	obj.drive(turtlename,200,0)
	obj.drive(turtlename,0,-90)
	for i in range(21):
		obj.drive(turtlename,9,-9)
	obj.drive(turtlename,0,140)
	obj.drive(turtlename,120,0)
	return

#get pose struct type
pose=obj.turtles[0].turtle_pose
while True:
	try:
		obj.setcolor(my_turtlename,"red")
		drawR(my_turtlename)
		time.sleep(0.5)
		pose.x=0
		pose.y=0
		pose.angle=0
		obj.setcolor(my_turtlename,"None")
		obj.setpose(my_turtlename,pose)
		time.sleep(0.5)
	except:
		#remove my turtle
		obj.remove_turtle(my_turtlename)
		traceback.print_exc()
		break