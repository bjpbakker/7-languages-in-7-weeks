(ns fibonacci)

(def fib
  (fib-seq 0 1))

(defn fib-seq [a b]
  (let [next (+ a b)]
    (lazy-seq (cons b (fib-seq b next)))))

(take 20 fib)
