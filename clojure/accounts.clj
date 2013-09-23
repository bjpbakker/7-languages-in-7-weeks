(ns accounts)

(defn open-account [number]
  (ref {:number number
   :balance 0}))

(defn by-number [number]
  (fn [account] (.equals (account :number) number)))

(defn find-account [accounts predicate]
  (first (filter predicate accounts)))

(defn change-balance [account f]
  (let [old-balance (account :balance)
        new-balance (f old-balance)]
    (dosync (alter account assoc :balance new-balance))))

(defn credit [account amount]
  (change-balance account (fn [balance] (+ balance amount))))

(defn debit [account-number amount]
  (change-balance account-number (fn [balance] (- balance amount))))

(defn transfer [from to amount]
  (debit from amount)
  (credit to amount))

(defn balances [accounts]
  (map (fn [account]
         {:account (account :number)
          :balance (account :balance)})
       accounts))


(def accounts [(open-account "123"),
               (open-account "456")
               (open-account "789")])

(credit
  (find-account accounts (by-number "123"))
  1000)

(transfer
  (find-account accounts (by-number "123"))
  (find-account accounts (by-number "456"))
  500)
(transfer
  (find-account accounts (by-number "123"))
  (find-account accounts (by-number "789"))
  280)
(transfer
  (find-account accounts (by-number "456"))
  (find-account accounts (by-number "789"))
  130)

(balances accounts)
