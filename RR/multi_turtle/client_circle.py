import turtle
import sys
import traceback
import time
from RobotRaconteur.Client import *		#import RR client library

with RR.ClientNodeSetup(argv=sys.argv):
	url='rr+tcp://localhost:22222/?service=Turtlebot_Service'
	#take url from command line
	if (len(sys.argv)>=2):
		url=sys.argv[1]

	sub=RRN.SubscribeService(url)
	#guard connection
	while True:
	   try:
		   obj = sub.GetDefaultClient()
		   turtles_wire=sub.SubscribeWire("turtles_wire")
		   break
	   except RR.ConnectionException:
		   time.sleep(0.1)
	#initialize display
	screen = turtle.Screen()
	screen.bgcolor("lightblue")
	my_turtlename="turtle1"
	obj.add_turtle(my_turtlename)
	turtle_dict={}						#turtle_dict: names<->turtle object


	for i in range(len(turtles_wire.InValue)):
		turtle_dict[turtles_wire.InValue[i].name] = turtle.Turtle()
		turtle_dict[turtles_wire.InValue[i].name].shape("turtle")


	def updatepose():           		 #set a new pose for turtlebot
		turtles=turtles_wire.InValue
		for i in range(len(turtles)):
			if turtles[i].color=="None":
				turtle_dict[turtles[i].name].penup()
			else:
				turtle_dict[turtles[i].name].pendown()
				turtle_dict[turtles[i].name].pencolor(turtles[i].color)
			turtle_dict[turtles[i].name].setpos(turtles[i].turtle_pose.x,turtles[i].turtle_pose.y)
			turtle_dict[turtles[i].name].seth(turtles[i].turtle_pose.angle)

	while True:
		try:
			updatepose()							#updatepose based on location of each turtle
			obj.drive(my_turtlename,10,10)

		except RR.ConnectionException:
			continue
		except:
			traceback.print_exc()
			obj.remove_turtle(my_turtlename)
			break


