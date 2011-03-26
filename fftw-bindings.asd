
(eval-when (:load-toplevel :execute)
  (asdf:oos 'asdf:load-op 'cffi-grovel) )

(asdf:defsystem :fftw-bindings
  :author "Zach Smith"
  :license "GPLv3 or later. See file COPYING"
  :components ((:file "packages")
               (cffi-grovel:grovel-file "fftw-grovel")
               (:file "fftw-bindings") )
  :serial t
  :depends-on (cffi) );toolbox iterate) )
