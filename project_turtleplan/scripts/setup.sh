#!/bin/bash
# TODO:
# v add 3 robots: robot1, robot2 ...
# v add all waypoints
# v add predicates to describe the connected waypoints
# v add predicates to describe 'robot at' facts
# v add predicates to describe 'free' facts
# - add goals 'visited b2' 'at c1' to robot1
#

# add robot1 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'robot'
  instance_name: 'robot1'
  attribute_name: ''
  function_value: 0.0";

# add robot2 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'robot'
  instance_name: 'robot2'
  attribute_name: ''
  function_value: 0.0";

# add robot3 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'robot'
  instance_name: 'robot3'
  attribute_name: ''
  function_value: 0.0";

# add a1 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'waypoint'
  instance_name: 'a1'
  attribute_name: ''
  function_value: 0.0";

# add a2 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'waypoint'
  instance_name: 'a2'
  attribute_name: ''
  function_value: 0.0";

# add a3 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'waypoint'
  instance_name: 'a3'
  attribute_name: ''
  function_value: 0.0";

# add b1 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'waypoint'
  instance_name: 'b1'
  attribute_name: ''
  function_value: 0.0";

# add b2 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'waypoint'
  instance_name: 'b2'
  attribute_name: ''
  function_value: 0.0";

# add b3 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'waypoint'
  instance_name: 'b3'
  attribute_name: ''
  function_value: 0.0";

# add c1 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'waypoint'
  instance_name: 'c1'
  attribute_name: ''
  function_value: 0.0";

# add c2 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'waypoint'
  instance_name: 'c2'
  attribute_name: ''
  function_value: 0.0";

# add c3 as an object
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 0
  instance_type: 'waypoint'
  instance_name: 'c3'
  attribute_name: ''
  function_value: 0.0";

# add fact : a1 a2 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'a1'}
  - {key: 'to', value: 'a2'}
  function_value: 0.0";

# add fact : a1 b1 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'a1'}
  - {key: 'to', value: 'b1'}
  function_value: 0.0";

# add fact : a2 a1 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'a2'}
  - {key: 'to', value: 'a1'}
  function_value: 0.0";

# add fact : a2 a3 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'a2'}
  - {key: 'to', value: 'a3'}
  function_value: 0.0";

# add fact : a3 a2 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'a3'}
  - {key: 'to', value: 'a2'}
  function_value: 0.0";

# add fact : a3 b3 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'a3'}
  - {key: 'to', value: 'b3'}
  function_value: 0.0";

# add fact : b1 a1 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'b1'}
  - {key: 'to', value: 'a1'}
  function_value: 0.0";

# add fact : b1 b2 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'b1'}
  - {key: 'to', value: 'b2'}
  function_value: 0.0";

# add fact : b1 c1 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'b1'}
  - {key: 'to', value: 'c1'}
  function_value: 0.0";

# add fact : b2 b1 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'b2'}
  - {key: 'to', value: 'b1'}
  function_value: 0.0";

# add fact : b2 b3 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'b2'}
  - {key: 'to', value: 'b3'}
  function_value: 0.0";

# add fact : b3 a3 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'b3'}
  - {key: 'to', value: 'a3'}
  function_value: 0.0";

# add fact : b3 b2 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'b3'}
  - {key: 'to', value: 'b2'}
  function_value: 0.0";

# add fact : b3 c3 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'b3'}
  - {key: 'to', value: 'c3'}
  function_value: 0.0";

# add fact : c1 b1 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'c1'}
  - {key: 'to', value: 'b1'}
  function_value: 0.0";

# add fact : c1 c2 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'c1'}
  - {key: 'to', value: 'c2'}
  function_value: 0.0";

# add fact : c2 c1 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'c2'}
  - {key: 'to', value: 'c1'}
  function_value: 0.0";

# add fact : c2 c3 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'c2'}
  - {key: 'to', value: 'c3'}
  function_value: 0.0";

# add fact : c3 c2 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'c3'}
  - {key: 'to', value: 'c2'}
  function_value: 0.0";

# add fact : c3 b3 are connected
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'connected'
  values:
  - {key: 'from', value: 'c3'}
  - {key: 'to', value: 'b3'}
  function_value: 0.0";


# add fact (robot_at robot1 a1)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'robot_at'
  values:
  - {key: 'v', value: 'robot1'}
  - {key: 'wp', value: 'a1'}
  function_value: 0.0";

# add fact (robot_at robot2 a2)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'robot_at'
  values:
  - {key: 'v', value: 'robot2'}
  - {key: 'wp', value: 'a2'}
  function_value: 0.0";

# add fact (robot_at robot3 a3)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'robot_at'
  values:
  - {key: 'v', value: 'robot3'}
  - {key: 'wp', value: 'a3'}
  function_value: 0.0";

# add fact (free b1)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'free'
  values:
  - {key: 'wp', value: 'b1'}
  function_value: 0.0";

# add fact (free b2)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'free'
  values:
  - {key: 'wp', value: 'b2'}
  function_value: 0.0";
# add fact (free b3)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'free'
  values:
  - {key: 'wp', value: 'b3'}
  function_value: 0.0";
# add fact (free c1)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'free'
  values:
  - {key: 'wp', value: 'c1'}
  function_value: 0.0";
# add fact (free c2)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'free'
  values:
  - {key: 'wp', value: 'c2'}
  function_value: 0.0";

# add fact (free c3)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 0
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'free'
  values:
  - {key: 'wp', value: 'c3'}
  function_value: 0.0";

# add goal (robot_at robot1 c1)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 1
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'robot_at'
  values:
  - {key: 'v', value: 'robot1'}
  - {key: 'wp', value: 'c1'}
  function_value: 0.0";

# add goal (robot_at robot2 c2)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 1
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'robot_at'
  values:
  - {key: 'v', value: 'robot2'}
  - {key: 'wp', value: 'c2'}
  function_value: 0.0";

# add goal (robot_at robot3 c3)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 1
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'robot_at'
  values:
  - {key: 'v', value: 'robot3'}
  - {key: 'wp', value: 'c3'}
  function_value: 0.0";


# add goal (visited robot1 b2)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 1
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'visited'
  values:
  - {key: 'v', value: 'robot1'}
  - {key: 'wp', value: 'b2'}
  function_value: 0.0";

# add goal (visited robot2 b2)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 1
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'visited'
  values:
  - {key: 'v', value: 'robot2'}
  - {key: 'wp', value: 'b2'}
  function_value: 0.0";

# add goal (visited robot3 b2)
rosservice call /kcl_rosplan/update_knowledge_base "update_type: 1
knowledge:
  knowledge_type: 1
  instance_type: ''
  instance_name: ''
  attribute_name: 'visited'
  values:
  - {key: 'v', value: 'robot3'}
  - {key: 'wp', value: 'b2'}
  function_value: 0.0";
