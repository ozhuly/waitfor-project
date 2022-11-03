#!/usr/bin/env python

import rospy
from std_msgs.msg import Empty
from rosplan_dispatch_msgs.msg import *
from rosplan_knowledge_msgs.srv import *
from diagnostic_msgs.msg import KeyValue
from move_base_msgs.msg import *
import actionlib

waypoints = {'wp1': [-0.5  , -0.5],   'wp2': [0.5  , -1.5], 'wp3': [0.5 , -0.5],
             'wp4': [1.5, -0.5], 'wp5': [0.5, 0.5], 'wp6': [1, -1],
			 'c1': [7  , 0],   'c2': [7  , -2], 'c3': [7  , -4]}

def callback(msg):
	print '***************************************************************callback initiate\n', '\n'*5
	# initiate action feedback variable
	feedBack = rosplan_dispatch_msgs.msg.ActionFeedback()
	print(feedBack)
	# grab the action name
	feedBack.action_id = msg.action_id
	feedBack.status = 1
	# initial action feedback update
	action_feedback_pub.publish(feedBack)
	# start move_to command
	if msg.name == 'goto_waypoint':
		for p in msg.parameters:
			print 'the p key is: ', p.key
			print 'the p value is: ', p.value
			if p.key == 'v':
				pass
				#robot = p.value
			elif p.key == 'from':
				from_wp = p.value
			elif p.key == 'to':
				to_wp = p.value
		[x_cord, y_cord] = waypoints[to_wp]
		print 'x_cord, y_cord are: ', x_cord, y_cord

		# remove free from to_wp
		free_remove = rosplan_knowledge_msgs.msg.KnowledgeItem()
		free_remove.knowledge_type = rosplan_knowledge_msgs.msg.KnowledgeItem.FACT
		free_remove.attribute_name = "free"
		free_remove.values.append(diagnostic_msgs.msg.KeyValue("wp", to_wp))
		update_kb(KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE, free_remove)

		# start move client
		result = simple_move_client(x_cord, y_cord, robot)
		# robotControl.robotMoveTo(from_wp, to_wp, robot)

		# remove robot_at from kb
		robot_at_remove = rosplan_knowledge_msgs.msg.KnowledgeItem()
		robot_at_remove.knowledge_type = rosplan_knowledge_msgs.msg.KnowledgeItem.FACT
		robot_at_remove.attribute_name = "robot_at"
		robot_at_remove.values.append(diagnostic_msgs.msg.KeyValue("r", "kenny" + robot_num))
		robot_at_remove.values.append(diagnostic_msgs.msg.KeyValue("wp", from_wp))
		update_kb(KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE, robot_at_remove)

		# adds robot_at to kb
		robot_at_add = rosplan_knowledge_msgs.msg.KnowledgeItem()
		robot_at_add.knowledge_type = rosplan_knowledge_msgs.msg.KnowledgeItem.FACT
		robot_at_add.attribute_name = "robot_at"
		robot_at_add.values.append(diagnostic_msgs.msg.KeyValue("r", "kenny" + robot_num))
		robot_at_add.values.append(diagnostic_msgs.msg.KeyValue("wp", to_wp))
		update_kb(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE, robot_at_add)

		# adds free to from_wp
		free_add = rosplan_knowledge_msgs.msg.KnowledgeItem()
		free_add.knowledge_type = rosplan_knowledge_msgs.msg.KnowledgeItem.FACT
		free_add.attribute_name = "free"
		free_add.values.append(diagnostic_msgs.msg.KeyValue("wp", from_wp))
		update_kb(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE, free_add)


		print '\n'*3
	# update and publish feedback variable
	feedBack = rosplan_dispatch_msgs.msg.ActionFeedback()
	feedBack.action_id = msg.action_id
	feedBack.status = 2
	action_feedback_pub.publish(feedBack)
	print result
	return result

def simple_move_client(x_pos = 0.0, y_pos = 0.0, robot = ''):
	print 'client initiate...'
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
	goal.target_pose.header.frame_id = robot + '_tf/map'
	goal.target_pose.header.stamp = rospy.Time.now()
	# Waits until the action server is online
	client.wait_for_server()
	print 'action server is online !'
	# send goal to client
	client.send_goal(goal)
	# wait for result
	client.wait_for_result()
	# print result
	result = client.get_result()
	print 'result:', result
	print 'DONE'
	return True

robot = sys.argv[1]
robot_num = robot[-1]
# initiate node
rospy.init_node(robot + "_turtle_rosplan_interface")
# publish action feedback to /kcl_rosplan/action_feedback topic
action_feedback_pub = rospy.Publisher('/' + robot + '/rosplan_plan_dispatcher/action_feedback', rosplan_dispatch_msgs.msg.ActionFeedback, queue_size=10)
print("*****here1*******")
rospy.wait_for_service('/rosplan_knowledge_base/update')
# call to service /update_knowledge_base
update_kb = rospy.ServiceProxy('/rosplan_knowledge_base/update', rosplan_knowledge_msgs.srv.KnowledgeUpdateService)
print("*****here2*******", robot)
# subscribe to action_dispatch server
rospy.Subscriber('/' + robot + '/rosplan_plan_dispatcher/action_dispatch', rosplan_dispatch_msgs.msg.ActionDispatch, callback)
# loop over ...
rospy.spin()
