The false position Algorithm is used to find a root by a bracking method where two initial guesses one on each
side of the root. The algoritm then draws a line between these two points and generates a new guess where this
line crosses the x-axis. This new guess replaces one of the previous guesses and the loop continues.\
\
This Algorithm has three required inputs and 2 optional inputs and produces up to 4 outputs\
\
The first three required inputs\
-func  || The function in which the root is going to be found\
-xl    || The lower guess of the root\
-xu    || The upper guess of the root\
\
The two optional inputs\
-es    || The approximate error desired (Default is 0.0001%)\
-maxit || The maximum number of itterations (Default is 200)\
\
Outputs\
-root  || The estimate of the root
-fx    || The the output of the function at the estimated root
-ea    || The approximate error of the estimate
-iter  || The amount of itterations the Algorithm went through

Example || aprrox = FalsePosition(x^2-x-4,-5,5,0.01,20)
