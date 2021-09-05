::  week5a.hoon
::  Hoon 101 winter 2019 (week 5)
::  create a naked generator that takes a single atom as input
::  (comments added)
::  
|=  n=@
::  evaluate the arm "goldbach" in the core defined below
=<  (goldbach n)
:: create a core
::
|%
:: create the arm "prime"
::
++  prime
::  naked generator that takes a single atom "n" as input.
::  returns true if n is a prime number and false otherwise.
::
  |=  n=@
  ^-  ?
::  if n<0, return false
::
  ?:  (lth n 2)  |
::  else, return true if n<0
::
  ?:  (lth n 4)  &
::  else...
::  define variable i=2
::
  =/  i=@  2
::  define variable j=2
::
  =/  j=@  2
::  recursion point
::
  |-  ^-  ?
::  if i*j==n (i.e. n is not a prime number), return false
::
  ?:  =((mul i j) n)  |
::  else, if foor(n/2) ==j, return true
  ?:  =(j (div n 2))  &
::  else, if i*j>n   
::
  ?:  (gth (mul i j) n)
::  set i->2, increment j and continue
::
    $(i 2, j +(j))
::  else, increment i and contiue
::
  $(i +(i))
::  create an arm called "goldbach"
::
++  goldbach
::  naked generator that takes a single atom "n" as input
::
  |=  n=@
::  
::
  ^-  ?(? [[@ @] ?])
::  if n<4 or n is odd, return false
::
  ?:  |((lth n 4) =((mod n 2) 1))  |
::  create a face i and initialize to 2
::
  =/  i=@  2
::  create a face j and initialize to n-2
::
  =/  j=@  (sub n 2)
:: recursion start
::
  |-  ^-  ?(? [[@ @] ?])
::  if both i and j are prime numbers, return a cell holding i,j and
::  "true"
::
  ?:  &((prime i) (prime j))  [[i j] |]
::  else, if i+2==n, return false
::
  ?:  =((add 2 i) n)  &
:: else, increment i, decrement j and continue
::
  $(i +(i), j (dec j))
--
