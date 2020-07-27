import time
import turtle
import sys
import traceback
import numpy as np
import cv2
from RobotRaconteur.Client import *     #import RR client library

#initialize global variables
my_turtle=None
turtle_display_list=[]
#initialize display
screen = turtle.Screen()
screen.bgcolor("lightblue")
def update(obj,turtle_list):                    #set a new pose for turtlebot
    global turtle_display_list, my_turtle

    if obj.turtle_change==True:
        #clear turtle_display_list
        turtle_display_list=[]
        #clear screen
        screen.clearscreen()
        screen.bgcolor("lightblue")
        obj.turtle_change=False
        #update turtles on screen
        for i in range(len(turtle_list)):
            turtle_display_list.append(turtle.Turtle())
            turtle_display_list[i].shape("turtle")
            #update index
            if (turtle_list[i].name==my_turtle.name):
                my_turtle.index=turtle_list[i].index

    #update turtles pose in display
    for i in range(len(turtle_list)):
        if turtle_list[i].color=="None":
            turtle_display_list[i].penup()
        else:
            turtle_display_list[i].pendown()
            turtle_display_list[i].pencolor(turtle_list[i].color)
        turtle_display_list[i].setpos(turtle_list[i].turtle_pose.x,turtle_list[i].turtle_pose.y)
        turtle_display_list[i].seth(turtle_list[i].turtle_pose.angle)

def WebcamImageToMat(image):
    frame2=image.data.reshape([image.height, image.width, 3], order='C')
    return frame2

url1='rr+tcp://localhost:22222/?service=Turtlebot_Service'
url2='rr+tcp://localhost:2355/?service=Webcam'
#take url from command line
if (len(sys.argv)>=2):
    url1=sys.argv[1]
    url2=sys.argv[2]
turtle_sub=RRN.SubscribeService(url1)
cam_sub=RRN.SubscribeService(url2)

while True:
    try:
        turtle_obj = turtle_sub.GetDefaultClient()
        cam_obj=cam_sub.GetDefaultClient()
        turtles_wire=turtle_sub.SubscribeWire("turtles_wire")
        break
    except RR.ConnectionException:
        time.sleep(0.1)

#create RR turtle struct, add my turtle to the turtle list
my_turtle=turtle_obj.add_turtle("turtle_webcam")


print("Running")

while True:
    try:
        #get image
        image=WebcamImageToMat(cam_obj.image)
        image_size=cam_obj.image.width*cam_obj.image.height
        image_dimension=np.array([cam_obj.image.height,cam_obj.image.width])

        update(turtle_obj,turtles_wire.InValue)                            #updatepose based on location of each turtle

        # 1) filter on RED component
        image_red = cv2.inRange(image, np.array([5,5,200]),np.array([200,200,255]))
        #run color connected components to filter the counts and centroid
        retval, labels, stats, centroids = cv2.connectedComponentsWithStats(image_red)
        idx=np.where(np.logical_and(stats[:,4]>=0.01*image_size, stats[:,4]<=0.5*image_size))[0]    #threshold the components to find the best one
        for i in idx:
            if np.linalg.norm(centroids[i]-image_dimension/2.)<50:  #threshold again, only for ones near the center
                print("red detected")
                turtle_obj.drive(my_turtle,10,0)            ####Drive forward
    
        # 2) filter on GREEN component
        image_green = cv2.inRange(image, np.array([5,200,5]),np.array([200,255,200]))
        #run color connected components to filter the counts and centroid
        retval, labels, stats, centroids = cv2.connectedComponentsWithStats(image_green)
        idx=np.where(np.logical_and(stats[:,4]>=0.01*image_size, stats[:,4]<=0.5*image_size))[0]    #threshold the components to find the best one
        for i in idx:
            if np.linalg.norm(centroids[i]-image_dimension/2.)<50:  #threshold again, only for ones near the center
                print("green detected")
                turtle_obj.drive(my_turtle,0,-10)            ####Drive forward
    
        # 3) filter on BLUE component
        image_blue = cv2.inRange(image, np.array([200,5,5]),np.array([255,200,200]))
        #run color connected components to filter the counts and centroid
        retval, labels, stats, centroids = cv2.connectedComponentsWithStats(image_blue)
        idx=np.where(np.logical_and(stats[:,4]>=0.01*image_size, stats[:,4]<=0.5*image_size))[0]    #threshold the components to find the best one
        for i in idx:
            if np.linalg.norm(centroids[i]-image_dimension/2.)<50:  #threshold again, only for ones near the center
                print("blue detected")
                turtle_obj.drive(my_turtle,0,10)            ####Drive forward    

        

    except RR.ConnectionException:
        continue
    except RR.ValueNotSetException:
        continue
    except:
        traceback.print_exc()
        turtle_obj.remove_turtle(my_turtle)
        break
