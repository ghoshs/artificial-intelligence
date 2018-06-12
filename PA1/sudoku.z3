(set-option :produce-models true)
(declare-datatypes () ((Col x0 x1 x2 x3 x4 x5 x6 x7 x8)))
(declare-datatypes () ((Row y0 y1 y2 y3 y4 y5 y6 y7 y8)))
(declare-fun Board (Col Row) Int)


; Fill in the missing constraints into the designated sections


;;;;;; --- BEGIN-CONSTRAINTS-1 --- 

; ** Sudoku constraints **
; TODO constraints for 1.

; Constraint 1a
; columnwise distinct cell values
(assert (distinct (Board x0 y0) (Board x0 y1) (Board x0 y2) (Board x0 y3) (Board x0 y4) (Board x0 y5) (Board x0 y6) (Board x0 y7) (Board x0 y8)))
(assert (distinct (Board x1 y0) (Board x1 y1) (Board x1 y2) (Board x1 y3) (Board x1 y4) (Board x1 y5) (Board x1 y6) (Board x1 y7) (Board x1 y8)))
(assert (distinct (Board x2 y0) (Board x2 y1) (Board x2 y2) (Board x2 y3) (Board x2 y4) (Board x2 y5) (Board x2 y6) (Board x2 y7) (Board x2 y8)))
(assert (distinct (Board x3 y0) (Board x3 y1) (Board x3 y2) (Board x3 y3) (Board x3 y4) (Board x3 y5) (Board x3 y6) (Board x3 y7) (Board x3 y8)))
(assert (distinct (Board x4 y0) (Board x4 y1) (Board x4 y2) (Board x4 y3) (Board x4 y4) (Board x4 y5) (Board x4 y6) (Board x4 y7) (Board x4 y8)))
(assert (distinct (Board x5 y0) (Board x5 y1) (Board x5 y2) (Board x5 y3) (Board x5 y4) (Board x5 y5) (Board x5 y6) (Board x5 y7) (Board x5 y8)))
(assert (distinct (Board x6 y0) (Board x6 y1) (Board x6 y2) (Board x6 y3) (Board x6 y4) (Board x6 y5) (Board x6 y6) (Board x6 y7) (Board x6 y8)))
(assert (distinct (Board x7 y0) (Board x7 y1) (Board x7 y2) (Board x7 y3) (Board x7 y4) (Board x7 y5) (Board x7 y6) (Board x7 y7) (Board x7 y8)))
(assert (distinct (Board x8 y0) (Board x8 y1) (Board x8 y2) (Board x8 y3) (Board x8 y4) (Board x8 y5) (Board x8 y6) (Board x8 y7) (Board x8 y8)))

; rowwise distinct cell values
(assert (distinct (Board x0 y0) (Board x1 y0) (Board x2 y0) (Board x3 y0) (Board x4 y0) (Board x5 y0) (Board x6 y0) (Board x7 y0) (Board x8 y0)))
(assert (distinct (Board x0 y1) (Board x1 y1) (Board x2 y1) (Board x3 y1) (Board x4 y1) (Board x5 y1) (Board x6 y1) (Board x7 y1) (Board x8 y1)))
(assert (distinct (Board x0 y2) (Board x1 y2) (Board x2 y2) (Board x3 y2) (Board x4 y2) (Board x5 y2) (Board x6 y2) (Board x7 y2) (Board x8 y2)))
(assert (distinct (Board x0 y3) (Board x1 y3) (Board x2 y3) (Board x3 y3) (Board x4 y3) (Board x5 y3) (Board x6 y3) (Board x7 y3) (Board x8 y3)))
(assert (distinct (Board x0 y4) (Board x1 y4) (Board x2 y4) (Board x3 y4) (Board x4 y4) (Board x5 y4) (Board x6 y4) (Board x7 y4) (Board x8 y4)))
(assert (distinct (Board x0 y5) (Board x1 y5) (Board x2 y5) (Board x3 y5) (Board x4 y5) (Board x5 y5) (Board x6 y5) (Board x7 y5) (Board x8 y5)))
(assert (distinct (Board x0 y6) (Board x1 y6) (Board x2 y6) (Board x3 y6) (Board x4 y6) (Board x5 y6) (Board x6 y6) (Board x7 y6) (Board x8 y6)))
(assert (distinct (Board x0 y7) (Board x1 y7) (Board x2 y7) (Board x3 y7) (Board x4 y7) (Board x5 y7) (Board x6 y7) (Board x7 y7) (Board x8 y7)))
(assert (distinct (Board x0 y8) (Board x1 y8) (Board x2 y8) (Board x3 y8) (Board x4 y8) (Board x5 y8) (Board x6 y8) (Board x7 y8) (Board x8 y8)))

