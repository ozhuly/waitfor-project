# rosplan-waitfor-project
open terminal and source devel/setup.bash
than type: 'roslaunch project_turtleplan turtleplan.launch' to launch simulation
open two differnt terminals and also source devel/setup.bash
on one of the two terminals run: bash ready_plan_combined.bash
than after it finishes run on each terminal: 'bash run_plan.bash robot_number' where robot number is 1 and 2 to run the plan on each robot

see what happens on the simulation :)

# turtlebot_detector
in the folder turtlebot_detecor there is a py file called create_demo.py, this file reads the video file called turtlebot_vid_for_demo.mp4 and creates the video turtlebot_detector_demo where the detector marked the detected turtlebots. the weights file of the model is turtlebot_detector.pt