(defun shortest-path (start end net)
  (bfs end (list (list start)) net))

(defun bfs (end queue net)
  (if (null queue)
      nil
      (let ((path (car queue)))
	(let ((node (car path)))
	  (if (eql node end)
	      (reverse path)
	      (bfs end
		   (append (cdr queue)
			   (new-paths path node net))
		   net))))))

(defun new-paths (path node net)
  (mapcar #'(lambda (n)
	      (cons n path))
	  (cdr (assoc node net))))

(defun bfss (end queue net)
  (if (null queue)
      nil
    'return-nonempty))

(defun bin-search (obj vec)
  (let ((len (length vec)))
    (and (not (zerop len))
	 (finder obj vec 0 (- len 1)))))

(defun finder (obj vec start end)
  (let ((range (- end start)))
    (if (zerop range)
	(if (eql obj (aref vec start))
	    obj
	    nil)
        (let ((mid (+ start (round (/ range 2)))))
	  (let ((obj2 (aref vec mid)))
	    (if (< obj obj2)
		(finder obj vec start (- mid 1))
	        (if (> obj obj2)
		    (finder obj vec (+ mid 1) end)
		    obj)))))))
