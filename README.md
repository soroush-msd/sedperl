# sedperl
Interpreting basic functionalities of the famous stream editor Sed in Perl

The commands implemented are `'q'`, `'p'`, `'d'`, `'s'`, and `'$'`.

1. Examples for `'q'` (quit):
```
$ seq 20 43 | ./speed.pl '5q'
20
21
22
23
24

$ seq 1 100 | ./speed.pl '/5{2}/q'
1
2
3
...
55

$ seq 400 500 | ./speed.pl '/^.4.$/q'
400
401
402
...
440
```

2. For `'p'` (print):
```
$ seq 18 21 | ./speed.pl 'p'
18
18
19
19
20
20
21
21

$ seq 18 21 | ./speed.pl '2p'
18
19
19
20
21

$ seq 18 22 | ./speed.pl '/2{2}/p'
18 
19
20
21
22
22

$ seq 18 21 | ./speed.pl '/.8$/p'
18
18
19
20
21
```

For `'d'` (delete):
```
$ seq 40 45 | ./speed.pl '5d'
40
41
42
43
45

$ seq 15 30 | ./speed.pl '/^2/d'
15
16
17
18
19
30

$ seq 20 23 | ./speed.pl '/[2]{2}/d'
20
21
23
```

For `'s'` (substitute):
```
$ seq 40 45 | ./speed.pl 's/[0-9]/hahaha/'
hahaha0
hahaha1
hahaha2
hahaha3
hahaha4
hahaha5

$ echo today is a good day in LA | ./speed.pl 's/LA/Sydney/'
today is a good day in Sydney

$ seq 40 45 | ./speed.pl '4s/43/forty-three/'
40
41
42
forty-three
44
45

$ seq 100 300 | ./speed.pl '/^.*00$/s/00/**/'
1**
101
.
.
2**
201
.
.
3**

$ echo will will will | ./speed.pl 's/w/b/g'
bill bill bill
```

And finally, for `'$'` (To address the last line):
```
$ seq 1 5 | ./speed.pl '$p'
1
2
3
4
5
5

$ seq 1 5 | ./speed.pl '$d'
1
2
3
4

$ seq 1 10 | ./speed.pl '$s/[1-9]/haha/'
1
2
3
.
.
haha0
```
:large_blue_circle: You can compliment each of the commands above with the `-n` flag. The `-n` flag prevents the input lines to be printed automatically.

For example:
```
$ seq 20 70 | ./speed.pl -n '$24p'
43

$ seq 20 70 | ./speed.pl -n '$p'
70

$ seq 20 70 | ./speed.pl -n '/5{2}/p'
55
```
