::  week5b.hoon
::  Hoon 101 winter 2019 (week 5)
::  morse code converter
::  
|=  raw=tape
=<
::  call the convert arm with the (upper case converted) input as
::  argument
::  
(convert (cuss raw))
|%
++  convert
  ::  create a gate that takes a tape as input
  ::
  |=  [message=tape]
  ::  return a tape
  ::
  ^-  tape
  ::  (~(got by a) b) produces the value located at key b within map a
  ::
  =/  chart  ~(got by table)                             
  ::  map each letter of the tape to its morse code expression
  ::
  %+  turn  message
  :: create a gate that takes a single UTF-8 character as input
  ::
  |=  b=@t
  ::  crip casts tape to cord; trip casts coord to tape; weld
  ::  concatenates two tapes
  ::
  (crip (weld (trip (chart b)) " "))
++  table
  %-  my
  :~  :-  'A'  '.-'
      :-  'B'  '-...'
      :-  'C'  '-.-.'
      :-  'D'  '-..'
      :-  'E'  '.'
      :-  'F'  '..-.'
      :-  'G'  '--.'
      :-  'H'  '....'
      :-  'I'  '..'
      :-  'J'  '.---'
      :-  'K'  '-.-'
      :-  'L'  '.-..'
      :-  'M'  '--'
      :-  'N'  '-.'
      :-  'O'  '---'
      :-  'P'  '.--.'
      :-  'Q'  '--.-'
      :-  'R'  '.-.'
      :-  'S'  '...'
      :-  'T'  '-'
      :-  'U'  '..-'
      :-  'V'  '...-'
      :-  'W'  '.--'
      :-  'X'  '-..-'
      :-  'Y'  '-.--'
      :-  'Z'  '--..'
      :-  '0'  '-----'
      :-  '1'  '.----'
      :-  '2'  '..---'
      :-  '3'  '...--'
      :-  '4'  '....-'
      :-  '5'  '.....'
      :-  '6'  '-....'
      :-  '7'  '--...'
      :-  '8'  '---..'
      :-  '9'  '----.'
  ==
--
