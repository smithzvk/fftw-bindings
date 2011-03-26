
(include "fftw3.h")

(cenum :calculation-type
  ((:forward "FFTW_FORWARD")
   :documentation "Do a forward transformation" )
  ((:backward "FFTW_BACKWARD")
   :documentation "Do a forward transformation" ))

(cenum :plan-method
  ((:estimate "FFTW_ESTIMATE")
   :documentation
   "Make an intelligent guess at how to do this calculation" )
  ((:measure "FFTW_MEASURE")
   :documentation
   "Measure the computation times to find a near optimum plan for the
   calculation" ))


