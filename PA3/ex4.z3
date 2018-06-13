(set-option :produce-models true)

(declare-datatypes () ((Plant apple banana cherry rose tulip lily onion carrot pepper)))
(declare-datatypes () ((Garden garden1 garden2 garden3 garden4)))

(declare-fun Fruit (Plant) Bool)
(declare-fun Flower (Plant) Bool)
(declare-fun Vegetable (Plant) Bool)

(declare-fun GrowsIn (Plant Garden) Bool)


(assert (forall ((x Plant)) (= (Fruit x) (or (= x apple) (= x banana) (= x cherry)))))
(assert (forall ((x Plant)) (= (Flower x) (or (= x rose) (= x tulip) (= x lily)))))
(assert (forall ((x Plant)) (= (Vegetable x) (or (= x onion) (= x carrot) (= x pepper)))))


;; TODO: constraint 1
(assert (forall ((x Plant)) (or (Fruit x) (Flower x) (Vegetable x) )))

;; TODO: constraint 2
(assert (forall ((x Garden)) 
				(exists ((x1 Plant) (x2 Plant) (x3 Plant)) 
						(and (GrowsIn x1 x) 
							 (GrowsIn x2 x) 
							 (GrowsIn x3 x)
							 (not (= x1 x2))
							 (not (= x1 x3))
							 (not (= x2 x3)) 
							 (forall ((y Plant)) 
							 		 (=> (GrowsIn y x) (or (= y x1) (= y x2) (= y x3)))
							 )))))

;; TODO: constraint 3
(assert (forall ((x Plant)) 
				(exists ((y Garden)) (GrowsIn x y))
		))

;; TODO: constraint 4
(assert (exists ((x1 Plant) (x2 Plant) (x3 Plant) (g Garden)) 
				 (and (Fruit x1)
				 	  (Fruit x2)
				 	  (Fruit x3)
				 	  (GrowsIn x1 g)
				 	  (GrowsIn x2 g)
				 	  (GrowsIn x3 g)
				 	  (not (= x1 x2))
				 	  (not (= x1 x3))
				 	  (not (= x2 x3))
				 	  (forall ((z Garden)) (=> (and (GrowsIn x1 z)
				 	  				 	  	   		(GrowsIn x2 z)
				 	  				 	  	   		(GrowsIn x3 z))
				 	  				 	  	   (= z g))
				 	  )
		)))

;; TODO: constraint 5
;(assert (forall ((x Plant)) 
;				(and (Flower x) 
;					 (exists ((y Garden)) (and (GrowsIn x y)
;					 						   (forall ((z Garden)) (=> (GrowsIn x z) (= z y)))
;					 					  )
;					  ))))

(assert (exists ((x1 Garden) (x2 Garden) (y Plant)) 
				(and (distinct x1 x2) 
					 (Vegetable y) 
					 (GrowsIn y x1)
					 (GrowsIn y x2)
					 (forall ((z Plant)) (=> (and (Vegetable z) (GrowsIn z x1) (GrowsIn z x1)) (= z y)))
				)))
(assert (exists ((p1 Plant)) 
				(and (Fruit p1)
					 (exists ((g Garden)) 
					 		 (and (GrowsIn p1 g) 
					 		 (forall ((z Garden)) (=> (GrowsIn p1 z) (= z g)))
					 		 )
					 )
					 (forall ((p2 Plant))
					 		 (=> (and (Fruit p2)
					 		 	  	  (exists ((g1 Garden)) 
					 		 				  (and (GrowsIn p2 g1) 
					 		 				  	   (forall ((z Garden)) (=> (GrowsIn p2 z) (= z g1)))
					 		 	 		  	  ))
					 		 	  ) 
					 		 	 (= p2 p1)
					 		  )
					 )
				)
				))


;; TODO: constraint 6
(assert (not (exists ((x Garden)) (and (GrowsIn carrot x) (GrowsIn rose x)))))
;
;; TODO: constraint 7
(assert (forall ((x Garden)) 
				(=> (GrowsIn tulip x) 
				    (exists ((y Plant)) 
				    		(and (Flower y) (GrowsIn y x) (not (= y tulip)))))))

;; TODO: constraint 8
(assert (exists ((f Plant) (v Plant) (l Plant)) 
				(and (GrowsIn f garden1) (GrowsIn v garden1) (GrowsIn l garden1) (Fruit f) (Vegetable v) (Flower l)) ))

;; TODO: constraint 9
(assert (forall ((x Plant)) 
				(=> (Flower x)
					 (not (GrowsIn x garden2)))))

;; TODO: constraint 10
(assert (GrowsIn carrot garden1))
(assert (GrowsIn carrot garden4))
(assert (GrowsIn banana garden3))

;; TODO: statements (a-c) to prove
(assert (GrowsIn lily garden1))
(assert (exists ((x Plant))
				(and (Fruit x) (GrowsIn x garden2) 
								   (GrowsIn x garden3)
								   (forall ((y Plant)) 
								   		   (=> (and (Fruit y) (GrowsIn y garden2) (GrowsIn y garden3))
								   		   	   (= y x)
								   		   ))) ))
(assert (exists ((x Garden)) (and (GrowsIn tulip x) (GrowsIn rose x))))



;; check and print model
(check-sat)

(echo "garden1:")
(get-value ((GrowsIn apple garden1) (GrowsIn banana garden1) (GrowsIn cherry garden1) (GrowsIn rose garden1) (GrowsIn tulip garden1) (GrowsIn lily garden1) (GrowsIn onion garden1) (GrowsIn carrot garden1) (GrowsIn pepper garden1)))

(echo "garden2:")
(get-value ((GrowsIn apple garden2) (GrowsIn banana garden2) (GrowsIn cherry garden2) (GrowsIn rose garden2) (GrowsIn tulip garden2) (GrowsIn lily garden2) (GrowsIn onion garden2) (GrowsIn carrot garden2) (GrowsIn pepper garden2)))

(echo "garden3:")
(get-value ((GrowsIn apple garden3) (GrowsIn banana garden3) (GrowsIn cherry garden3) (GrowsIn rose garden3) (GrowsIn tulip garden3) (GrowsIn lily garden3) (GrowsIn onion garden3) (GrowsIn carrot garden3) (GrowsIn pepper garden3)))

(echo "garden4:")
(get-value ((GrowsIn apple garden4) (GrowsIn banana garden4) (GrowsIn cherry garden4) (GrowsIn rose garden4) (GrowsIn tulip garden4) (GrowsIn lily garden4) (GrowsIn onion garden4) (GrowsIn carrot garden4) (GrowsIn pepper garden4)))
(echo "")
