;; P20
;; 3 練習問題

;; model
(defun make-laptop-base nil
  (let (b)
    (setq b (make-cube 300 200 10))
    (send b :locate #f(0 100 0))
    (send b :set-color :gray60)
    b))
(defun make-laptop-desktop-front nil
  (let (b)
    (setq b (make-cube 300 5 200))
    (send b :locate #f(0 -5 100))
    (send b :set-color :gray60)
    b))
(defun make-laptop-desktop-back nil
  (let (b)
    (setq b (make-cube 295 5.05 198))
    (send b :locate #f(0 -4.9 100))
    (send b :set-color :black)
    b))
(defun make-laptop-axis nil
  (let (b)
    (setq b (make-cylinder 6 220))
    (send b :locate #f(-110 0 1))
    (send b :rotate 1.5707 :y)
    (send b :set-color :gray10)
    b))
;; keyboards
(defun make-keyboard-1-l1 (offset)
  (let (b)
    (setq b (make-cube 14 5 11.5))
    (send b :locate (float-vector (- 125 offset) 25 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-2-l2 (offset)
  (let (b)
    (setq b (make-cube 14 14 11.5))
    (send b :locate (float-vector (- 125 offset) 40 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-3-l2 (offset)
  (let (b)
    (setq b (make-cube 21.5 14 11.5))
    (send b :locate (float-vector (- 125 offset) 40 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-2-l3 (offset)
  (let (b)
    (setq b (make-cube 14 14 11.5))
    (send b :locate (float-vector (- 125 offset) 60 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-2-l4 (offset)
  (let (b)
    (setq b (make-cube 14 14 11.5))
    (send b :locate (float-vector (- 125 offset) 80 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-4-l4 (offset)
  (let (b)
    (setq b (make-cube 19 14 11.5))
    (send b :locate (float-vector (- 125 offset) 80 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-enter ()
  (let (b1 b2)
    (setq b1 (make-cube 24 14 11.5))
    (send b1 :locate (float-vector -120 60 1.5))
    (setq b2 (make-cube 20 25 11.5))
    (send b2 :locate (float-vector -122 75 1.5))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :black)
    b1))
(defun make-keyboard-shift (offset)
  (let (b)
    (setq b (make-cube 26.5 14 11.5))
    (send b :locate (float-vector (- 125 offset) 100 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-2-l5 (offset)
  (let (b)
    (setq b (make-cube 14 14 11.5))
    (send b :locate (float-vector (- 125 offset) 100 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-5-l6 (offset)
  (let (b)
    (setq b (make-cube 12 14 11.5))
    (send b :locate (float-vector (- 125 offset) 120 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-4-l6 (offset)
  (let (b)
    (setq b (make-cube 19 14 11.5))
    (send b :locate (float-vector (- 125 offset) 120 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-space ()
  (let (b)
    (setq b (make-cube 75 14 11.5))
    (send b :locate (float-vector 12.5 120 1.5))
    (send b :set-color :black)
    b))
(defun make-keyboard-1-l6 (offset)
  (let (b)
    (setq b (make-cube 14 7 11.5))
    (send b :locate (float-vector (- 125 offset) 122.5 1.5))
    (send b :set-color :black)
    b))
;; set objects
(setq b1 (make-laptop-base))
(setq b2 (make-laptop-desktop-front))
(setq b3 (make-laptop-desktop-back))
(setq b4 (make-laptop-axis))
(send b2 :assoc b3)
(send b3 :assoc b4)
;; k1 bodies
(setq k1-bodies nil)
(dotimes (i 14)
  (setq k1-bodies (append k1-bodies (list (make-keyboard-1-l1 (* 19 i))))))
(dolist (bdy k1-bodies) (send b1 :assoc bdy))
;; k2 bodies
(setq k2-bodies nil)
(dotimes (i 14)
  (if (= i 0)
    (setq k2-bodies (append k2-bodies (list (make-keyboard-3-l2 (+ 3.5 (* 18.5 i))))))
    (setq k2-bodies (append k2-bodies (list (make-keyboard-2-l2 (+ 7.5 (* 18.5 i))))))))
(dolist (bdy k2-bodies) (send b1 :assoc bdy))
;; k3 bodies
(setq k3-bodies nil)
(dotimes (i 14)
  (if (= i 13)
    (setq k3-bodies (append k3-bodies (list (make-keyboard-enter))))
    (setq k3-bodies (append k3-bodies (list (make-keyboard-2-l3 (* 18.5 i)))))))
(dolist (bdy k3-bodies) (send b1 :assoc bdy))
;; k4 bodies
(setq k4-bodies nil)
(dotimes (i 13)
  (if (= i 0)
    (setq k4-bodies (append k4-bodies (list (make-keyboard-4-l4 2.5))))
    (setq k4-bodies (append k4-bodies (list (make-keyboard-2-l4 (+ 6 (* 18.5 i))))))))
(dolist (bdy k4-bodies) (send b1 :assoc bdy))
;; k5 bodies
(setq k5-bodies nil)
(dotimes (i 13)
  (cond ((= i 0) (setq k5-bodies (append k5-bodies (list (make-keyboard-shift 7.5)))))
        ((= i 12) (setq k5-bodies (append k5-bodies (list (make-keyboard-shift (+ 21 (* 18.5 i)))))))
        (t (setq k5-bodies (append k5-bodies (list (make-keyboard-2-l5 (+ 15 (* 18.5 i)))))))))
(dolist (bdy k5-bodies) (send b1 :assoc bdy))
;; k6 bodies
(setq k6-bodies nil)
(dotimes (i 11)
  (cond ((= i 0) (setq k6-bodies (append k6-bodies (list (make-keyboard-5-l6 0)))))
        ((= i 1) (setq k6-bodies (append k6-bodies (list (make-keyboard-5-l6 16)))))
        ((= i 2) (setq k6-bodies (append k6-bodies (list (make-keyboard-4-l6 36)))))
        ((= i 3) (setq k6-bodies (append k6-bodies (list (make-keyboard-4-l6 60)))))
        ((= i 4) (setq k6-bodies (append k6-bodies (list (make-keyboard-space)))))
        ((= i 5) (setq k6-bodies (append k6-bodies (list (make-keyboard-4-l6 162.5)))))
        ((= i 6) (setq k6-bodies (append k6-bodies (list (make-keyboard-4-l6 185)))))
        ((= i 7) (setq k6-bodies (append k6-bodies (list (make-keyboard-5-l6 205)))))
        ((= i 8) (setq k6-bodies (append k6-bodies (list (make-keyboard-1-l6 220)))))
        ((= i 9) (setq k6-bodies (append k6-bodies (list (make-keyboard-5-l6 235)))))
        ((= i 10) (setq k6-bodies (append k6-bodies (list (make-keyboard-1-l6 250)))))
        ))
(dolist (bdy k6-bodies) (send b1 :assoc bdy))
;; set instances
;; laptop body
(setq h1 (instance bodyset-link
                   :init (make-cascoords)
                   :bodies (append (list b1) k1-bodies k2-bodies k3-bodies k4-bodies k5-bodies k6-bodies)))
;; laptop desktop
(setq s1 (instance bodyset-link
                   :init (make-cascoords)
                   :bodies (list b2 b3 b4)))
;; laptop joint
(setq j1 (instance rotational-joint
                   :init :parent-link h1
                   :child-link s1
                   :axis
                   :x))
; instance cascaded coords
(defun macbookpro ()
  (setq r (instance cascaded-link :init))
  (send r :assoc h1)
  (send h1 :assoc s1)
  (setq (r . links) (list h1 s1))
  (setq (r . joint-list) (list j1))
  (send r :init-ending)
  r)

;; use models start
(load "models/h7-robot.l")
(setq *mac* (macbookpro))
(setq *robot* (h7))

(send *mac* :locate #f(600 0 800))
(send *mac* :rotate 1.57 :z)

(send *robot* :reset-pose)
(send *robot* :locate #f(0 0 550))

(objects (list *robot* *mac*))

(setq c (make-cascoords :pos #f(550 40 742) :rpy (float-vector 0 0 0)))
(send *robot* :head :look-at (send *mac* :worldpos))
(send *robot* :larm :inverse-kinematics c
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)

(send *robot* :larm :end-coords :assoc *mac*)
(send *robot* :larm :move-end-pos #f(200 0 100) :world
      :debug-view t :look-at-target t)

(send *robot* :larm :end-coords :dissoc *mac*)
(send *robot* :larm :move-end-pos #f(-400 200 100) :world
      :debug-view t :look-at-target nil)

; (send *robot* :larm :end-coords :assoc *mac*)
; (send *robot* :larm :move-end-pos #f(0 0 100) :world
;       :debug-view t :look-at-target t)
; (send *robot* :head :look-at (send *kettle* :worldpos))

; (send *irtviewer* :look-all
; 	(geo::make-bounding-box
; 		(flatten (send-all (send *robot* :bodies) :vertices))))
;
; (setq *kettle* (send *room* :object "room73b2-kettle"))
;
; (if (send *kettle* :parent) (send (send *kettle* :parent) :dissoc *kettle*))
;
; (send *robot* :head :look-at (send *kettle* :worldpos))
;
; (send *robot* :larm :inverse-kinematics
; 	(car (send *kettle* :handle))
; 	:link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
; 	:move-target (send *robot* :larm :end-coords)
; 	:rotation-axis :z
; 	:debug-view t)
;
; (send *robot* :larm :end-coords :assoc *kettle*)
;
; (send *robot* :larm :move-end-pos #f(0 0 100) :world
; 	:debug-view t :look-at-target t)
