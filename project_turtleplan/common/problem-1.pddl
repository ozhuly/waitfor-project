(define (problem task)
(:domain turtlebot_demo_oz)
(:objects
    wp0 wp1 - waypoint
    kenny - robot
)
(:init
    (robot_at kenny wp0)

    (connected wp0 wp0)
    (connected wp1 wp0)
    (connected wp0 wp1)
    (connected wp1 wp1)



    (= (distance wp0 wp0) 0)
    (= (distance wp1 wp0) 1)
    (= (distance wp0 wp1) 1)
    (= (distance wp1 wp1) 0)

)
(:goal (and
    (visited kenny wp1)
    (robot_at kenny wp0)
    (visited wp1)
))
)
