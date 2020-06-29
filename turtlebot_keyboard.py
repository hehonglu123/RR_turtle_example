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


#RR Client Setup
url='rr+tcp://localhost:22222/?service=Turtlebot_Service'
obj=RRN.ConnectService(url)
print("Running")
print("Press Arrow Key to Control Turtle")
print("Press q to quit")
try:
    while True:
        try:
            c = sys.stdin.read()
            if "\x1b[A" in c:
                obj.drive("turtle1",5,0)            ####Drive forward
            if "\x1b[B" in c:
                obj.drive("turtle1",-5,0)           ####Drive backward               
            if "\x1b[C" in c:
                obj.drive("turtle1",0,-5)           ####Drive right
            if "\x1b[D" in c:
                obj.drive("turtle1",0,5)            ####Drive left
            if "q" in c:
                break

        except IOError: pass
#finish reading keyboard input
finally:
    termios.tcsetattr(fd, termios.TCSAFLUSH, oldterm)
    fcntl.fcntl(fd, fcntl.F_SETFL, oldflags)