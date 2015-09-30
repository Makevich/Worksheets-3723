;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Worksheet 12 Big-Bang w- Struct-Let (09-16-15 B)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define (img-stringlist lst selected)
  (cond
    [(null? lst) empty-image]
    [else
     (let*
         ([color (if (zero? selected) "red" "black")])
       (beside
        (text (first lst) 12 color)
        (img-stringlist (rest lst) (- selected 1))))]))

(define-struct ws (selected strings))
(define (show-state s)
  (img-stringlist (ws-strings s) (ws-selected s)))

(define (replace-ith lst i x)
  (if (null? lst) '()
      (if (zero? i)
          (cons x (rest lst))
          (cons (first lst)(replace-ith (rest lst)(- i 1) x )))))

(define (handle-key s ke)
  (let*
      ([sel (ws-selected s)]
       [lst (ws-strings s)])
    (cond
      [(=(string-length ke) 1)
       (make-ws
        (modulo (+ sel 1) (length lst))
        (replace-ith lst sel ke))]
      [else s])))

(define (launch dummy)
  (big-bang
   (make-ws 0 (list "a" "b" "c"))
   (to-draw show-state)
   (on-key handle-key)))