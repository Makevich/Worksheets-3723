;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Worksheet 14 Sum Types (09-21-15)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define-struct shape-square ())
(define-struct shape-circle ())
(define-struct shape-triangle ())

(define (display-shape shape)
  (cond
    [(shape-square? shape) (square 40 "solid" "blue")]
    [(shape-circle? shape) (circle 20 "solid" "blue")]
    [(shape-triangle? shape) (triangle 40 "solid" "blue")]))


(display-shape (make-shape-square))

(define-struct polygon-regular (num-sides))
(define-struct polygon-star (num-sides step))

(define (display-polygon shape)
  (cond
    [(polygon-regular? shape)
     (regular-polygon
      40
      (polygon-regular-num-sides shape)
      "solid"
      "red")]
    [(polygon-star? shape)
     (star-polygon
      40
      (polygon-star-num-sides shape)
      (polygon-star-step shape)
      "solid"
      "red")]))

(display-polygon (make-polygon-star 5 2))

(define (poly-list lst)
  (cond
    [(null? lst) empty-image]
    [else
     (beside
      (display-polygon (first lst))
      (poly-list (rest lst)))]))

(poly-list (list (make-polygon-star 5 1) (make-polygon-star 5 2) (make-polygon-star 8 1) (make-polygon-star 5 2) (make-polygon-star 10 9)))