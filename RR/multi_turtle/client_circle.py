import turtle                           #import python turtle library
import time
import sys
import traceback
from RobotRaconteur.Client import *     #import RR client library

#initialize global variables
turtle_display_dict={}
#initialize display
screen = turtle.Screen()
screen.bgcolor("lightblue")

turtle_change=False
#event callback
def turtle_changed():
    global turtle_change
    turtle_change=True

def update(turtle_dict):                    #set a new pose for turtlebot
    global turtle_display_dict, my_turtle, turtle_change

    if turtle_change==True:
        #clear turtle_display_dict
        turtle_display_dict={}
        #clear screen
        screen.clearscreen()
        screen.bgcolor("lightblue")
        turtle_change=False
        #update turtles on screen
        for key, value in turtle_dict.items():
            turtle_display_dict[key]=turtle.Turtle()
            turtle_display_dict[key].shape("turtle")
            turtle_display_dict[key].penup()

    #update turtles pose in display
    for key, value in turtle_dict.items():
        turtle_display_dict[key].setpos(value.turtle_pose.x,value.turtle_pose.y)
        turtle_display_dict[key].seth(value.turtle_pose.angle)
        if value.color=="None":
            turtle_display_dict[key].penup()
        else:
            turtle_display_dict[key].pendown()
            turtle_display_dict[key].pencolor(value.color)
        


#RR client setup, connect to turtle service
url='rr+tcp://localhost:22222/?service=Turtlebot_Service'
#take url from command line
if (len(sys.argv)>=2):
    url=sys.argv[1]
sub=RRN.SubscribeService(url)
while True:
   try:
       obj = sub.GetDefaultClient()
       turtles_wire=sub.SubscribeWire("turtles_wire")
       break
   except RR.ConnectionException:
       time.sleep(0.1)

#event setup
obj.turtle_change+=turtle_changed

#create RR turtle struct, add my turtle to the turtle list
my_turtlename="turtle-circle"
obj.add_turtle(my_turtlename)
obj.setcolor(my_turtlename,"green")
while True:
	try:
		obj.drive(my_turtlename,10,10)
		update(turtles_wire.InValue)
	except:
		traceback.print_exc()
		#remove my turtle
		obj.remove_turtle(my_turtlename)    

