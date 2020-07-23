import RobotRaconteur as RR
RRN=RR.RobotRaconteurNode.s
from maze import *
import time
import turtle
import numpy as np


def waypoint_following(turtle_obj,turtle_pose_wire,target_x,target_y):
	desired_angle=np.degrees(np.arctan2(target_y-turtle_pose_wire.InValue.y,target_x-turtle_pose_wire.InValue.x))

	turtle_obj.drive(0,desired_angle-turtle_pose_wire.InValue.angle)
	updatepose()
	turtle_obj.drive(np.linalg.norm([target_x-turtle_pose_wire.InValue.x,target_y-turtle_pose_wire.InValue.y]),0)
	updatepose()

with RR.ClientNodeSetup(argv=sys.argv):
	url='rr+tcp://localhost:22222/?service=Turtlebot_Service'
	#take url from command line
	if (len(sys.argv)>=2):
		url=sys.argv[1]
	sub=RRN.SubscribeService(url)
	while True:
	   try:
		   turtle_obj = sub.GetDefaultClient()
		   turtle_pose_wire=sub.SubscribeWire("turtle_pose_wire")
		   
		   break
	   except RR.ConnectionException:
		   time.sleep(0.1)

	maze_obj=Turtle_Maze()
	maze_obj.setup_maze(turtle_obj.map)


	t1=turtle.Turtle()
	t1.shape("turtle")

	def updatepose():                    #set a new pose for turtlebot
		if turtle_obj.color=="None":
			t1.penup()
		else:
			t1.pencolor(turtle_obj.color)
		if (turtle_pose_wire.TryGetInValue()[0]):
			t1.setpos(turtle_pose_wire.InValue.x,turtle_pose_wire.InValue.y)
			t1.seth(turtle_pose_wire.InValue.angle)
		

	print("Running")

	maze=Maze.solver_obj(turtle_obj.map)
	start_x  = 1
	start_y  = 1
	target_x = 23
	target_y = 22

	start_node  = maze.get(start_x, start_y)
	target_node = maze.get(target_x, target_y)
	path = astar(maze, start_node, target_node)

	RRN.RegisterServiceTypeFromFile("experimental.turtlebot_create") 
	turtle_pose=RRN.NewStructure("experimental.turtlebot_create.pose")
	turtle_pose.x,turtle_pose.y=maze_obj.maze_to_screen(start_x, start_y)
	turtle_pose.angle=0
	turtle_obj.color="None"
	turtle_obj.setpose(turtle_pose)
	updatepose()
	turtle_obj.color="green"
	

	for p in path:
		
		# t1.goto(maze_obj.maze_to_screen(p.x,p.y))
		screen_x,screen_y=maze_obj.maze_to_screen(p.x,p.y)
		waypoint_following(turtle_obj,turtle_pose_wire,screen_x,screen_y)
		
