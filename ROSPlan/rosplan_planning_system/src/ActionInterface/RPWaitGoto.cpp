#include "rosplan_action_interface/RPWaitGoto.h"

/* The implementation of RPWaitGoto.h */
namespace KCL_rosplan {

	/* constructor */
	RPWaitGoto::RPWaitGoto(ros::NodeHandle &nh) {
		// perform setup
	}

	/* action dispatch callback */
	bool RPWaitGoto::concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg) {

		// The action implementation goes here.
		/*bool flag = true;
		while(flag) {		
			flag = false
			std::vector<std::string>::iterator nit = predicates.begin();
			for(; nit!=predicates.end(); nit++) {
				if (*nit == "=" || *nit == ">" || *nit == "<" || *nit == ">=" || *nit == "<=") continue;
				if (!nit.second) { 
					flag = true;	
				}	
			}
			std::vector<std::string>::iterator nit = sensed_predicates.begin();
			for(; nit!=sensed_predicates.end(); nit++) {
				if (*nit == "=" || *nit == ">" || *nit == "<" || *nit == ">=" || *nit == "<=") continue;
				if (!nit.second) { 
					flag = true;
				}	
			}
			if (flag) ROS_INFO("KCL: (%s) waiting for goto_waypoint.", msg->name.c_str());
		}*/
		// complete the action
		ROS_INFO("KCL: (%s) waiting for goto ended.", msg->name.c_str());
		return true;
	}
} // close namespace

	/*-------------*/
	/* Main method */
	/*-------------*/

	int main(int argc, char **argv) {

		ros::init(argc, argv, "rosplan_wait_action", ros::init_options::AnonymousName);
		ros::NodeHandle nh("~");

		// create PDDL action subscriber
		KCL_rosplan::RPWaitGoto rpti(nh);

		rpti.runActionInterface();

		return 0;
	}
