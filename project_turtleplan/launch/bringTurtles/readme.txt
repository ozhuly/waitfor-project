bring turtles up with:
$roslaunch project_turtleplan bring_main.launch

publish simple goal to robot1 with
$rostopic pub /robot1/move_base_simple/goal geometry_msgs/PoseStamped '{header: {stamp: now, frame_id: "robot1_tf/map"}, pose: {position: {x: 0. y: 0.5, z: 0.0}, orientation: {w: 1.0}}}'

