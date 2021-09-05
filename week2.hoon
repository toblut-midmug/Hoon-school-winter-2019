:: week2.hoon
:: Hoon 101 winter 2019 (week 2)
:: checks whether the input argument is a cell or an even/odd atom.
::
::  naked generator that takes a single argument which is either a cell or an atom
::  
|=  mynoun=*
::  branch if mynoun is an atom
::
?@  mynoun
::  branch if mynoun is even
::
?:  =(0 (mod mynoun 2))
    "even atom"
    "odd atom"
:: if mynoun is not an atom, it is a cell
:: 
"cell"
