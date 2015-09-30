;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Worksheet 13 Product Types (09-21-15)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

; coord is (Real Real Real)
(define-struct coord (x y z))

(define (distance1 pt1 pt2)
  (sqrt (+ (sqr (- (coord-x pt1) (coord-x pt2)))
           (sqr (- (coord-y pt1) (coord-y pt2)))
           (sqr (- (coord-z pt1) (coord-z pt2))))))

(distance1 (make-coord 2 2 2) (make-coord -1 6 2))

(define (distance2 pt1 pt2)
  (sqrt (+ (sqr (- (first pt1) (first pt2)))
           (sqr (- (second pt1) (second pt2)))
           (sqr (- (third pt1) (third pt2))))))

(define-struct task (pri text done))

(define (pri-color pri)
  (cond
    [(= pri 1) "green"]
    [(= pri 2) "blue"]
    [(= pri 3) "brown"]
    [else "darkgray"]))

(define (todo-img1 item)
  (if (task-done item)
      (text (string-append "X " (task-text item)) 12 "lightgray")
      (text (task-text item) 12 (pri-color (task-pri item)))))

(define (todo-img2 item)
  (if (third item)
      (text (string-append "X " (second item)) 12 "lightgray")
      (text (second item) 12 (pri-color (first item)))))

(todo-img2 (list 2 "finish 3723 worksheet" #false))
(todo-img1 (make-task 2 "finish 3723 worksheet" #false))