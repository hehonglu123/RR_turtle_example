import time
import numpy as np
import traceback
import copy
#import RR library
import RobotRaconteur as RR
RRN=RR.RobotRaconteurNode.s
import threading

#Actual class object
class create_impl:
	def __init__(self):               			#initialization upon creation

		#RR property
		self.turtle_pose=RRN.NewStructure("experimental.turtlebot_create.pose")
		self.turtle=RRN.NewStructure("experimental.turtlebot_create.turtle")
		self.turtles=[]
		self.name_dict={}									#name_dict: name<->index
		self.turtle_change=True
		self.distance_report_inst=RRN.NewStructure("experimental.turtlebot_create.distance")

		#distance checking 
		self._lock=threading.RLock()
		self._running=False

	def drive(self,turtle_name,move_speed,turn_speed):            #Drive function, update new position, this is the one referred in definition
		self.turtles[self.name_dict[turtle_name]].turtle_pose.x+=move_speed*np.cos(np.radians(self.turtles[self.name_dict[turtle_name]].turtle_pose.angle))
		self.turtles[self.name_dict[turtle_name]].turtle_pose.y+=move_speed*np.sin(np.radians(self.turtles[self.name_dict[turtle_name]].turtle_pose.angle))
		self.turtles[self.name_dict[turtle_name]].turtle_pose.angle+=turn_speed
		self.turtles_wire.OutValue=self.turtles
		# time.sleep(0.1)

	def setpose(self,turtle_name,desire_pose):
		self.turtles[self.name_dict[turtle_name]].turtle_pose=desire_pose
		self.turtles_wire.OutValue=self.turtles
	def setcolor(self,turtle_name,color):
		self.turtles[self.name_dict[turtle_name]].color=color
		self.turtles_wire.OutValue=self.turtles

	def add_turtle(self,turtle_name):					#add new turtle at origin
		self.turtle_change=True
		self.name_dict[turtle_name]=len(self.turtles)
		self.turtle.name=turtle_name
		self.turtle.turtle_pose=self.turtle_pose
		self.turtle.turtle_pose.x=0
		self.turtle.turtle_pose.y=0
		self.turtle.turtle_pose.angle=0
		self.turtles.append(copy.deepcopy(self.turtle))
		self.turtles_wire.OutValue=self.turtles
		
	def remove_turtle(self,turtle_name):
		self.turtle_change=True
		del self.turtles[self.name_dict[turtle_name]]
		del self.name_dict[turtle_name]
		self.turtles_wire.OutValue=self.turtles

	def start(self):
		self._running=True
		self._camera = threading.Thread(target=self.distance_check)
		self._camera.daemon = True
		self._camera.start()
	def close(self):
		self._running = False
		self._camera.join()

	def distance_check(self):
		while self._running:
			with self._lock:
				try:
					self.distance_report=[copy.deepcopy(self.distance_report_inst) for i in range(len(self.turtles))]
					for i in range(len(self.turtles)):
						self.distance_report[i].name=self.turtles[i].name
						self.distance_report[i].d=999
						for j in range(i+1,len(self.turtles)):
							d=np.linalg.norm([self.turtles[i].turtle_pose.x-self.turtles[j].turtle_pose.x,self.turtles[i].turtle_pose.y-self.turtles[j].turtle_pose.y])
							if self.distance_report[i].d>d:
								self.distance_report[i].d=d
								self.distance_report[i].direction=[self.turtles[j].turtle_pose.x-self.turtles[i].turtle_pose.x,self.turtles[j].turtle_pose.y-self.turtles[i].turtle_pose.y]
								self.distance_report[j].d=d
								self.distance_report[j].direction=[self.turtles[i].turtle_pose.x-self.turtles[j].turtle_pose.x,self.turtles[i].turtle_pose.y-self.turtles[j].turtle_pose.y]
					self.distance_report_wire.OutValue=self.distance_report
				except:
					traceback.print_exc()

		
		

if __name__ == '__main__':
		
	with RR.ServerNodeSetup("experimental.turtlesim", 22222):      #setup RR node with service name and port
		#Register the service type

		RRN.RegisterServiceTypeFromFile("experimental.turtlebot_create")               #register service type

		create_inst=create_impl()                #create object
		create_inst.start()						#start distance checking service
		#Register the service with definition and object
		RRN.RegisterService("Turtlebot_Service","experimental.turtlebot_create.turtlesim",create_inst)

		#Wait for program exit to quit
		input("Press enter to quit")