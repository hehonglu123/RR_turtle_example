import termios, fcntl, sys, os
import turtle                           #import python turtle library
import time
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
        



#keyboard reading settings
fd = sys.stdin.fileno()
oldterm = termios.tcgetattr(fd)
newattr = termios.tcgetattr(fd)
newattr[3] = newattr[3] & ~termios.ICANON & ~termios.ECHO
termios.tcsetattr(fd, termios.TCSANOW, newattr)
oldflags = fcntl.fcntl(fd, fcntl.F_GETFL)
fcntl.fcntl(fd, fcntl.F_SETFL, oldflags | os.O_NONBLOCK)


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
       distance_report_wire=sub.SubscribeWire("distance_report_wire")
       break
   except RR.ConnectionException:
       time.sleep(0.1)

#event setup
obj.turtle_change+=turtle_changed

#create RR turtle struct, add my turtle to the turtle list
my_turtlename="turtle-1"
obj.add_turtle(my_turtlename)

print("Running")
print("Press Arrow Key to Control Turtle")
print("Press q to quit")
try:
    while True:
        try:
            #update pose
            update(turtles_wire.InValue)
            c = sys.stdin.read()
            if "\x1b[A" in c:
                obj.drive(my_turtlename,10,0)            ####Drive forward
            if "\x1b[B" in c:
                obj.drive(my_turtlename,-10,0)           ####Drive backward               
            if "\x1b[C" in c:
                obj.drive(my_turtlename,0,-10)           ####Drive right
            if "\x1b[D" in c:
                obj.drive(my_turtlename,0,10)            ####Drive left
            if "q" in c:
                break
            print(distance_report_wire.InValue[my_turtlename].d)
            
        except IOError: pass
        except TypeError: pass
#finish reading keyboard input
finally:
    termios.tcsetattr(fd, termios.TCSAFLUSH, oldterm)
    fcntl.fcntl(fd, fcntl.F_SETFL, oldflags)

#remove my turtle
obj.remove_turtle(my_turtle)    