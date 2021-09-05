::  week3a.hoon
::  Hoon 101 winter 2019 (week 3)
::  Assignment 3a. Comment each line of code to tell the reader what the code is doing.
::  Comments should be written as "breathing comments" as suggested in the Hoon Style Guide: https://urbit.org/docs/learn/hoon/style/
::
|=  n=@ud
::  combine atom t with the subject and initialize  it to 1
:: 
=/  t=@ud  1
::  recursion start
::
|-
::  return t if n=1
::
?:  =(n 1)
    t
::  else, recursion step with n decremented and t multipied by n
::
$(n (dec n), t (mul t n))
