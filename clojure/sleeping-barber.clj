(ns sleeping-barber)

(defn sleep [millis]
  (Thread/sleep millis))

(defn current-time []
  (System/currentTimeMillis))

(defn open? [shop start-time]
  (let [closing-time (+ start-time (shop :time-open))]
    (< (current-time) closing-time)))

(def closed? (complement open?))

(defn seet-available? [shop]
  (< @(shop :customer-queue) (shop :capacity)))

(defn release-seet [shop]
  (swap! (shop :customer-queue) dec))

(defn give-haircut [shop barber]
  (release-seet shop)
  (sleep 20)
  (assoc barber :haircuts-given (inc (barber :haircuts-given))))

(defn take-seet [shop]
  (swap! (shop :customer-queue) inc)
  (send (shop :barber) (partial give-haircut shop)))

(defn customer-arrives [shop]
  (let [timeout (+ 10 (rand 20))]
    (sleep timeout)
    (if (seet-available? shop)
      (take-seet shop))))

(defn shop-open [shop action]
  (loop [start-time (current-time)]
    (if (closed? shop start-time)
      @(shop :barber)
      (do (customer-arrives shop)
          (recur start-time)))))

(def shop {:barber (agent {:haircuts-given 0})
           :time-open (* 10 1000)
           :customer-queue (atom 0)
           :capacity 3})

(defn main []
  (future (shop-open shop
                     (partial customer-arrives shop)))
  (sleep (shop :time-open))
  @(shop :barber))

(main)
