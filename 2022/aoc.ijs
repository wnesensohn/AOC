f1 =: 'C:\Users\willi\Documents\GitHub\AOC\2022\i1.txt'
d1 =. 1!:1 < f1
d1 =. ". each (LF) chopstring d1
pt1 =. >. / +/;.2 > d1
t1 =. +/;.2 > d1
t1 =. (\: t1) { t1
pt2 =. +/ (i.3) { t1
2 2 $ 'top elve'; pt1 ; 'top 3 elves' ; pt2

read=: 1!:1@:boxopen

d2 =: read < 'C:\Users\willi\Documents\GitHub\AOC\2022\i2.txt'
d2 =: cutLF d2

Rating1 =: 3 : 0
if. y -: 'A X' do. 4
elseif. y -: 'A Y' do. 8
elseif. y -: 'A Z' do. 3
elseif. y -: 'B X' do. 1
elseif. y -: 'B Y' do. 5
elseif. y -: 'B Z' do. 9
elseif. y -: 'C X' do. 7
elseif. y -: 'C Y' do. 2
elseif. y -: 'C Z' do. 6
elseif. 1 do. 0
end.
)

pt1 =. +/ > Rating1 each d2

Rating2 =: 3 : 0
if. y -: 'A X' do. 0 + 3
elseif. y -: 'A Y' do. 3 + 1
elseif. y -: 'A Z' do. 2 + 6
elseif. y -: 'B X' do. 1
elseif. y -: 'B Y' do. 3 + 2
elseif. y -: 'B Z' do. 6 + 3
elseif. y -: 'C X' do. 0 + 2
elseif. y -: 'C Y' do. 3 + 3
elseif. y -: 'C Z' do. 6 + 1
elseif. 1 do. 0
end.
)

pt2 =. +/ > Rating2 each d2
2 2 $ 'pt1'; pt1 ; 'pt2' ; pt2

d3 =: read < 'C:\Users\willi\Documents\GitHub\AOC\2022\i3.txt'
d3 =: cutLF d3

Priority =: 3 : 0
X =: (a. i. y)
if. (X < 97) do. (X + 27 - 65)
else. (X + 1 - 97) end.
)

Split =: 3 : 0
(2,((# y)%2)) $ y
)

SetIntersect =: 3 : 0
~. (0 { y) -.^:2 (1 { y) 
)

d3_1 =: Split each d3
d3_1 =: SetIntersect each d3_1

pt1 =. +/ > Priority each d3_1

SetIntersect =: 3 : 0
~. (0 { y) -.^:2 (1 { y) -.^:2 (2 { y) -. ' '
)

d3_2 =: 100 3 $ > d3

SetIntersect"2 d3_2
pt2 =. +/ Priority"0 SetIntersect"2 d3_2

2 2 $ 'pt1'; pt1 ; 'pt2' ; pt2

d4 =: read < 'C:\Users\willi\Documents\GitHub\AOC\2022\i4.txt'

d4 =: ;". each (',-',LF) cutopen d4
d4 =: (((#d4)%4),4) $ d4

Contains =: 3 : 0
((0{y >: 2{y) *. (1{y <: 3{y)) +. ((2{y >: 0{y) *. (3{y <: 1{y))
)

pt1 =. +/ Contains"1 d4

Overlaps =: 3 : 0
((0{y <: 3{y) *. (2{y <: 1{y))
)

pt2 =. +/ Overlaps"1 d4



2 2 $ 'pt1'; pt1 ; 'pt2' ; pt2

d5 =: read <'C:\Users\willi\Documents\GitHub\AOC\2022\i5.txt'
d5 =: cutLF d5
moves =: (9+i._9+#d5) { d5 NB. Life is hard enough without input parsing
moves =: > ". each ((60+i.100){a.) cutopen"1 >moves

stacks =: (1+4*i.9) {"1 (>(i.8){d5) NB. Well, a computer is for parsing.

moves =: |: (0 _1 _1) + |:moves
stacks =: >>' ' cutopen each <"1 |: stacks

stacks;|:moves

NB. stacks and moves are now in a shape that's suitable
NB. for solving the problem, maybe they need to be transposed
NB. but with neither intuition nor knowledge, trial-and-error it is


NB. concatenates arrays
(3&{. , _3&{.) stacks

NB. replace stack at pos with new value - not very elegant
NB. but could be a building block for the final verb
pos =: 5
((pos-1)&{. , ((,'new value') , (pos-9)&{.)) stacks

(i.2) { moves

NB. power is used like this (3 is the # of "iterations" and
NB. 2&* is just a verb - this would be the final modifier
(2&*^: 3) 1

NB. Plan is to create a monad which takes the pending moves and the
NB. current stacks, performs the shuffle and outputs the remaining
NB. moves and the new stacks. However, to do this, I think the moves
NB. and stacks have to be boxed, and the monad must produce a box
NB. of same shape. Then this verb can be applied with power #moves
NB. times and out comes the final stack. So is the theory.

NB. given the source, target and number of items, coming up with
NB. new stacks should be easy, relatively speaking.