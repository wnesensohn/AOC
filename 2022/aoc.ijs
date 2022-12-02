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