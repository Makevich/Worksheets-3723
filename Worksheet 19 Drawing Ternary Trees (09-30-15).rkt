;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Worksheet 19 Drawing Ternary Trees (09-30-15)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define (child-lines w1 w2 w3)
  (let* ([OFFSET 20]
         [HEIGHT 50]
         [width (+ w1 w2 w3)]
         [left-line
          (scene+line
           (rectangle width HEIGHT "solid" "transparent")
           OFFSET 0 OFFSET HEIGHT "black")]
         [middle-line
          (scene+line
           (rectangle width HEIGHT "solid" "transparent")
           OFFSET 0 (+ OFFSET w1) HEIGHT "black")]
         [right-line
          (scene+line
           (rectangle width HEIGHT "solid" "transparent")
           OFFSET 0 (+ OFFSET w1 w2) HEIGHT "black")])
    (overlay left-line middle-line right-line)))

;1a
(scene+line (rectangle 100 200 "solid" "red") 80 50 20 150 "black")
;1c
(scene+line (rectangle 100 200 "solid" "red") 20 120 80 180 "black")
;1d
(child-lines 60 150 70)

;2 Consider the function

(define (connect-level root left middle right)
  (let* ([lwidth (image-width left)]
         [mwidth (image-width middle)]
         [rwidth (image-width right)])
    (above/align "left"
                 root
                 (child-lines lwidth mwidth rwidth)
                 (beside/align "top" left middle right))))

;2a
(connect-level (square 20 "solid" "blue")
              (triangle 20 "solid" "green")
              (circle 20 "solid" "orange")
              (square 20 "solid" "teal"))

;2b
(connect-level (square 20 "solid" "blue")
               (triangle 20 "solid" "green")
               (circle 20 "solid" "orange")
               (square 20 "solid" "teal"))

;3 Consider the definitions:

; a Tree is either
; - a leaf, containing no data
; - a node, containing three TTree's, left, middle, and right

(define-struct leaf ())
(define-struct ternary (left middle right))

(define EX1 (make-ternary (make-leaf) (make-leaf) (make-leaf)))
(define EX2 (make-ternary EX1 EX1 (make-leaf)))
(define EX3 (make-ternary EX2 (make-leaf) EX2))
(define EX4 (make-ternary EX3 EX3 EX3))

(define (img-ternary t)
  (let* ([node-img (circle 20 "solid" "blue")])
        (cond
          [(leaf? t) node-img]
          [(ternary? t)
           (connect-level node-img
                          (img-ternary (ternary-left t))
                          (img-ternary (ternary-middle t))
                          (img-ternary (ternary-right t)))])))

(img-ternary EX2)

