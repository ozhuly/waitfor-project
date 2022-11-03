(define (problem turtlebot_demo_task)

(:domain turtlebot_demo_oz)

(:objects
    kenny - robot
    wp0 wp1 - waypoint
)
(:init
    (connected wp0 wp1)
    (connected wp1 wp0)
)

(:goal (and
    (visited kenny wp1)
    (robot_at kenny wp0)      
)))
