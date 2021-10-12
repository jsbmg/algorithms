(defun max-heapify (array i heapsize)
  (let ((l (* 2 i))
	(r (1+ (* 2 i)))
	(largest i))

    (when (and (< l heapsize) (> (nth l array) (nth i array)))
      (setq largest l))

    (when (and (< r heapsize) (> (nth r array) (nth largest array)))
      (setq largest r))

    (when (not (= largest i))
       ;; swap the values at indices 0 an i
      (let ((arrayi (nth i array))
	    (arraylgst (nth largest array)))
	(setcar (nthcdr i array) arraylgst) 
	(setcar (nthcdr largest array) arrayi))
       
      (setq heapsize (1- heapsize)
      (max-heapify array 0 heapsize)))))

(defun heapsort (array)
  (let ((heapsize (length array)))
    
    (dotimes (i (/ (1- (length array)) 2))
      (let* ((i (- (/ (length array) 2) i)))
	(max-heapify array i heapsize)))

    (dotimes (i (length array))
      (let* ((i (- (length array) i))
	     (arrayi (nth i array))
	     (array0 (nth 0 array)))
	  (setcar (nthcdr i array) array0)
	  (setcar (nthcdr 0 array) arrayi))
	(setq heapsize (1- heapsize))
	(max-heapify array 0 heapsize))))


(defvar array
  '(1 8 3 9 5))
(max-heapify array 0 (length array))

(heapsort array)

(dotimes (i (length array))
  (let ((i (- (length array) i)))
    (message (number-to-string i))))

(seq-do-indexed (lambda (_ i)
                  (message "%d" i))
                array)

(cl-loop for i from (length array) downto 0
         do (message "%d" i))

	 


