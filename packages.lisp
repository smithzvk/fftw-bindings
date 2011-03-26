
(defpackage :fftw-bindings
    (:use :cl :cffi)
  (:nicknames :fftw)
  (:export #:malloc #:free
           #:plan-dft-1d #:destroy-plan
           #:execute ))

(cffi:define-foreign-library libfftw3
  (t (:default "libfftw3")) )
(cffi:use-foreign-library libfftw3)
