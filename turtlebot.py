import turtle
import time

screen = turtle.Screen()
turtle = turtle.Turtle()
turtle.shape("turtle")
screen.bgcolor("lightblue")

def drive(move_speed,turn_speed):            #Drive function, update new position, this is the one referred in definition

	turtle.forward(move_speed)
	turtle.left(turn_speed)

def setpose(x,y,angle):            #set a new pose for turtlebot

	turtle.setpos(x,y)
	turtle.seth(angle)
		



for i in range(100):
	now=time.time()
	drive(5,0)
	print("function call time= ",time.time()-now)
