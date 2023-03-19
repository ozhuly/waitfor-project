#!/bin/bash

echo "reading waypoints"
# load waypoints into parameter server
rosparam load `rospack find project_turtleplan`/config/waypoints.yaml;

./ready_plan.bash 1
./ready_plan.bash 2

param_type="update_type:"
param="knowledge:"
for i in $(seq 3 $(( $(rosservice call /rosplan_knowledge_base/state/instances "type_name: 'waypoint'" | sed 's/wp/\n/g' | wc -l))) )
do
param_type="$param_type
- 0";
param="$param
- knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'free'
  values:
  - {key: 'wp', value: 'wp$i'}
  function_value: 0.0"
done;


rosservice call /rosplan_knowledge_base/update_array "
$param_type
$param"

# NOTE: robot_at(kenny wp0) gets added by the mapping interface