; 3x3 gridwise distinct cell values
(assert (distinct (Board x0 y0) (Board x0 y1) (Board x0 y2) (Board x1 y0) (Board x1 y1) (Board x1 y2) (Board x2 y0) (Board x2 y1) (Board x2 y2)))
(assert (distinct (Board x0 y3) (Board x0 y4) (Board x0 y5) (Board x1 y3) (Board x1 y4) (Board x1 y5) (Board x2 y3) (Board x2 y4) (Board x2 y5)))
(assert (distinct (Board x0 y6) (Board x0 y7) (Board x0 y8) (Board x1 y6) (Board x1 y7) (Board x1 y8) (Board x2 y6) (Board x2 y7) (Board x2 y8)))
(assert (distinct (Board x3 y0) (Board x3 y1) (Board x3 y2) (Board x4 y0) (Board x4 y1) (Board x4 y2) (Board x5 y0) (Board x5 y1) (Board x5 y2)))
(assert (distinct (Board x3 y3) (Board x3 y4) (Board x3 y5) (Board x4 y3) (Board x4 y4) (Board x4 y5) (Board x5 y3) (Board x5 y4) (Board x5 y5)))
(assert (distinct (Board x3 y6) (Board x3 y7) (Board x3 y8) (Board x4 y6) (Board x4 y7) (Board x4 y8) (Board x5 y6) (Board x5 y7) (Board x5 y8)))
(assert (distinct (Board x6 y0) (Board x6 y1) (Board x6 y2) (Board x7 y0) (Board x7 y1) (Board x7 y2) (Board x8 y0) (Board x8 y1) (Board x8 y2)))
(assert (distinct (Board x6 y3) (Board x6 y4) (Board x6 y5) (Board x7 y3) (Board x7 y4) (Board x7 y5) (Board x8 y3) (Board x8 y4) (Board x8 y5)))
(assert (distinct (Board x6 y6) (Board x6 y7) (Board x6 y8) (Board x7 y6) (Board x7 y7) (Board x7 y8) (Board x8 y6) (Board x8 y7) (Board x8 y8)))

; Constraint 1b
; assert given cell values. There are 11 given cell values
(assert (= (Board x0 y0) 6))
(assert (= (Board x0 y1) 2))
(assert (= (Board x1 y3) 6))
(assert (= (Board x1 y4) 9))
(assert (= (Board x2 y2) 4))
(assert (= (Board x2 y5) 7))
(assert (= (Board x5 y1) 4))
(assert (= (Board x6 y6) 3))
(assert (= (Board x8 y3) 5))
(assert (= (Board x8 y7) 4))
(assert (= (Board x8 y8) 6))

;;;;;; --- END-CONSTRAINTS-1 ---



;;;;;; --- BEGIN-CONSTRAINTS-2 --- 

; ** Constraints for top middle square **
; TODO constraints for 2.

; Constrain 2a
; assert summation value 

(assert (= (+ (Board x3 y0) (Board x3 y1) (Board x3 y2)) 15))

; Constrain 2b
; assert difference of two cell values

(assert (= (- (Board x4 y1) (Board x4 y0)) 2))

; Constrain 2c
; assert product of two cell values

(assert (= (Board x5 y1) (* 2 (Board x5 y2))))

;;;;;; --- END-CONSTRAINTS-2 ---



;;;;;; --- BEGIN-CONSTRAINTS-3 --- 

; ** Constraints for top right square **
; TODO constraints for 3.

