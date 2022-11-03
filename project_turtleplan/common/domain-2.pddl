(define (domain turtlebot_demo_oz)

(:requirements 
	:strips :typing :fluents 
	:disjunctive-preconditions :durative-actions)


(:types
	waypoint 
	robot
)

(:predicates
	(robot_at ?v - robot ?wp - waypoint)
	(connected ?from ?to - waypoint)
	(visited ?v - robot ?wp - waypoint)
	(free ?wp - waypoint)
)

(:functions
	(distance ?wp1 ?wp2 - waypoint) 
)

;; Move between any two waypoints, avoiding terrain
(:durative-action goto_waypoint
	:parameters (?v - robot ?from ?to - waypoint)
	:duration ( = ?duration 10)
	:condition (and
		(at start (robot_at ?v ?from))
		(at start (free ?to))
		(at start (connected ?from ?to))
		)
	:effect (and
		(at start (not (robot_at ?v ?from)))
		(at end (visited ?v ?to))
		(at end (robot_at ?v ?to))
		)
)
)
