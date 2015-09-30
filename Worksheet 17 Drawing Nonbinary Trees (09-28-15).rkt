;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Worksheet 17 Drawing Nonbinary Trees (09-28-15)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/planetcute)

;Question 1
;Consider the following definition
(define (sum lst) (cond
                    [(null? lst) 0]
                    [else (+ (first lst) (sum (rest lst)))]))

(define (child-lines offset children-widths)
  (let* ([width (sum children-widths)]
         [origin (- width offset)]
         [HEIGHT 50])
    (cond
      [(null? children-widths) empty-image]
      [else
       (let* ([bg (overlay/align
                   "right" "top"
                   (rectangle width HEIGHT "solid" "transparent")
                   (child-lines offset (rest children-widths)))]
              [this-width (first children-widths)])
         (add-line bg origin 0 (- this-width offset) HEIGHT "black"))])))

;1a) What does the expression evaluate to?
(frame(child-lines 20 (list 20 50 20 20)))

;Question 2
;Consider the following function definitions
(define cute-list (list stone-block-tall (circle 50 "solid" "red") wall-block-tall))

(define (beside-list lst)
  (cond
    [(null? lst) empty-image]
    [else (beside/align "top" (first lst) (beside-list (rest lst)))]))

(define (map-widths img-lst)
  (cond
    [(null? img-lst) '()]
    [else (cons (image-width (first img-lst)) (map-widths (rest img-lst)))]))

;2a)
(beside-list cute-list)

;2b)
(map-widths cute-list)

;Question 3
(define (connect-level root-img subtree-imgs)
  (let* ([offset (/ (image-width root-img) 2)])
    (above/align "right"
                 root-img
                 (child-lines offset (map-widths subtree-imgs))
                 (beside-list subtree-imgs))))

(connect-level (square 20 "solid" "blue") cute-list)

;Question 4
; A List-of-NETrees is either
; - '()
; - (cons t rest), where t is an NETree and rest is a List-of-NETrees

;An NETree is either
; - an t-node, which has a List-of-NETree's

;4i
(define-struct t-node (children))
(let* ([LEAF (make-t-node '())])
  (make-t-node (list LEAF (make-t-node (list LEAF LEAF)))))

;4ii
(let* ([LEAF (make-t-node '())])
  (make-t-node (list (make-t-node (list LEAF LEAF)) LEAF)))

;Question5
(define (img-subtree-list t-list)
  (cond
    [(null? t-list) '()]
    [else (cons (img-tree (first t-list)) (img-subtree-list (rest t-list)))]))

(define (img-tree t)
  (let* ([node-img (circle 5 "solid" "blue")])
    (connect-level node-img (img-subtree-list (t-node-children t)))))

;5b
(let* ([LEAF (make-t-node '())])
  (img-tree (make-t-node (list LEAF (make-t-node (list LEAF LEAF))))))