; Disjunction of 5 possible scenarios where each scenario is a conjunction of mentioned constraints on the 5 cell values
; (or add one constraint for all the 4 non-yellow cells to be >=5)
(assert 
	(or 
		(and 
			(> (Board x6 y0) 4) 
			(<= (Board x8 y0) 4) 
			(<= (Board x7 y1) 4) 
			(<= (Board x6 y2) 4) 
			(<= (Board x8 y2) 4)
		)
		(and 
			(> (Board x8 y0) 4) 
			(<= (Board x6 y0) 4) 
			(<= (Board x7 y1) 4) 
			(<= (Board x6 y2) 4) 
			(<= (Board x8 y2) 4)
		)
		(and 
			(> (Board x7 y1) 4) 
			(<= (Board x8 y0) 4) 
			(<= (Board x6 y0) 4) 
			(<= (Board x6 y2) 4) 
			(<= (Board x8 y2) 4)
		)
		(and 
			(> (Board x6 y2) 4) 
			(<= (Board x8 y0) 4) 
			(<= (Board x7 y1) 4) 
			(<= (Board x6 y0) 4) 
			(<= (Board x8 y2) 4)
		)
		(and 
			(> (Board x8 y2) 4) 
			(<= (Board x8 y0) 4) 
			(<= (Board x7 y1) 4) 
			(<= (Board x6 y2) 4) 
			(<= (Board x6 y0) 4)
		)
	) 
)

;;;;;; --- END-CONSTRAINTS-3 ---



;;;;;; --- BEGIN-CONSTRAINTS-4 --- 

; ** Constraints for center square **
; TODO constraints for 4.

; assert summation of corner cell values of centre 3x3 grid equal to centre cell of centre grid
(assert (= 
			(+ 
				(Board x3 y3) 
				(Board x5 y3) 
				(Board x3 y5) 
				(Board x5 y5)
			) 
			(* 2 (Board x4 y4))
		))

;;;;;; --- END-CONSTRAINTS-4 ---



;;;;;; --- BEGIN-CONSTRAINTS-5 --- 

; ** Constraints for middle right square **
; TODO constraints for 5.

;3 constraints which assert that all 3 rows of middle right 3x3 grid are ordered in ascending order from left to right 
(assert  
		(and
			(< (Board x6 y3) (Board x7 y3)) 
			(< (Board x7 y3) (Board x8 y3))
		)
)
(assert 
		(and
			(< (Board x6 y4) (Board x7 y4)) 
			(< (Board x7 y4) (Board x8 y4))
		)
)
(assert 	
		(and
			(< (Board x6 y5) (Board x7 y5)) 
			(< (Board x7 y5) (Board x8 y5))
		)
)

;;;;;; --- END-CONSTRAINTS-5 ---



;;;;;; --- BEGIN-CONSTRAINTS-6 --- 

; ** Constraints for bottom left square **
; TODO constraints for 6.

; assert that either one of the adjacent cell is 1 less than the cell where x=1 and y=6
(assert 
			(or
				(= (Board x1 y6) (+ 1 (Board x0 y6)))
				(= (Board x1 y6) (+ 1 (Board x2 y6))) 
			) 
		)
; assert that either one of the adjacent cell is 1 less than the cell where x=1 and y=7
(assert (or
				(= (Board x1 y7) (+ 1 (Board x0 y7)))
				(= (Board x1 y7) (+ 1 (Board x2 y7))) 
			) 
		)
; assert that either one of the adjacent cell is 1 less than the cell where x=1 and y=8
(assert (or
				(= (Board x1 y8) (+ 1 (Board x0 y8)))
				(= (Board x1 y8) (+ 1 (Board x2 y8))) 
			) 
		)


;;;;;; --- END-CONSTRAINTS-6 ---



;;;;;; --- BEGIN-CONSTRAINTS-7 --- 

; ** Constraints for bottom middle square **
; TODO constraints for 7.

