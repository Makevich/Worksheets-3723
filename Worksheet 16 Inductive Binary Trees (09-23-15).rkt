;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Worksheet 16 Inductive Binary Trees (09-23-15)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; An Bin Tree is either
; - a bt-empty; or
; - a bt-node , which has a string, a BinTree, and a BinTree

(define-struct bt-empty ())
(define-struct bt-node (label left right))

;Question 2a
(make-bt-node "A"
              (make-bt-node "B" (make-bt-empty) (make-bt-empty))
              (make-bt-node "C"
                            (make-bt-node "D" (make-bt-empty) (make-bt-empty))
                            (make-bt-empty)))

;Question 2b
(make-bt-node "F"
              (make-bt-node "D"
                            (make-bt-node "A" (make-bt-empty) (make-bt-empty))
                            (make-bt-node "E" (make-bt-empty) (make-bt-empty)))
              (make-bt-node "H"
                            (make-bt-empty)
                            (make-bt-node "L" (make-bt-empty) (make-bt-empty))))
;Question 3
;Consider the function
(define (bt? t)
  (cond
    [(bt-empty? t) #true]
    [(bt-node? t) (and (string? (bt-node-label t))
                       (bt? (bt-node-left t)) (bt? (bt-node-right t)))]
    [else #false]))

;3a) What does this evaluate to?
(bt? (make-bt-node "B" (make-bt-empty) (make-bt-empty)))

;3b) What does this evaluate to?
(bt? (make-bt-node 5 (make-bt-empty) (make-bt-empty)))

;3c) What does this evaluate to?
(bt? (make-bt-node "X" '() (make-bt-empty)))