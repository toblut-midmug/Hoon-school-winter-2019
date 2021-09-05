:: week6.hoon
:: Hoon 101 (winter 2019)
::
:: Shuffle a deck of French playing cards and deal hands to players
:: Returns a list of cords which encode the hands in shorthand notation
:: (https://en.wikipedia.org/wiki/Standard_52-card_deck#Rank_and_color)
:: 
:: "Write a %say generator that takes two arguments x and y and produces
:: a list of x lists of y distinct cards from a standard 52 card deck"
::
::
:-  %say
|=  [[* eny=@uvJ *] [x=@ud y=@ud ~] ~]
:-  %noun
=<
(deal-cards [(shuffle [make-deck eny]) y x])
|%
:: deals y cards to x players
::
++  deal-cards
  |=  [deck=(list tape) ncards=@ud nplayers=@ud]
::  return a list of cords
::
  ^-  (list @t)
:: initialize counters and a the return value
::
  =/  i=@ud  0
  =/  hands=(list @t)  ~
  =/  m=@ud  0
::  loop over all hands/players
::
  |-
:: if al players got their cards, we are done
::
  ?:  =(m nplayers)  hands
:: initialize current hand to an empty tape;
:: set up card counter for the current hand
::
  =/  hand=tape  ""
  =/  n=@ud  0
:: loop over cards of the current hand
::
  |- 
:: if we have dealt ncards cards, we are done:
:: inc the hand coutner, append the current hand to the list of hands
:: break to the outer loop (^$ rune)
::
  ?:  =(n ncards)  
    ^$(m +(m), hands (weld hands [(crip hand) ~]))
:: inc card counter, append the next card to the current hand,
:: inc counter for the cards in the deck
::
  $(n +(n), hand (weld hand (snag i deck)), i +(i))
:: makes the deck: a list of all card names
::
++  make-deck
  ^-  (list tape)
:: list of suits for a french card deck
::
  =/  suits=(list tape)  ["♦" "♣" "♥" "♠" ~]
:: list of ranks for a french card deck
:: 
  =/  ranks=(list tape)
    :~  "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
        "10"
        "J"
        "K"
        "Q"
        "A"
     ==
:: the list holding the deck
::
  =/  deck=(list tape)  ~
:: create the deck via looping over all suits and all ranks
:: via two nested loops.
::
  =/  suit=@ud  0
  |-
  ?:  (gte suit (lent suits))  deck
  =/  rank=@ud  0
  |-
:: if we have looped over all ranks, break to the outer loop and proceed
:: with the next suit.
  ?:  (gte rank (lent ranks)) 
    ^$(suit +(suit))
:: append the current combination of rank and suit (a tape) to the deck;
:: increment the rank counter
::
  $(deck (weld deck [(weld (snag rank ranks) (snag suit suits)) ~]), rank +(rank))
::  $(deck ranks, rank +(rank))
:: randomly shuffles the elements of a list
::
++  shuffle
  |=  [mylist=(list tape) entropy=@]
  :: return a list of nouns
  ::
  ^-  (list tape)
  :: initialize the return value as an empty list
  ::
  =/  slist=(list tape)  ~
  :: initialize the random number generator
  ::
  =/  rng  ~(. og entropy)
  :: iteratively remove random elements from mylsit and append themm to
  :: slist
  ::
  |-
  :: if mylist is empty return slist
  ::
  ?:  =(0 (lent mylist))  slist
  :: select a random index in the ramaining list
  ::
  =^  i  rng  (rads:rng (lent mylist))
  :: append the i-th elemnt of mylist to slist and remove it from mylist
  ::
  $(slist (weld slist ~[(snag i mylist)]), mylist (oust [i 1] mylist))
--
