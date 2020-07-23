import turtle as tt
import traceback
import cv2
import time
import numpy as np
import rospy		#import ROS client library
from python_turtle.msg import turtle,turtle_array
from python_turtle.srv import addturtle, removeturtle, setcolor
from std_msgs.msg import Int8
from geometry_msgs.msg import TwistStamped
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

turtles=turtle_array()
change=1
screen = tt.Screen()
screen.bgcolor("lightblue")
#ROS initialization
rospy.init_node('client_color', anonymous=False)
bridge=CvBridge()

#add my turtle to the turtle list
my_turtlename="turtle_color"
rospy.wait_for_service('addturtle')
add_turtle=rospy.ServiceProxy('addturtle',addturtle)
ret=add_turtle(my_turtlename)

rospy.wait_for_service('setcolor')
set_color=rospy.ServiceProxy('setcolor',setcolor)
ret=set_color(my_turtlename,"red")
#vel publisher
pub=rospy.Publisher('drive',TwistStamped,queue_size=1)


def callback(data):
	global turtles
	turtles=data
def change_callback(data):
	global change
	change=1
def image_callback(data):
#triggered when data received
    try:
        image = bridge.imgmsg_to_cv2(data, "bgr8")	#convert ros image message to opencv object
    except CvBridgeError as e:
        print(e)
    cv2.namedWindow("Image")
    if (not image is None):
        cv2.imshow("Image",image)
    if cv2.waitKey(50)==-1:
        cv2.destroyAllWindows()


    image_size=data.width*data.height
    image_dimension=np.array([data.height,data.width])

    msg=TwistStamped()
    msg.header.frame_id=my_turtlename

    # 1) filter on RED component
    image_red = cv2.inRange(image, np.array([5,5,200]),np.array([200,200,255]))
    #run color connected components to filter the counts and centroid
    retval, labels, stats, centroids = cv2.connectedComponentsWithStats(image_red)
    idx=np.where(np.logical_and(stats[:,4]>=0.01*image_size, stats[:,4]<=0.5*image_size))[0]    #threshold the components to find the best one
    for i in idx:
        if np.linalg.norm(centroids[i]-image_dimension/2.)<50:  #threshold again, only for ones near the center
            print("red detected")
            msg.twist.linear.x=10
            pub.publish(msg)
            return

    # 2) filter on GREEN component
    image_green = cv2.inRange(image, np.array([5,200,5]),np.array([200,255,200]))
    #run color connected components to filter the counts and centroid
    retval, labels, stats, centroids = cv2.connectedComponentsWithStats(image_green)
    idx=np.where(np.logical_and(stats[:,4]>=0.01*image_size, stats[:,4]<=0.5*image_size))[0]    #threshold the components to find the best one
    for i in idx:
        if np.linalg.norm(centroids[i]-image_dimension/2.)<50:  #threshold again, only for ones near the center
            print("green detected")
            msg.twist.angular.z=-10
            pub.publish(msg)
            return

    # 3) filter on BLUE component
    image_blue = cv2.inRange(image, np.array([200,5,5]),np.array([255,200,200]))
    #run color connected components to filter the counts and centroid
    retval, labels, stats, centroids = cv2.connectedComponentsWithStats(image_blue)
    idx=np.where(np.logical_and(stats[:,4]>=0.01*image_size, stats[:,4]<=0.5*image_size))[0]    #threshold the components to find the best one
    for i in idx:
        if np.linalg.norm(centroids[i]-image_dimension/2.)<50:  #threshold again, only for ones near the center
            print("blue detected")
            msg.twist.angular.z=10
            pub.publish(msg)
            return


sub=rospy.Subscriber('turtles',turtle_array,callback)
change_sub=rospy.Subscriber('change',Int8,change_callback)
image_sub=rospy.Subscriber("image_raw",Image,image_callback, queue_size = 1,buff_size=2**24)


def update_dict():
	global turtles
	turtle_dict={}						#turtle_dict: names<->turtle object
	print(len(turtles.turtles))
	for i in range(len(turtles.turtles)):
		turtle_dict[turtles.turtles[i].name] = tt.Turtle()
		turtle_dict[turtles.turtles[i].name].shape("turtle")
	return turtle_dict
time.sleep(1)
turtle_dict=update_dict()
def updatepose():           		 #set a new pose for turtlebot
	global turtle_dict, turtles
	for i in range(len(turtles.turtles)):
		if turtles.turtles[i].color=="None":
			turtle_dict[turtles.turtles[i].name].penup()
		else:
			turtle_dict[turtles.turtles[i].name].pendown()
			turtle_dict[turtles.turtles[i].name].pencolor(turtles.turtles[i].color)
		turtle_dict[turtles.turtles[i].name].setpos(turtles.turtles[i].turtle_pose.position.x,turtles.turtles[i].turtle_pose.position.y)
		turtle_dict[turtles.turtles[i].name].seth(turtles.turtles[i].turtle_pose.orientation.z)

while not rospy.is_shutdown():
	global change
	try:
		if change==1:
			screen.clearscreen()
			turtle_dict=update_dict()
			screen.bgcolor("lightblue")
			change=0
		updatepose()							#updatepose based on location of each turtle
		time.sleep(0.01)
	except KeyError:
		continue
	except IndexError:
		continue
	except:
		#remove my turtle
		rospy.wait_for_service('removeturtle')
		remove_turtle=rospy.ServiceProxy('removeturtle',removeturtle)
		ret=remove_turtle(my_turtlename)

		traceback.print_exc()
		break


