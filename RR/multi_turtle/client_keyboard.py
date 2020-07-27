import termios, fcntl, sys, os
import turtle                           #import python turtle library
import time
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

    if turtle_change:
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
       break
   except RR.ConnectionException:
       time.sleep(0.1)

#event setup
obj.turtle_change+=turtle_changed

#create RR turtle struct, add my turtle to the turtle list
my_turtle=obj.add_turtle("turtle-1")


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
                obj.drive(my_turtle,10,0)            ####Drive forward
            if "\x1b[B" in c:
                obj.drive(my_turtle,-10,0)           ####Drive backward               
            if "\x1b[C" in c:
                obj.drive(my_turtle,0,-10)           ####Drive right
            if "\x1b[D" in c:
                obj.drive(my_turtle,0,10)            ####Drive left
            if "q" in c:
                break
            
        except IOError: pass
#finish reading keyboard input
finally:
    termios.tcsetattr(fd, termios.TCSAFLUSH, oldterm)
    fcntl.fcntl(fd, fcntl.F_SETFL, oldflags)

#remove my turtle
obj.remove_turtle(my_turtle)    