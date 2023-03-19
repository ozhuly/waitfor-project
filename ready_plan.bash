#!/bin/bash

echo "loading waypoints robot$1"
# let RoadmapServer know that wps are available in param server
rosservice call /robot$1/rosplan_roadmap_server/load_waypoints;

# add robot kenny instance + goals: visit all waypoint instances
echo "Adding initial state and goals to knowledge base.";
param_type="update_type:
- 0";
param="knowledge:
- knowledge_type: 0
  instance_type: 'robot'
  instance_name: 'kenny$1'
  attribute_name: ''
  function_value: 0.0";
param_type="$param_type
- 0";
param="$param
- knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'robot_at'
  values:
  - {key: 'r', value: 'kenny$1'}
  - {key: 'wp', value: 'wp$1'}
  function_value: 0.0";


rosservice call /rosplan_knowledge_base/update_array "
$param_type
$param"

# NOTE: robot_at(kenny wp0) gets added by the mapping interface