; assert disjunction of two scenaios is true
; where, first scenario contrains all orange colored cells to even values and blue colored cells to odd values
; and the 2nd scenario contrains all orange colored cells to odd values and blue colored cells to even values
(assert 

		(or 
			(and 
				(or (= 2 (Board x3 y6)) (= 4 (Board x3 y6)) (= 6 (Board x3 y6)) (= 8 (Board x3 y6))) 
				(or (= 2 (Board x5 y7)) (= 4 (Board x5 y7)) (= 6 (Board x5 y7)) (= 8 (Board x5 y7))) 
				(or (= 2 (Board x4 y8)) (= 4 (Board x4 y8)) (= 6 (Board x4 y8)) (= 8 (Board x4 y8)))

				(or (= 1 (Board x4 y6)) (= 3 (Board x4 y6)) (= 5 (Board x4 y6)) (= 7 (Board x4 y6)) (= 9 (Board x4 y6)))
				(or (= 1 (Board x4 y7)) (= 3 (Board x4 y7)) (= 5 (Board x4 y7)) (= 7 (Board x4 y7)) (= 9 (Board x4 y7)))
				(or (= 1 (Board x3 y8)) (= 3 (Board x3 y8)) (= 5 (Board x3 y8)) (= 7 (Board x3 y8)) (= 9 (Board x3 y8)))
			)
			(and 
				(or (= 1 (Board x3 y6)) (= 3 (Board x3 y6)) (= 5 (Board x3 y6)) (= 7 (Board x3 y6)) (= 9 (Board x3 y6))) 
				(or (= 1 (Board x5 y7)) (= 3 (Board x5 y7)) (= 5 (Board x5 y7)) (= 7 (Board x5 y7)) (= 9 (Board x5 y7))) 
				(or (= 1 (Board x4 y8)) (= 3 (Board x4 y8)) (= 5 (Board x4 y8)) (= 7 (Board x4 y8)) (= 9 (Board x4 y8)))

				(or (= 2 (Board x4 y6)) (= 4 (Board x4 y6)) (= 6 (Board x4 y6)) (= 8 (Board x4 y6)))
				(or (= 2 (Board x4 y7)) (= 4 (Board x4 y7)) (= 6 (Board x4 y7)) (= 8 (Board x4 y7)))
				(or (= 2 (Board x3 y8)) (= 4 (Board x3 y8)) (= 6 (Board x3 y8)) (= 8 (Board x3 y8)))
			)
		)
	
)

;;;;;; --- END-CONSTRAINTS-7 ---



;;;;;; --- BEGIN-CONSTRAINTS-DOMAIN ---

; Each cell may be assigned only to integer values between 1 and 9:

