;; Write a type using `defrecord` that implements a protocol
(defprotocol Measurable
  (length [m]))

(defrecord Line [x1 x2]
  Measurable
    (length [m] (- x2 x1)))

;; (.length (Line. 0 10))
