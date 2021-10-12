(defvar values
  '(1 8 2 9 3 4))

(defun insertion-sort (values)
  (dotimes (j (1- (length values)))
    (let* ((j (1+ j))
	   (key (nth j values))
	   (i (1- j)))
    (while (and (>= i 0) (> (nth i values) key))
      (setcar (nthcdr (1+ i) values) (nth i values))
      (setq i (1- i)))
    (setcar (nthcdr (1+ i) values) key)))
  values)



