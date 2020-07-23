import time
import turtle
import termios, fcntl, sys, os
from RobotRaconteur.Client import *     #import RR client library

#keyboard reading settings
fd = sys.stdin.fileno()
oldterm = termios.tcgetattr(fd)
newattr = termios.tcgetattr(fd)
newattr[3] = newattr[3] & ~termios.ICANON & ~termios.ECHO
termios.tcsetattr(fd, termios.TCSANOW, newattr)
oldflags = fcntl.fcntl(fd, fcntl.F_GETFL)
fcntl.fcntl(fd, fcntl.F_SETFL, oldflags | os.O_NONBLOCK)


with RR.ClientNodeSetup(argv=sys.argv):
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


    #add my turtle to the turtle list
    screen = turtle.Screen()
    screen.bgcolor("lightblue")
    my_turtlename="turtle1"
    obj.add_turtle(my_turtlename)

    def update_dict():
        turtle_dict={}                      #turtle_dict: names<->turtle object

        if (turtles_wire.TryGetInValue()):
            for i in range(len(turtles_wire.InValue)):
                turtle_dict[turtles_wire.InValue[i].name] = turtle.Turtle()
                turtle_dict[turtles_wire.InValue[i].name].shape("turtle")
            return turtle_dict

    turtle_dict=update_dict()
    def updatepose():                    #set a new pose for turtlebot
        global turtle_dict
        for i in range(len(turtles_wire.InValue)):
            if turtles_wire.InValue[i].color=="None":
                turtle_dict[turtles_wire.InValue[i].name].penup()
            else:
                turtle_dict[turtles_wire.InValue[i].name].pendown()
                turtle_dict[turtles_wire.InValue[i].name].pencolor(turtles_wire.InValue[i].color)
            turtle_dict[turtles_wire.InValue[i].name].setpos(turtles_wire.InValue[i].turtle_pose.x,turtles_wire.InValue[i].turtle_pose.y)
            turtle_dict[turtles_wire.InValue[i].name].seth(turtles_wire.InValue[i].turtle_pose.angle)



    print("Running")
    print("Press Arrow Key to Control Turtle")
    print("Press q to quit")
    try:
        while True:
            try:
                #read in keyboard input
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

                if obj.turtle_change==True:
                    screen.clearscreen()
                    turtle_dict=update_dict()
                    screen.bgcolor("lightblue")
                    obj.turtle_change=False
                updatepose()                            #updatepose based on location of each turtle

            except IOError: pass
    #finish reading keyboard input
    finally:
        termios.tcsetattr(fd, termios.TCSAFLUSH, oldterm)
        fcntl.fcntl(fd, fcntl.F_SETFL, oldflags)

    #remove my turtle
    obj.remove_turtle(my_turtlename)    