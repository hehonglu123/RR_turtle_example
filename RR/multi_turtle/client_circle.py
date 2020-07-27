import turtle                           #import python turtle library
import time
import sys
import traceback
from RobotRaconteur.Client import *     #import RR client library

#initialize global variables
my_turtle=None
turtle_display_list=[]
#initialize display
screen = turtle.Screen()
screen.bgcolor("lightblue")

turtle_change=False
#event callback
def turtle_changed():
    global turtle_change
    turtle_change=True

def update(turtle_list):                    #set a new pose for turtlebot
    global turtle_display_list, my_turtle, turtle_change

    if turtle_change==True:
        #clear turtle_display_list
        turtle_display_list=[]
        #clear screen
        screen.clearscreen()
        screen.bgcolor("lightblue")
        turtle_change=False
        #update turtles on screen
        for i in range(len(turtle_list)):
            turtle_display_list.append(turtle.Turtle())
            turtle_display_list[i].shape("turtle")
            #update index
            if (turtle_list[i].name==my_turtle.name):
                my_turtle.index=turtle_list[i].index

    #update turtles pose in display
    for i in range(len(turtle_list)):
        if turtle_list[i].color=="None":
            turtle_display_list[i].penup()
        else:
            turtle_display_list[i].pendown()
            turtle_display_list[i].pencolor(turtle_list[i].color)
        turtle_display_list[i].setpos(turtle_list[i].turtle_pose.x,turtle_list[i].turtle_pose.y)
        turtle_display_list[i].seth(turtle_list[i].turtle_pose.angle)


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
my_turtle=obj.add_turtle("turtle-circle")
obj.setcolor(my_turtle,"green")
while True:
	try:
		obj.drive(my_turtle,10,10)
		update(turtles_wire.InValue)
	except:
		traceback.print_exc()
		#remove my turtle
		obj.remove_turtle(my_turtle)    

