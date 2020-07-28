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
		self.turtle=RRN.NewStructure("experimental.turtlebot_create.turtle")
		self.turtle.turtle_pose=RRN.NewStructure("experimental.turtlebot_create.pose")
		self.turtles={}
		self.distance_report_inst=RRN.NewStructure("experimental.turtlebot_create.distance")
		#event
		self.turtle_change=RR.EventHook()

		#distance checking 
		self._lock=threading.RLock()
		self._running=False


	def drive(self,turtle_name,move_speed,turn_speed):            #Drive function, update new position, this is the one referred in definition
		# with self._lock:
			self.turtles[turtle_name].turtle_pose.x+=move_speed*np.cos(np.radians(self.turtles[turtle_name].turtle_pose.angle))
			self.turtles[turtle_name].turtle_pose.y+=move_speed*np.sin(np.radians(self.turtles[turtle_name].turtle_pose.angle))
			self.turtles[turtle_name].turtle_pose.angle+=turn_speed
			self.turtles_wire.OutValue=self.turtles

	def setpose(self,turtle_name,desire_pose):
		with self._lock:
			self.turtles[turtle_name].turtle_pose=desire_pose
			self.turtles_wire.OutValue=self.turtles
	def setcolor(self,turtle_name,color):
		with self._lock:
			self.turtles[turtle_name].color=color
			self.turtles_wire.OutValue=self.turtles

	def add_turtle(self,turtle_name):					#add new turtle at origin
		# with self._lock:
		try:
			self.turtles[turtle_name]=copy.deepcopy(self.turtle)
			self.turtles_wire.OutValue=self.turtles

			#pipe send turtle_change signal
			self.turtle_change.fire()

		except:
			traceback.print_exc()
		
	def remove_turtle(self,turtle_name):
		# with self._lock:
			try:
				del self.turtles[turtle_name]
				#update turtles index
				for i in range(len(self.turtles)):
					self.turtles.index=i
				self.turtles_wire.OutValue=self.turtles
				#pipe send turtle_change signal
				self.turtle_change.fire()
			except:
				traceback.print_exc()

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
					self.distance_report={}
					for key, value in self.turtles.items():
						self.distance_report[key]=copy.deepcopy(self.distance_report_inst)
						for key1, value1 in self.turtles.items():
							if key!=key1:
								direction=[value1.turtle_pose.x-value.turtle_pose.x,value1.turtle_pose.y-value.turtle_pose.y]
								d=np.linalg.norm(direction)
								#update minimal distance if not set or found smaller ones
								if self.distance_report[key].d>d or self.distance_report[key].d==0:
									self.distance_report[key].d=d
									self.distance_report[key].direction=direction
									
					self.distance_report_wire.OutValue=self.distance_report
				except AttributeError:
					pass
				except:
					traceback.print_exc()

	

		
		

if __name__ == '__main__':
		
	with RR.ServerNodeSetup("experimental.turtlesim", 22222):      #setup RR node with service name and port
		#Register the service type

		RRN.RegisterServiceTypeFromFile("robdef/experimental.turtlebot_create")               #register service type

		create_inst=create_impl()                #create object
		create_inst.start()						#start distance checking service
		#Register the service with definition and object
		RRN.RegisterService("Turtlebot_Service","experimental.turtlebot_create.turtlesim",create_inst)


		#Wait for program exit to quit
		input("Press enter to quit")