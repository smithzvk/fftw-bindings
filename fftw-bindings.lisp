
(in-package :fftw-bindings)

(defcfun (malloc "fftw_malloc") :pointer (size :int))

(defcfun (free "fftw_free") :void (array :pointer))

(defcfun (plan-dft-1d "fftw_plan_dft_1d") :pointer
  (size :int)
  (in :pointer)
  (out :pointer)
  (calc-type :calculation-type)
  (plan-method :plan-method) )

(defcfun (execute "fftw_execute") :void (plan :pointer))

(defcfun (destroy-plan "fftw_destroy_plan") :void (plan :pointer))

(defun dft (arr)
  (with-foreign-object (cin :double (* 2 (length arr)))
    (with-foreign-object (cout :double (* 2 (length arr)))
      (loop for i below (length arr)
            do (setf (mem-aref cin :double (* i 2)) (float (realpart (aref arr i)) 0d0)
                     (mem-aref cin :double (1+ (* i 2))) (float (imagpart (aref arr i)) 0d0) ))
      (let ((plan (plan-dft-1d (length arr) cin cout :forward :estimate)))
        (unwind-protect 
             (execute plan)
          (destroy-plan plan) ))
      (let ((out (make-array (length arr))))
        (loop for i below (length out)
              do (setf (aref out i) (complex (mem-aref cout :double (* i 2))
                                             (mem-aref cout :double (1+ (* i 2))) )))
        out ))))

(defun idft (arr)
  (with-foreign-object (cin :double (* 2 (length arr)))
    (with-foreign-object (cout :double (* 2 (length arr)))
      (loop for i below (length arr)
            do (setf (mem-aref cin :double (* i 2)) (float (realpart (aref arr i)) 0d0)
                     (mem-aref cin :double (1+ (* i 2))) (float (imagpart (aref arr i)) 0d0) ))
      (let ((plan (plan-dft-1d (length arr) cin cout :backward :estimate)))
        (unwind-protect 
             (execute plan)
          (destroy-plan plan) ))
      (let ((out (make-array (length arr))))
        (loop for i below (length out)
              do (setf (aref out i) (complex (mem-aref cout :double (* i 2))
                                             (mem-aref cout :double (1+ (* i 2))) )))
        out ))))

