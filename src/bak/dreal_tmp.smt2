(set-logic QF_NRA)
(declare-fun FV9 () Int )
(declare-fun FV10 () Int )
(declare-fun __x1____pure () Real )
(declare-fun __x8____pure () Real )
(declare-fun __x0__ () Real )
(declare-fun __x2__ () Real )
(declare-fun __x4__ () Real )
(declare-fun __x5__ () Real )
(declare-fun __x7__ () Real )
(declare-fun __x9__ () Real )
(declare-fun __x10__ () Real )
(declare-fun __x11__ () Real )
(declare-fun __x12__ () Real )
(declare-fun __x14__ () Real )
(declare-fun __x15__ () Real )
(declare-fun __x16__ () Real )
(declare-fun __x17__ () Int )
(declare-fun __x18__ () Real )
(assert (and (and (and (=> (= __x1____pure __x8____pure) (= __x0__ __x7__)) (=> (= __x1____pure __x8____pure) (= __x4__ __x10__))) (and (and (or (not (and (= __x0__ __x2__) (= __x4__ __x5__))) true) (or (not true) (and (= __x0__ __x2__) (= __x4__ __x5__)))) (and (or (not (= __x0__ __x4__)) true) (or (not true) (= __x0__ __x4__))) (and (or (not (and (= __x7__ __x9__) (= __x10__ __x11__))) true) (or (not true) (and (= __x7__ __x9__) (= __x10__ __x11__)))) (and (or (not (= __x7__ __x10__)) true) (or (not true) (= __x7__ __x10__))) (and (or (not (and (= __x12__ __x14__) (= __x15__ __x16__))) true) (or (not true) (and (= __x12__ __x14__) (= __x15__ __x16__)))) (and (or (not (= __x12__ __x15__)) true) (or (not true) (= __x12__ __x15__))) (and (and (<= 1 __x17__) (and (and (and (and (<= 1 FV10) (<= FV10 __x17__)) (<= 1 FV9)) (<= FV9 0)) (and (= __x2__ (/ (* 1  FV9) (* 1  __x17__))) (= __x2__ (/ (* 1  (* (- 1) FV9)) (* 1  __x17__))) (or (= __x9__ (/ (* 1  FV10) (* 1  __x17__))) (= __x9__ (/ (* 1  (* (- 1) FV10)) (* 1  __x17__))))))) (or (not (and (or (= __x5__ 1.0) (= __x5__ (- 1.0))) (or (or (= __x11__ 0.0) (= __x11__ 1.0)) (= __x11__ (- 1.0))))) (= __x14__ (+ (* (* __x5__ (/ 6369051672525773 4503599627370496)) (sin __x18__)) (* (* __x11__ (/ 6369051672525773 4503599627370496)) (cos __x18__)))))) (not (and (<= __x16__ 1.0) (<= (- 1.0) __x16__))))) true) )
(check-sat)