
;; TODO: model exercise 3 here

(declare-fun P (Int Int) Bool)
(declare-fun Q (Int Int) Bool)
(declare-fun R (Int Int) Bool)

(assert (forall ((x Int)) (exists ((y Int)) (P x y))))
(assert (forall ((x Int)) (exists ((y Int)) (Q x y))))

(assert (forall ((x Int)) (exists ((y Int)) (R x y))))

(assert (forall ((x Int) (y Int) (z Int)) 
		(=> (or (P x y) (Q x y)) 
			(=> (or (P y z) (Q y z))
				 (R x z)))))
(check-sat)