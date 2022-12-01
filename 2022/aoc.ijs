f1 =: 'C:\Users\willi\Documents\GitHub\AOC\2022\i1.txt'
d1 =. 1!:1 < f1
d1 =. ". each (LF) chopstring d1
pt1 =. >. / +/;.2 > d1
t1 =. +/;.2 > d1
t1 =. (\: t1) { t1
pt2 =. +/ (i.3) { t1
2 2 $ 'top elve'; pt1 ; 'top 3 elves' ; pt2