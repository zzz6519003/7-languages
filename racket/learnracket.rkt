(let ([me "Bob"])
  "Alice"
  ) ; => "Bob"

(let* ([x 1]
       [y (+ x 1)])
       (* x y))

(letrec ([is-even? (lambda (n)
                     (or (zero? n)
                         (is-odd? (sub1 n))))]
         [is-odd? (lambda (n) (and (not (zero? n))
                                   (is-even? (sub1 n))))])
  )