(assert (and (< (Board x0 y0) 10) (> (Board x0 y0) 0)))
(assert (and (< (Board x0 y1) 10) (> (Board x0 y1) 0)))
(assert (and (< (Board x0 y2) 10) (> (Board x0 y2) 0)))
(assert (and (< (Board x0 y3) 10) (> (Board x0 y3) 0)))
(assert (and (< (Board x0 y4) 10) (> (Board x0 y4) 0)))
(assert (and (< (Board x0 y5) 10) (> (Board x0 y5) 0)))
(assert (and (< (Board x0 y6) 10) (> (Board x0 y6) 0)))
(assert (and (< (Board x0 y7) 10) (> (Board x0 y7) 0)))
(assert (and (< (Board x0 y8) 10) (> (Board x0 y8) 0)))
(assert (and (< (Board x1 y0) 10) (> (Board x1 y0) 0)))
(assert (and (< (Board x1 y1) 10) (> (Board x1 y1) 0)))
(assert (and (< (Board x1 y2) 10) (> (Board x1 y2) 0)))
(assert (and (< (Board x1 y3) 10) (> (Board x1 y3) 0)))
(assert (and (< (Board x1 y4) 10) (> (Board x1 y4) 0)))
(assert (and (< (Board x1 y5) 10) (> (Board x1 y5) 0)))
(assert (and (< (Board x1 y6) 10) (> (Board x1 y6) 0)))
(assert (and (< (Board x1 y7) 10) (> (Board x1 y7) 0)))
(assert (and (< (Board x1 y8) 10) (> (Board x1 y8) 0)))
(assert (and (< (Board x2 y0) 10) (> (Board x2 y0) 0)))
(assert (and (< (Board x2 y1) 10) (> (Board x2 y1) 0)))
(assert (and (< (Board x2 y2) 10) (> (Board x2 y2) 0)))
(assert (and (< (Board x2 y3) 10) (> (Board x2 y3) 0)))
(assert (and (< (Board x2 y4) 10) (> (Board x2 y4) 0)))
(assert (and (< (Board x2 y5) 10) (> (Board x2 y5) 0)))
(assert (and (< (Board x2 y6) 10) (> (Board x2 y6) 0)))
(assert (and (< (Board x2 y7) 10) (> (Board x2 y7) 0)))
(assert (and (< (Board x2 y8) 10) (> (Board x2 y8) 0)))
(assert (and (< (Board x3 y0) 10) (> (Board x3 y0) 0)))
(assert (and (< (Board x3 y1) 10) (> (Board x3 y1) 0)))
(assert (and (< (Board x3 y2) 10) (> (Board x3 y2) 0)))
(assert (and (< (Board x3 y3) 10) (> (Board x3 y3) 0)))
(assert (and (< (Board x3 y4) 10) (> (Board x3 y4) 0)))
(assert (and (< (Board x3 y5) 10) (> (Board x3 y5) 0)))
(assert (and (< (Board x3 y6) 10) (> (Board x3 y6) 0)))
(assert (and (< (Board x3 y7) 10) (> (Board x3 y7) 0)))
(assert (and (< (Board x3 y8) 10) (> (Board x3 y8) 0)))
(assert (and (< (Board x4 y0) 10) (> (Board x4 y0) 0)))
(assert (and (< (Board x4 y1) 10) (> (Board x4 y1) 0)))
(assert (and (< (Board x4 y2) 10) (> (Board x4 y2) 0)))
(assert (and (< (Board x4 y3) 10) (> (Board x4 y3) 0)))
(assert (and (< (Board x4 y4) 10) (> (Board x4 y4) 0)))
(assert (and (< (Board x4 y5) 10) (> (Board x4 y5) 0)))
(assert (and (< (Board x4 y6) 10) (> (Board x4 y6) 0)))
(assert (and (< (Board x4 y7) 10) (> (Board x4 y7) 0)))
(assert (and (< (Board x4 y8) 10) (> (Board x4 y8) 0)))
(assert (and (< (Board x5 y0) 10) (> (Board x5 y0) 0)))
(assert (and (< (Board x5 y1) 10) (> (Board x5 y1) 0)))
(assert (and (< (Board x5 y2) 10) (> (Board x5 y2) 0)))
(assert (and (< (Board x5 y3) 10) (> (Board x5 y3) 0)))
(assert (and (< (Board x5 y4) 10) (> (Board x5 y4) 0)))
(assert (and (< (Board x5 y5) 10) (> (Board x5 y5) 0)))
(assert (and (< (Board x5 y6) 10) (> (Board x5 y6) 0)))
(assert (and (< (Board x5 y7) 10) (> (Board x5 y7) 0)))
(assert (and (< (Board x5 y8) 10) (> (Board x5 y8) 0)))
(assert (and (< (Board x6 y0) 10) (> (Board x6 y0) 0)))
(assert (and (< (Board x6 y1) 10) (> (Board x6 y1) 0)))
(assert (and (< (Board x6 y2) 10) (> (Board x6 y2) 0)))
(assert (and (< (Board x6 y3) 10) (> (Board x6 y3) 0)))
(assert (and (< (Board x6 y4) 10) (> (Board x6 y4) 0)))
(assert (and (< (Board x6 y5) 10) (> (Board x6 y5) 0)))
(assert (and (< (Board x6 y6) 10) (> (Board x6 y6) 0)))
(assert (and (< (Board x6 y7) 10) (> (Board x6 y7) 0)))
(assert (and (< (Board x6 y8) 10) (> (Board x6 y8) 0)))
(assert (and (< (Board x7 y0) 10) (> (Board x7 y0) 0)))
(assert (and (< (Board x7 y1) 10) (> (Board x7 y1) 0)))
(assert (and (< (Board x7 y2) 10) (> (Board x7 y2) 0)))
(assert (and (< (Board x7 y3) 10) (> (Board x7 y3) 0)))
(assert (and (< (Board x7 y4) 10) (> (Board x7 y4) 0)))
(assert (and (< (Board x7 y5) 10) (> (Board x7 y5) 0)))
(assert (and (< (Board x7 y6) 10) (> (Board x7 y6) 0)))
(assert (and (< (Board x7 y7) 10) (> (Board x7 y7) 0)))
(assert (and (< (Board x7 y8) 10) (> (Board x7 y8) 0)))
(assert (and (< (Board x8 y0) 10) (> (Board x8 y0) 0)))
(assert (and (< (Board x8 y1) 10) (> (Board x8 y1) 0)))
(assert (and (< (Board x8 y2) 10) (> (Board x8 y2) 0)))
(assert (and (< (Board x8 y3) 10) (> (Board x8 y3) 0)))
(assert (and (< (Board x8 y4) 10) (> (Board x8 y4) 0)))
(assert (and (< (Board x8 y5) 10) (> (Board x8 y5) 0)))
(assert (and (< (Board x8 y6) 10) (> (Board x8 y6) 0)))
(assert (and (< (Board x8 y7) 10) (> (Board x8 y7) 0)))
(assert (and (< (Board x8 y8) 10) (> (Board x8 y8) 0)))

