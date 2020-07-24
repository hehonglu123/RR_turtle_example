import turtle
import time
from maze_solver import *

class Turtle_Maze():
	def __init__(self):
		self.screen = turtle.Screen()
		self.screen.bgcolor("lightblue")
		self.screen.title("Maze")
		self.screen.setup(700,700)

		self.t=turtle.Turtle()
		self.t.shape("square")
		self.t.color("red")
		self.t.penup()
		self.t.speed(0)

	def setup_maze(self,m):
		for y in range(len(m)):
			for x in range(len(m[y])):
				character=m[y][x]
				screen_x,screen_y=self.maze_to_screen(x,y)

				if character=="X":
					self.t.goto(screen_x,screen_y)
					self.t.stamp()

	def maze_to_screen(self,x,y):
		screen_x=-288+(x*24)
		screen_y=288-(y*24)
		return screen_x,screen_y
	def screen_to_maze(self,x,y):
		maze_x=int((x+288.)/24.)
		maze_y=int((288.-y)/24.)
		return maze_x,maze_y
