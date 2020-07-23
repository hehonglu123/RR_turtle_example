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

# m=open("map/map1.txt",'r').read().splitlines()

# maze_obj=Turtle_Maze()
# maze_obj.setup_maze(m)


# maze     = Maze.from_file("map/map1.txt")
# start_x  = 1
# start_y  = 1
# target_x = 22
# target_y = 22

# start_node  = maze.get(start_x, start_y)
# target_node = maze.get(target_x, target_y)

# if not start_node.walkable or not target_node.walkable:
# 	print "Start node or target node is not walkable. No solution exists."
# 	exit(1)
	
# path = astar(maze, start_node, target_node)

# #initialize turtle
# t1=turtle.Turtle()
# t1.shape("turtle")
# t1.speed=10
# t1.color("green")
# t1.penup()
# t1.goto(maze_obj.maze_to_screen(start_x,start_y))
# t1.pendown()
# for p in path:
# 	t1.goto(maze_obj.maze_to_screen(p.x,p.y))

