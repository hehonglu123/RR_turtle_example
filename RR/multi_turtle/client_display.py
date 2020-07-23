import turtle
import traceback
import time
from RobotRaconteur.Client import *		#import RR client library


url='rr+tcp://localhost:22222/?service=Turtlebot_Service'
obj=RRN.ConnectService(url)

screen = turtle.Screen()
screen.bgcolor("lightblue")


def update_dict():
	turtle_dict={}						#turtle_dict: names<->turtle object
	for i in range(len(obj.turtles)):
		turtle_dict[obj.turtles[i].name] = turtle.Turtle()
		turtle_dict[obj.turtles[i].name].shape("turtle")
	return turtle_dict

turtle_dict=update_dict()
def updatepose():           		 #set a new pose for turtlebot
	global turtle_dict
	for i in range(len(obj.turtles)):
		if obj.turtles[i].color=="None":
			turtle_dict[obj.turtles[i].name].penup()
		else:
			turtle_dict[obj.turtles[i].name].pendown()
			turtle_dict[obj.turtles[i].name].pencolor(obj.turtles[i].color)
		turtle_dict[obj.turtles[i].name].setpos(obj.turtles[i].turtle_pose.x,obj.turtles[i].turtle_pose.y)
		turtle_dict[obj.turtles[i].name].seth(obj.turtles[i].turtle_pose.angle)

while True:
	try:
		if obj.turtle_change==True:
			screen.clearscreen()
			turtle_dict=update_dict()
			screen.bgcolor("lightblue")
			obj.turtle_change=False
		updatepose()							#updatepose based on location of each turtle
		time.sleep(0.01)
	except KeyError:
		continue
	except IndexError:
		continue
	except:
		traceback.print_exc()
		break


