#lang racket


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
  (is-odd? 11) (is-odd? 11) (is-odd? 12))



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

(define (hello4 [name "World"])
  (string-append "Hello " name))

(define (hello-k #:name [name "World"] #:greeting [g "Hello"] . args)
  (format "~a ~a, ~a extra args" g name (length args)))

(define (fizzbuzz? n)
  (match (list (remainder n 3) (remainder n 5))
    [(list 0 0) 'fizzbuzz]
    [(list 0 _) 'fizz]
    [(list _ 0) 'buzz]
    [_          #f]))

(fizzbuzz? 15)
(fizzbuzz? 37)

;; Looping can be done through (tail-) recursion
(define (loop i)
  (when (< i 10)
    (printf "i=~a\n" i)
    (loop (add1 i))))
(loop 5)

(let loop ((i 0))
  (when (< i 10)
    (printf "i=~a\n" i)
    (loop (add1 i))))

(for ([i (in-list '(l i s t))])
  (displayln i))

(for ([i 10] [j '(x y z f)] [k '(1 2 3)]) (printf "~a:~a ~a\n" i j k))

(define (make-accumulator delta)
  (lambda (amount)
    (set! delta (+ delta amount))
    delta))
 
(define A (make-accumulator 5))
(define B (make-accumulator 5))
(A 10)
 
(A 10)
 
(B 10)
