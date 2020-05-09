import turtle
from tkthread import tk, TkThread
import threading, time
import traceback
#import RR library
import RobotRaconteur as RR
RRN=RR.RobotRaconteurNode.s

#object definition
turtlebot_interface="""
#Service to provide virtual interface to the Duckiebot Drive
service experimental.turtlebot_create

stdver 0.9
struct pose
    field single x
    field single y
    field single angle
end

object turtlebot
	function void drive(single move_speed, single turn_speed)
	function void setpose(pose desire_pose)
	function void setpencolor(string color)
	property pose turtle_pose

end object
"""
#Actual class object
class create_impl:
	def __init__(self):               			#initialization upon creation
		#turtlesim initialization
		self.screen = turtle.Screen()
		self.turtle = turtle.Turtle()
		self.turtle.shape("turtle")
		self.screen.bgcolor("lightblue")
		#tkthread initialization
		self.tkt = TkThread(self.screen._root)  # make the thread-safe callable
		#RR background thread initialization
		self._lock=threading.RLock()
		self._running=False
		#RR property
		self.turtle_pose=RRN.NewStructure("experimental.turtlebot_create.pose")

	def drive(self,move_speed,turn_speed):            #Drive function, update new position, this is the one referred in definition
		# self.run(lambda: self.tkt(self.turtle.forward,move_speed))
		# self.run(lambda: self.tkt(self.turtle.left,turn_speed))
		self.tkt(self.turtle.forward,move_speed)
		self.tkt(self.turtle.left,turn_speed)


	def setpose(self,desire_pose):            #set a new pose for turtlebot

		self.tkt(self.turtle.setpos,desire_pose.x,desire_pose.y)
		self.tkt(self.turtle.seth,desire_pose.angle)
	def getpose(self):
		while self._running:
			try:
				(self.turtle_pose.x,self.turtle_pose.y)=self.turtle.pos()
				self.turtle_pose.angle=self.turtle.heading()
			except:
				traceback.print_exc()

	def run(self,func):
	    threading.Thread(target=func).start()


	def setpencolor(self,color):
		if color=="none":
			self.tkt(self.turtle.penup)
			return
		self.tkt(self.turtle.pendown)
		self.tkt(self.turtle.pencolor,color)
	#background thread updating pose property
	def start(self):
		self._running=True
		self._pose = threading.Thread(target=self.getpose)
		self._pose.daemon = True
		self._pose.start()
	def close(self):
		self._running = False
		self._pose.join()
		


if __name__ == '__main__':
		
	with RR.ServerNodeSetup("experimental.turtlebot_create", 22222):      #setup RR node with service name and port
		#Register the service type

		RRN.RegisterServiceType(turtlebot_interface)               #register service type

		create_inst=create_impl()                #create object
		create_inst.start()
          

		#Register the service with definition and object
		RRN.RegisterService("Turtlebot_Service","experimental.turtlebot_create.turtlebot",create_inst)

		#Wait for program exit to quit
		input("Press enter to quit")