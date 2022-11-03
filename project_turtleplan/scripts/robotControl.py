#!/usr/bin/env python

import sys
import roslib
import rospy

# Brings in the SimpleActionClient
import actionlib

from move_base_msgs.msg import *

def simple_move_client(x_pos = 0.0, y_pos = 0.0, robot = ''):
    rospy.init_node(robot + 'simple_move')
    # initiate client varaiable
    print 'wait for movebase node: ', robot + '/move_base'
    client = actionlib.SimpleActionClient(robot + '/move_base', MoveBaseAction)
    print 'client is online !'
    # initiate goal varaiable
    goal = MoveBaseGoal()
    # set goal
    goal.target_pose.pose.position.x = x_pos
    goal.target_pose.pose.position.y = y_pos
    goal.target_pose.pose.orientation.w = 1.0
    goal.target_pose.header.frame_id = 'robot1_tf/map'
    goal.target_pose.header.stamp = rospy.Time.now()
    # Waits until the action server is online
    client.wait_for_server()
    # send goal to client
    client.send_goal(goal)
    # wait for result
    client.wait_for_result()
    # print result
    print client.get_result()
    print 'DONEEE'


if __name__ == '__main__':
    print 'this is main command !!'
    try:
        simple_move_client(0.5, 0.5, 'robot1')
    except rospy.ROSInterruptException:
        print "Keyboard Interrupt"
