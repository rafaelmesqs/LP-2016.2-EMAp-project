#lang racket
;projeto lp-2016 paula rafael e waldo

(define (X lst ptr1 ptr2)
  (define (auxX lst ptr1 ptr2 counter)
    (if (equal? ptr1 ptr2)
        counter
        (auxX lst ptr1 (- ptr2 1) (+ counter (list-ref lst (- ptr2 1))))))
  (auxX lst ptr1 ptr2 (list-ref lst (- ptr1 1))))


(define (MaxSoFar lst)
  (let ((p '()))
    (if (null? lst)
        '()
        (for ((i (+ (length lst) 1))
              #:when (> i 0))
          (for ((j (range i (+ (length lst) 1))))
            (begin (set! p (append p (list (X lst i j))))
                   (print p)))))))

;MaxSoFar :-- 0.0
;for L := 1 to N do
;for U := L to N do
;Sum := 0. O
;for I := L to U do
;Sum := Sum + X[I]
;/* Sum now contains the
;sum of X[L..U] */
;MaxSoFar := max(MaxSoFar, Sum)  
(require racket/trace)

;(trace X)