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



((λ () "Hello World"))

(define-syntax-rule (while condition body ...)
  (let loop ()
    (when condition
      body ...
      (loop))))

(let ([i 0])
  (while (< i  10)
    (displayln i)
    (set! i (add1 i))))

;; Macros are hygienic, you cannot clobber existing variables!
(define-syntax-rule (swap! x y) ; -! is idiomatic for mutation
  (let ([tmp x])
    (set! x y)
    (set! y tmp)))

(define tmp 2)
(define other 3)
(swap! tmp other)
(printf "tmp = ~a; other = ~a\n" tmp other)
;; The variable `tmp` is renamed to `tmp_1`
;; in order to avoid name conflict
;; (let ([tmp_1 tmp])
;;   (set! tmp other)
;;   (set! other tmp_1))

;; But they are still code transformations, for example:
(define-syntax-rule (bad-while condition body ...)
  (when condition
    body ...
    (bad-while condition body ...)))
;; this macro is broken: it generates infinite code, if you try to use
;; it, the compiler will get in an infinite loop

