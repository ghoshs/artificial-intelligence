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
; all planrs are either a fruit, or a flower or a vegetable
(assert (forall ((x Plant)) (or (Fruit x) (Flower x) (Vegetable x) )))

;; TODO: constraint 2
; For all gardens there exist 3 plants that grow in it such that they are distinct 
(assert (forall ((x Garden)) 
				(exists ((x1 Plant) (x2 Plant) (x3 Plant)) 
						(and (GrowsIn x1 x) 
							 (GrowsIn x2 x) 
							 (GrowsIn x3 x)
							 (distinct x1 x2 x3)
; any other plant growing in the garden should be either x1, x2 or x3
							 (forall ((y Plant)) 
							 		 (=> (GrowsIn y x) (not (distinct y x1 x2 x3)))
							 )
						))))

;; TODO: constraint 3
; every plant grows in atleast one garden
(assert (forall ((x Plant)) 
				(exists ((y Garden)) (GrowsIn x y))
		))

;; TODO: constraint 4
; There exists a garden with 3 plants such that all three plants are distinct fruits
(assert (exists ((x1 Plant) (x2 Plant) (x3 Plant) (g Garden)) 
				 (and (Fruit x1)
				 	  (Fruit x2)
				 	  (Fruit x3)
				 	  (GrowsIn x1 g)
				 	  (GrowsIn x2 g)
				 	  (GrowsIn x3 g)
				 	  (distinct x1 x2 x3)
; for any other garden growing 3 distinct fruits it must same as g
				 	  (forall ((z Garden)) (=> (and (GrowsIn x1 z)
				 	  				 	  	   		(GrowsIn x2 z)
				 	  				 	  	   		(GrowsIn x3 z))
				 	  				 	  	   (= z g))
				 	  )
		)))

;; TODO: constraint 5
; 3 plants grow in >= 2 gardens
;a. exactly one vegetable grows in >=2 gardens
(assert (exists ((x1 Garden) (x2 Garden) (y Plant)) 
				(and (distinct x1 x2) 
					 (Vegetable y) 
					 (GrowsIn y x1)
					 (GrowsIn y x2)
; all vegetables which grow in the 2 distinct garden found above must be same as 'y'
					 (forall ((z Plant)) (=> (and (Vegetable z) (GrowsIn z x1) (GrowsIn z x1)) (= z y)))
				)))

;b. if two fruits grow in exactly one garden then they have to be the same fruits
(assert (exists ((p1 Plant) (p2 Plant) (g1 Garden) (g2 Garden))
				(=> (and (Fruit p1)
					 (Fruit p2)
					 (GrowsIn p1 g1)
					 (GrowsIn p2 g2)
; if p1 grows in garden g1 then any other garden in which p1 grows is same as g1 (exactly 1 garden)
					 (forall ((z Garden)) (=> (GrowsIn p1 z) (= z g1)))
; similarly for p2
					 (forall ((z Garden)) (=> (GrowsIn p2 z) (= z g2)))
					)
; if there are 2 fruits growing in exactly one garden then the fruits are the same
					(not (distinct p1 p2))
				)
		))

;; TODO: constraint 6
; No garden can grow both carrot and roses
(assert (not (exists ((x Garden)) (and (GrowsIn carrot x) (GrowsIn rose x)))))
;
;; TODO: constraint 7
; all gardens which grow tulip also grow another flower which is not tulip
(assert (forall ((x Garden)) 
				(=> (GrowsIn tulip x) 
				    (exists ((y Plant)) 
				    		(and (Flower y) (GrowsIn y x) (distinct y tulip))))))

;; TODO: constraint 8
; There exists 1 fruit, 1 vegetable and 1 flower that grows in garden1 
(assert (exists ((f Plant) (v Plant) (l Plant)) 
				(and (GrowsIn f garden1) (GrowsIn v garden1) (GrowsIn l garden1) (Fruit f) (Vegetable v) (Flower l)) ))

;; TODO: constraint 9
; for all plants which are flowers they do not grow in garden2
(assert (forall ((x Plant)) 
				(=> (Flower x)
					 (not (GrowsIn x garden2)))))

;; TODO: constraint 10
(assert (GrowsIn carrot garden1))
(assert (GrowsIn carrot garden4))
(assert (GrowsIn banana garden3))

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



;; TODO: statements (a-c) to prove
; To prove we should get unsat
; To get a model comment out this section
(assert (or 
; Statement a: Lily doesn't grow in garden1
			(not (GrowsIn lily garden1))
;
; Statement b: If two fruits grow in both garden2 and garden3 then they must be the same  
			(not (exists ((x Plant) (y Plant))
							(=>  (and (Fruit x) 
								 (Fruit y)
								 (GrowsIn x garden2) 
								 (GrowsIn x garden3)
								 (GrowsIn y garden2) 
								 (GrowsIn y garden3)
								 )
								 (not (distinct x y))
							) ))
; Statement c: Tulip and rose grow in the same garden
			(not (exists ((x Garden)) (and (GrowsIn tulip x) (GrowsIn rose x))))
		))
(check-sat)