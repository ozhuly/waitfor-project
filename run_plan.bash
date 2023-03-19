#!/bin/bash

echo "Executing the Plan for robot$1"
rosservice call /robot$1/rosplan_parsing_interface/parse_plan_from_file ~/ros_kinetic/ropslan/src/project_turtleplan/common/readyplan$1.pddl
rosservice call /robot$1/rosplan_plan_dispatcher/dispatch_plan
