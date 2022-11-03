(define (problem turtle-prob-01)
	
  (:domain turtle-domain)

  (:objects
    turtle1 turtle2 turtle3 - turtle
    doc1 doc2 doc3 - position
    route1 route2 route3 route4 route5 route6 - position
    pos1 pos2 pos3 pos4 pos5 - position)

  (:init
    (at turtle1 doc1) (at turtle2 doc2) (at turtle3 doc3)
    (clear route1) (clear route2) (clear route3) 
    (clear route4) (clear route5) (clear route6)
    (clear pos1) (clear pos2) (clear pos3)
    (clear pos4) (clear pos5)
  	(connected doc1 route1) (connected route1 doc1)
    (connected doc2 route1) (connected route1 doc2)
    (connected doc3 route1) (connected route1 doc3)
    (connected route1 pos1) (connected pos1 route1)
    (connected pos1 route2) (connected route2 pos1)
    (connected route2 route3) (connected route3 route2)
    (connected route3 pos2) (connected pos2 route3)
    (connected pos2 route4) (connected route4 pos2)
    (connected route4 pos3) (connected pos3 route4)
    (connected route2 route5) (connected route5 route2)
    (connected route5 pos4) (connected pos4 route5)
    (connected pos4 route6) (connected route6  pos4)
    (connected route6 pos5) (connected pos5 route6))

  (:goal
  	(and
      (at turtle1 doc1)
      (at turtle2 doc2)
      (at turtle3 doc3)
      (visited pos5) (visited pos3))))