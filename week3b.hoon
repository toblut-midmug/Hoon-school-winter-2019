::  week3b.hoon
::  Hoon 101 winter 2019 (week 3)
::  Naked generator that takes a list as an argument and returns its 3rd element
::  The algorithm recursively removes the head of the list until it
::  reaches the 3rd element
:: 
|=  b=(list)  
:: initialize counter to zero
::
=/  n=@ud  0
:: recursion start
::
|-
:: crash if b is null
::
?~  b  !!  
:: return head of b if n=2 
::
?:  =(n 2)  i.b
:: else, recursion step with increment n, truncate the list by removing its head
$(n +(n), b t.b)

