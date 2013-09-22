(ns starwars)

(defprotocol Jedi
  (choose-side [jedi]))

(defrecord Obi-Wan []
  Jedi
  (choose-side [this]
               "I choose the side of Jedi"))

(defrecord Anakin []
  Jedi
  (choose-side [this]
               "I'm on the dark side"))

(def obi-wan (Obi-Wan.))
(choose-side obi-wan)

(def darth-vader (Anakin.))
(choose-side darth-vader)
