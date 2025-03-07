(set-option :incremental false)
(set-info :notes "CVC4 always dumps the most general, all-supported logic (below), as some internals might require the use of a logic more general than the input.")
(set-logic ALL)

(declare-sort hermes.iml.aadl.Connection_Real 0)
(declare-fun hermes.iml.aadl.Connection_Real.source (hermes.iml.aadl.Connection_Real) Real)
(declare-fun hermes.iml.aadl.Connection_Real.target (hermes.iml.aadl.Connection_Real) Real)
(define-fun hermes.iml.aadl.Connection_Real.a1 ((x1 hermes.iml.aadl.Connection_Real)) Bool (= (hermes.iml.aadl.Connection_Real.source x1) (hermes.iml.aadl.Connection_Real.target x1)))
(declare-sort utrc.test1.S1 0)
(declare-fun utrc.test1.S1.i1 (utrc.test1.S1) Real)
(declare-fun utrc.test1.S1.i2 (utrc.test1.S1) Real)
(declare-fun utrc.test1.S1.o1 (utrc.test1.S1) Real)
(declare-fun utrc.test1.S1.n (utrc.test1.S1) Int)
(define-fun utrc.test1.S1.a1 ((x2 utrc.test1.S1)) Bool (and (>= (utrc.test1.S1.n x2) 1) (exists ((x Int) (y Int)) (let ((_let_0 (utrc.test1.S1.i1 x2))) (let ((_let_1 (* x (utrc.test1.S1.n x2)))) (let ((_let_2 (utrc.test1.S1.i2 x2))) (let ((_let_3 (* y (utrc.test1.S1.n x2)))) (and (and (>= y 1) (<= y (utrc.test1.S1.n x2)) (>= x 1) (<= x (utrc.test1.S1.n x2))) (and (or (= _let_0 (to_real _let_1)) (= _let_0 (to_real (* (- 1) _let_1)))) (or (= _let_2 (to_real _let_3)) (= _let_2 (to_real (* (- 1) _let_3)))))))))) )))
(define-fun utrc.test1.S1.g1 ((x1 utrc.test1.S1)) Bool (let ((_let_0 (utrc.test1.S1.o1 x1))) (and (<= _let_0 1.0) (>= _let_0 1.0))))
(declare-sort utrc.test1.S2 0)
(declare-fun utrc.test1.S2.i1 (utrc.test1.S2) Real)
(declare-fun utrc.test1.S2.i2 (utrc.test1.S2) Real)
(declare-fun utrc.test1.S2.o1 (utrc.test1.S2) Real)
(declare-fun utrc.test1.S2.alpha (utrc.test1.S2) Real)
(define-fun utrc.test1.S2.a1 ((x1 utrc.test1.S2)) Bool (let ((_let_0 (utrc.test1.S2.i1 x1))) (let ((_let_1 (utrc.test1.S2.i2 x1))) (and (or (= _let_0 1.0) (= _let_0 (/ (- 1) 1))) (or (= _let_1 0.0) (= _let_1 1.0) (= _let_1 (/ (- 1) 1)))))))
(define-fun utrc.test1.S2.g1 ((x1 utrc.test1.S2)) Bool (let ((_let_0 (sqrt (to_real 2)))) (let ((_let_1 (utrc.test1.S2.alpha x1))) (= (utrc.test1.S2.o1 x1) (+ (* (utrc.test1.S2.i1 x1) _let_0 _let_1) (* (utrc.test1.S2.i2 x1) _let_0 _let_1))))))
(declare-sort utrc.test1.S1__impl 0)
(declare-fun utrc.test1.S1__impl.S2_sub (utrc.test1.S1__impl) utrc.test1.S2)
(declare-fun utrc.test1.S1__impl.base_0 (utrc.test1.S1__impl) utrc.test1.S1)
(declare-fun utrc.test1.S1__impl.i1_TO_A (utrc.test1.S1__impl) hermes.iml.aadl.Connection_Real)
(define-fun utrc.test1.S1__impl.i1_TO_A.init ((x1 utrc.test1.S1__impl)) Bool (let ((_let_0 (utrc.test1.S1__impl.i1_TO_A x1))) (and (= (hermes.iml.aadl.Connection_Real.source _let_0) (utrc.test1.S1.i1 (utrc.test1.S1__impl.base_0 x1))) (= (hermes.iml.aadl.Connection_Real.target _let_0) (utrc.test1.S2.i1 (utrc.test1.S1__impl.S2_sub x1))))))
(declare-fun utrc.test1.S1__impl.i2_TO_A (utrc.test1.S1__impl) hermes.iml.aadl.Connection_Real)
(define-fun utrc.test1.S1__impl.i2_TO_A.init ((x1 utrc.test1.S1__impl)) Bool (let ((_let_0 (utrc.test1.S1__impl.i2_TO_A x1))) (and (= (hermes.iml.aadl.Connection_Real.source _let_0) (utrc.test1.S1.i2 (utrc.test1.S1__impl.base_0 x1))) (= (hermes.iml.aadl.Connection_Real.target _let_0) (utrc.test1.S2.i2 (utrc.test1.S1__impl.S2_sub x1))))))
(declare-fun utrc.test1.S1__impl.S2_TO_o1 (utrc.test1.S1__impl) hermes.iml.aadl.Connection_Real)
(define-fun utrc.test1.S1__impl.S2_TO_o1.init ((x1 utrc.test1.S1__impl)) Bool (let ((_let_0 (utrc.test1.S1__impl.S2_TO_o1 x1))) (and (= (hermes.iml.aadl.Connection_Real.source _let_0) (utrc.test1.S2.o1 (utrc.test1.S1__impl.S2_sub x1))) (= (hermes.iml.aadl.Connection_Real.target _let_0) (utrc.test1.S1.o1 (utrc.test1.S1__impl.base_0 x1))))))
(declare-fun inst () utrc.test1.S1__impl)
(set-info :notes "choiceK_1 is a skolem introduced due to term-level Hilbert choice removal")
(declare-fun choiceK_1 () Real)
(assert (let ((_let_0 (utrc.test1.S1__impl.i1_TO_A inst))) (= (hermes.iml.aadl.Connection_Real.source _let_0) (hermes.iml.aadl.Connection_Real.target _let_0))))
(assert (let ((_let_0 (utrc.test1.S1__impl.i2_TO_A inst))) (= (hermes.iml.aadl.Connection_Real.source _let_0) (hermes.iml.aadl.Connection_Real.target _let_0))))
(assert (let ((_let_0 (utrc.test1.S1__impl.S2_TO_o1 inst))) (= (hermes.iml.aadl.Connection_Real.source _let_0) (hermes.iml.aadl.Connection_Real.target _let_0))))
(assert (let ((_let_0 (utrc.test1.S1__impl.S2_TO_o1 inst))) (and (= (hermes.iml.aadl.Connection_Real.source _let_0) (utrc.test1.S2.o1 (utrc.test1.S1__impl.S2_sub inst))) (= (hermes.iml.aadl.Connection_Real.target _let_0) (utrc.test1.S1.o1 (utrc.test1.S1__impl.base_0 inst))))))
(assert (let ((_let_0 (utrc.test1.S1__impl.i1_TO_A inst))) (and (= (hermes.iml.aadl.Connection_Real.source _let_0) (utrc.test1.S1.i1 (utrc.test1.S1__impl.base_0 inst))) (= (hermes.iml.aadl.Connection_Real.target _let_0) (utrc.test1.S2.i1 (utrc.test1.S1__impl.S2_sub inst))))))
(assert (let ((_let_0 (utrc.test1.S1__impl.i2_TO_A inst))) (and (= (hermes.iml.aadl.Connection_Real.source _let_0) (utrc.test1.S1.i2 (utrc.test1.S1__impl.base_0 inst))) (= (hermes.iml.aadl.Connection_Real.target _let_0) (utrc.test1.S2.i2 (utrc.test1.S1__impl.S2_sub inst))))))
(assert (let ((_let_0 (utrc.test1.S1__impl.S2_sub inst))) (let ((_let_1 (utrc.test1.S1__impl.base_0 inst))) (let ((_let_2 (utrc.test1.S1.o1 _let_1))) (let ((_let_3 (utrc.test1.S2.i1 _let_0))) (let ((_let_4 (utrc.test1.S2.i2 _let_0))) (let ((_let_5 (utrc.test1.S2.alpha _let_0))) (and (=> (and (or (= _let_3 1.0) (= _let_3 (- 1.0))) (or (= _let_4 0.0) (= _let_4 1.0) (= _let_4 (- 1.0)))) (= (utrc.test1.S2.o1 _let_0) (+ (* choiceK_1 _let_3 _let_5) (* choiceK_1 _let_4 _let_5)))) (not (and (>= (* (- 1.0) _let_2) (- 1.0)) (>= _let_2 1.0))) (>= (utrc.test1.S1.n _let_1) 1) (not (or (forall ((y Int)) (let ((_let_0 (* y (utrc.test1.S1.n _let_1)))) (let ((_let_1 (utrc.test1.S1.i2 _let_1))) (or (not (>= y 1)) (>= (+ y (* (- 1) (utrc.test1.S1.n _let_1))) 1) (and (not (= _let_1 (/ _let_0 1))) (not (= _let_1 (/ (* (- 1) _let_0) 1))))))) ) (forall ((x Int)) (let ((_let_0 (* x (utrc.test1.S1.n _let_1)))) (let ((_let_1 (utrc.test1.S1.i1 _let_1))) (or (not (>= x 1)) (>= (+ x (* (- 1) (utrc.test1.S1.n _let_1))) 1) (and (not (= _let_1 (/ _let_0 1))) (not (= _let_1 (/ (* (- 1) _let_0) 1))))))) )))))))))))
(assert (let ((_let_0 (utrc.test1.S1__impl.i1_TO_A inst))) (let ((_let_1 (utrc.test1.S1__impl.i2_TO_A inst))) (let ((_let_2 (utrc.test1.S1__impl.S2_TO_o1 inst))) (let ((_let_3 (utrc.test1.S1__impl.S2_sub inst))) (let ((_let_4 (utrc.test1.S1__impl.base_0 inst))) (and (= (hermes.iml.aadl.Connection_Real.source _let_2) (utrc.test1.S2.o1 _let_3)) (= (hermes.iml.aadl.Connection_Real.target _let_2) (utrc.test1.S1.o1 _let_4)) (= (hermes.iml.aadl.Connection_Real.source _let_0) (utrc.test1.S1.i1 _let_4)) (= (hermes.iml.aadl.Connection_Real.target _let_0) (utrc.test1.S2.i1 _let_3)) (= (hermes.iml.aadl.Connection_Real.source _let_1) (utrc.test1.S1.i2 _let_4)) (= (hermes.iml.aadl.Connection_Real.target _let_1) (utrc.test1.S2.i2 _let_3)) (>= (utrc.test1.S1.n _let_4) 1) (not (forall ((y Int)) (let ((_let_0 (* y (utrc.test1.S1.n _let_4)))) (let ((_let_1 (utrc.test1.S1.i2 _let_4))) (or (not (>= y 1)) (>= (+ y (* (- 1) (utrc.test1.S1.n _let_4))) 1) (and (not (= _let_1 (/ _let_0 1))) (not (= _let_1 (/ (* (- 1) _let_0) 1))))))) )) (not (forall ((x Int)) (let ((_let_0 (* x (utrc.test1.S1.n _let_4)))) (let ((_let_1 (utrc.test1.S1.i1 _let_4))) (or (not (>= x 1)) (>= (+ x (* (- 1) (utrc.test1.S1.n _let_4))) 1) (and (not (= _let_1 (/ _let_0 1))) (not (= _let_1 (/ (* (- 1) _let_0) 1))))))) )))))))))
(assert (= (* choiceK_1 choiceK_1) 2.0))
(declare-fun g_2 () Bool)
(declare-fun g_3 () Bool)
(set-info :notes "skv_4 is created during skolemization")
(declare-fun skv_4 () Int)
(set-info :notes "skv_5 is created during skolemization")
(declare-fun skv_5 () Int)
(set-info :notes "intvar_6 is is an integer variable created by the dio solver")
(declare-fun intvar_6 () Int)
(set-info :notes "intvar_7 is is an integer variable created by the dio solver")
(declare-fun intvar_7 () Int)
(set-info :notes "intvar_8 is is an integer variable created by the dio solver")
(declare-fun intvar_8 () Int)
(set-info :notes "intvar_9 is is an integer variable created by the dio solver")
(declare-fun intvar_9 () Int)
(set-info :notes "intvar_10 is is an integer variable created by the dio solver")
(declare-fun intvar_10 () Int)
(set-info :notes "intvar_11 is is an integer variable created by the dio solver")
(declare-fun intvar_11 () Int)
(set-info :notes "intvar_12 is is an integer variable created by the dio solver")
(declare-fun intvar_12 () Int)
(set-info :notes "intvar_13 is is an integer variable created by the dio solver")
(declare-fun intvar_13 () Int)
(set-info :notes "intvar_14 is is an integer variable created by the dio solver")
(declare-fun intvar_14 () Int)
(check-sat)
