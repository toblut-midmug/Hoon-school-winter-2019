::  week4.hoon
::  Hoon 101 winter 2019 (week 4)
::  Sum of all multiples of 5 or 3 _below_ some integer n
::  The algorithm works recursively: It successivley decrements n and sums up multiples of 3 or 5 along the way.
::  Example: For n=1000, we obtain 233168.
::
::  naked generator that takes a single unsigned integer n as input
::
|=  n=@ud
::  variable holding the sum
::
=/  s=@ud  0
::  recursion point
::
|-  
::  return s if n <= 3
::
?:  (lte n 3)  s
::  else, check if (n-1) is a multiple of 3 or 5
::
?:  ?|  =(0 (mod (dec n) 3))
        =(0 (mod (dec n) 5))  
    ==
::  return (n-1) + multiples below (n-1) if (n-1) is a multiple of 5 or 3
::
$(n (dec n), s (add s (dec n)))
::  else, return mutliples below (n-1)
::
$(n (dec n), s s)

