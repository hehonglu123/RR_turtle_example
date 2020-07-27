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


url='rr+tcp://localhost:22222/?service=Turtlebot_Service'
#take url from command line
if (len(sys.argv)>=2):
    url=sys.argv[1]
sub=RRN.SubscribeService(url)
while True:
   try:
       obj = sub.GetDefaultClient()
       turtle_pose_wire=sub.SubscribeWire("turtle_pose_wire")
       distance_report_wire=sub.SubscribeWire("distance_report_wire")

       break
   except RR.ConnectionException:
       time.sleep(0.1)

#add my turtle to the turtle list
my_turtlename="turtle1"
obj.add_turtle(my_turtlename)


print("Running")
print("Press Arrow Key to Control Turtle")
print("Press q to quit")
try:
    while True:
        try:
            c = sys.stdin.read()
            if "\x1b[A" in c:
                obj.drive("turtle1",10,0)            ####Drive forward
            if "\x1b[B" in c:
                obj.drive("turtle1",-10,0)           ####Drive backward               
            if "\x1b[C" in c:
                obj.drive("turtle1",0,-10)           ####Drive right
            if "\x1b[D" in c:
                obj.drive("turtle1",0,10)            ####Drive left
            if "q" in c:
                break
            for i in range(len(distance_report_wire.InValue))
            print(distance_report_wire[0].  )
        except IOError: pass
#finish reading keyboard input
finally:
    termios.tcsetattr(fd, termios.TCSAFLUSH, oldterm)
    fcntl.fcntl(fd, fcntl.F_SETFL, oldflags)

#remove my turtle
obj.remove_turtle(my_turtlename)    