
;; TODO: model exercise 3 here

(declare-fun P (Int Int) Bool)
(declare-fun Q (Int Int) Bool)
(declare-fun R (Int Int) Bool)

; assert statement 1
(assert (forall ((x Int)) (exists ((y Int)) (P x y))))

; assert statement 2
(assert (forall ((x Int)) (exists ((y Int)) (Q x y))))

; assert statement 3
(assert (forall ((x Int) (y Int) (z Int)) 
		(=> (or (P x y) (Q x y)) 
			(=> (or (P y z) (Q y z))
				 (R x z)))))

; assert negation of the clause we want to derive
(assert (not (forall ((x Int)) (exists ((y Int)) (R x y)))))

; Should get unsat if derived clause holds for all interpretations
(check-sat)