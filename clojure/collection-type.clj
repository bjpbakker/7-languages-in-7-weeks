(defn collection-type [c]
  (cond
     (list? c) :list
     (vector? c) :vector
     (map? c) :map
     (set? c) :set))

(collection-type '())
(collection-type [])
(collection-type #{})
(collection-type {})
