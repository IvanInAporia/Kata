; library that contains 'is', 'deftest' and 'run-tests' functions
(use 'clojure.test)

(println "Clojure: Hello World")

; need forward declaration for this function to be callable from chop
(declare left-and-right)

(defn chop [item array]
    (cond
        (= (count array) 1) (if (= (get array 0) item) 0 -1)
        (> (count array) 1) (left-and-right item array (int (/ (count array) 2)))
        :else -1 ; empty array
    )
)

(defn adjust-if-found [location middle]
    (if (>= location 0)
        (+ location middle)
        location
    )
)

(defn left-and-right [item array middle]
    (if (< item (get array middle))
        (chop item (subvec array 0 middle))
        (adjust-if-found (chop item (subvec array middle)) middle)
    )
)

(deftest chop-test
    (is (= -1 (chop 3 (vector ))))
    (is (= -1 (chop 3 (vector 1))))
    (is (= 0  (chop 1 (vector 1))))
    (is (= 0  (chop 1 (vector 1, 3, 5))))
    (is (= 1  (chop 3 (vector 1, 3, 5))))
    (is (= 2  (chop 5 (vector 1, 3, 5))))
    (is (= -1 (chop 0 (vector 1, 3, 5))))
    (is (= -1 (chop 2 (vector 1, 3, 5))))
    (is (= -1 (chop 4 (vector 1, 3, 5))))
    (is (= -1 (chop 6 (vector 1, 3, 5))))
    (is (= 0  (chop 1 (vector 1, 3, 5, 7))))
    (is (= 1  (chop 3 (vector 1, 3, 5, 7))))
    (is (= 2  (chop 5 (vector 1, 3, 5, 7))))
    (is (= 3  (chop 7 (vector 1, 3, 5, 7))))
    (is (= -1 (chop 0 (vector 1, 3, 5, 7))))
    (is (= -1 (chop 2 (vector 1, 3, 5, 7))))
    (is (= -1 (chop 4 (vector 1, 3, 5, 7))))
    (is (= -1 (chop 6 (vector 1, 3, 5, 7))))
    (is (= -1 (chop 8 (vector 1, 3, 5, 7))))
)

(run-tests)