;;;;;; --- END-CONSTRAINTS-DOMAIN ---



; Compute solution

(check-sat)



; Print solution, line by line

(get-value ((Board x0 y0)))
(get-value ((Board x1 y0)))
(get-value ((Board x2 y0)))
(get-value ((Board x3 y0)))
(get-value ((Board x4 y0)))
(get-value ((Board x5 y0)))
(get-value ((Board x6 y0)))
(get-value ((Board x7 y0)))
(get-value ((Board x8 y0)))
(get-value ((Board x0 y1)))
(get-value ((Board x1 y1)))
(get-value ((Board x2 y1)))
(get-value ((Board x3 y1)))
(get-value ((Board x4 y1)))
(get-value ((Board x5 y1)))
(get-value ((Board x6 y1)))
(get-value ((Board x7 y1)))
(get-value ((Board x8 y1)))
(get-value ((Board x0 y2)))
(get-value ((Board x1 y2)))
(get-value ((Board x2 y2)))
(get-value ((Board x3 y2)))
(get-value ((Board x4 y2)))
(get-value ((Board x5 y2)))
(get-value ((Board x6 y2)))
(get-value ((Board x7 y2)))
(get-value ((Board x8 y2)))
(get-value ((Board x0 y3)))
(get-value ((Board x1 y3)))
(get-value ((Board x2 y3)))
(get-value ((Board x3 y3)))
(get-value ((Board x4 y3)))
(get-value ((Board x5 y3)))
(get-value ((Board x6 y3)))
(get-value ((Board x7 y3)))
(get-value ((Board x8 y3)))
(get-value ((Board x0 y4)))
(get-value ((Board x1 y4)))
(get-value ((Board x2 y4)))
(get-value ((Board x3 y4)))
(get-value ((Board x4 y4)))
(get-value ((Board x5 y4)))
(get-value ((Board x6 y4)))
(get-value ((Board x7 y4)))
(get-value ((Board x8 y4)))
(get-value ((Board x0 y5)))
(get-value ((Board x1 y5)))
(get-value ((Board x2 y5)))
(get-value ((Board x3 y5)))
(get-value ((Board x4 y5)))
(get-value ((Board x5 y5)))
(get-value ((Board x6 y5)))
(get-value ((Board x7 y5)))
(get-value ((Board x8 y5)))
(get-value ((Board x0 y6)))
(get-value ((Board x1 y6)))
(get-value ((Board x2 y6)))
(get-value ((Board x3 y6)))
(get-value ((Board x4 y6)))
(get-value ((Board x5 y6)))
(get-value ((Board x6 y6)))
(get-value ((Board x7 y6)))
(get-value ((Board x8 y6)))
(get-value ((Board x0 y7)))
(get-value ((Board x1 y7)))
(get-value ((Board x2 y7)))
(get-value ((Board x3 y7)))
(get-value ((Board x4 y7)))
(get-value ((Board x5 y7)))
(get-value ((Board x6 y7)))
(get-value ((Board x7 y7)))
(get-value ((Board x8 y7)))
(get-value ((Board x0 y8)))
(get-value ((Board x1 y8)))
(get-value ((Board x2 y8)))
(get-value ((Board x3 y8)))
(get-value ((Board x4 y8)))
(get-value ((Board x5 y8)))
(get-value ((Board x6 y8)))
(get-value ((Board x7 y8)))
(get-value ((Board x8 y8)))
