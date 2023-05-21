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
