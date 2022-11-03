(define (domain turtle-domain)
	
	(:requirements :typing :durative-actions)
	
	(:types turtle position)
	
	(:predicates 
		(at ?t - turtle ?p - position)
		(clear ?p - position)
		(connected ?p1 ?p2 - position)
		(visited ?p - position))
    
	
	(:durative-action go_to
  		:parameters (?t - turtle ?p1 ?p2 - position)
  		:duration (= ?duration 1)
  		:condition 
  			(and
  				(at start (clear ?p2))
  				(at start (at ?t ?p1))
  				(over all (connected ?p1 ?p2)))
  		:effect 
  			(and
  				(at start (not (clear ?p2)))
  				(at start (not (at ?t ?p1)))
  				(at end (clear ?p1))
  				(at end (at ?t ?p2))
  				(at end (visited ?p2)))


	(:durative-action wait_goto
		:parameters (?t - turtle ?p1 ?p2 - position)
		:duration ( = ?duration 10)
		:condition (and
			(at start (at ?t ?p1))
		:effect (and
			(at end (at ?t ?p1)))
			(at end (clear ?p2))
			(at end (connected ?p1 ?p2))
)
)

