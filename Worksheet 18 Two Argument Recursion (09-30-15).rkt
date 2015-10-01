;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Worksheet 18 Two Argument Recursion (09-30-15)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Consider the following function
(define (merge xs ys)
  (cond
    [(null? xs) ys]
    [(null? ys) xs]
    [else
     (let* ([x (first xs)]
            [y (first ys)])
       (if (<= x y)
           (cons x (merge (rest xs) ys))
           (cons y (merge xs (rest ys)))))]))

;1a What does this evaluates to
(merge (list 1 5 9 13) (list 2 6 7 8 15))
;1b
(merge (list 5 10)(list 1 2 3 10 100))

;1c
;The purpose of merge is to join two lists into a new list. It will
;repeat the elements in case they appear in both lists

;1d

;2 Consider the following function
(define (zip xs ys)
  (cond
    [(null? xs) '()]
    [(null? ys) '()]
    [else (cons
           (list (first xs) (first ys))
           (zip (rest xs) (rest ys)))]))

;2a
(zip (list "a" "b" "c") (list "x" "y" "z"))
;2b
(zip (list 1 2 3 4) (list "x" "y" "z"))

;3 Consider the following function
(define (combine-with-each elt lst)
  (cond
    [(null? lst) '()]
    [else (cons (list elt (first lst))(combine-with-each elt (rest lst)))]))

;3a
(combine-with-each 5 (list "a" "b" "c"))
;3b
(combine-with-each "x" (list 1 2 3))

;4 Consider the following function
(define (cartesian-product xs ys)
  (cond
    [(null? xs) '()]
    [else (append
           (combine-with-each (first xs) ys)
           (cartesian-product (rest xs) ys))]))
;4a
(cartesian-product (list 1 2) (list "a" "b" "c"))

;4b
(cartesian-product (list "x" "y" "z") (list "5"))

;4c
;{1,2}x{{a,b,c} = {(1,a),(1,b),(1,c),(2,a),(2,b),(2,c)}
