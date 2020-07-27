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
		self.turtles=[]
		self.distance_report_inst=RRN.NewStructure("experimental.turtlebot_create.distance")
		#event
		self.turtle_change=RR.EventHook()

		#distance checking 
		self._lock=threading.RLock()
		self._running=False

	#turtle_change pipe member property getter and setter
	@property
	def turtle_change(self):
		return self._turtlechange
	@turtle_change.setter
	def turtle_change(self,value):
		self._turtlechange=value
		#Create the PipeBroadcaster and set backlog to 3 so packets
		#will be dropped if the transport is overloaded
		self._turtlechange_broadcaster=RR.PipeBroadcaster(value,1)


	def drive(self,turtle_obj,move_speed,turn_speed):            #Drive function, update new position, this is the one referred in definition
		# with self._lock:
			self.turtles[turtle_obj.index].turtle_pose.x+=move_speed*np.cos(np.radians(self.turtles[turtle_obj.index].turtle_pose.angle))
			self.turtles[turtle_obj.index].turtle_pose.y+=move_speed*np.sin(np.radians(self.turtles[turtle_obj.index].turtle_pose.angle))
			self.turtles[turtle_obj.index].turtle_pose.angle+=turn_speed
			self.turtles_wire.OutValue=self.turtles

	def setpose(self,turtle_obj,desire_pose):
		with self._lock:
			self.turtles[turtle_obj.index].turtle_pose=desire_pose
			self.turtles_wire.OutValue=self.turtles
	def setcolor(self,turtle_obj,color):
		with self._lock:
			self.turtles[turtle_obj.index].color=color
			self.turtles_wire.OutValue=self.turtles

	def add_turtle(self,turtle_name):					#add new turtle at origin
		# with self._lock:
			self.turtle.name=turtle_name
			self.turtle.index=len(self.turtles)
			self.turtles.append(copy.deepcopy(self.turtle))
			self.turtles_wire.OutValue=self.turtles

			#pipe send turtle_change signal
			self.turtle_change.fire()
			return self.turtle
		
	def remove_turtle(self,turtle_obj):
		# with self._lock:
			try:
				del self.turtles[turtle_obj.index]
				#update turtles index
				for i in range(len(self.turtles)):
					self.turtles.index=i
				self.turtles_wire.OutValue=self.turtles
				#pipe send turtle_change signal
				self.turtle_change.fire()
			except:
				print(turtle_obj.index)
				print(len(self.turtles))
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

		RRN.RegisterServiceTypeFromFile("robdef/experimental.turtlebot_create")               #register service type

		create_inst=create_impl()                #create object
		create_inst.start()						#start distance checking service
		#Register the service with definition and object
		RRN.RegisterService("Turtlebot_Service","experimental.turtlebot_create.turtlesim",create_inst)


		#Wait for program exit to quit
		input("Press enter to quit")