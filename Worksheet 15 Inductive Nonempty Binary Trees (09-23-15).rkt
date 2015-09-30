;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Worksheet 15 Inductive Nonempty Binary Trees (09-23-15)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; An NEBinTree is either
; - a leaf, which has a number; or
; an interior, which has a number, an NEBinTree, and an NEBinTree

(define-struct leaf (val))
(define-struct interior (val left right))

(make-interior 5 (make-leaf 3) (make-interior 7 (make-leaf 6) (make-leaf 9)))

;NEBinTree -> Number
;Sum up the labels of an NEBinTree
(define (sum-nodes t)
  (cond
    [(leaf? t) (leaf-val t)]
    [(interior? t)
     (+ (interior-val t)
        (sum-nodes (interior-left t))
        (sum-nodes (interior-right t)))]))

(sum-nodes (make-interior 5 (make-leaf 3) (make-interior 7 (make-leaf 6) (make-leaf 9))))

(sum-nodes (make-interior 12 (make-interior 15 (make-leaf 30) (make-leaf 32)) (make-leaf 25)))