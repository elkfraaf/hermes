(declare-sort test.S1_Impl 0)
(declare-sort hermes.iml.aadl.Connection<Float> 0)
(declare-sort test.S1 0)
(declare-sort test.S2 0)
(declare-fun test.S1_Impl.base_0( test.S1_Impl) test.S1)
(declare-fun test.S1_Impl.S2_sub( test.S1_Impl) test.S2)
(declare-fun test.S1_Impl.i1_TO_A( test.S1_Impl) hermes.iml.aadl.Connection<Float>)
(declare-fun test.S1_Impl.i2_TO_A( test.S1_Impl) hermes.iml.aadl.Connection<Float>)
(declare-fun test.S1_Impl.S2_TO_o1( test.S1_Impl) hermes.iml.aadl.Connection<Float>)
(declare-fun test.inst () test.S1_Impl )
(declare-fun hermes.iml.aadl.Connection<Float>.source( hermes.iml.aadl.Connection<Float>) Real)
(declare-fun hermes.iml.aadl.Connection<Float>.target( hermes.iml.aadl.Connection<Float>) Real)
(declare-fun test.S1.i1( test.S1) Real)
(declare-fun test.S1.i2( test.S1) Real)
(declare-fun test.S1.o1( test.S1) Real)
(declare-fun test.S1.n( test.S1) Int)
(declare-fun test.S2.i1( test.S2) Real)
(declare-fun test.S2.i2( test.S2) Real)
(declare-fun test.S2.o1( test.S2) Real)
(declare-fun test.S2.alpha( test.S2) Real)
(assert (and (= (and (= (hermes.iml.aadl.Connection<Float>.source (test.S1_Impl.i1_TO_A test.inst)) (test.S1.i1 (test.S1_Impl.base_0 test.inst))) (= (hermes.iml.aadl.Connection<Float>.target (test.S1_Impl.i1_TO_A test.inst)) (test.S2.i1 (test.S1_Impl.S2_sub test.inst)))) true) (= (= (hermes.iml.aadl.Connection<Float>.source (test.S1_Impl.i1_TO_A test.inst)) (hermes.iml.aadl.Connection<Float>.target (test.S1_Impl.i1_TO_A test.inst))) true) (= (and (= (hermes.iml.aadl.Connection<Float>.source (test.S1_Impl.i2_TO_A test.inst)) (test.S1.i2 (test.S1_Impl.base_0 test.inst))) (= (hermes.iml.aadl.Connection<Float>.target (test.S1_Impl.i2_TO_A test.inst)) (test.S2.i2 (test.S1_Impl.S2_sub test.inst)))) true) (= (= (hermes.iml.aadl.Connection<Float>.source (test.S1_Impl.i2_TO_A test.inst)) (hermes.iml.aadl.Connection<Float>.target (test.S1_Impl.i2_TO_A test.inst))) true) (= (and (= (hermes.iml.aadl.Connection<Float>.source (test.S1_Impl.S2_TO_o1 test.inst)) (test.S2.o1 (test.S1_Impl.S2_sub test.inst))) (= (hermes.iml.aadl.Connection<Float>.target (test.S1_Impl.S2_TO_o1 test.inst)) (test.S1.o1 (test.S1_Impl.base_0 test.inst)))) true) (= (= (hermes.iml.aadl.Connection<Float>.source (test.S1_Impl.S2_TO_o1 test.inst)) (hermes.iml.aadl.Connection<Float>.target (test.S1_Impl.S2_TO_o1 test.inst))) true) (and (and (<= 1 (test.S1.n (test.S1_Impl.base_0 test.inst))) (exists ((x Int)(y Int)) (and (and (and (and (<= 0 y) (<= y (test.S1.n (test.S1_Impl.base_0 test.inst)))) (<= 1 x)) (<= x (test.S1.n (test.S1_Impl.base_0 test.inst)))) (and (or (= (test.S1.i1 (test.S1_Impl.base_0 test.inst)) (/ (to_real x) (to_real (test.S1.n (test.S1_Impl.base_0 test.inst))))) (= (test.S1.i1 (test.S1_Impl.base_0 test.inst)) (/ (to_real (* (- 1) x)) (to_real (test.S1.n (test.S1_Impl.base_0 test.inst)))))) (or (= (test.S1.i2 (test.S1_Impl.base_0 test.inst)) (/ (to_real y) (to_real (test.S1.n (test.S1_Impl.base_0 test.inst))))) (= (test.S1.i2 (test.S1_Impl.base_0 test.inst)) (/ (to_real (* (- 1) y)) (to_real (test.S1.n (test.S1_Impl.base_0 test.inst)))))))))) (=> (and (or (= (test.S2.i1 (test.S1_Impl.S2_sub test.inst)) 1.0) (= (test.S2.i1 (test.S1_Impl.S2_sub test.inst)) (- 1.0))) (or (or (= (test.S2.i2 (test.S1_Impl.S2_sub test.inst)) 0.0) (= (test.S2.i2 (test.S1_Impl.S2_sub test.inst)) 1.0)) (= (test.S2.i2 (test.S1_Impl.S2_sub test.inst)) (- 1.0)))) (= (test.S2.o1 (test.S1_Impl.S2_sub test.inst)) (+ (* (* (test.S2.i1 (test.S1_Impl.S2_sub test.inst)) (/ 6369051672525773 4503599627370496)) (sin (test.S2.alpha (test.S1_Impl.S2_sub test.inst)))) (* (* (test.S2.i2 (test.S1_Impl.S2_sub test.inst)) (/ 6369051672525773 4503599627370496)) (cos (test.S2.alpha (test.S1_Impl.S2_sub test.inst)))))))) (not (and (<= (test.S1.o1 (test.S1_Impl.base_0 test.inst)) 1.0) (<= (- 1.0) (test.S1.o1 (test.S1_Impl.base_0 test.inst)))))) )
(check-sat)