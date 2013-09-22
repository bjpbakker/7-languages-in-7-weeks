(defmacro unless
  "unless macro"
  ([test body]
    `(if (not ~test) ~body))
  ([test body otherwise]
      `(if (not ~test) ~body ~otherwise)))

(unless false :false)
(unless true :false :true)
